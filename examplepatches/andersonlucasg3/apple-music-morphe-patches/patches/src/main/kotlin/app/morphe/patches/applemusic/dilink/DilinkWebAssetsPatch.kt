package app.morphe.patches.applemusic.dilink

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK

private const val AMS_ADAPTOR = "res/raw/js_ams_adaptor.js"

/**
 * The DiLink WebView is Chromium 74, but Apple's sign-in page ships ES2020 JavaScript
 * (optional chaining / nullish coalescing), which Chromium 74 cannot parse. The page then
 * fails with "Uncaught SyntaxError" and never defines window.AMS.
 *
 * The assets were fetched and transpiled to Chrome 74 at build time by tools/fetch_assets.js +
 * tools/assemble_assets.js. This patch embeds them in the APK (inside the AMS adaptor raw
 * resource) and PlatformCompat.interceptWebResource serves them from shouldInterceptRequest,
 * so the head unit never needs a transpiler or a PC.
 */
@Suppress("unused")
internal val dilinkWebAssetsPatch = resourcePatch(
    name = "DiLink: web assets",
    description = "Embeds Chrome 74-compatible copies of the Apple sign-in JavaScript assets so " +
        "the sign-in page can run on the DiLink WebView, without a PC at runtime.",
    default = true,
) {
    compatibleWith(APPLE_MUSIC_DILINK)

    execute {
        val adaptor = get(AMS_ADAPTOR, copy = true).readText()
        // The .mpp bundle only carries classes.dex, so the blob is fetched at patch time (CLI or
        // Morphe Manager) and embedded in the APK; the head unit needs no network for this step.
        val url = java.net.URI(
            "https://raw.githubusercontent.com/andersonlucasg3/apple-music-android-freedom/main/assets/transpiled_assets.bin",
        ).toURL()
        val json = url.openStream().use { it.readBytes().decodeToString() }
        val encoded = java.util.Base64.getEncoder().encodeToString(json.toByteArray())
        get(AMS_ADAPTOR, copy = false).writeText(
            adaptor + "\n;window.__DL_ASSETS_B64__=\"" + encoded + "\";/*__DL_END__*/\n",
        )
    }
}
