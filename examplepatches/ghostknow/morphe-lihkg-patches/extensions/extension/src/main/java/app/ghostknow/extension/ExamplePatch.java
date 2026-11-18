package app.ghostknow.extension;

/**
 * Placeholder extension module.
 *
 * The LIHKG patches only override fixed return values, so no runtime extension code
 * is merged into the app. This module exists because the patches plugin builds it
 * into extensions/extension.mpe, which future patches can pull in with extendWith().
 */
@SuppressWarnings("unused")
public class ExamplePatch {

    public static boolean showAds() {
        return false;
    }
}
