/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

/** Force dark mode's answer, asked from tests in other packages with the patch in the build. */
public final class ForceDarkModeForTests {
    private ForceDarkModeForTests() {
    }

    /** Whether the controller's light answer comes back dark. */
    public static boolean forcesDark() {
        ForceDarkMode.inBuildForTests = true;
        try {
            return ForceDarkMode.answer(false);
        } finally {
            ForceDarkMode.inBuildForTests = null;
        }
    }
}
