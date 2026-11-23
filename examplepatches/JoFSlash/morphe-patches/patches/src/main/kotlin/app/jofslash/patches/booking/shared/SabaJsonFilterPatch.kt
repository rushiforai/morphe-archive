package app.jofslash.patches.booking.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

internal const val SABA_JSON_FILTER = "Lapp/jofslash/extension/booking/SabaJsonFilter;"

/** Turns the JSON of a server-driven page, such as the search results, into the app's components. */
private const val SABA_PARSER = "Lcom/booking/saba/SabaParser;"

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC, Opcode.INVOKE_DIRECT, Opcode.INVOKE_INTERFACE,
)

/**
 * Sends the JSON of every server-driven page through SabaJsonFilter before the app reads it. The
 * filter does nothing until a patch turns one of its parts on with [enableSabaJsonFilter].
 */
internal val sabaJsonFilterPatch = bytecodePatch {
    extendWith("extensions/booking.mpe")

    execute {
        // Every page's JSON goes through SabaParser, which reads it with kotlinx Json.decodeFromString.
        var hooked = 0
        mutableClassDefBy(SABA_PARSER).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            // From the end, so the indexes of the calls not yet changed stay right.
            instructions.indices.reversed().forEach { index ->
                val insn = instructions[index]
                if (insn.opcode !in INVOKES) return@forEach
                val reference = (insn as ReferenceInstruction).reference as? MethodReference ?: return@forEach
                if (reference.name != "decodeFromString") return@forEach
                val stringParameter = reference.parameterTypes.indexOfFirst { it.toString() == "Ljava/lang/String;" }
                if (stringParameter < 0) return@forEach
                val call = insn as Instruction35c
                // The receiver comes first for the non-static calls.
                val registerIndex = stringParameter + if (insn.opcode == Opcode.INVOKE_STATIC) 0 else 1
                val register = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
                    .getOrNull(registerIndex) ?: throw PatchException("Unexpected decodeFromString call")
                method.addInstructions(
                    index,
                    """
                        invoke-static { v$register }, $SABA_JSON_FILTER->filter(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """
                )
                hooked++
            }
        }
        if (hooked == 0) throw PatchException("Couldn't find where server-driven pages are read")
        Logger.getLogger("SabaJsonFilter").info("Filtering $hooked server-driven page reads")
    }
}

/** Turns on a part of SabaJsonFilter: [switch] is "hideSponsored" or "hideUrgency". */
internal fun BytecodePatchContext.enableSabaJsonFilter(switch: String) {
    methodOf(SABA_JSON_FILTER, switch).addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """
    )
}
