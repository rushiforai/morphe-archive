package app.d0nj.patches.niagara

import app.d0nj.patches.niagara.Constants.COMPATIBILITY_NIAGARA
import app.d0nj.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val removeAnalyticsPatch = bytecodePatch(
    name = "Remove analytics",
    description = "Stops usage reports, retention events and analytics sessions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    execute {
        val successStub = successResultStub(SingularFirstSessionWorkFingerprint.method)

        UsageReportUploadWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        RetentionEventsWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        GdprConsentSyncWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        SingularFirstSessionWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        SingularSessionWorkFingerprint.method.apply {
            clearBody()
            addInstructions(0, successStub)
        }

        AttributionPostFingerprint.method.apply {
            clearBody()
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        FirebaseCollectionToggleFingerprint.method.apply {
            clearBody()
            addInstructions(0, "return-void")
        }
    }
}

/** The success `Result` factory the analytics workers return on completion. */
private fun successResultStub(workMethod: MutableMethod): String {
    val instructions = workMethod.implementation!!.instructions.toList()
    for (i in 0 until instructions.size - 2) {
        val reference = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (instructions[i].opcode.toString() != "INVOKE_STATIC") continue
        if (reference.parameterTypes.isNotEmpty()) continue
        val second = instructions[i + 1].opcode.toString()
        val third = instructions[i + 2].opcode.toString()
        if (second == "MOVE_RESULT_OBJECT" && third == "RETURN_OBJECT") {
            val resultType = reference.returnType
            check(resultType.startsWith("Lb/")) { "Unexpected success result type: $resultType" }
            return "invoke-static {}, ${reference.definingClass}->${reference.name}()$resultType\n" +
                "move-result-object v0\n" +
                "return-object v0"
        }
    }
    error("Could not discover the success Result factory in SingularFirstSessionReportWorker")
}
