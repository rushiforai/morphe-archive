package com.feurstagram.patches.ascent

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_ASCENT

/*
 * Ascent models the subscription as a `gk4` status object, and every premium gate in the UI is
 * `premiumStatus instanceof ck4` (ck4 = "is premium"). The status is produced in three places
 * Ascent models the subscription as an `sl4` status object, and every premium gate in the UI is
 * `premiumStatus instanceof nl4` (nl4 = "is premium"). The status is produced in two places that
 * have to agree, otherwise the UI flips back to the free state a moment after launch:
 *
 *  - m90.c(Lrc0;)  - the server answer handler. A subscribed answer is mapped to `ml4.a`
 *                    (premium) or `ol4.a` (free), then cached and pushed into the status
 *                    StateFlow `m90.i`.
 *  - s81.invokeSuspend - the coroutine lambda that maps the locally known purchase state into
 *                    the same status (`rl4` premium, `ql4` promotion, `pl4` expired, `ol4` free).
 *                    It runs on the very first launch, before the server has answered, so the UI
 *                    would briefly render the free state without it.
 *
 * Both are pinned to `ml4.a`. The premium-feature settings list is separate state and is left
 * untouched.
 *
 * Repackaging the APK invalidates the Play license shipped with PairIP
 * (`com.pairip.application.Application` -> `LicenseClient.checkLicense`), which otherwise raises
 * the "not licensed" path and kills the process after 30 seconds, so that check is disabled too.
 */

/** Final status object used by every premium gate: `ml4` implements `nl4`. */
private const val PREMIUM_STATUS = "Lml4;"

/** Free status object (`ol4`), the value the server mapping must never produce. */
private const val FREE_STATUS = "Lol4;"

/** Server answer handler of the subscription repository. */
private const val STATUS_REPOSITORY = "Lm90;"

/** Coroutine lambda that maps the local purchase state into a status. */
private const val STATUS_MAPPER = "Ls81;"

/** PairIP Play licensing client. */
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Forces every source of the subscription status to report "premium" and stops PairIP from
 * terminating a re-signed build.
 */
internal fun BytecodePatchContext.unlockPremium() {
    forceSubscribedServerStatus()
    forcePremiumLocalStatus()
    disablePairIpLicenseCheck()
}

/** `m90.c`: both branches of the "subscribed ? ml4.a : ol4.a" mapping return the premium status. */
private fun BytecodePatchContext.forceSubscribedServerStatus() {
    val method = mutableClassDefBy(STATUS_REPOSITORY).methods.singleOrNull { it.name == "c" }
        ?: throw PatchException("Could not find the subscription status handler ($STATUS_REPOSITORY->c)")

    val freeStatusIndex = method.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == FREE_STATUS && reference.name == "a"
    }
    if (freeStatusIndex < 0) {
        throw PatchException("Could not find the free status constant in the subscription status handler")
    }

    val register = (method.instructions[freeStatusIndex] as OneRegisterInstruction).registerA
    method.replaceInstruction(freeStatusIndex, "sget-object v$register, $PREMIUM_STATUS->a:$PREMIUM_STATUS")
}

/**
 * `s81.invokeSuspend`: the mapper is a coroutine state machine whose first branch (`a == 0`) is
 * the subscription mapping. Returning the premium status right after the dispatch field is read
 * skips that mapping (and every suspension point inside it) without touching the second use of
 * the same lambda shape.
 */
private fun BytecodePatchContext.forcePremiumLocalStatus() {
    val method = mutableClassDefBy(STATUS_MAPPER).methods.singleOrNull { it.name == "invokeSuspend" }
        ?: throw PatchException("Could not find the subscription status mapper ($STATUS_MAPPER->invokeSuspend)")

    val dispatchIndex = method.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == STATUS_MAPPER && reference.name == "a"
    }
    if (dispatchIndex < 0) {
        throw PatchException("Could not find the state machine dispatch field in the subscription status mapper")
    }

    val dispatchRegister = (method.instructions[dispatchIndex] as OneRegisterInstruction).registerA
    val originalCode = method.instructions[dispatchIndex + 1]

    method.addInstructionsWithLabels(
        dispatchIndex + 1,
        """
            if-nez v$dispatchRegister, :original
            sget-object v$dispatchRegister, $PREMIUM_STATUS->a:$PREMIUM_STATUS
            return-object v$dispatchRegister
        """,
        ExternalLabel("original", originalCode),
    )
}

/** `LicenseClient.checkLicense(Context)`: no-op, so a re-signed APK never enters the "not licensed" path. */
private fun BytecodePatchContext.disablePairIpLicenseCheck() {
    val method = mutableClassDefBy(LICENSE_CLIENT).methods.singleOrNull { it.name == "checkLicense" }
        ?: throw PatchException("Could not find the PairIP license check ($LICENSE_CLIENT->checkLicense)")

    val instructionCount = method.implementation?.instructions?.size
        ?: throw PatchException("PairIP license check has no implementation")

    method.removeInstructions(instructionCount)
    method.addInstructions(0, "return-void")
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Ascent Premium. The subscription status the app reports to its UI is " +
        "always \"premium\" (server answer, cached state and first-launch mapping), and the Play " +
        "license check is disabled so the re-signed build does not shut itself down.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ASCENT)

    execute {
        unlockPremium()
    }
}
