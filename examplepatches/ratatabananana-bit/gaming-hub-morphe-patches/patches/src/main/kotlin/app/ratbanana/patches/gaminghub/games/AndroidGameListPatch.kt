package app.ratbanana.patches.gaminghub.games

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/AndroidGameList;"

@Suppress("unused")
val androidGameListPatch = bytecodePatch(
    name = "Use Android game list",
    description = "Fills My games with installed apps that Android marks as games. " +
        "Required for any patched Gaming Hub, because Samsung's game service refuses " +
        "apps that are not signed by Samsung.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        GosRequestFingerprint.let { fingerprint ->
            val gosCall = fingerprint.instructionMatches[1].getInstruction<FiveRegisterInstruction>()
            val responseMatch = fingerprint.instructionMatches[2]
            val responseRegister = responseMatch.getInstruction<OneRegisterInstruction>().registerA

            // Right after the GOS call the command and JSON parameter registers are still intact.
            fingerprint.method.addInstructions(
                responseMatch.index + 1,
                """
                    invoke-static { v${gosCall.registerD}, v${gosCall.registerE}, v$responseRegister }, $EXTENSION_CLASS->replaceGosResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$responseRegister
                """,
            )
        }
    }
}
