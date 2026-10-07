/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

/** Turn off screen transitions, asked from tests in other packages with the patch in the build. */
public final class ScreenTransitionsForTests {
    private ScreenTransitionsForTests() {
    }

    /** Whether a tab, a panel and a tab strip's page asked for with their slide still slide in. */
    public static boolean slides() {
        ScreenTransitions.inBuildForTests = true;
        try {
            return ScreenTransitions.tabStyle(1, 1) == 1 && ScreenTransitions.panelSlides(true)
                    && ScreenTransitions.pageSlides(true);
        } finally {
            ScreenTransitions.inBuildForTests = null;
        }
    }
}
