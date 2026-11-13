/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.navigation;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Keeps a start on Home (issue #6).
 *
 * <p>PineDrama asks one reader which tab a start lands on: Drama (Home), For You (Home's other
 * feed) or Discover. A new install gets Discover for its first two days, and one of its server
 * experiments sends a signed-out start there too. The main activity's landing rule, its fallback
 * tab name, Home's own top tab and the start's preloads all ask that same reader, so answering
 * Drama in place of Discover turns the whole start into a Home start. For You is still Home and
 * stays as PineDrama picked it. A notification names its own tab before the reader is asked, so it
 * keeps it.
 */
public final class OpenOnHome {
    static final String FAMILY = "open on home";
    static final String DISCOVER = "DISCOVER_TAB";
    static final String HOME = "DRAMA_TAB";

    private OpenOnHome() {
    }

    /** The landing tab PineDrama's reader hands back, Discover answered as Drama while the switch is on. */
    public static Object landingTab(Object tab) {
        try {
            HookStatus.bound(FAMILY, "landing tab");
            if (!SettingsStatus.openOnHomeEnabled || !Settings.OPEN_ON_HOME.get()) return tab;
            if (!(tab instanceof Enum) || !DISCOVER.equals(((Enum<?>) tab).name())) return tab;
            return home((Enum<?>) tab);
        } catch (Throwable failure) {
            Logger.printException(() -> "Open on Home failed; PineDrama keeps its own landing tab", failure);
            return tab;
        }
    }

    /** Drama, from the same enum as the tab it replaces, since the enum's own name is obfuscated. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Enum<?> home(Enum<?> tab) {
        return Enum.valueOf((Class) tab.getDeclaringClass(), HOME);
    }
}
