package app.template.patches.pdb.branding

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Restores a visible launcher icon.
 *
 * The exported/base APK ships a deliberately blank default icon:
 * `res/mipmap-anydpi/ic_logo.xml` and `ic_logo_round.xml` are adaptive icons whose
 * `<foreground>` is `@null`. The visible icon normally comes from one of the ~58
 * theme aliases (`pdb.app.aliasZenlight`, …) that the app enables at runtime — on a
 * freshly exported or patched APK those states are lost and the launcher falls back
 * to the blank adaptive icon.
 *
 * This patch points the adaptive icons' foreground at the app's own brand glyph
 * (`img_big_logo` — a transparent-background logo bitmap; the adaptive background is
 * already white). The "Pdb Extras" icon switcher can still pick any of the theme
 * aliases at runtime.
 */
@Suppress("unused")
val pdbFixAppIconPatch = resourcePatch(
    name = "Fix app icon",
    description = "Gives the default launcher icon a real foreground. The base APK ships an " +
        "adaptive icon with a null foreground (the visible icon normally comes from a theme " +
        "alias enabled at runtime).",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        for (path in listOf(
            "res/mipmap-anydpi/ic_logo.xml",
            "res/mipmap-anydpi/ic_logo_round.xml",
        )) {
            document(path).use { doc ->
                val foregrounds = doc.getElementsByTagName("foreground")
                for (i in 0 until foregrounds.length) {
                    val el = foregrounds.item(i) as? Element ?: continue
                    el.setAttribute("android:drawable", "@drawable/img_big_logo")
                }
            }
        }
    }
}
