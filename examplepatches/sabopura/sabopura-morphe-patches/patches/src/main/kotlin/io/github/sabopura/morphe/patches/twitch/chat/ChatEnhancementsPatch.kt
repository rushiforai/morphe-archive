package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import io.github.sabopura.morphe.patches.twitch.ui.playerMenuResourcePatch
import java.util.logging.Logger

private const val BRIDGE = "Lio/github/sabopura/morphe/extension/twitch/chat/RowAccess;"
private const val SUPPORT = "Lio/github/sabopura/morphe/extension/twitch/chat/ChatEnhancements;"
private const val SET_TEXT = "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView\$BufferType;)V"

private object MessageItem : Fingerprint(strings = listOf("MessageRecyclerItem(messageId=", ", sourceChannelId="))

/**
 * Reports every native chat row to the extension, for the chat patches to decorate.
 * Anchors follow Hooman's GPLv3 Twitch emote patch; no obfuscated identifier is hardcoded.
 */
internal val chatRowBase = bytecodePatch {
    dependsOn(playerMenuResourcePatch, chatLineSharedHooks)
    extendWith(TWITCH_EXTENSION)
    val fields = linkedMapOf<String, FieldReference>()

    execute {
        val model = MessageItem.originalClassDef
        val description = describedFields(model)
        fun fieldAfter(label: String, type: String): FieldReference {
            return description[label]?.takeIf { it.definingClass == model.type && it.type == type }
                ?: throw PatchException("Chat enhancements: unresolved model field $label")
        }
        fields["messageId"] = fieldAfter("MessageRecyclerItem(messageId=", "Ljava/lang/String;")
        fields["channelId"] = fieldAfter(", sourceChannelId=", "Ljava/lang/String;")
        fields["username"] = fieldAfter(", username=", "Ljava/lang/String;")
        fields["userId"] = description[", authorUserId="]?.takeIf {
            it.definingClass == model.type && it.type in setOf("Ljava/lang/String;", "Ltv/twitch/android/models/Tuid;")
        } ?: throw PatchException("Chat enhancements: unsupported author ID field type")
        if (fields.getValue("userId").type == "Ltv/twitch/android/models/Tuid;") {
            classDefBy("Ltv/twitch/android/models/Tuid;").methods.filter {
                it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
            }.uniqueContract("Tuid string conversion")
        }
        fields["timestamp"] = fieldAfter(", messageTimestamp=", "Ljava/lang/Long;")

        fun isBinder(method: Method): Boolean = !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map { it.toString() } == listOf(model.type, "Z") &&
            method.implementation?.instructions?.count {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == SET_TEXT
            } == 1
        val holder = classesMatching { it.methods.any(::isBinder) }.uniqueContract("live message holder")
        val binder = mutableClassDefBy(holder).methods.single(::isBinder)
        val code = binder.instructions.toList()
        val setterIndex = code.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == SET_TEXT
        }
        val setter = code[setterIndex] as? FiveRegisterInstruction
            ?: throw PatchException("Chat enhancements: unexpected text setter instruction")
        fields["textView"] = code.take(setterIndex).asReversed().firstNotNullOfOrNull {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            if (it.opcode == Opcode.IGET_OBJECT &&
                (it as? TwoRegisterInstruction)?.registerA == setter.registerC &&
                field?.type == "Landroid/widget/TextView;") field else null
        } ?: throw PatchException("Chat enhancements: text view field not found")

        // Resolve the RecyclerView ViewHolder's itemView by type and constructor contract.
        var ancestor = holder
        while (!ancestor.type.startsWith("Landroidx/recyclerview/widget/")) {
            ancestor = classDefBy(ancestor.superclass
                ?: throw PatchException("Chat enhancements: missing holder superclass"))
        }
        fields["itemView"] = ancestor.instanceFields.singleOrNull {
            it.type == "Landroid/view/View;" && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                AccessFlags.FINAL.isSet(it.accessFlags)
        } ?: throw PatchException("Chat enhancements: ambiguous RecyclerView itemView")

        fields.values.forEach { reference -> requirePublicField(reference, "Chat enhancements") }
        // Right after Twitch's own setText, so the row only ever reads the text of this message.
        val firstParameter = binder.implementation!!.registerCount - 3
        if (code.take(setterIndex).any { instruction -> instruction.opcode.setsRegister() &&
                (instruction as? OneRegisterInstruction)?.registerA?.let { it in firstParameter..firstParameter + 1 } == true })
            throw PatchException("Chat enhancements: binder overwrites its row and model before the text is set")
        binder.addInstructions(setterIndex + 1, "invoke-static/range {p0 .. p1}, $SUPPORT->bind(Ljava/lang/Object;Ljava/lang/Object;)V")
        scaleRowPadding(binder)
        val join = channelJoinMethod(this)
        join.addInstructions(0, channelJoinHook(join, "$SUPPORT->onChannelJoin(Ljava/lang/Object;Ljava/lang/String;)V"))
        Logger.getLogger("Sabopura.ChatEnhancements").info(
            "Chat enhancements: 1 row hook, 1 channel join hook, ${fields.size} resolved fields")
    }
    finalize {
        fields.forEach { (name, field) ->
            // ART does not narrow an object register to null on an if-eqz edge. Returning
            // from a shared label would merge Tuid and String into Object and reject this
            // entire bridge class when the first chat row calls it. Keep the paths distinct
            // and explicitly materialize null for the declared String return type.
            val convert = if (name == "userId" && field.type == "Ltv/twitch/android/models/Tuid;") """
                if-eqz p0, :id_null
                invoke-virtual {p0}, Ltv/twitch/android/models/Tuid;->toString()Ljava/lang/String;
                move-result-object p0
                return-object p0
                :id_null
                const/4 p0, 0x0
            """ else ""
            replaceBridge(BRIDGE, name, """
                check-cast p0, ${field.definingClass}
                iget-object p0, p0, $field
                $convert
                return-object p0
            """)
        }
    }
}
