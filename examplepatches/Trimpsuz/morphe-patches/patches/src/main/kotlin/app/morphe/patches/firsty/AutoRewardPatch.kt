package app.morphe.patches.firsty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.compatibility.Constants.FIRSTY
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val autoRewardPatch = bytecodePatch(
    name = "Auto-claim free data",
    description = "Claim 20 MB ad data bundles in a loop until your limit is reached",
    default = true
) {
    compatibleWith(FIRSTY)

    extendWith("extensions/firsty/autoreward.mpe")

    execute {
        val method = OnCreateFingerprint.method
        val implementation = method.implementation
            ?: error("FirstyApplication.onCreate() has no method implementation")

        // Inject just before the final return
        val returnIndex = implementation.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_VOID || it.opcode == Opcode.RETURN
        }
        check(returnIndex >= 0) {
            "Could not find the final return in FirstyApplication.onCreate()"
        }

        method.addInstructions(
            returnIndex,
            """
                invoke-static { p0 }, Lapp/morphe/extension/firsty/AutoReward;->bootstrap(Landroid/content/Context;)V
            """
        )
    }
}
