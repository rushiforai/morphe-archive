/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Two switches that tie a pin's download to its save (#17). Both start off and need Download pins on.
 *
 * <p>Save pins you download: downloading one pin from its menu or long-press menu also makes the quick
 * save Pinterest's own save button makes, unless the pin is saved already. Grid and board downloads
 * use the form of {@link PinDownloads#start} that takes a listener, so they never get here.
 *
 * <p>Download pins you save: every save in the app goes through one method, whichever screen it starts
 * on, and {@link #saving} runs at its head.
 *
 * <p>With both on neither can loop. {@link #saving} downloads through the form of start that doesn't
 * save, and {@link #ownSave} keeps a download's own save, which comes back through that same method,
 * from downloading the pin a second time.
 */
public final class SaveAndDownload {
    private SaveAndDownload() {}

    /** What the rewritten stubs do, which tests stand in for because nothing rewrites them there. */
    interface Host {
        void save(Object saver, Object pin);
        boolean saved(Object pin);
    }

    static volatile Host hostForTests;

    /**
     * The newest quick-save helper Pinterest built. Each one is built from app-wide objects, so holding
     * it keeps no screen alive, and it's held with the switch off because the switch can turn on later.
     */
    static volatile Object latest;

    private static volatile boolean ownSave;

    /** Rewritten to make the quick save Pinterest's save button makes, with Pinterest's own Saved toast. */
    private static void savePin(Object saver, Object pin) {}

    /** Rewritten to read the two things Pinterest fills once a pin is saved: its board and its profile flag. */
    private static boolean alreadySaved(Object pin) { return false; }

    /**
     * Called as Pinterest finishes building a quick-save helper. That can be ahead of the application's
     * onCreate, where asking PatchFamily would fail Setting's initialiser for the rest of the process.
     */
    public static void saver(Object built) {
        try {
            if (!Utils.settingsReady() || PatchFamily.Capability.SAVE_AND_DOWNLOAD.installed()) latest = built;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "keep quick save", failure);
        }
    }

    /** Called ahead of every save, with the pin being saved. */
    public static void saving(Object pin) {
        HookStatus.invoked(FamilyNames.DOWNLOAD_PINS);
        try {
            if (ownSave || !PinDownloads.active() || !PatchFamily.Capability.SAVE_AND_DOWNLOAD.installed()
                    || !Settings.DOWNLOAD_SAVED_PINS.get()) return;
            if (PinDownloads.start(pin, Utils.getContext(), null)) HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "saved pin downloaded");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "download saved pin", failure);
        }
    }

    /** Called once a single pin's download was queued. */
    static void downloaded(Object pin) {
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.SAVE_AND_DOWNLOAD.installed()
                    || !Settings.SAVE_DOWNLOADED_PINS.get()) return;
            if (saved(pin)) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "downloaded pin already saved");
                return;
            }
            Object saver = latest;
            if (saver == null) {
                HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "downloaded pin not saved, no quick save yet");
                Utils.showToastLong(couldNotSave());
                return;
            }
            Utils.runOnMainThreadNowOrLater(() -> {
                ownSave = true;
                try {
                    save(saver, pin);
                    HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "downloaded pin saved");
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "save downloaded pin", failure);
                    Utils.showToastLong(couldNotSave());
                } finally {
                    ownSave = false;
                }
            });
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "save downloaded pin", failure);
        }
    }

    private static String couldNotSave() {
        return L10n.t("Couldn't save this pin. Open it once, then try again.");
    }

    private static void save(Object saver, Object pin) {
        Host host = hostForTests;
        if (host != null) host.save(saver, pin);
        else savePin(saver, pin);
    }

    private static boolean saved(Object pin) {
        Host host = hostForTests;
        return host != null ? host.saved(pin) : alreadySaved(pin);
    }
}
