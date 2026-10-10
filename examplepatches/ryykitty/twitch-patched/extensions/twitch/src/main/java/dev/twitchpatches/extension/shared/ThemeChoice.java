package dev.twitchpatches.extension.shared;

final class ThemeChoice {
    static boolean light(String preference, boolean systemDark) {
        if ("LIGHT".equals(preference)) return true;
        if ("DARK".equals(preference)) return false;
        return !systemDark;
    }
}
