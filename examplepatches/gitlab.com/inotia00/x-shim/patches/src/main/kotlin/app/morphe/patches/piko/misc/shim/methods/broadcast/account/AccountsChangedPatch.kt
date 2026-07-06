package app.morphe.patches.piko.misc.shim.methods.broadcast.account

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.kotlin.kotlinHelperPatch
import app.morphe.patches.piko.misc.shim.methods.kotlin.onReceiveParameterCheckInstruction
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup

private const val ACCOUNTS_CHANGED_RECEIVER_CLASS = "Lcom/x/account/AccountsChangedReceiver;"
private const val ACCOUNTS_CHANGED_RECEIVER_SUB_CLASS =
    $$"Lcom/twitter/app/common/account/AppAccountManager$AccountsChangedReceiver;"

val accountsChangedPatch = bytecodePatch(
    description = "AccountsChanged",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        onReceiveFingerprint(ACCOUNTS_CHANGED_RECEIVER_CLASS).method.apply {
            cleanup()
            addInstructions(
                0,
                onReceiveParameterCheckInstruction + """
                    return-void
                """
            )
        }
        onReceiveFingerprint(ACCOUNTS_CHANGED_RECEIVER_SUB_CLASS).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }
    }
}
