package app.merak.patches.authenticator.organizer

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.merak.patches.authenticator.shared.MainActivityOnCreateFingerprint
import app.merak.patches.shared.Constants.COMPATIBILITY_GOOGLE_AUTHENTICATOR
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/merak/extension/authenticator/AccountOrganizerPatch;"

@Suppress("unused")
val accountOrganizerPatch = patch(
    name = "Account organizer",
    description = "Adds categories to organize accounts, shown as folders or as cards. " +
        "Switch layouts and manage categories from the bar above the account list.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_AUTHENTICATOR)

    extendWith("extensions/extension.mpe")

    execute {
        // region Resolve the app's account model.

        val displayedOtpCreate = DisplayedOtpCreateFingerprint.originalMethod
        val accountType = displayedOtpCreate.parameterTypes.first().toString()
        val displayedOtpType = displayedOtpCreate.returnType

        // DisplayedOtp keeps a reference to the account it was created from.
        val accountField = DisplayedOtpCreateFingerprint.originalClassDef.fields.singleOrNull { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) && field.type == accountType
        } ?: throw PatchException("Could not find the account field of $displayedOtpType")

        if (AccountMigrationFingerprint.originalClassDef.type != accountType) {
            throw PatchException(
                "Account class mismatch: ${AccountMigrationFingerprint.originalClassDef.type} != $accountType"
            )
        }
        val accountDisplayName = AccountDisplayNameFingerprint.originalMethod
        val accountSecretField = AccountUniqueKeyFingerprint.instructionMatches.first().fieldReference

        // endregion

        // region Hook the account list controller.

        val updateMethod = OtpListUpdateFingerprint.method
        val controllerType = updateMethod.definingClass
        val accountListType = updateMethod.parameterTypes.first().toString()
        val updateMatches = OtpListUpdateFingerprint.instructionMatches
        val setItemsIndex = updateMatches[1].index
        val displayedListRegister = updateMethod.getInstruction<FiveRegisterInstruction>(setItemsIndex).registerD
        val refreshTimerField = updateMatches[3].fieldReference

        // Insert at the higher index first, so the lower index stays valid.
        updateMethod.addInstruction(
            setItemsIndex,
            "invoke-static { v$displayedListRegister }, $EXTENSION_CLASS->onBeforeDisplay(Ljava/util/List;)V",
        )
        updateMethod.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->onAccountsLoaded(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        // endregion

        // region Style account rows as cards.

        OtpRowBindFingerprint.method.apply {
            val returnIndex = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) throw PatchException("Could not find the end of the row binder")
            addInstruction(
                returnIndex,
                "invoke-static { p1, p2 }, $EXTENSION_CLASS->onBindOtpRow(Landroid/view/View;Ljava/lang/Object;)V",
            )
        }

        // endregion

        // region Activity lifecycle and back navigation.

        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onMainActivityCreated(Landroid/app/Activity;)V",
        )

        MainActivityOnBackPressedFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->onBackPressed(Landroid/app/Activity;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // endregion

        // region Implement the extension bridges, which call obfuscated app code.

        val extensionMethods = mutableClassDefBy(EXTENSION_CLASS).methods
        fun bridge(name: String, smali: String) {
            val method: MutableMethod = extensionMethods.firstOrNull { it.name == name }
                ?: throw PatchException("Extension bridge not found: $name")
            method.removeInstructions(0, method.implementation!!.instructions.size)
            method.addInstructions(0, smali)
        }

        bridge(
            "getAccount",
            """
                check-cast p0, $displayedOtpType
                iget-object p0, p0, $accountField
                return-object p0
            """,
        )
        bridge(
            "getAccountDisplayName",
            """
                check-cast p0, $accountType
                invoke-virtual { p0 }, $accountDisplayName
                move-result-object p0
                return-object p0
            """,
        )
        bridge(
            "getAccountSecret",
            """
                check-cast p0, $accountType
                iget-object p0, p0, $accountSecretField
                return-object p0
            """,
        )
        bridge(
            "getUpdateTimer",
            """
                check-cast p0, $controllerType
                iget-object p0, p0, $refreshTimerField
                return-object p0
            """,
        )
        bridge(
            "invokeListUpdate",
            """
                check-cast p0, $controllerType
                check-cast p1, $accountListType
                invoke-virtual { p0, p1 }, $updateMethod
                return-void
            """,
        )

        // endregion
    }
}
