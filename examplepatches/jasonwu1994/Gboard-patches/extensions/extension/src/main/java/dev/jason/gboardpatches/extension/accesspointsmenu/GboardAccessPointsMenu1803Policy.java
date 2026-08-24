package dev.jason.gboardpatches.extension.accesspointsmenu;

public final class GboardAccessPointsMenu1803Policy {
    public static final String MENU_REDESIGN_FLAG = "enable_access_points_menu_redesign";

    private GboardAccessPointsMenu1803Policy() {
    }

    public static Object mirrorSwitch(String flagName, Object stockResult, boolean enabled) {
        if (!MENU_REDESIGN_FLAG.equals(flagName) || !(stockResult instanceof Boolean)) {
            return stockResult;
        }
        return Boolean.valueOf(enabled);
    }
}
