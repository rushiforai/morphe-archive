package io.github.bakwudo.uyu.patches.twitch.danmaku

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.bakwudo.uyu.patches.util.fieldsRead
import io.github.bakwudo.uyu.patches.util.instanceField
import io.github.bakwudo.uyu.patches.util.replaceMethodBody

private const val CHAT_MESSAGES_CLASS = "$DANMAKU_EXTENSION_PACKAGE/ChatMessages;"

private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/List;"

/**
 * Sends every batch of received chat messages to the extension, and fills in the extension's
 * ChatMessages methods, which read the obfuscated message and token classes.
 */
internal fun BytecodePatchContext.hookChatMessages() {
    val eventClass = MessagesReceivedEventToStringFingerprint.classDef
    val constructor = eventClass.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, LIST, "Z")
    } ?: throw PatchException("MessagesReceivedEvent(String, List, boolean) constructor not found.")

    // At the start the parameters are untouched. A static call before the superclass
    // constructor is valid, as it does not use the uninitialized this.
    constructor.addInstruction(
        0,
        "invoke-static/range { p1 .. p3 }, $DANMAKU_EXTENSION_CLASS->onMessagesReceived(${STRING}${LIST}Z)V",
    )

    val liveMessage = ChatLiveMessageToStringFingerprint.classDef
    val messageInfo = ChatMessageInfoToStringFingerprint.classDef
    val idField = liveMessage.instanceField(STRING)
    val infoField = liveMessage.instanceField(messageInfo.type)
    // toString prints the sender, flags, timestamp and bits before the tokens, and the badges after.
    val tokensField = ChatMessageInfoToStringFingerprint.originalMethod.fieldsRead(messageInfo.type)
        .firstOrNull { it.type == LIST }
        ?: throw PatchException("ChatMessageInfo tokens field not found.")

    val emoteToken = EmoteTokenToStringFingerprint.classDef
    val tokenBase = emoteToken.superclass
        ?: throw PatchException("Emote token has no superclass.")
    // toString prints the text, then the id.
    val emoteIdField = EmoteTokenToStringFingerprint.originalMethod.fieldsRead(emoteToken.type)
        .filter { it.type == STRING }
        .getOrNull(1)
        ?: throw PatchException("Emote token id field not found.")

    val textToken = tokenClass(tokenBase, "TextToken(text=")
    val mentionToken = tokenClass(tokenBase, "MentionToken(text=")
    val urlToken = tokenClass(tokenBase, "UrlToken(url=")
    val bitsToken = tokenClass(tokenBase, "BitsToken(prefix=")

    fun getter(name: String, type: String, field: FieldReference) =
        replaceMethodBody(CHAT_MESSAGES_CLASS, name, 2, fieldGetter(type, field))

    getter("messageId", liveMessage.type, idField)
    getter("messageInfo", liveMessage.type, infoField)
    getter("tokens", messageInfo.type, tokensField)
    getter("textTokenText", textToken.type, firstStringInToString(textToken))
    getter("mentionTokenText", mentionToken.type, firstStringInToString(mentionToken))
    getter("urlTokenUrl", urlToken.type, firstStringInToString(urlToken))
    getter("emoteTokenId", emoteToken.type, emoteIdField)
    getter("bitsTokenPrefix", bitsToken.type, bitsToken.instanceField(STRING))
    getter("bitsTokenAmount", bitsToken.type, bitsToken.instanceField("I"))
}

/** The token class of ChatMessageInfo whose toString starts with [toStringPrefix]. */
private fun BytecodePatchContext.tokenClass(tokenBase: String, toStringPrefix: String): ClassDef =
    classDefByStrings(toStringPrefix, StringComparisonType.CONTAINS).singleOrNull { it.superclass == tokenBase }
        ?: throw PatchException("Chat token class ($toStringPrefix) not found uniquely.")

/** The text field of a token, which toString prints first. */
private fun firstStringInToString(tokenClass: ClassDef): FieldReference =
    tokenClass.methods.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
        ?.fieldsRead(tokenClass.type)
        ?.firstOrNull { it.type == STRING }
        ?: throw PatchException("Text field of ${tokenClass.type} not found.")
