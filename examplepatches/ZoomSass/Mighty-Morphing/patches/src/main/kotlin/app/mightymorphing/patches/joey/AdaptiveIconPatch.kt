package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.morphe.patcher.patch.resourcePatch

private const val FIXED_ICON = "adaptive_icon/ic_launcher_monochrome_fv4.xml"
private const val ICON_PATH = "res/drawable/ic_launcher_monochrome_fv4.xml"

/**
 * Joey's themed (monochrome) launcher icon is drawn the wrong way round: a solid square with the
 * koala cut out of it. This swaps in the koala on a clear background. Fix by IchinichiQ (PR #24).
 */
@Suppress("unused")
val adaptiveIconPatch = resourcePatch(
    name = "Fix adaptive icon",
    description = "Fixes the inverted colours in Joey's themed launcher icon. Fix by IchinichiQ.",
    default = true,
) {
    compatibleWith(JOEY)

    execute {
        val icon = get(ICON_PATH)
        if (!icon.isFile) error("Joey's monochrome icon $ICON_PATH was not found")
        icon.writeText(loadFixedIcon())
    }
}

/** Loads the replacement icon from the patch bundle. */
private fun loadFixedIcon(): String {
    val classLoader = object {}.javaClass.classLoader
    return classLoader.getResourceAsStream(FIXED_ICON)?.use { it.readBytes().decodeToString() }
        ?: error("Bundled icon $FIXED_ICON was not found")
}
