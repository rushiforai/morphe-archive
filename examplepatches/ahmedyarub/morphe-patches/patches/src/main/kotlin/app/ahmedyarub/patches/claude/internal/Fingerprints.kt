package app.ahmedyarub.patches.claude.internal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * String resources whose names R8 resource shrinking stripped (`APKTOOL_RENAMED_0x…`), so they can only be
 * matched by id. Ids change every release: update them each time the Claude version is bumped.
 */
private object Resources {
    /** "Internal settings": the row (1.261120.19). */
    const val INTERNAL_SETTINGS_ROW = 0x7f141294

    /** The header of the Settings section that holds the row (1.261120.19). */
    const val INTERNAL_SETTINGS_SECTION = 0x7f141c20
}

/**
 * Both gates of the "Internal settings" entry are an R8-merged `invoke(Object, Object, Object)` Compose
 * lambda testing `account != null && wz.a.a()`: a non-null internal-org object (`b20.b1.e`, type `ap.j4`)
 * and the `is_ant` (Anthropic employee) preference. The anchor is the employee check — a no-argument `()Z`
 * call, its `move-result` and the `if-eqz` that skips the content — followed within the content's setup by
 * the content's string resource, which tells the two gates apart (and from look-alikes elsewhere).
 */
private fun employeeGateFingerprint(stringResource: Int) = Fingerprint(
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        methodCall(parameters = listOf(), returnType = "Z", opcode = Opcode.INVOKE_VIRTUAL),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
        literal(stringResource, location = MatchAfterWithin(20))
    )
)

/**
 * The outer gate (`b20.e1` case 0 in 1.261120.19): the Settings screen renders the section holding the row
 * only when `b1.p || (account != null && wz.a.a())`.
 */
internal val internalSettingsSectionFingerprint = employeeGateFingerprint(Resources.INTERNAL_SETTINGS_SECTION)

/**
 * The inner gate (`a30.s` case 4 in 1.261120.19): inside that section, the "Internal settings" row itself.
 * This is the live row; a hardcoded `"Internal Settings"` literal belongs to a dormant copy of the same shape
 * (`au.l4`) that the app does not render, and another to the internal screen's own header (`p3.x`).
 */
internal val internalSettingsRowFingerprint = employeeGateFingerprint(Resources.INTERNAL_SETTINGS_ROW)
