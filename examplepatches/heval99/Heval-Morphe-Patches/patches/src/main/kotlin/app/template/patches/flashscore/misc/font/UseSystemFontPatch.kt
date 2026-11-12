package app.template.patches.flashscore.misc.font

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.flashscore.controls.FLASHSCORE_EXTENSION
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val FLASHSCORE_SYSTEM_FONTS = "Lapp/template/extension/flashscore/SystemFonts;"

/**
 * ResourcesCompat.getFont(int, Context) (R8-renamed and merged, t5l.b in 26.11.4): the only static
 * (int, Context)Typeface in the app, and it starts with Context.isRestricted().
 */
private fun Method.isResourcesCompatGetFont() =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "Landroid/graphics/Typeface;" &&
        parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/content/Context;") &&
        implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Landroid/content/Context;" && ref.name == "isRestricted"
            } == true
        } == true

/**
 * Flashscore's text comes in its own Livesport families (regular, bold, extrabold, the score
 * digits, the display face). Compose and two views load those font resources through
 * ResourcesCompat.getFont; the patch makes that call answer the device's system font at the weight
 * the resource stands for (SystemFonts in extensions/flashscore: extrabold 900, bold/medium 500,
 * else 400). Flashscore's own font families and the weights they declare stay, so bold text stays
 * bold. The XML text styles and layouts are rewritten by the companion resource patch.
 *
 * 2026-11-07 (#128): the first version replaced the four Compose families with FontFamily.Default.
 * Flashscore's text styles carry no weight (the bold comes from the family's only font), so every
 * Compose text then rendered at the regular weight, visibly thinner than the XML views.
 */
@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Uses the device's system font instead of Flashscore's custom font.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    dependsOn(useSystemFontStylesPatch)

    extendWith(FLASHSCORE_EXTENSION)

    execute {
        classDefBy(FLASHSCORE_SYSTEM_FONTS)

        val found = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.isResourcesCompatGetFont() }.forEach { found += classDef.type to it.name }
        }
        val (owner, name) = found.singleOrNull()
            ?: throw PatchException("Expected one ResourcesCompat.getFont(int, Context), found $found")
        val getFont = mutableClassDefBy(owner).methods.single { it.name == name && it.isResourcesCompatGetFont() }

        // p0 = id, p1 = context. A non-null answer is returned in place of the app's font.
        val locals = getFont.implementation!!.registerCount - 2
        if (locals < 1) throw PatchException("$owner->$name has no local register")
        getFont.requireNoBranchTargetAt(0, "system font lookup")
        getFont.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-static { p0, p1 }, $FLASHSCORE_SYSTEM_FONTS->typeface(ILandroid/content/Context;)Landroid/graphics/Typeface;
                move-result-object v0
                if-eqz v0, :heval_stock
                return-object v0
            """.trimIndent(),
            ExternalLabel("heval_stock", getFont.getInstruction(0)),
        )
    }
}
