/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Starts reels and the videos that open in the same viewer in Facebook's own Clean mode, for Clean
 * up Reels (#75).
 *
 * <p>Facebook's three-dot menu has a Clean mode item that hides the buttons down the side of one
 * reel. For accounts it gives "sticky" Clean mode, it also remembers that choice in one flag, and
 * each part of the viewer that follows Clean mode reads the flag as it's made: the overlay with the
 * buttons, the footer, the video controls and the unified player's controls. The patch hands each
 * of those reads here. A yes is passed on as it came, and a no becomes a yes while the switch is
 * on, so every new reel starts the way the menu item leaves one.
 *
 * <p>Nothing else is touched. Facebook's own ways out of Clean mode still work for the reel on
 * screen, and the next one starts clean again. The overlay skips the read for an ad, so an ad keeps
 * its controls. Off, paused, before the settings are ready, or when anything here fails, the answer
 * is Facebook's own.
 */
public final class ReelCleanMode {
    /** Counted under the patch's name each time a part of the viewer is started clean. */
    static final String STARTED_CLEAN = "Viewer part started in Clean mode";

    private static final String FAMILY = FamilyNames.REEL_DECLUTTER;

    private ReelCleanMode() {
    }

    /**
     * Injection point, right after a part of the Reels viewer reads Facebook's remembered Clean
     * mode flag as it's made. True starts that part clean. Never throws.
     *
     * @param facebook what Facebook's flag answered.
     */
    public static boolean startClean(boolean facebook) {
        try {
            HookStatus.invoked(FAMILY);
            if (facebook || !Utils.settingsReady() || !Settings.REEL_CLEAN_MODE.get()) return facebook;
            HookStatus.bound(FAMILY, "reel Clean mode");
            HookStatus.counted(FAMILY, STARTED_CLEAN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel Clean mode", failure);
            Logger.printException(() -> "Reel Clean mode: could not read its switch", failure);
            return facebook;
        }
    }

    /**
     * The same, for the part that reads the flag through Facebook's helper that boxes it. The
     * answer is Facebook's own object unless the switch turns a no into a yes. Never throws.
     *
     * @param facebook what Facebook's helper answered, a Boolean.
     */
    public static Boolean startClean(Boolean facebook) {
        boolean clean = Boolean.TRUE.equals(facebook);
        return startClean(clean) && !clean ? Boolean.TRUE : facebook;
    }
}
