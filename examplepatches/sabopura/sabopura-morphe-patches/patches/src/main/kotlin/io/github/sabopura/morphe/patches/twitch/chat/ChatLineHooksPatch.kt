// Hook points follow Lurk (jordanwoodson/lurk-morphe-patches, GPL-3.0); see NOTICE.
package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

internal const val LINE_HOOKS = "Lio/github/sabopura/morphe/extension/twitch/chat/ChatLineHooks;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val SPANNABLE = "Landroid/text/SpannableString;"

private object LineFormatter : Fingerprint(strings = listOf("H:mm"))
private object SpanGroup : Fingerprint(strings = listOf("ChatMessageSpanGroup(timestampSpan="))
private object EmoteToken : Fingerprint(strings = listOf("EmoteToken(id=", ", text="))
private object IrcComponents : Fingerprint(strings = listOf("IrcEventComponents(messageTags=", ", command="))
private object IrcCredentials : Fingerprint(strings = listOf("UserCredentials(nickname=", ", oauthToken="))

private fun BytecodePatchContext.formatterMethods(): Pair<ClassDef, List<MutableMethod>> {
    val formatter = LineFormatter.originalClassDef
    return formatter to mutableClassDefBy(formatter).methods.toList()
}

/** The one line builder that puts a line's five spans together. */
private fun BytecodePatchContext.spanGroupBuilder(): MutableMethod {
    val group = SpanGroup.originalClassDef.type
    return formatterMethods().second.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == group && method.implementation?.instructions?.any {
            it.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                ((it as ReferenceInstruction).reference as? MethodReference)?.let { ref -> ref.definingClass == group && ref.name == "<init>" } == true
        } == true
    }.uniqueContract("chat line builder")
}

/** The (emote token -> image span) builder of the line formatter, identified by its token parameter. */
private fun BytecodePatchContext.emoteSpanBuilder(): MutableMethod {
    val token = EmoteToken.originalClassDef.type
    return formatterMethods().second.filter { method ->
        val parameters = method.parameterTypes.map { it.toString() }
        method.returnType == SPANNABLE && !AccessFlags.STATIC.isSet(method.accessFlags) && parameters.size == 7 &&
            parameters[3] == token && parameters[4] == "Z" && parameters[5] == "Ljava/lang/Integer;"
    }.uniqueContract("emote span builder")
}

/** Installs Compact chat: badges dropped at the line builder, Twitch emotes shown as their code. */
internal val compactChatHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        spanGroupBuilder().apply {
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                    ((it as ReferenceInstruction).reference as? MethodReference)?.definingClass == returnType
            }
            // this, timestamp, badges, sender, inline header, message, isRTL.
            val badges = getInstruction<RegisterRangeInstruction>(index).startRegister + 2
            insertBeforeKeepingLabels(index, """
                invoke-static/range {v$badges .. v$badges}, $LINE_HOOKS->badges($CHAR_SEQUENCE)$CHAR_SEQUENCE
                move-result-object v$badges
            """)
        }
        emoteSpanBuilder().apply {
            val code = EmoteToken.originalClassDef.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }
                .implementation!!.instructions
                .filter { it.opcode == Opcode.IGET_OBJECT }
                .map { (it as ReferenceInstruction).reference as FieldReference }
                .filter { it.type == "Ljava/lang/String;" }
                .toList().takeIf { it.size == 2 }?.last()
                ?: throw PatchException("Compact chat: emote token no longer prints its id and text")
            val tokenParameter = implementation!!.registerCount - parameterTypes.size + 3
            addInstructionsWithLabels(0, """
                invoke-static {}, $LINE_HOOKS->emotesAsText()Z
                move-result v0
                if-eqz v0, :stock
                move-object/from16 v0, v$tokenParameter
                iget-object v0, v0, $code
                new-instance v1, $SPANNABLE
                invoke-direct {v1, v0}, $SPANNABLE-><init>($CHAR_SEQUENCE)V
                return-object v1
            """, ExternalLabel("stock", getInstruction(0)))
        }
    }
}

/** Every IRC line's tags, read for the first-msg marker. */
internal val firstChatterHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        mutableClassDefBy(IrcComponents.originalClassDef).methods.filter {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "Ljava/util/Map;"
        }.uniqueContract("IRC event components constructor").addInstructions(
            0, "invoke-static/range {p1 .. p1}, $LINE_HOOKS->ircTags(Ljava/util/Map;)V")
    }
}

