package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.turnOffTruthFeatures

// Truth Social 1.28.3. Truth+ is the paid tier: live and on-demand TV, plus
// Gems rewards. Its promotions are Compose functions, found here by the
// trace names the app keeps in its release build. Each one returns before
// it draws anything, so nothing is left in its place:
//
// - the Truth+ button at the top right of the home feeds
// - the strip of live Truth+ streams at the top of the home feeds
// - the row of Truth+ live shows in the feeds
// - the Truth+ banner in the feeds
// - the "Subscribe to Truth+" banner in the side menu
//
// It also turns off the server's switches for the Watch tab (Truth+ TV)
// and the live shows row.
private val TRUTH_PLUS_COMPOSABLES = listOf(
    "com.truthsocial.app.features.timeline.feeds.LiveCarouselChipStrip (",
    "com.truthsocial.app.features.timeline.render.LiveShowsFeedItemRenderer.Render (",
    "com.truthsocial.core.ui.timeline.presentation.TruthPlusBanner (",
    "com.truthsocial.app.common.components.navigation.navdrawer.NonPremiumTruthGemsBannerRow (",
)

// The top bar's actions slot, a lambda that takes the row scope, the
// composer, and the change flags. Its only content is the Truth+ button.
private const val TOP_BAR_ACTIONS = "com.truthsocial.app.features.timeline.feeds.ComposableSingletons\$FeedsTopBarContentKt.lambda\$"

private fun Method.traceNames() = implementation?.instructions
    ?.filter { it.opcode == Opcode.CONST_STRING }
    ?.map { ((it as ReferenceInstruction).reference as StringReference).string }
    .orEmpty()

private fun Method.isTruthPlusComposable(): Boolean {
    val names = traceNames()
    if (names.any { name -> TRUTH_PLUS_COMPOSABLES.any { name.startsWith(it) } }) return true
    return parameterTypes.size == 3 && names.any { it.startsWith(TOP_BAR_ACTIONS) }
}

@Suppress("unused")
val hideTruthPlusPatch = bytecodePatch(
    name = "Hide Truth+",
    description = "Hides the Truth+ button, the Watch tab, the Truth+ live shows row, and the Truth+ banners.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val found = mutableSetOf<String>()
        forEachMatchingMethod({ true }, { it.isTruthPlusComposable() }) { method ->
            found += method.traceNames().first { name ->
                TRUTH_PLUS_COMPOSABLES.any { name.startsWith(it) } || name.startsWith(TOP_BAR_ACTIONS)
            }.substringBefore(" (").substringBefore(".lambda")

            if (method.returnType == "V") {
                method.addInstructions(0, "return-void")
            } else {
                // Lambdas return kotlin.Unit, read from the field they already use.
                val unit = method.implementation!!.instructions.firstNotNullOfOrNull {
                    if (it.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
                    ((it as ReferenceInstruction).reference as FieldReference)
                        .takeIf { field -> field.type == method.returnType && field.definingClass == method.returnType }
                } ?: throw PatchException("Unit not found in ${method.definingClass}->${method.name}")
                method.addInstructions(
                    0,
                    """
                        sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}
                        return-object v0
                    """.trimIndent(),
                )
            }
        }
        turnOffTruthFeatures("watch_tab", "live_content_carousel")
        if (found.size < 5) throw PatchException("Truth+ promotions not all found: $found")
    }
}
