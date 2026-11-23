package org.ungoogled.patches.maps.account.keepopen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.ungoogled.patches.shared.addInstructionsAtLabel

/**
 * The account sheet's custom-action tap: run the action, then ALWAYS answer
 * DISMISS (field a of the dismiss-policy enum; b is NO_DISMISS -- both read off
 * its static initializer), which closes the sheet.
 */
private object AccountSheetActionDismissFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lcmjl;", name = "e"),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, definingClass = "Lcuge;", name = "a", location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lcmnr;", name = "a", location = MatchAfterImmediately()),
        opcode(Opcode.RETURN_OBJECT, MatchAfterImmediately()),
    ),
    custom = { method, _ -> method.definingClass == "Lbnhv;" },
)

/** 26.47: the same tap lives in the shared switch lambda `bqow.a`, policy enum `cmzt`. */
private object AccountSheetActionDismissFingerprint2647 : Fingerprint(
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lcmvk;", name = "e"),
        methodCall(opcode = Opcode.INVOKE_INTERFACE, definingClass = "Lcuno;", name = "a", location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lcmzt;", name = "a", location = MatchAfterImmediately()),
        opcode(Opcode.RETURN_OBJECT, MatchAfterImmediately()),
    ),
    custom = { method, _ -> method.definingClass == "Lbqow;" },
)

/**
 * Lets something of ours opened from the account sheet (the Customization
 * screen, the profile toast) leave the sheet open behind it: when
 * Shapes.SKIP_DISMISS is set, the tap answers NO_DISMISS once instead.
 * Every other row still closes the sheet as usual.
 */
internal val accountSheetNoDismissPatch = bytecodePatch(
    description = "Lets the account sheet stay open behind screens opened from it.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        val is2647 = packageMetadata.versionName == "26.47.00.1022347503"
        val noDismiss = if (is2647) "Lcmzt;->b:Lcmzt;" else "Lcmnr;->b:Lcmnr;"
        val dismissFingerprint = if (is2647) AccountSheetActionDismissFingerprint2647 else AccountSheetActionDismissFingerprint
        dismissFingerprint.let { fp ->
            val dismiss = fp.instructionMatches[2].index
            val register = (fp.method.implementation!!.instructions[dismiss] as OneRegisterInstruction).registerA
            fp.method.addInstructionsWithLabels(
                dismiss,
                """
                    sget-boolean v$register, $SHAPES->SKIP_DISMISS:Z
                    if-eqz v$register, :dismiss
                    const/4 v$register, 0x0
                    sput-boolean v$register, $SHAPES->SKIP_DISMISS:Z
                    sget-object v$register, $noDismiss
                    return-object v$register
                """,
                ExternalLabel("dismiss", fp.method.implementation!!.instructions[dismiss]),
            )
        }
    }
}

/** Shows the OneGoogle account sheet (the avatar tap runs it); the only place its dynamic-colour flag is set. */
private object AccountMenuShowerFingerprint : Fingerprint(
    name = "b",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("enableDynamicColors")),
)

/**
 * androidx Fragment.onDestroy -- the bare `mCalled = true`. Identified through
 * the fragment state manager's performDestroy: it clears mCalled, runs a
 * lambda whose switch case 14 calls this, then throws "... did not call
 * through to super.onDestroy()" if it is still false. Several other lifecycle
 * callbacks have the identical body, so the name is pinned to that finding.
 */
private object FragmentOnDestroyFingerprint : Fingerprint(
    definingClass = "Lbj;",
    name = "ai",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(1),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = "this", name = "O", location = MatchAfterImmediately()),
        opcode(Opcode.RETURN_VOID, MatchAfterImmediately()),
    ),
)

/** 26.47 keeps the fragment class as `ai` with the same `ai()` onDestroy body. */
private object FragmentOnDestroyFingerprint2647 : Fingerprint(
    definingClass = "Lai;",
    name = "ai",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(1),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = "this", name = "O", location = MatchAfterImmediately()),
        opcode(Opcode.RETURN_VOID, MatchAfterImmediately()),
    ),
)

/** The account sheet's Settings row: its case in the shared row-click dispatcher, from its first instruction. */
private object SettingsRowClickFingerprint : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", name = "a"),
        opcode(Opcode.MOVE_OBJECT, MatchAfterImmediately()),
        checkCast("Lomf;", location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lomf;", location = MatchAfterImmediately()),
        string("SettingsActionSpecClicked", location = MatchAfterImmediately()),
    ),
)

/** 26.47's Settings case: same dispatcher shape, row holder `ool`. */
private object SettingsRowClickFingerprint2647 : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", name = "a"),
        opcode(Opcode.MOVE_OBJECT, MatchAfterImmediately()),
        checkCast("Lool;", location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lool;", location = MatchAfterImmediately()),
        string("SettingsActionSpecClicked", location = MatchAfterImmediately()),
    ),
)

internal val keepAccountSheetOpenPatch = bytecodePatch(
    description = "Returning from Settings or Customization, or tapping \"Your profile\", " +
        "leaves the account sheet open instead of dropping back to the map.",
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(sharedExtensionPatch, accountSheetNoDismissPatch)

    execute {
        val is2647 = packageMetadata.versionName == "26.47.00.1022347503"
        // Remember the sheet's shower every time it opens, so it can be re-shown.
        AccountMenuShowerFingerprint.method.addInstructions(0, "sput-object p0, $SHAPES->MENU:Ljava/lang/Object;")

        // Report every fragment destroy; Shapes re-shows the sheet when the Settings page goes away.
        val fragmentDestroy = if (is2647) FragmentOnDestroyFingerprint2647 else FragmentOnDestroyFingerprint
        fragmentDestroy.method.addInstructions(0, "invoke-static { p0 }, $SHAPES->fragmentDestroyed(Ljava/lang/Object;)V")

        // The Settings row asks for the sheet back. At the case's own label, so the switch reaches it.
        val settingsRow = if (is2647) SettingsRowClickFingerprint2647 else SettingsRowClickFingerprint
        settingsRow.let { fp ->
            val caseEntry = fp.instructionMatches.first().index
            // v0 carries the shared dispatcher's receiver in 26.43. The following
            // move-object writes its destination before reading it, so use that
            // destination as the temporary flag register instead.
            val following = fp.method.implementation!!.instructions[caseEntry + 1]
            if (following.opcode != Opcode.MOVE_OBJECT) throw PatchException("Settings row has no dead move destination")
            val scratch = (following as TwoRegisterInstruction).registerA
            val receiver = (fp.method.implementation!!.instructions[caseEntry] as TwoRegisterInstruction).registerB
            if (scratch == receiver || scratch > 15) throw PatchException("Settings row flag register is live")
            fp.method.addInstructionsAtLabel(
                caseEntry,
                """
                    const/4 v$scratch, 0x1
                    sput-boolean v$scratch, $SHAPES->REOPEN_MENU:Z
                """,
            )
        }
        val dispatcher = if (is2647) "Look;" else "Lome;"
        if (settingsRow.method.definingClass != dispatcher) throw PatchException("Settings row is no longer in the shared dispatcher")
    }
}
