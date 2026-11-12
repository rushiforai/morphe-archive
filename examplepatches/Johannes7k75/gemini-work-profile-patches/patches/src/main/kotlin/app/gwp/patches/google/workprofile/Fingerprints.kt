package app.gwp.patches.google.workprofile

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val ELIGIBILITY_ALLOWED_LOG = "Robin eligibility : Work profile is allowed."
internal const val ELIGIBILITY_DISALLOWED_LOG = "Robin eligibility : is disallowed on Work profile"
internal const val WEB_TRAMPOLINE_LOG = "Trampolining to web app for work profile. %s"

/**
 * Central "is this a managed (work) profile" check of the Google app.
 * Used by several eligibility paths, including the one that fails with error 900009
 * ("use your personal profile").
 */
internal object ManagedProfileCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("#FCF: Managed profile check status : %s"),
    ),
)

/**
 * Gemini ("Robin") eligibility evaluation. Shape in the Google app (17.70.x - 17.72.x):
 *
 * ```
 * iget-boolean vA, p0, LThis;->allowWorkProfile:Z     <- filter 0
 * if-nez vA, :allowed                                 <- filter 1
 * iget-boolean vA, p0, LThis;->otherFlag:Z
 * if-eqz vA, :not_allowed
 * ...
 * const-string .., "Robin eligibility : Work profile is allowed."   <- filter 2
 * ...
 * const-string .., "Robin eligibility : is disallowed on Work profile"  <- filter 3
 * ```
 * When the work profile is allowed, the following "disallowed" block (error 19) is skipped.
 */
internal object RobinEligibilityFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, definingClass = "this", type = "Z"),
        opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
        string(ELIGIBILITY_ALLOWED_LOG, location = MatchAfterWithin(40)),
        string(ELIGIBILITY_DISALLOWED_LOG),
    ),
)

/** Deep link handler that sends work-profile users to the Gemini web app instead of the native UI. */
internal object WorkProfileWebTrampolineFingerprint : Fingerprint(
    filters = listOf(
        string(WEB_TRAMPOLINE_LOG),
    ),
)
