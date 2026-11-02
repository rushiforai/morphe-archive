package app.d0nj.patches.firefox

import app.d0nj.patches.firefox.Constants.COMPATIBILITY_FIREFOX
import app.d0nj.patches.shared.copyBundledResources
import app.d0nj.patches.shared.elementByName
import app.morphe.patcher.patch.resourcePatch

private const val BUNDLED_RESOURCE_DIRECTORY = "firefox-nightly"

private val appLogoFiles = listOf(
    "drawable-hdpi/ic_logo_wordmark_normal.webp",
    "drawable-hdpi/ic_logo_wordmark_private.webp",
    "drawable-mdpi/ic_logo_wordmark_normal.webp",
    "drawable-mdpi/ic_logo_wordmark_private.webp",
    "drawable-nodpi/ic_wordmark_logo.webp",
    "drawable-nodpi/ic_wordmark_text_normal.webp",
    "drawable-nodpi/ic_wordmark_text_private.webp",
    "drawable-xhdpi/ic_logo_wordmark_normal.webp",
    "drawable-xhdpi/ic_logo_wordmark_private.webp",
    "drawable-xxhdpi/ic_logo_wordmark_normal.webp",
    "drawable-xxhdpi/ic_logo_wordmark_private.webp",
    "drawable-xxxhdpi/ic_logo_wordmark_normal.webp",
    "drawable-xxxhdpi/ic_logo_wordmark_private.webp",
    "drawable/ic_firefox.xml",
) + (0..11).map { "drawable/\$ic_firefox__$it.xml" }

@Suppress("unused")
val nightlyAppLogoPatch = resourcePatch(
    name = "Firefox Nightly in-app logo",
    description = "Swaps the logo and wordmark shown inside the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        copyBundledResources(BUNDLED_RESOURCE_DIRECTORY, appLogoFiles)
    }
}
