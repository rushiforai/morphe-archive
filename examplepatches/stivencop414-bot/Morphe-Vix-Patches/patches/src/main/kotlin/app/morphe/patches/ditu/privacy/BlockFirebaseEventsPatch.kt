package app.morphe.patches.ditu.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object FirebaseEventFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/os/BaseBundle;", name = "putString"),
        methodCall(definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;", name = "logEvent"),
    ),
)

@Suppress("unused")
val blockFirebaseEventsPatch = patch(
    name = "Block app Firebase custom events",
    description = "Stops the app's Firebase custom-event logging call. Other Firebase collection and other analytics SDKs may remain active.",
    default = true,
) {
    category("Privacy")
    compatibleWith(*AppCompatibilities.ditu())
    execute {
        val matches = FirebaseEventFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected exactly one Firebase custom-event sender; found ${matches.size}")
        val method = matches.single().method
        val calls = method.instructions.withIndex().filter { (_, insn) ->
            val ref = insn.getReference<MethodReference>()
            ref?.definingClass == "Lcom/google/firebase/analytics/FirebaseAnalytics;" && ref.name == "logEvent" &&
                ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Landroid/os/Bundle;") && ref.returnType == "V"
        }
        if (calls.size != 1) throw PatchException("Expected exactly one Firebase logEvent call in ${method.definingClass}->${method.name}; found ${calls.size}")
        method.removeInstruction(calls.single().index)
    }
}
