package semicoloncolonel.mobilestream.patches.cnn.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// CNN 26.21.0 — Faster launch.
//
// CNN's splash screen waits for Optimizely (its feature-flag service) to
// start, and OptimizelyClientFactory starts it with the SDK's asynchronous
// initialize, which downloads a fresh datafile first. When cdn.optimizely.com
// is blocked or slow, the SDK retries with waits of 2, 4 and 8 seconds, so the
// splash stays up for about 14 seconds.
//
// That initialize call now goes to OptimizelyQuickStart, which starts the
// client at once from the datafile already on the phone (Optimizely's cached
// copy, or the one bundled in the app). Optimizely's background updates keep
// the cached copy current.
// ─────────────────────────────────────────────────────────────────────────────

private const val FACTORY = "Lcom/cnn/mobile/android/phone/features/featurestateprovider/optimizely/OptimizelyClientFactory;"
private const val QUICK_START = "Lsemicoloncolonel/mobilestream/extension/cnn/OptimizelyQuickStart;"

@Suppress("unused")
val fasterLaunchPatch = bytecodePatch(
    name = "Faster launch",
    description = "Opens the app without waiting to download its feature settings.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        var replaced = 0
        mutableClassDefBy(FACTORY).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                // OptimizelyManager.initialize(Context, Integer datafileRes, listener)
                if (reference.returnType != "V" || reference.parameterTypes.size != 3 ||
                    reference.parameterTypes[0] != "Landroid/content/Context;" ||
                    reference.parameterTypes[1] != "Ljava/lang/Integer;"
                ) {
                    return@forEachIndexed
                }
                val r = instruction as FiveRegisterInstruction
                method.replaceInstruction(
                    index,
                    "invoke-static { v${r.registerC}, v${r.registerD}, v${r.registerE}, v${r.registerF} }, " +
                        "$QUICK_START->start(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Object;)V",
                )
                replaced++
            }
        }
        if (replaced != 1) throw PatchException("Optimizely initialize call: expected 1, found $replaced")
    }
}
