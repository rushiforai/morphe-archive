package app.fakh.extension.kompas;

import app.fakh.extension.shared.GmsCoreCheck;

/** Tells the user when Google sign-in is started without GmsCore installed. */
public final class GmsCore {
    private GmsCore() {
    }

    /** Called where the app starts the Google sign-in. */
    public static void require() {
        GmsCoreCheck.require("Login dengan Google");
    }
}
