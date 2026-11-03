package app.template.patches.fotmob.misc.font

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

// The system font values FotMob itself uses in the base theme (values/styles.xml) and for
// Burmese (values-my-v26/styles.xml), where Roboto Flex is never used.
private val SYSTEM_THEME_FONTS = mapOf(
    "font_regular" to "sans-serif",
    "font_medium" to "sans-serif-medium",
    "font_semi_bold" to "sans-serif-medium",
    "font_extra_bold" to "sans-serif-black",
    "nativeAdBodyFont" to "sans-serif",
    "nativeAdTitleFont" to "sans-serif-medium",
)

/** The single <style name="[name]"> of [path], failing loudly when it is missing or duplicated. */
private fun org.w3c.dom.Document.style(path: String, name: String): Element {
    val styles = getElementsByTagName("style")
    val matches = (0 until styles.length)
        .mapNotNull { styles.item(it) as? Element }
        .filter { it.getAttribute("name") == name }
    return matches.singleOrNull()
        ?: throw PatchException("$path: expected one style \"$name\", found ${matches.size}")
}

/** Sets the existing <item name="[item]"> of [style] to [value], failing loudly when it is missing. */
private fun Element.setItem(path: String, item: String, value: String) {
    val items = getElementsByTagName("item")
    val matches = (0 until items.length)
        .mapNotNull { items.item(it) as? Element }
        .filter { it.getAttribute("name") == item }
    val node = matches.singleOrNull()
        ?: throw PatchException("$path: style \"${getAttribute("name")}\" has ${matches.size} items \"$item\", expected one")
    node.textContent = value
}

// XML Views: the API 26+ theme points the font theme attributes at the Roboto Flex font
// families; point them at the system families the base and Burmese themes use instead. The
// switch text appearance names its font directly, so it gets the system medium family.
private val useSystemFontResourcePatch = resourcePatch(
    description = "Points the app theme fonts at the system font.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        val themePath = "res/values-v26/styles.xml"
        val basePath = "res/values/styles.xml"
        decode(themePath, basePath)

        document(themePath).use { doc ->
            val theme = doc.style(themePath, "Base.Theme.FotMob.V26")
            SYSTEM_THEME_FONTS.forEach { (item, value) -> theme.setItem(themePath, item, value) }
        }
        document(basePath).use { doc ->
            val switch = doc.style(basePath, "TextAppearance.FotMob.Switch")
            switch.setItem(basePath, "android:fontFamily", "sans-serif-medium")
            switch.setItem(basePath, "fontFamily", "sans-serif-medium")
        }
    }
}

@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Uses the system font instead of the app's own font.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(useSystemFontResourcePatch)

    execute {
        // 1. Compose: the font holder's static flag (app font allowed) is stored as false, so
        // the typography, the weight mapping and the splash tagline take FotMob's own system font
        // path. Both branches jump to the store, so the forced value goes in at its label.
        AppFontFlagFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val storeIndex = fingerprint.instructionMatches.last().index
            val flag = method.getInstruction<ReferenceInstruction>(storeIndex).reference as FieldReference
            if (flag.definingClass != method.definingClass || flag.type != "Z") {
                throw PatchException("FotMob font flag: the store after the \"my\" check writes $flag, not a boolean of ${method.definingClass}")
            }
            val register = method.getInstruction<OneRegisterInstruction>(storeIndex).registerA
            val zero = if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0"
            method.addInstructionsAtControlFlowLabelChecked(storeIndex, zero)
        }

        // 2. Code-set Views: the Typeface loader skips the font resource and returns the system
        // family its caller passes ("sans-serif", "sans-serif-medium") in the requested style.
        // The /range form keeps the call valid whatever register p2 lands on.
        TypefaceLoaderFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range {p2 .. p3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;
                move-result-object v0
                return-object v0
            """,
        )
    }
}
