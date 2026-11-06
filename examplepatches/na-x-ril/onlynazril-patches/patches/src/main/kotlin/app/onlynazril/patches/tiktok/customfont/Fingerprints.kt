package app.onlynazril.patches.tiktok.customfont

import app.morphe.patcher.Fingerprint

/**
 * Anchors for the custom-font patch.
 *
 * The class that owns the anchors is obfuscated and renames with every
 * build: on 46.5.3 it is `X.05oe`, on 47.0.3 `X.0lNd`, on 47.1.4
 * `X.05o5`. What does not move, on every version checked, is the shape:
 *
 *  - the class reads one of the font files TikTok bundles as its own
 *    faces, `font/TikTok-Display-Regular.otf` or
 *    `font/TikTok-Text-Regular.otf`, in the factory method itself;
 *  - the factory is static and takes the nine parameters below,
 *    returning the face to draw with. TikTok resolves a variable-font
 *    request (weight, width, slant, optical size axes) through it and
 *    falls back to the bundled static faces when the platform builder
 *    has none.
 *
 * Every other Typeface factory in the bundle takes fewer parameters,
 * so the nine-parameter shape is unique without a name.
 */
private const val DISPLAY_FONT = "font/TikTok-Display-Regular.otf"
private const val TEXT_FONT = "font/TikTok-Text-Regular.otf"

/** The bundled faces the factory falls back to, in either of its two families. */
internal val FONT_KEYS = listOf(DISPLAY_FONT, TEXT_FONT)

/** The factory's shape: TikTok's variable-font resolver, nine parameters. */
internal val FACTORY_PARAMETERS = listOf(
    "F", "I", "F", "F", "Ljava/lang/Float;", "F", "I", "Ljava/util/Map;", "I",
)

/** What the factory answers with. */
internal const val FACTORY_RETURN = "Landroid/graphics/Typeface;"

/**
 * The Compose loader's first parameter: the Context. Its second is the
 * app's obfuscated font request, so only the Context can be matched by
 * name. On 47.0.3 the loader is `X.0lNf#LIZ(Context, X.0lNm)`, on
 * 47.1.4 `X.05vZ#LIZ(Context, X.01fp)` - the same two-parameter shape
 * on a class that reads the bundled faces, and the one Jetpack
 * Compose asks (its `AndroidComposeView` builds the FontFamily
 * resolver, which reaches the faces here rather than at the factory).
 */
internal const val COMPOSE_LOADER_CONTEXT = "Landroid/content/Context;"

/**
 * The asset loader's shape: the AssetManager and the path, static, and
 * the body is what tells it apart - it creates the face with
 * `Typeface.createFromAsset`. On 47.0.3 it is `X.0VKh#t4`, on 47.1.4
 * `X.00kn#s4` (the name moves with the class), and every other
 * `(AssetManager, String) -> Typeface` method in the bundle is the
 * framework's or carries a different body. This is the one point Lynx
 * asks for a bundled face (its own `TypefaceCache` calls it), so it is
 * hooked with a path guard: the callers also read sticker and editor
 * asset fonts, which must keep the app's own resolution.
 */
internal const val ASSET_LOADER_ASSET_MANAGER = "Landroid/content/res/AssetManager;"
internal const val ASSET_LOADER_PATH = "Ljava/lang/String;"

/**
 * The WebView font interceptor's shape: a `WebResourceResponse` answered
 * from a `WebView`, on a class that reads a bundled face. Hybrid (H5)
 * pages are drawn by Chromium, so the app serves them the font bytes
 * over the WebView client (`FontLoadManager$init$1#shouldInterceptRequest`
 * on both checked versions - the two overloads are the deprecated
 * `(WebView, String)` and the current `(WebView, WebResourceRequest)`).
 * Hooking it answers the page with the imported file's bytes.
 */
internal const val WEB_FONT_VIEW = "Landroid/webkit/WebView;"
internal const val WEB_FONT_URL = "Ljava/lang/String;"
internal const val WEB_FONT_REQUEST = "Landroid/webkit/WebResourceRequest;"
internal const val WEB_FONT_RESPONSE = "Landroid/webkit/WebResourceResponse;"

/**
 * Where the font picker's answer comes back: the foundation
 * activity delivers every activity result through its own
 * onActivityResult, and the activities the Tweaks screen lives
 * in inherit it. The name is a ByteDance foundation class, which
 * keeps it across builds, and the signature is the framework's
 * own, so neither half of the anchor moves.
 */
internal object BaseActivityOnActivityResultFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/bytedance/ies/foundation/activity/BaseActivity;" &&
            method.name == "onActivityResult" &&
            method.parameterTypes == listOf("I", "I", "Landroid/content/Intent;") &&
            method.returnType == "V" &&
            method.implementation != null
    },
)
