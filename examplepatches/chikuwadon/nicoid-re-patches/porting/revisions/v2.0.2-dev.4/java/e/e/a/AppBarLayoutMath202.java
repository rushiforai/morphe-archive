package e.e.a;

/** Screen layout metrics. Positions use the original action-bar top as zero. */
final class AppBarLayoutMath202 {
    private AppBarLayoutMath202() {}

    /**
     * Returns {native app-bar translation, content-frame translation,
     * floating tab-strip position}, in pixels.
     */
    static int[] calculate(int mode, int appHeight, int contentHeight, int tabHeight) {
        if (appHeight <= 0 || contentHeight <= appHeight || tabHeight <= 0
                || tabHeight > contentHeight)
            throw new IllegalArgumentException("Invalid bar/container dimensions");
        switch (mode) {
            case 0: return new int[]{0, 0, appHeight};
            case 1: return new int[]{tabHeight, 0, 0};
            case 2: return new int[]{0, 0, appHeight + contentHeight - tabHeight};
            case 3: return new int[]{contentHeight, -appHeight, 0};
            case 4: return new int[]{contentHeight - tabHeight, -appHeight,
                    appHeight + contentHeight - tabHeight};
            case 5: return new int[]{contentHeight, -appHeight, contentHeight - tabHeight};
            default: throw new IllegalArgumentException("Unknown tab/app arrangement: " + mode);
        }
    }
}