/**
 * Emote and badge sizes (from Twitch's chat image size enum) and the login name of the signed-in user
 * (the IRC nickname), shared by the appearance and filter settings. Both do nothing until those settings are used.
 */
internal val chatLineSharedHooks = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    var enum: ClassDef? = null
    execute {
        mutableClassDefBy(IrcCredentials.originalClassDef).methods.filter {
            it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
        }.uniqueContract("IRC credentials constructor").addInstructions(
            0, "invoke-static/range {p1 .. p1}, $LINE_HOOKS->credentials(Ljava/lang/String;)V")

        val sizes = classesMatching { type ->
            AccessFlags.ENUM.isSet(type.accessFlags) && type.methods.any { it.name == "getSizeDp" && it.returnType == "F" && it.parameterTypes.isEmpty() }
        }.uniqueContract("chat image size enum")
        for (name in listOf("Emote", "Badge")) if (sizes.fields.none { it.name == name })
            throw PatchException("Chat image sizes: enum no longer has $name")
        enum = sizes
        mutableClassDefBy(sizes).methods.first { it.name == "getSizeDp" && it.parameterTypes.isEmpty() }.apply {
            removeInstructions(0, implementation!!.instructions.count())
            addInstructions(0, """
                invoke-static {p0}, $LINE_HOOKS->imageSizeDp(Ljava/lang/Object;)F
                move-result p0
                return p0
            """)
        }
        mutableClassDefBy(sizes).methods.first { it.name == "getLandscapeSizeDp" && it.parameterTypes.isEmpty() }.apply {
            removeInstructions(0, implementation!!.instructions.count())
            addInstructions(0, """
                invoke-static {p0}, $LINE_HOOKS->landscapeImageSizeDp(Ljava/lang/Object;)Ljava/lang/Float;
                move-result-object p0
                return-object p0
            """)
        }
    }
    finalize {
        val sizes = enum ?: return@finalize
        fun stockField(getter: String): FieldReference = (sizes.methods.first { it.name == getter && it.parameterTypes.isEmpty() }
            .implementation!!.instructions.first { it.opcode == Opcode.IGET || it.opcode == Opcode.IGET_OBJECT } as ReferenceInstruction).reference as FieldReference
        replaceBridge(LINE_HOOKS, "stockSizeDp", """
            check-cast p0, ${sizes.type}
            iget p0, p0, ${stockField("getSizeDp")}
            return p0
        """)
        replaceBridge(LINE_HOOKS, "stockLandscapeSizeDp", """
            check-cast p0, ${sizes.type}
            iget-object p0, p0, ${stockField("getLandscapeSizeDp")}
            return-object p0
        """)
    }
}

/** Row padding scale, inserted where Twitch sets the row's vertical padding. */
internal fun scaleRowPadding(binder: MutableMethod) {
    val code = binder.implementation!!.instructions.toList()
    val index = code.indices.filter { i ->
        val ref = (code[i] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/view/View;" && ref.name == "setPadding" &&
            (code[i] as? FiveRegisterInstruction)?.let { it.registerE == it.registerG } == true
    }.uniqueContract("chat row padding")
    val vertical = (code[index] as FiveRegisterInstruction).registerE
    binder.insertBeforeKeepingLabels(index, """
        invoke-static {v$vertical}, $LINE_HOOKS->rowPadding(I)I
        move-result v$vertical
    """)
}

/** Rewrites the boolean a data class's constructor stores into [field]. */
internal fun filterConstructorFlag(type: ClassDef, field: FieldReference, filter: String, context: BytecodePatchContext) {
    val method = context.mutableClassDefBy(type).methods.filter { ctor ->
        ctor.name == "<init>" && ctor.implementation!!.instructions.any {
            it.opcode == Opcode.IPUT_BOOLEAN && (it as ReferenceInstruction).reference.toString() == field.toString()
        }
    }.uniqueContract("constructor writing ${field.name}")
    val index = method.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT_BOOLEAN && (it as ReferenceInstruction).reference.toString() == field.toString()
    }
    val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
    method.addInstructions(index, """
        invoke-static/range {v$register .. v$register}, $filter
        move-result v$register
    """)
}
