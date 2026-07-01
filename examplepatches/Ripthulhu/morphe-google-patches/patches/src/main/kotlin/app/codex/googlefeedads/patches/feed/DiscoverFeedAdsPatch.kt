package app.codex.googlefeedads.patches.feed

import app.codex.googlefeedads.patches.shared.Constants.COMPATIBILITY_GOOGLE_APP
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/codex/googlefeedads/extension/GoogleFeedAdsPatch;"

internal object DiscoverStreamSubtreeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("TB#getStreamSubtree"),
        string("Created StreamSubTree successfully, items %s"),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            definingClass = "Ljava/util/List;",
            name = "size",
            returnType = "I",
            location = MatchAfterImmediately(),
        ),
    ),
)

@Suppress("unused")
val removeDiscoverFeedAdsPatch = bytecodePatch(
    name = "Remove Discover feed ads",
    description = "Filters likely ad nodes from the Google app Discover feed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_APP)

    extendWith("extensions/extension.mpe")

    execute {
        DiscoverStreamSubtreeFingerprint.method.apply {
            val logStringIndex = DiscoverStreamSubtreeFingerprint.instructionMatches[1].index
            val sizeCallIndex = DiscoverStreamSubtreeFingerprint.instructionMatches[2].index
            val listRegister = getInstruction<FiveRegisterInstruction>(sizeCallIndex).registerC

            addInstructions(
                logStringIndex,
                """
                    invoke-static { v$listRegister }, $EXTENSION_CLASS->filterDiscoverFeedNodes(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$listRegister
                """,
            )
        }
    }
}
