package app.ahmedyarub.patches.claude.internal

import app.ahmedyarub.patches.claude.shared.forceEmployeeResult
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_CLAUDE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/**
 * Opens an `account != null && wz.a.a()` gate matched by [gate]: the employee check's result is set to 1
 * and the null check just before the call is removed. The gated content does not read that account object
 * (the row's onClick is passed in and the internal screen is self-contained).
 */
context(_: BytecodePatchContext)
private fun openEmployeeGate(gate: Fingerprint) = gate.forceEmployeeResult(matchIndex = 1).apply {
    val callIndex = gate.instructionMatches[0].index
    val nullCheckIndex = (callIndex - 1 downTo 0).first { getInstruction(it).opcode == Opcode.IF_EQZ }
    replaceInstruction(nullCheckIndex, "nop")
}

@Suppress("unused")
val showInternalSettingsPatch = bytecodePatch(
    name = "Show internal settings",
    description = "Shows the Settings screen's \"Internal settings\" entry, normally only for Anthropic " +
            "accounts: GrowthBook feature flag overrides, endpoint selection, network and usage simulation.",
    default = false
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        // The entry is gated twice on `account != null && is_ant`: once around the Settings section that
        // holds it, once around the row itself. Both are opened. The stored is_ant value, which the app
        // reports to analytics, Sentry and GrowthBook attributes (read straight from the preference, not
        // through wz.a), is untouched.
        openEmployeeGate(internalSettingsSectionFingerprint)
        openEmployeeGate(internalSettingsRowFingerprint)
    }
}
