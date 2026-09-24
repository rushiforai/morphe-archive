package app.template.patches.nytgames

import app.morphe.patcher.Fingerprint

/**
 * The Hilt-generated Application base class holds the real onCreate().
 *
 * Class hierarchy in 6.34.0:
 *   ReleaseAppCrosswordApplication            (manifest android:name, no onCreate)
 *     -> Hilt_ReleaseAppCrosswordApplication  (generated, defines onCreate)  <-- target
 *       -> CrosswordApplication               (app base)
 *
 * onCreate cannot be renamed/obfuscated (it overrides android.app.Application),
 * and p0 inside it is the Application instance, which is exactly what
 * RefreshRateHelper.install(Application) needs.
 */
internal val applicationOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/nytimes/games/core/Hilt_ReleaseAppCrosswordApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Hilt provider for the "ShowNewGamesHomeAnimations" Abra flag
 * (AbraModule.i(AbraManager, SharedPreferences): Boolean).
 *
 * When true, the home screen renders the animated "new variant" cards — each an
 * app.rive.runtime.kotlin.RiveAnimationView embedded in Compose via AndroidView
 * interop. That interop churn + Rive TextureView compositing is the main
 * UI-thread cost while scrolling the home list. Forcing this provider to return
 * false makes the cards fall back to their static-icon layout.
 *
 * Matched by the stable pref-key string rather than the obfuscated method name.
 */
internal val showHomeAnimationsFlagFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Lcom/nytimes/android/abra/AbraManager;",
        "Landroid/content/SharedPreferences;",
    ),
    strings = listOf("NEW_HOME_VARIANT_ANIMATIONS_PREF"),
)
