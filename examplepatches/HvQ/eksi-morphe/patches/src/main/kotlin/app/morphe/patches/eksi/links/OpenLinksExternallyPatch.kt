package app.morphe.patches.eksi.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.eksi.shared.Constants.COMPATIBILITY_EKSI
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private val externalLinkCustomTabFingerprint = Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(
        string("APP_LINK_OPEN_EXTERNAL"),
        opcode(
            Opcode.IF_EQZ,
            location = InstructionLocation.MatchAfterWithin(2),
        ),
        methodCall(
            parameters = listOf("Landroid/content/Context;", "Landroid/net/Uri;"),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
            location = InstructionLocation.MatchAfterWithin(2),
        ),
    ),
)

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open external links in browser",
    description = "Opens external web links in the default browser instead of a Chrome Custom Tab.",
) {
    compatibleWith(COMPATIBILITY_EKSI)

    execute {
        val match = externalLinkCustomTabFingerprint.match()
        val preferenceGateMatch = match.instructionMatches[1]
        val launchMatch = match.instructionMatches[2]
        val launch = launchMatch.getInstruction<FiveRegisterInstruction>()

        require(launch.registerCount == 3) { "Unexpected Custom Tab launch registers" }

        val intentRegister = launch.registerC
        val contextRegister = launch.registerD
        val uriRegister = launch.registerE

        match.method.apply {
            replaceInstruction(preferenceGateMatch.index, "nop")
            removeInstruction(launchMatch.index)
            addInstructions(
                launchMatch.index,
                """
                    new-instance v$intentRegister, Landroid/content/Intent;
                    invoke-direct {v$intentRegister}, Landroid/content/Intent;-><init>()V
                    invoke-virtual {v$intentRegister, v$uriRegister}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
                    const-string v$uriRegister, "android.intent.action.VIEW"
                    invoke-virtual {v$intentRegister, v$uriRegister}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
                    const v$uriRegister, 0x10000000
                    invoke-virtual {v$intentRegister, v$uriRegister}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
                    invoke-virtual {v$contextRegister, v$intentRegister}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                """,
            )
        }
    }
}
