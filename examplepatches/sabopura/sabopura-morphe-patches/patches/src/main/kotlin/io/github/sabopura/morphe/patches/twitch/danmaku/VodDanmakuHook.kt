package io.github.sabopura.morphe.patches.twitch.danmaku

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import io.github.sabopura.morphe.patches.twitch.chat.describedFields
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.fieldBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val VOD_DANMAKU = "Lio/github/sabopura/morphe/extension/twitch/danmaku/VodDanmaku;"
internal const val VOD_COMMENT_ACCESS = "Lio/github/sabopura/morphe/extension/twitch/danmaku/VodCommentAccess;"
private const val EMOTICON = "Ltv/twitch/android/models/EmoticonModel;"
private const val RENDERED_TEXT = "Landroid/text/SpannedString;"
private const val STRING = "Ljava/lang/String;"
private val logger = Logger.getLogger("Morphe.Twitch.Danmaku")

/** The VOD chat replay comment is a Kotlin data class; its toString() is the stable anchor. */
internal object ChommentModelToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = listOf(),
    returnType = STRING,
    strings = listOf("ChommentModel(id="),
)

/** Bridge name, label in the model's toString, and the type that field must have (null: any object). */
private val COMMENT_FIELDS = listOf(
    Triple("id", "ChommentModel(id=", STRING),
    Triple("vodId", ", vodId=", STRING),
    Triple("offsetSeconds", ", contentOffsetSeconds=", "I"),
    Triple("commenter", ", commenter=", null),
    Triple("message", ", message=", null),
)
private val COMMENTER_FIELDS = listOf(
    Triple("userId", "ChommentCommenterModel(id=", STRING),
    Triple("displayName", ", displayName=", STRING),
    Triple("login", ", username=", STRING),
)
private val MESSAGE_FIELDS = listOf(
    Triple("body", "ChommentMessageModel(body=", STRING),
    Triple("emoticons", ", emoticons=", null),
    Triple("color", ", userColor=", STRING),
)

/**
 * The constructor of the row Twitch adds to the VOD chat list, once per comment as playback reaches
 * it: the only one taking the comment model with its rendered text.
 */
internal fun isVodRowConstructor(method: Method, comment: String): Boolean {
    if (method.name != "<init>") return false
    val parameters = method.parameterTypes.map { it.toString() }
    return comment in parameters && RENDERED_TEXT in parameters
}

/** The p-register that holds parameter [index] of [method] on entry. */
internal fun parameterRegister(method: Method, index: Int): Int =
    1 + method.parameterTypes.take(index).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 as Int }

/** A bridge body returning [field] of the object passed in, for int and object fields. */
internal fun vodBridge(field: FieldReference): String = when {
    field.type == "I" -> """
        check-cast p0, ${field.definingClass}
        iget p0, p0, $field
        return p0
    """
    field.type.startsWith("L") -> fieldBridge(field)
    else -> throw PatchException("Danmaku on VODs: no bridge for ${field.type} field ${field.name}")
}

private fun BytecodePatchContext.resolve(
    owner: String,
    fields: List<Triple<String, String, String?>>,
    into: MutableMap<String, FieldReference>,
) {
    val described = describedFields(classDefBy(owner))
    for ((name, label, type) in fields) {
        into[name] = described[label]?.takeIf { type == null || it.type == type }
            ?: throw PatchException("Danmaku on VODs: $label not found or no longer ${type ?: "an object"}")
    }
}

/**
 * Hands each VOD chat replay comment to the extension as Twitch adds it to the chat list, and
 * returns the fields the extension reads, by bridge name.
 */
internal fun BytecodePatchContext.hookVodComments(): Map<String, FieldReference> {
    val readers = linkedMapOf<String, FieldReference>()
    val comment = ChommentModelToStringFingerprint.originalClassDef
    resolve(comment.type, COMMENT_FIELDS, readers)
    resolve(readers.getValue("commenter").type, COMMENTER_FIELDS, readers)
    resolve(readers.getValue("message").type, MESSAGE_FIELDS, readers)
    val emoticon = classDefBy(EMOTICON)
    for ((name, field, type) in listOf(Triple("emoteId", "id", STRING), Triple("emoteBegin", "begin", "I"))) {
        emoticon.fields.singleOrNull { it.name == field && it.type == type }
            ?: throw PatchException("Danmaku on VODs: EmoticonModel.$field is gone")
        readers[name] = ImmutableFieldReference(EMOTICON, field, type)
    }
    readers.values.forEach { requirePublicField(it, "Danmaku on VODs") }

    val row = classesMatching { type -> type.methods.any { isVodRowConstructor(it, comment.type) } }
        .uniqueContract("VOD chat row")
    val constructor = mutableClassDefBy(row).methods.filter { isVodRowConstructor(it, comment.type) }
        .uniqueContract("VOD chat row constructor")
    val register = parameterRegister(constructor, constructor.parameterTypes.indexOfFirst { it.toString() == comment.type })
    constructor.addInstructions(0, "invoke-static/range {p$register .. p$register}, $VOD_DANMAKU->onComment(Ljava/lang/Object;)V")
    logger.info("Danmaku on VODs: hooked ${row.type} constructor, ${readers.size} fields")
    return readers
}
