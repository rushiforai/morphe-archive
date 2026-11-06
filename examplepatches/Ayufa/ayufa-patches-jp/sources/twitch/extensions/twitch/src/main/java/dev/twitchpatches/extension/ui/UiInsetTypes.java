package dev.twitchpatches.extension.ui;

final class UiInsetTypes {
    private static final int STATUS_BAR = 1;
    private static final int NAVIGATION_BAR = 2;
    private static final int DISPLAY_CUTOUT = 128;

    static int filter(int types, boolean status, boolean navigation) {
        int hidden = (status ? STATUS_BAR | DISPLAY_CUTOUT : 0) | (navigation ? NAVIGATION_BAR : 0);
        return types & ~hidden;
    }
}
