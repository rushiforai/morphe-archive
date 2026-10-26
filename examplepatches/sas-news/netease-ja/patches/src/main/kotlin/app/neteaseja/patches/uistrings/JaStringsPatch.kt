package app.neteaseja.patches.uistrings

import app.morphe.patcher.patch.resourcePatch
import app.neteaseja.patches.shared.Constants.COMPATIBILITY_NETEASE

/**
 * Adds a Japanese locale overlay (res/values-ja/strings.xml) built from
 * translations curated in tools/ + analysis/.
 *
 * Design policy: only short, high-visibility UI strings are translated, and
 * Japanese is kept at roughly the same character width as the original
 * Chinese so layouts do not break. Anything not in the overlay falls back
 * to the app's default (Chinese) strings automatically.
 */
@Suppress("unused")
val jaStringsPatch = resourcePatch(
    name = "日本語化 (Japanese UI)",
    description = "主要なUI文字列を日本語（一部英語）で表示します。レイアウト崩れ防止のため短文中心の部分的翻訳です。",
    default = true
) {
    compatibleWith(COMPATIBILITY_NETEASE)

    execute {
        // The XML is bundled under patches/src/main/resources and loaded
        // with the patch bundle's own class loader (same mechanism
        // extendWith uses for .mpe extensions).
        val xml = object {}.javaClass.classLoader
            ?.getResourceAsStream("translations/values-ja-strings.xml")
            ?.bufferedReader(Charsets.UTF_8)
            ?.use { it.readText() }
            ?: error("translations/values-ja-strings.xml is missing from the patch bundle")

        // Adding res/values-ja/strings.xml overlays the Japanese translations
        // on top of the default strings without touching any other locale.
        // The values-ja directory does not exist in the original APK,
        // so create it first (get() only resolves the path).
        val out = get("res/values-ja/strings.xml", false)
        out.parentFile?.mkdirs()
        out.writeText(xml)
    }
}
