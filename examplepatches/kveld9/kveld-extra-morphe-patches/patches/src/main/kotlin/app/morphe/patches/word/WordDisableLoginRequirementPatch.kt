package app.morphe.patches.word

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_WORD
import app.morphe.patches.shared.clearTryBlocks
import app.morphe.patches.shared.ensureRegisterCount

@Suppress("unused")
val wordDisableLoginRequirementPatch = bytecodePatch(
    name = "Disable Login Requirement",
    description = "Removes login requirement and FTUX paywall screens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WORD)

    execute {
        var patched = 0

        firstRunM0Fingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(2)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, """
                new-instance v0, Lcom/microsoft/office/officehub/objectmodel/TaskResult;
                const/4 v1, 0x0
                invoke-direct {v0, v1}, Lcom/microsoft/office/officehub/objectmodel/TaskResult;-><init>(I)V
                invoke-interface {p2, v0}, Lcom/microsoft/office/officehub/objectmodel/IOnTaskCompleteListener;->onTaskComplete(Lcom/microsoft/office/officehub/objectmodel/TaskResult;)V
                return-void
            """)
            patched++
        }

        firstRunN0Fingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(2)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, """
                invoke-static {}, Lcom/microsoft/office/apphost/OfficeActivityHolder;->GetActivity()Landroid/app/Activity;
                move-result-object v0
                const/4 v1, 0x1
                invoke-static {v0, v1}, Lcom/microsoft/office/officehub/util/OHubSharedPreferences;->setFTUXShown(Landroid/content/Context;Z)V
                return-void
            """)
            patched++
        }

        ftuxPaywallLauncherFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(2)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, """
                new-instance v0, Lcom/microsoft/office/officehub/objectmodel/TaskResult;
                const/4 v1, 0x0
                invoke-direct {v0, v1}, Lcom/microsoft/office/officehub/objectmodel/TaskResult;-><init>(I)V
                invoke-interface {p2, v0}, Lcom/microsoft/office/officehub/objectmodel/IOnTaskCompleteListener;->onTaskComplete(Lcom/microsoft/office/officehub/objectmodel/TaskResult;)V
                return-void
            """)
            patched++
        }

        getIdentityForSignInNameFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            patched++
        }

        checkAndStartSSOIfRequiredFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            patched++
        }

        println("[Disable Login Requirement] Applied $patched hooks -> login requirement and FTUX paywalls removed.")
    }
}
