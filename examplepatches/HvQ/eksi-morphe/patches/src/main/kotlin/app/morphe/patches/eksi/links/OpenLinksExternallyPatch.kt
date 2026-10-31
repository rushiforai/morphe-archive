package app.morphe.patches.eksi.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.eksi.shared.Constants.COMPATIBILITY_EKSI
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// 2.5.0+: social links try their native app first, everything else falls through to a Chrome Custom Tab.
private val externalLinkCustomTabFingerprint = Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
    filters = listOf(
        string("android.intent.category.BROWSABLE"),
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "startActivity",
            location = InstructionLocation.MatchAfterWithin(2),
        ),
        // Start of the Custom Tab fallback, reached by branches only.
        opcode(
            Opcode.NEW_INSTANCE,
            location = InstructionLocation.MatchAfterWithin(1),
        ),
        string("com.android.chrome"),
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
        val fallbackMatch = match.instructionMatches[2]
        val launchMatch = match.instructionMatches[4]
        val launch = launchMatch.getInstruction<FiveRegisterInstruction>()

        require(launch.registerCount == 3) { "Unexpected Custom Tab launch registers" }

        // The Custom Tab builder register and the unused tab helper register are free scratch registers here.
        val intentRegister = fallbackMatch.getInstruction<OneRegisterInstruction>().registerA
        val scratchRegister = launch.registerC
        val contextRegister = launch.registerD
        val uriRegister = launch.registerE

        require(
            setOf(intentRegister, scratchRegister, contextRegister, uriRegister).size == 4,
        ) { "Unexpected Custom Tab fallback registers" }

        match.method.apply {
            // Insert after the branch target so all fallback paths run this code, then skip the Custom Tab launch.
            addInstructionsWithLabels(
                fallbackMatch.index + 1,
                """
                    new-instance v$intentRegister, Landroid/content/Intent;
                    const-string v$scratchRegister, "android.intent.action.VIEW"
                    invoke-direct {v$intentRegister, v$scratchRegister, v$uriRegister}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
                    const/high16 v$scratchRegister, 0x10000000
                    invoke-virtual {v$intentRegister, v$scratchRegister}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
                    invoke-virtual {v$contextRegister, v$intentRegister}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                    goto :launched
                """,
                ExternalLabel("launched", getInstruction(launchMatch.index + 1)),
            )
        }
    }
}
