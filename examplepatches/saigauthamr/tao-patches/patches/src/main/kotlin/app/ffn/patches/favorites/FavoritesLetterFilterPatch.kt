package app.ffn.patches.favorites

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

// List type of the shared user story list screen that shows favorite stories.
private const val LIST_TYPE_FAVORITES = 2

// Title prefix the list uses for "all titles" (sent to the server as an empty prefix).
private const val PREFIX_ALL = "@"

/**
 * The user story list screen's load method (Ab.S0 in 66.5). It reads the title prefix filter,
 * then later reads the list type to pick the endpoint.
 */
internal object UserStoryListLoadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = "Ljava/lang/String;"),
        string(PREFIX_ALL, location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET, type = "I"),
        string("user/fav/story/v3"),
    ),
)

@Suppress("unused")
val favoritesLetterFilterPatch = patch(
    name = "Favorites letter filter",
    description = "Opens favorite stories filtered to one starting letter instead of all titles. " +
        "Use this when the full favorites list fails to load. Other letters stay available in the A-Z bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    val letter by stringOption(
        key = "letter",
        default = "A",
        title = "Starting letter",
        description = "Title letter the favorite stories list opens with, or # for titles starting with a non-letter.",
        required = true,
    ) { it != null && it.length == 1 && (it[0].isLetter() || it == "#") }

    execute {
        UserStoryListLoadFingerprint.let {
            val prefixRead = it.instructionMatches[0]
            val prefixField = prefixRead.fieldReference
            val listTypeField = it.instructionMatches[2].fieldReference
            // The prefix read is overwritten immediately, so its destination and the "@" register are free here.
            val (free1, screen) = prefixRead.getInstruction<TwoRegisterInstruction>().let { i -> i.registerA to i.registerB }
            val free2 = it.instructionMatches[1].getInstruction<OneRegisterInstruction>().registerA

            // The prefix read is a branch target, so the check must take over its label.
            it.method.addInstructionsAtControlFlowLabel(
                prefixRead.index,
                """
                    iget v$free1, v$screen, $listTypeField
                    const/4 v$free2, $LIST_TYPE_FAVORITES
                    if-ne v$free1, v$free2, :keep_prefix
                    iget-object v$free1, v$screen, $prefixField
                    const-string v$free2, "$PREFIX_ALL"
                    invoke-virtual { v$free1, v$free2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v$free1
                    if-eqz v$free1, :keep_prefix
                    const-string v$free1, "${letter!!.uppercase()}"
                    iput-object v$free1, v$screen, $prefixField
                    :keep_prefix
                    nop
                """,
            )
        }
    }
}
