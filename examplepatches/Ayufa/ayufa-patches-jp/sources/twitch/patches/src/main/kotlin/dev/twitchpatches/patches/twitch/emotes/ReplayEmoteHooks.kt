package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private object ReplayCommentModelFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(
        string("ChommentModel(id="),
        string(", channelId="),
    ),
)

private object ReplayCommentBinderFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall("Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"),
        methodCall($$"Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V"),
    ),
)

internal fun BytecodePatchContext.injectReplayEmotes() {
    val model = ReplayCommentModelFingerprint.originalClassDef
    val channel = labeledReplayField(model.methods.single { it.name == "toString" }, ", channelId=")
    val bind = ReplayCommentBinderFingerprint.originalMethod
    require(bind.parameterTypes.size == 1) { "Emotes: replay comment binder signature changed." }
    val row = classDefBy(bind.definingClass)
    val holderType = bind.references().filterIsInstance<FieldReference>().filter { it.type == "Landroid/widget/TextView;" }
        .map { it.definingClass }.distinct().uniqueHook("replay text holder")
    val text = classDefBy(holderType).fields.filter { it.type == "Landroid/widget/TextView;" && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        .uniqueHook("replay text field")
    val comment = row.fields.filter { it.type == model.type }.uniqueHook("replay row comment field")
    val channelDeclaration = model.fields.single { it.name == channel.name && it.type == channel.type }
    require(AccessFlags.PUBLIC.isSet(channelDeclaration.accessFlags) && AccessFlags.PUBLIC.isSet(comment.accessFlags)) {
        "Emotes: replay channel fields are inaccessible."
    }
    val owner = mutableClassDefBy(row.type)
    val bridge = nativeReloadMethod(row.type, "twitchPatchReplayEmotes", listOf(row.type, bind.parameterTypes[0].toString()), "V", 5, """
        instance-of v0, p1, $holderType
        if-eqz v0, :done
        check-cast p1, $holderType
        iget-object v0, p1, $text
        iget-object v1, p0, $comment
        iget-object v1, v1, $channel
        invoke-static {v0, v1}, $EMOTES->bind(Landroid/widget/TextView;Ljava/lang/String;)V
        :done
        return-void
    """, static = true)
    owner.methods.add(bridge)
    val target = owner.methods.single { it.reference == bind.reference }
    val touch = target.code().withIndex().filter {
        val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        ref?.name == "setOnTouchListener" && ref.parameterTypes == listOf($$"Landroid/view/View$OnTouchListener;")
    }.uniqueHook("replay touch listener")
    val replacement = ImmutableMethodReference(
        "Ldev/twitchpatches/extension/emotes/ReplayEmoteTouch;", "install",
        listOf("Landroid/widget/TextView;", $$"Landroid/view/View$OnTouchListener;"), "V"
    )
    val call = touch.value as FiveRegisterInstruction
    target.replaceInstruction(touch.index, BuilderInstruction35c(
        Opcode.INVOKE_STATIC,
        call.registerCount,
        call.registerC,
        call.registerD,
        call.registerE,
        call.registerF,
        call.registerG,
        replacement
    )
    )
    require(owner.methods.none { it.name == "twitchPatchBindReplayOriginal" }) { "Emotes: replay binder is already wrapped." }
    owner.methods.remove(target)
    target.name = "twitchPatchBindReplayOriginal"
    owner.methods.add(target)
    owner.methods.add(replayBindingWrapper(target, bridge, bind.name))
}

internal fun replayBindingWrapper(original: MethodReference, bridge: MethodReference, name: String) =
    nativeReloadMethod(original.definingClass, name, original.parameterTypes.map { it.toString() }, "V", 2, """
        invoke-virtual/range {p0 .. p1}, $original
        invoke-static/range {p0 .. p1}, $bridge
        return-void
    """)

internal fun labeledReplayField(method: Method, label: String): FieldReference {
    val code = method.code()
    val marker = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
    require(marker >= 0) { "Emotes: replay channel label changed." }
    val direct = code.asSequence().drop(marker + 1).takeWhile {
        (it as? ReferenceInstruction)?.reference !is StringReference
    }.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .filter { it.definingClass == method.definingClass && it.type == "Ljava/lang/String;" }
        .distinctBy { it.toString() }.toList()
    if (direct.isNotEmpty()) return direct.uniqueHook("replay channel field")
    val helper = code.withIndex().drop(marker + 1).firstOrNull { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.parameterTypes == listOf("Ljava/lang/StringBuilder;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;") &&
            ref.returnType == "V" && instruction.opcode == Opcode.INVOKE_STATIC
    } ?: error("Emotes: replay channel concatenation changed.")
    val call = helper.value as FiveRegisterInstruction
    fun assignment(register: Int) = code.take(helper.index).withIndex().lastOrNull { (_, instruction) ->
        instruction.opcode.setsRegister() && instruction is OneRegisterInstruction &&
            instruction.registerA == register
    } ?: error("Emotes: replay channel argument is unavailable.")
    val nextLabel = assignment(call.registerE)
    require(((nextLabel.value as? ReferenceInstruction)?.reference as? StringReference)?.string == ", vodId=") {
        "Emotes: replay channel concatenation order changed."
    }
    val channel = assignment(call.registerD)
    val field = (channel.value as? ReferenceInstruction)?.reference as? FieldReference
    require(channel.index > marker && channel.value.opcode == Opcode.IGET_OBJECT &&
        field?.definingClass == method.definingClass && field.type == "Ljava/lang/String;") {
        "Emotes: replay channel field cannot be derived safely."
    }
    return field
}
