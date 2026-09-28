/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

/** Asks the Menu hooks about a group the way Facebook's two sections of a group do. */
public final class MenuSectionsForTests {
    private MenuSectionsForTests() {
    }

    /** A stand-in for the Menu's group enum, under names Facebook's keeps. */
    public enum Group {
        FEATURED, PROFILE, PRODUCTS, HELP, SETTINGS, LOGOUT, PRODUCTS_FROM_FACEBOOK, COMMUNITY_RESOURCES, UPSELL, UNKNOWN
    }

    /** True when the section Facebook draws for the Upgrades group builds nothing. */
    public static boolean hidesUpgrades() {
        return MenuSections.hideSection(Group.UPSELL);
    }

    /** True when the section Facebook draws for the Also from Meta group builds nothing. */
    public static boolean hidesAlsoFromMeta() {
        return MenuSections.hideSection(Group.PRODUCTS_FROM_FACEBOOK);
    }

    /** True when the section carrying the server's part of the Upgrades group builds nothing. */
    public static boolean hidesServerUpgrades() {
        return MenuSections.hideServerSection(Group.UPSELL);
    }

    /** True when the section carrying the server's part of the Also from Meta group builds nothing. */
    public static boolean hidesServerAlsoFromMeta() {
        return MenuSections.hideServerSection(Group.PRODUCTS_FROM_FACEBOOK);
    }

    /** Forgets the debug lines already written, as a new Facebook process would start without them. */
    public static void newProcess() {
        MenuSections.forgetLog();
    }
}
