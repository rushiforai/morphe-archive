/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.Objects;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * When the photos picked in the attach menu each have their own caption, the comment field below
 * them holds the first photo's caption, and sending writes it back into whichever photo is first
 * then. Telegram leaves the field as it was when the first photo is unpicked or another photo is
 * dragged in front of it, so the old first photo's caption goes out on the new first photo. With
 * the switch on, a change of first photo while the photos have their own captions, before the
 * change or after it, has the field show the new first photo's caption, the way it does after the
 * photo viewer closes. After it too: Undo of a removal in the preview brings a captioned photo back
 * in front, and the field has to follow it there.
 */
public final class CaptionOrder {
    private CaptionOrder() {}

    // Set as a change of the picked photos starts and read as it ends, both on the main thread.
    private static Object provider;
    private static Object first;
    private static boolean ownCaptions;

    /**
     * Called as the picked photos are about to change.
     *
     * @param order the picked photos' keys, in order
     * @param captionForAll Telegram's captionForAllMedia: 1 while one caption goes with all photos
     * @param provider what loads the first photo's caption into the comment field
     */
    public static void before(ArrayList<?> order, int captionForAll, Object provider) {
        CaptionOrder.provider = null;
        first = null;
        ownCaptions = false;
        HookStatus.invoked(FamilyNames.CAPTION_ORDER);
        try {
            if (provider == null || order == null || order.isEmpty() || !on()) return;
            CaptionOrder.provider = provider;
            first = order.get(0);
            ownCaptions = captionForAll == 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CAPTION_ORDER, "before", failure);
        }
    }

    /**
     * Called once the picked photos have changed.
     *
     * @param order the picked photos' keys, in order
     * @param captionForAll Telegram's captionForAllMedia after the change
     * @return the provider to load the new first photo's caption, or null to leave the field alone
     */
    public static Object after(ArrayList<?> order, int captionForAll) {
        Object answer = provider;
        Object was = first;
        boolean ownBefore = ownCaptions;
        provider = null;
        first = null;
        ownCaptions = false;
        if (answer == null) return null;
        try {
            // One caption for all photos before and after: the field holds it, as Telegram meant.
            if (!ownBefore && captionForAll != 0) return null;
            Object now = order == null || order.isEmpty() ? null : order.get(0);
            if (Objects.equals(was, now)) return null;
            HookStatus.counted(FamilyNames.CAPTION_ORDER, "first photo changed");
            return answer;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CAPTION_ORDER, "after", failure);
            return null;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.CAPTION_ORDER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CAPTION_ORDER, "switch", failure);
            return false;
        }
    }
}
