/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;

/**
 * The release notes of the installed bundle, shown once after an update — the first time LinkedIn
 * opens, on top of whatever screen the launcher icon led to.
 */
final class WhatsNew {
    /** Entry for the first release. English like every other string here: it is a translation key. */
    private static final String FIRST_RELEASE = "The first release of Loki Patches.\n\n"
            + "• Copy text: long press a post, comment, or any text to select and copy it, like on Reddit\n"
            + "• Hide ads, promoted jobs, suggested posts, and Premium promotions\n"
            + "• Download photos and videos, feed filters, ghost mode in chat, and more\n\n"
            + "Open the settings from the Me panel → Loki Patches, or long press the LinkedIn icon → Loki Patches.";

    /** Newest first: {version, notes}. One entry per release worth announcing. */
    static final String[][] NOTES = {
            {"1.0.0", FIRST_RELEASE},
    };

    /** The dialog belongs to one app start; opening a second activity must not repeat it. */
    private static boolean alreadyOffered;

    private WhatsNew() {
    }

    /** The notes for a version, or null when it has none; pre-releases use their base version. */
    static String notesFor(String version) {
        String releaseVersion = version.split("-", 2)[0];
        for (int i = 0; i < NOTES.length; i++) {
            String[] entry = NOTES[i];
            if (!entry[0].equals(releaseVersion)) continue;
            return I18n.tr(entry[1]);
        }
        return null;
    }

    /** Shows the notes unless this version was already shown; never lets a dialog failure escape. */
    static void maybeShow(Activity activity) {
        if (alreadyOffered) return;
        alreadyOffered = true;
        try {
            show(activity);
        } catch (Throwable failure) {
            Diagnostics.error("WhatsNew failed", failure);
        }
    }

    private static void show(Activity activity) {
        String installedVersion = Settings.patchesVersion();
        String lastSeen = Settings.getString(Settings.LAST_SEEN_VERSION, null);
        if (installedVersion.equals(lastSeen)) return;
        Settings.setString(Settings.LAST_SEEN_VERSION, installedVersion);

        String notes = notesFor(installedVersion);
        if (notes == null) return;  // nothing written for this release

        Configuration configuration = activity.getResources().getConfiguration();
        boolean nightMode = (configuration.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        int theme = nightMode
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        AlertDialog.Builder builder = new AlertDialog.Builder(activity, theme);
        builder.setTitle(I18n.f("%1$s %2$s — what changed", SettingsActivity.BRAND, installedVersion));
        builder.setMessage(notes);
        builder.setPositiveButton("OK", null);
        builder.setNeutralButton(I18n.tr("Settings"), (clicked, which) -> SettingsActivity.open(activity));
        AlertDialog dialog = builder.show();
        SettingsActivity.tintButtons(dialog, activity);
    }
}
