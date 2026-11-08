package io.github.sazap10.patches.sync.onboarding

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sazap10.patches.sync.shared.SyncCompatibility

/**
 * HomeActivity's launch routing. It reads `show___onboarding` (default true) from the "HomeActivity" preferences,
 * opens OnboardingActivity when it is true, and otherwise opens MainActivity.
 */
internal object HomeActivityRouteFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/activities/HomeActivity;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("show___onboarding")),
)

@Suppress("unused")
val skipOnboardingPatch = patch(
    name = "Skip onboarding",
    description = "Opens the main feed on first launch instead of Sync's welcome and setup screens.",
    default = true,
) {
    compatibleWith(*SyncCompatibility.SyncForReddit)

    execute {
        HomeActivityRouteFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val keyIndex = HomeActivityRouteFingerprint.instructionMatches.first().index
            val getBooleanIndex = (keyIndex until instructions.size).first { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/SharedPreferences;" && reference.name == "getBoolean"
            }
            val moveResult = instructions[getBooleanIndex + 1]
            if (moveResult.opcode != Opcode.MOVE_RESULT) throw PatchException("Unexpected code after getBoolean")
            val register = (moveResult as OneRegisterInstruction).registerA

            // Report onboarding as already done. The stored flag is left alone, so the user can still open
            // onboarding from Sync's settings.
            replaceInstruction(getBooleanIndex + 1, "const/4 v$register, 0x0")
        }
    }
}
