package app.stayfree.patches.inbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * App preferences constructor (`Loc8;-><init>` in 20.14.1), where the `hasUserImapAccount`
 * delegated pref is built and stored in its own `Lt26;` field (`Loc8;->p`). Same shape as the
 * `hasUserEverLoggedInStayFresh` lookup in [hasEverLoggedInStayFreshPatch].
 */
private object HasUserImapAccountDelegateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("hasUserImapAccount"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, location = InstructionLocation.MatchAfterWithin(3)),
    ),
)

/**
 * Inbox Control Gmail sign-in check (`Lcs4;->i()Z` in 20.16.1): true only when the StayFresh
 * prefs hold a signed-in user (`email`, `display_name`, `photo_url`) plus an access and a
 * `refresh_token`. It is the "Gmail sign-in" item of the Inbox Control permission category.
 */
private object IsGmailSignedInFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("email", "display_name", "photo_url", "refresh_token"),
)

/**
 * Permissions ViewModel `refreshAllGranted(activity)` (`Lg38;->h(Lds0;)V` in 20.14.1). It does
 * not use the permission list shown on the Permissions screen; it ANDs a fixed chain of checks
 * (usage access, accessibility, MIUI background pop-ups on xiaomi/redmi/poco, the
 * Gmail sign-in, the `hasUserImapAccount` pref, overlay, battery optimization, notifications, …) and stores the
 * result in a boolean field. That field drives the home "Tap to complete permission setup" item
 * (`idWarningItem2`, shown while it is false) and the Notification Center "All permissions
 * granted!" state. The manufacturer strings plus the boolean store are unique to it (the
 * onboarding constructor has the same strings but is a constructor).
 */
private object RefreshAllPermissionsGrantedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("xiaomi", "redmi", "poco"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN),
    ),
)

/**
 * With Inbox Control removed nobody can sign in with Gmail, so both of its items (the Gmail
 * sign-in and the `hasUserImapAccount` pref) stay false and the all-granted check never passes:
 * the home screen keeps asking to complete the permission setup even with every remaining
 * permission granted. Only the check's own reads of these two are forced to true; the sign-in
 * state and the pref themselves (and everything else reading them, e.g. sync) are left alone.
 */
val permissionSetupCompletePatch = bytecodePatch(
    description = "Stops the Gmail sign-in from counting as a required permission, so the " +
        "permission setup reminder disappears once every remaining permission is granted.",
) {
    execute {
        val delegateMatch = HasUserImapAccountDelegateFingerprint.match()
        val delegateField = (
            delegateMatch.method.implementation!!.instructions.elementAt(delegateMatch.instructionMatches.last().index)
                as ReferenceInstruction
            ).reference as FieldReference

        RefreshAllPermissionsGrantedFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            // iget-object vX, vY, Loc8;->p:Lt26;  (then d(..) -> check-cast Boolean -> booleanValue)
            val prefIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).let {
                        it.name == delegateField.name && it.definingClass == delegateField.definingClass
                    }
            }
            if (prefIndex < 0) throw PatchException("hasUserImapAccount read not found")

            val booleanValueIndex = (prefIndex until instructions.size).firstOrNull { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == "Ljava/lang/Boolean;" && it.name == "booleanValue"
                    }
            } ?: throw PatchException("hasUserImapAccount booleanValue() not found")

            val moveResultIndex = booleanValueIndex + 1
            val moveResult = instructions[moveResultIndex]
            if (moveResult.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Unexpected ${moveResult.opcode} after booleanValue()")
            }
            val register = (moveResult as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("Unexpected result register v$register")

            addInstruction(moveResultIndex + 1, "const/4 v$register, 0x1")
        }

        val isGmailSignedIn = IsGmailSignedInFingerprint.method

        RefreshAllPermissionsGrantedFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            // iget-object vX, vY, Ljt4;->C:Lcs4;  invoke-virtual {vX}, Lcs4;->i()Z  move-result vX
            val callIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == isGmailSignedIn.definingClass &&
                            it.name == isGmailSignedIn.name &&
                            it.returnType == "Z" &&
                            it.parameterTypes.isEmpty()
                    }
            }
            if (callIndex < 0) throw PatchException("Gmail sign-in check call not found")

            val moveResult = instructions[callIndex + 1]
            if (moveResult.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Unexpected ${moveResult.opcode} after Gmail sign-in check")
            }
            val register = (moveResult as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("Unexpected result register v$register")

            addInstruction(callIndex + 2, "const/4 v$register, 0x1")
        }
    }
}
