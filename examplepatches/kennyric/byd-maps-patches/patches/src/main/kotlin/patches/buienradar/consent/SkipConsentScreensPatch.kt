package patches.buienradar.consent

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.buienradar.ad.hideAdsPatch
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR
import patches.buienradar.shared.Constants.originalInput
import patches.buienradar.tracking.disableTrackingPatch

/**
 * Splash decision coroutine: `ONBOARDING_DONE` selects the first-run pager
 * (Pay-or-OK page, then the OneTrust consent page); afterwards the
 * Pay-or-OK screen returns until `PAY_OR_OK_SEEN_1` is set.
 */
internal object SplashRouteFingerprint : Fingerprint(
    name = "invokeSuspend",
    strings = listOf("ONBOARDING_DONE", "PAY_OR_OK_SEEN_1"),
)

/** OneTrust wrapper: shows the banner when the SDK requires it or the user opens Privacy settings. */
internal object ConsentBannerFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("OTEventListener.nothingToDoContinue", "OTEventListener.showingBanner"),
)

private fun Method.indexOfString(value: String) = instructions.indexOfFirst {
    it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == value
}

@Suppress("unused")
val skipConsentScreensPatch = bytecodePatch(
    name = "Skip consent screens",
    description = "Skips the first-run Pay-or-OK choice and the OneTrust cookie banner after disabling tracking " +
        "and ads. Records no consent choice; Privacy settings on the Info tab remain available.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)
    dependsOn(originalInput, disableTrackingPatch, hideAdsPatch)

    execute {
        SplashRouteFingerprint.method.apply {
            fun forceTrueAfter(index: Int) {
                val result = (index until instructions.size).first { instructions[it].opcode == Opcode.MOVE_RESULT }
                val register = getInstruction<OneRegisterInstruction>(result).registerA
                replaceInstruction(result, "const/4 v$register, 0x1")
            }
            // Treat the first-run pager and the Pay-or-OK screen as completed.
            forceTrueAfter(indexOfString("ONBOARDING_DONE"))
            val seen = indexOfString("PAY_OR_OK_SEEN_1")
            forceTrueAfter(seen)
            // Pay-or-OK feature check: `if (!flag && !premium) PAY_OR_OK`. With the flag set the
            // route depends only on premium or the seen flag above.
            val flagResult = (seen downTo 2).first { index ->
                instructions[index].opcode == Opcode.MOVE_RESULT &&
                    instructions[index + 1].opcode == Opcode.IF_NEZ &&
                    instructions[index + 2].opcode == Opcode.IF_EQZ
            }
            val flagCall = getInstruction<ReferenceInstruction>(flagResult - 1).reference as MethodReference
            check(flagCall.returnType == "Z" && flagCall.parameterTypes.size == 1) { "Unexpected Pay-or-OK flag call: $flagCall" }
            val register = getInstruction<OneRegisterInstruction>(flagResult).registerA
            replaceInstruction(flagResult, "const/4 v$register, 0x1")
        }

        // Automatic banner only; a manual request from Privacy settings is forced past this check.
        ConsentBannerFingerprint.method.apply {
            val calls = instructions.withIndex().filter { (_, instruction) ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "shouldShowBanner"
            }
            check(calls.size == 1) { "Expected one shouldShowBanner check, found ${calls.size}" }
            val result = calls.single().index + 1
            check(instructions[result].opcode == Opcode.MOVE_RESULT)
            val register = getInstruction<OneRegisterInstruction>(result).registerA
            replaceInstruction(result, "const/4 v$register, 0x0")
        }
    }
}
