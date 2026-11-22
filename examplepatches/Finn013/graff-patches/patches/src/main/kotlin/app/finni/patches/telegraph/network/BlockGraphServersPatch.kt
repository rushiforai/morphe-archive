package app.finni.patches.telegraph.network

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val GRAPH_URL = Regex("^https?://([a-z0-9-]+\\.)*graphmessenger\\.com/")

@Suppress("unused")
val blockGraphServersPatch = patch(
    name = "Block Graph servers",
    description = "Points the Graph Messenger remote config (ads ids, forced update version, update nag, " +
        "recommended chats) and the Graph AI API to 127.0.0.1, so the app never contacts graphmessenger.com.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        var replaced = 0
        Fingerprint(
            filters = listOf(string("graphmessenger.com", StringComparisonType.CONTAINS)),
        ).matchAllOrNull()?.forEach { match ->
            val method = match.method
            val instructions = method.implementation!!.instructions
            for (index in instructions.indices.reversed()) {
                val instruction = instructions[index]
                val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                val url = reference.string
                if (!GRAPH_URL.containsMatchIn(url)) continue
                val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                val blocked = url.replaceFirst(GRAPH_URL, "https://127.0.0.1/")
                method.replaceInstruction(index, "const-string v$register, \"$blocked\"")
                replaced++
            }
        }
        if (replaced == 0) throw PatchException("No graphmessenger.com URLs found")
    }
}
