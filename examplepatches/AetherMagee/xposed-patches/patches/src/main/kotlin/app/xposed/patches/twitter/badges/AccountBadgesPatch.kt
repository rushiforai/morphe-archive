package app.xposed.patches.twitter.badges

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.xposed.patches.twitter.Constants.COMPATIBILITY_X
import app.xposed.patches.twitter.Constants.EXTENSION_PATH
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun String.toJavaClassName() = substring(1, length - 1).replace('/', '.')

private fun returnString(value: String) =
    """
    const-string v0, "$value"
    return-object v0
    """

private val Method.instructionList: List<Instruction>
    get() = implementation!!.instructions.toList()

private fun Method.stringIndex(value: String) = instructionList.indexOfFirst {
    (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
        ((it as ReferenceInstruction).reference as StringReference).string == value
}.also { require(it >= 0) { "\"$value\" not found in $name" } }

private fun Instruction.field() = (this as ReferenceInstruction).reference as FieldReference

/** The field read closest before the string, e.g. `if (this.x != null) json.put("key", ...)`. */
private fun Method.fieldReadBefore(string: String, opcode: Opcode) =
    instructionList.subList(0, stringIndex(string)).lastOrNull { it.opcode == opcode }?.field()
        ?: throw IllegalStateException("No $opcode before \"$string\" in $definingClass->$name")

/** The field read closest after the string, e.g. `sb.append("key=").append(this.x)`. */
private fun Method.fieldReadAfter(string: String, opcode: Opcode) =
    instructionList.drop(stringIndex(string) + 1).firstOrNull { it.opcode == opcode }?.field()
        ?: throw IllegalStateException("No $opcode after \"$string\" in $definingClass->$name")

@Suppress("unused")
val accountBadgesPatch = bytecodePatch(
    name = "Account location badges",
    description = "Shows X-Posed style country badges next to names and highlights or hides posts " +
        "from chosen countries, without reporting passive engagement with them. " +
        "Data comes from the X-Posed community cache, falling back to X's \"About this account\". " +
        "Tap a badge for account details and settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_X)

    extendWith(EXTENSION_PATH)

    execute {
        // Badges are ImageSpans appended after the display name, so adding ours
        // to the list lets X measure, ellipsize and draw it like a verified badge.
        TweetHeaderSetDataFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range { p0 .. p4 }, $HOOKS_CLASS->onSetHeaderData(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
            move-result-object p4
            """,
        )

        // Obfuscated class names are resolved here and handed to the extension.
        UsernameBadgeClassExtensionFingerprint.method.addInstructions(
            0,
            returnString(UsernameBadgeToStringFingerprint.originalClassDef.type.toJavaClassName()),
        )
        AboutRepositoryClassExtensionFingerprint.method.addInstructions(
            0,
            returnString(AboutProfileRepositoryFingerprint.originalClassDef.type.toJavaClassName()),
        )

        GraphqlApiConstructorFingerprint.method.apply {
            addInstructions(
                instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID },
                "invoke-static { p0 }, $HOOKS_CLASS->onGraphqlApi(Ljava/lang/Object;)V",
            )
        }

        // Analytics identify posts by author id, so learn id -> handle from every TwitterUser.
        TwitterUserToStringFingerprint.apply {
            val idField = originalMethod.fieldReadAfter("TwitterUser{userId=", Opcode.IGET_WIDE)
            val usernameField = originalMethod.fieldReadAfter(", username='", Opcode.IGET_OBJECT)
            TwitterUserFieldsExtensionFingerprint.method.addInstructions(
                0,
                returnString(listOf(originalClassDef.type.toJavaClassName(), idField.name, usernameField.name).joinToString("|")),
            )
            classDef.methods.filter { it.name == "<init>" }.forEach { constructor ->
                constructor.instructions
                    .mapIndexedNotNull { i, instruction -> i.takeIf { instruction.opcode == Opcode.RETURN_VOID } }
                    .reversed()
                    .forEach { constructor.addInstruction(it, "invoke-static { p0 }, $HOOKS_CLASS->onTwitterUser(Ljava/lang/Object;)V") }
            }
        }

        // Passive engagement filter: client event fields, named by their JSON keys.
        val itemsField = ScribeLogSerializeFingerprint.originalMethod.fieldReadBefore("items", Opcode.IGET_OBJECT)
        val eventNameField = ScribeLogEventNameFingerprint.originalMethod.fieldReadAfter("android:", Opcode.IGET_OBJECT)
        val detailsField = ScribeItemSerializeFingerprint.originalMethod.fieldReadBefore("tweet_details", Opcode.IGET_OBJECT)
        val authorIdField = ScribeItemSerializeFingerprint.originalMethod.fieldReadBefore("author_id", Opcode.IGET_WIDE)
        val itemIdField = ScribeItemSerializeFingerprint.originalMethod.fieldReadBefore("id", Opcode.IGET_WIDE)
        val itemTypeField = ScribeItemSerializeFingerprint.originalMethod.fieldReadBefore("item_type", Opcode.IGET)
        require(eventNameField.type == "Ljava/lang/String;") { "Unexpected event name field $eventNameField" }
        require(authorIdField.definingClass == detailsField.type) { "Unexpected author id field $authorIdField" }
        ScribeFieldsExtensionFingerprint.method.addInstructions(
            0,
            returnString(
                listOf(
                    ScribeLogSerializeFingerprint.originalClassDef.type.toJavaClassName(),
                    eventNameField.name,
                    itemsField.name,
                    ScribeItemSerializeFingerprint.originalClassDef.type.toJavaClassName(),
                    detailsField.name,
                    authorIdField.name,
                    itemIdField.name,
                    itemTypeField.name,
                ).joinToString("|"),
            ),
        )

        EventDispatchFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static { p2 }, $HOOKS_CLASS->shouldDropEvent(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :keep
                return-void
                """,
                ExternalLabel("keep", getInstruction(0)),
            )
        }
    }
}

