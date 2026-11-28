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
// The splash screen waits for Optimizely (CNN's feature-flag service) to start,
// and OptimizelyClientFactory starts it with the SDK's asynchronous initialize,
// which downloads a fresh datafile first. When cdn.optimizely.com is blocked or
// slow, the SDK retries with waits of 2, 4 and 8 seconds, so the splash stays
// up for about 14 seconds. The initialize call is redirected to
// OptimizelyQuickStart, which starts the client at once from the datafile
// already on the phone and refreshes in the background.
//
// 26.23.0 starts Optimizely from the local datafile itself, so this patch does
// not target it. An earlier version also forced the 26.23.0 splash's wait on
// StartupManager.isReady to pass at once. That opened the app before its
// startup config was ready, and the app then stayed on the splash screen.
// ─────────────────────────────────────────────────────────────────────────────

private const val FACTORY = "Lcom/cnn/mobile/android/phone/features/featurestateprovider/optimizely/OptimizelyClientFactory;"
private const val QUICK_START = "Lsemicoloncolonel/mobilestream/extension/cnn/OptimizelyQuickStart;"

@Suppress("unused")
val fasterLaunchPatch = bytecodePatch(
    name = "Faster launch",
    description = "Opens the app without waiting to download its feature settings.",
) {
    category("Setup")
    compatibleWith(Constants.FASTER_LAUNCH_COMPATIBILITY)

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
        // Morphe Manager can apply a patch to a version it does not support when
        // the user allows that. On 26.23.0 and later, the call is gone because
        // the app already starts from its saved settings, so say that plainly.
        if (replaced == 0) {
            throw PatchException(
                "Faster launch supports only CNN 26.21.0. CNN 26.23.0 and later already start without " +
                    "waiting for this download, so they do not need the patch. Turn it off for this version. " +
                    "(No Optimizely initialize call was found in OptimizelyClientFactory.)",
            )
        }
        if (replaced != 1) throw PatchException("Optimizely initialize call: expected 1, found $replaced")
    }
}
