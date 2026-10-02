/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Where the tab bar goes. Facebook puts it at the top for some accounts and at the bottom for
 * others, by a server setting, and keeps a preference of its own that overrides that setting
 * either way: fb4a_bottom_tabs_override_enabled, a TriState its own tab menu can write. Each place
 * that decides where the bar goes reads that preference and branches on the TriState's ordinal, YES
 * for the bottom and NO for the top, with UNSET leaving it to the server. The hook goes right after
 * each of those reads, and while the switch is on the answer is YES's ordinal.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own. Facebook places the bar as its main screen starts, so a change shows after a
 * restart.
 */
public final class BottomTabBar {
    /** Counted under the patch's name each time the override is answered with YES. */
    static final String PUT_AT_BOTTOM = "Tab bar put at the bottom";

    /** Facebook's three-way preference value. Its class and its constants keep their names. */
    static final String TRI_STATE = "com.facebook.common.util.TriState";

    private static final String FAMILY = FamilyNames.BOTTOM_TAB_BAR;

    /** YES's ordinal, read from Facebook's TriState the first time the switch is on; -1 until then. */
    private static volatile int yes = -1;

    private BottomTabBar() {
    }

    /**
     * The hook, right after Facebook takes the ordinal of its override. Returns YES's ordinal while
     * the switch is on, and [facebooks] otherwise.
     */
    public static int override(int facebooks) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.BOTTOM_TAB_BAR.get()) return facebooks;
            int bottom = yes();
            HookStatus.bound(FAMILY, "tab bar position");
            HookStatus.counted(FAMILY, PUT_AT_BOTTOM);
            if (bottom != facebooks) Logger.printDebug(() -> "Bottom tab bar: the override reads YES");
            return bottom;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "tab bar position", failure);
            return facebooks;
        }
    }

    private static int yes() throws ReflectiveOperationException {
        int ordinal = yes;
        if (ordinal < 0) {
            Object constant = Class.forName(TRI_STATE).getField("YES").get(null);
            yes = ordinal = ((Enum<?>) constant).ordinal();
        }
        return ordinal;
    }
}
