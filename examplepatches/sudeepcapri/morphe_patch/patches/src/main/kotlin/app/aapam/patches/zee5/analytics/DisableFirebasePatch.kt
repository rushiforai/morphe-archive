package app.aapam.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.aapam.patches.zee5.shared.Constants
import app.aapam.patches.zee5.shared.FirebaseInitFingerprint

@Suppress("unused")
val disableFirebasePatch = bytecodePatch(
    name = "Disable Firebase analytics",
    description = "Prevents Firebase Analytics from initializing, stopping " +
        "event and user-property reporting to Google.",
) {
    compatibleWith(Constants.COMPATIBILITY_ZEE5_TV)

    execute {
        val method = FirebaseInitFingerprint.method

        // Inserting a bare return-void at index 0 would leave the constructor
        // without a super call, which the ART verifier rejects at class-load
        // time with "Constructor returning without calling superclass
        // constructor". Locate the existing super constructor call and return
        // right after it, so the instance is fully constructed but no Firebase
        // state is initialized. The remaining body becomes unreachable dead
        // code, which is valid bytecode.
        val index = method.instructions.indexOfFirst { ins ->
            (ins as? ReferenceInstruction)?.reference is MethodReference &&
                (ins.reference as MethodReference).name == "<init>"
        }
        check(index >= 0) {
            "Could not locate super constructor call in DefaultFirebaseAnalytics.<init>"
        }

        method.addInstructions(index + 1, "return-void\n")
    }
}
