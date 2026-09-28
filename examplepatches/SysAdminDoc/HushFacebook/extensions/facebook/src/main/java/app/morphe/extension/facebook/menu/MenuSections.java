/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import androidx.annotation.Nullable;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * What the Hide Menu promotions patch asks while Facebook builds its Menu.
 *
 * <p>Facebook's Menu is a list of groups, each typed by an enum Facebook keeps under its own
 * names: HELP, SETTINGS, LOGOUT and so on. Upgrades is the UPSELL group and Also from Meta is
 * PRODUCTS_FROM_FACEBOOK. Every group is built by two sections, the one Facebook draws itself
 * (the header and its rows) and one for what the server sends to go with the group. The patch
 * asks {@link #hideSection} in the first and {@link #hideServerSection} in the second as soon as
 * each knows its group, and a yes has the section build nothing.
 *
 * <p>Only those two groups can go, each by its own switch, and only by the enum's name, never by
 * a title on screen. It fails open: with a switch off, a pause, settings that aren't ready,
 * anything but an enum, or any failure in here, the section builds as Facebook built it.
 */
public final class MenuSections {
    /** The enum name of the Upgrades group. */
    static final String UPGRADES = "UPSELL";

    /** The enum name of the Also from Meta group. */
    static final String ALSO_FROM_META = "PRODUCTS_FROM_FACEBOOK";

    /** The counter route of the native sections: every group asked about, and the ones hidden. */
    static final String ROUTE = "Menu sections";

    /** The counter route of the sections carrying what the server sends with a group. */
    static final String SERVER_ROUTE = "Menu server sections";

    /** What a hidden Upgrades group is counted under. */
    static final String UPGRADES_HIDDEN = "Upgrades";

    /** What a hidden Also from Meta group is counted under. */
    static final String ALSO_FROM_META_HIDDEN = "Also from Meta";

    /** The Hook status names of the two hooks. */
    static final String NATIVE_HOOK = "Menu section";
    static final String SERVER_HOOK = "Menu server section";

    /** Distinct debug lines kept, so a Menu opened again and again doesn't fill the log. */
    private static final int MAX_LOGGED = 64;

    /** The debug lines already written this process: hook, group and answer. */
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();

    private MenuSections() {
    }

    /**
     * Injection point, in the children builder of the section Facebook draws for a Menu group,
     * right after it read the group. True has the section build no children. Never throws.
     */
    public static boolean hideSection(@Nullable Object group) {
        return decide(group, NATIVE_HOOK, ROUTE);
    }

    /**
     * Injection point, in the children builder of the section that carries what the server sends
     * with a Menu group, right after it read the group. True has it build nothing. Never throws.
     */
    public static boolean hideServerSection(@Nullable Object group) {
        return decide(group, SERVER_HOOK, SERVER_ROUTE);
    }

    private static boolean decide(@Nullable Object group, String hook, String route) {
        try {
            HookStatus.invoked(FamilyNames.MENU_PROMOTIONS);
            if (!(group instanceof Enum)) {
                // The patch hands over what answers the group enum, so anything else means the
                // anchor took the wrong call and nothing here can be trusted.
                HookStatus.missingMember(FamilyNames.MENU_PROMOTIONS, "Menu group enum", hook,
                        group == null ? "null" : group.getClass().getName());
                return false;
            }
            HookStatus.bound(FamilyNames.MENU_PROMOTIONS, hook);
            String name = ((Enum<?>) group).name();
            FeedFilterCounters.sawList(route, 1);
            FeedFilterCounters.sawKind(route, name);
            boolean upgrades = UPGRADES.equals(name);
            if (!upgrades && !ALSO_FROM_META.equals(name)) return false;
            // Ready first: Settings loads every switch, and it can't before the context is set.
            boolean hide = Utils.settingsReady() && switchFor(name).get();
            if (hide) FeedFilterCounters.removed(route, 1, upgrades ? UPGRADES_HIDDEN : ALSO_FROM_META_HIDDEN);
            log(hook, name, hide);
            return hide;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MENU_PROMOTIONS, hook, failure);
            return false;
        }
    }

    /** The switch that hides the group named [name], or null for every group the Menu keeps. */
    @Nullable
    static BooleanSetting switchFor(String name) {
        if (UPGRADES.equals(name)) return Settings.HIDE_MENU_UPGRADES;
        if (ALSO_FROM_META.equals(name)) return Settings.HIDE_MENU_ALSO_FROM_META;
        return null;
    }

    /** One debug line per hook, group and answer, so the phone check can see what the Menu built. */
    private static void log(String hook, String name, boolean hidden) {
        String line = hook + ": " + name + (hidden ? " hidden" : " left in");
        if (LOGGED.size() >= MAX_LOGGED || !LOGGED.add(line)) return;
        Logger.printDebug(() -> "Hide Menu promotions: " + line);
    }

    /** Forgets which debug lines were written, as a new Facebook process would. For tests. */
    static void forgetLog() {
        LOGGED.clear();
    }
}
