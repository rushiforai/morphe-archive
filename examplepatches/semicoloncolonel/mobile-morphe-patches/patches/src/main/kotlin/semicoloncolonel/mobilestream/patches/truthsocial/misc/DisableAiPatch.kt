package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants

// Truth Social 1.28.3. Truth AI is Perplexity's search and answers. Its
// entry point is the floating "Ask Perplexity AI" button on the Discover
// screen, drawn by a small slot of the screen that shows it only when the
// user is not searching. The patch returns from that slot before it draws
// the button. The slot is found by its trace name, the icon it loads, and
// its read of the trending posts' loading state.
private const val DISCOVER_SLOT = "com.truthsocial.app.features.discover.DiscoverScreen.Screen.<anonymous> ("

private fun Method.isAskAiSlot(): Boolean {
    val instructions = implementation?.instructions ?: return false
    if (instructions.none {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string.startsWith(DISCOVER_SLOT)
        }
    ) return false
    val returns = instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.returnType }
    return returns.any { it == "Lcom/truthsocial/core/common/ui/loadingstate/LoadingState;" } &&
        returns.any { it.startsWith("Landroidx/compose/ui/graphics/vector/") }
}

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Removes the Ask Perplexity AI button from Discover.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod({ true }, { it.isAskAiSlot() }) { method ->
            // The slot returns kotlin.Unit, read from the field it already uses.
            val unit = method.implementation!!.instructions.firstNotNullOfOrNull {
                if (it.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
                ((it as ReferenceInstruction).reference as FieldReference)
                    .takeIf { field -> field.type == method.returnType && field.definingClass == method.returnType }
            } ?: throw PatchException("Unit not found in the Ask AI slot")
            method.addInstructions(
                0,
                """
                    sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}
                    return-object v0
                """.trimIndent(),
            )
        }
        if (count != 1) throw PatchException("Expected one Ask AI slot, found $count")
    }
}
