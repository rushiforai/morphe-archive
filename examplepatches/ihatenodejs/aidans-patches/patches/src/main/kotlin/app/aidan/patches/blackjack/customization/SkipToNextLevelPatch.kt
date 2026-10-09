package app.aidan.patches.blackjack.customization

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val UNITY_PLAYER_ACTIVITY = "Lcom/unity3d/player/UnityPlayerActivity;"
private const val SKIP_LEVEL_DIALOG = "Lapp/aidan/extension/blackjack/SkipLevelDialog;"

@Suppress("unused")
val skipToNextLevelPatch = bytecodePatch(
    name = "Skip to Next Level",
    description = "Allows tapping the next level indicator on the top bar to show a confirmation dialog and skip to the next level. REQUIRES Add Custom Chip Store to be enabled.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_BLACKJACK)
    dependsOn(addCustomChipStorePatch)
    extendWith("extensions/extension.mpe")

    execute {
        val activity = mutableClassDefByOrNull(UNITY_PLAYER_ACTIVITY)
            ?: throw PatchException("UnityPlayerActivity class not found")
        val onCreate = activity.methods.singleOrNull { method ->
            method.name == "onCreate" &&
                method.parameterTypes == listOf("Landroid/os/Bundle;") &&
                method.returnType == "V"
        } ?: throw PatchException("UnityPlayerActivity.onCreate(Bundle) method not found")

        val implementation = onCreate.implementation
            ?: throw PatchException("UnityPlayerActivity.onCreate(Bundle) has no implementation")
        require(implementation.instructions.lastOrNull()?.opcode == Opcode.RETURN_VOID) {
            "Unexpected UnityPlayerActivity.onCreate(Bundle) terminator"
        }

        onCreate.addInstructions(
            implementation.instructions.size - 1,
            "invoke-static {p0}, $SKIP_LEVEL_DIALOG->install(Landroid/app/Activity;)V"
        )
    }
}
