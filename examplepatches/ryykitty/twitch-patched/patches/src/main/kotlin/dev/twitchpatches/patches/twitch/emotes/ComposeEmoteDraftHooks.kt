package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import dev.twitchpatches.patches.twitch.shared.*

private const val COMPOSE_DRAFT = "Ldev/twitchpatches/extension/emotes/ComposeEmoteDraft;"
private const val COMPOSE_STATE = "Ldev/twitchpatches/extension/emotes/ComposeStateBridge;"
private const val OBJECT = "Ljava/lang/Object;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

private object TextFieldStateFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("TextFieldState(selection=")),
)

private object TransformedTextFieldStateFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("TransformedTextFieldState(textFieldState=")),
)

private object TextFieldLayoutRecordFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("CacheRecord(visualText=")),
)

private object ChatToolbarStateFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string(", isChatInputEnabled=")),
)

private object ParagraphIntrinsicsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "L", "L", "Ljava/lang/String;", "Ljava/util/List;", "Ljava/util/List;", "Z"),
    filters = listOf(methodCall(definingClass = "Landroid/text/SpannableString;", name = "<init>")),
    custom = { method, _ -> method.name == "<init>" },
)

private class TextFieldLayoutFingerprint(record: String, transformedState: String) : Fingerprint(
    custom = { method, owner ->
        owner.fields.any { it.type == record } && method.parameterTypes.size == 2 && method.returnType != "V" &&
            method.references().filterIsInstance<FieldReference>().any {
                it.definingClass == method.parameterTypes[0].toString() && it.type == transformedState
            }
    },
)

private class ChatInputFieldFingerprint(toolbarState: String, textFieldState: String) : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterTypes.map(CharSequence::toString)
        AccessFlags.STATIC.isSet(method.accessFlags) && toolbarState in parameters && textFieldState in parameters &&
            method.references().filterIsInstance<MethodReference>().any {
                it.parameterTypes.size >= 12 && it.parameterTypes[0].toString() == textFieldState
            }
    },
)

internal fun BytecodePatchContext.injectComposeEmoteDraft() {
    val textFieldState = TextFieldStateFingerprint.originalClassDef.type
    val transformedState = TransformedTextFieldStateFingerprint.originalClassDef
    val stateField = transformedState.fields.filter { it.type == textFieldState }.uniqueHook("transformed text field state")
    injectComposeStateBridge(transformedState.methods.single { it.name == "<init>" }.references())
    wrapTextFieldLayout(transformedState.type, "${transformedState.type}->${stateField.name}:$textFieldState")
    decorateParagraphText()
    val toolbarState = ChatToolbarStateFingerprint.originalClassDef.type
    val chatField = ChatInputFieldFingerprint(toolbarState, textFieldState).let { fingerprint ->
        mutableClassDefBy(fingerprint.originalMethod.definingClass).methods.single { it.reference == fingerprint.originalMethod.reference }
    }
    val fieldParameter = chatField.parameterTypes.indexOfFirst { it.toString() == textFieldState }
    chatField.addInstruction(0, "invoke-static/range {p$fieldParameter .. p$fieldParameter}, $COMPOSE_DRAFT->bindChatField($OBJECT)V")
}

private fun BytecodePatchContext.injectComposeStateBridge(stateOwnerReferences: List<Reference>) {
    val create = stateOwnerReferences.filterIsInstance<MethodReference>().filter {
        it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) && it.returnType != "V" && it.definingClass.startsWith("Landroidx/compose/runtime/")
    }.uniqueHook("Compose mutable state factory")
    val state = create.returnType
    val bridge = mutableClassDefBy(COMPOSE_STATE)
    val flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
    bridge.methods.removeIf { it.name in setOf("create", "read", "write") }
    // Compose only tracks a read or write made through its own state object.
    bridge.methods.add(inputMethod(COMPOSE_STATE, "create", listOf(OBJECT), OBJECT, 2, flags, """
        invoke-static {p0}, $create
        move-result-object v0
        return-object v0
    """))
    bridge.methods.add(inputMethod(COMPOSE_STATE, "read", listOf(OBJECT), OBJECT, 2, flags, """
        check-cast p0, $state
        invoke-interface {p0}, $state->getValue()$OBJECT
        move-result-object v0
        return-object v0
    """))
    bridge.methods.add(inputMethod(COMPOSE_STATE, "write", listOf(OBJECT, OBJECT), "V", 2, flags, """
        check-cast p0, $state
        invoke-interface {p0, p1}, $state->setValue($OBJECT)V
        return-void
    """))
}

private fun BytecodePatchContext.wrapTextFieldLayout(transformedState: String, stateField: String) {
    val record = TextFieldLayoutRecordFingerprint.originalClassDef.type
    val layout = TextFieldLayoutFingerprint(record, transformedState).originalMethod
    val owner = mutableClassDefBy(layout.definingClass)
    val original = owner.methods.single { it.reference == layout.reference }
    val inputsField = original.references().filterIsInstance<FieldReference>().first {
        it.definingClass == original.parameterTypes[0].toString() && it.type == transformedState
    }
    val parameters = original.parameterTypes.map(CharSequence::toString)
    val name = owner.keepOriginalAs(original, "twitchPatchesFieldLayoutOriginal")
    owner.methods.add(inputMethod(owner.type, name, parameters, original.returnType, 4, original.accessFlags, """
        iget-object v0, p1, $inputsField
        iget-object v0, v0, $stateField
        invoke-static {v0}, $COMPOSE_DRAFT->beginLayout($OBJECT)V
        invoke-virtual {p0, p1, p2}, ${original.reference}
        move-result-object v0
        invoke-static {}, $COMPOSE_DRAFT->endLayout()V
        return-object v0
    """))
}

private fun BytecodePatchContext.decorateParagraphText() {
    val intrinsics = mutableClassDefBy(ParagraphIntrinsicsFingerprint.originalClassDef.type)
    val textField = intrinsics.fields.filter { it.type == CHAR_SEQUENCE }.uniqueHook("paragraph text")
    val fieldReference = "${intrinsics.type}->${textField.name}:$CHAR_SEQUENCE"
    val constructor = intrinsics.methods.filter { it.name == "<init>" }.uniqueHook("paragraph constructor")
    val assignments = constructor.code().withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IPUT_OBJECT && (instruction as ReferenceInstruction).reference.toString() == fieldReference
    }.uniqueHook("paragraph text assignment")
    val assignment = assignments.value as TwoRegisterInstruction
    val register = assignment.registerA
    // Plain text jumps straight to this assignment, so the hook has to follow it and store the result again.
    constructor.addInstructions(assignments.index + 1, """
        invoke-static/range {v$register .. v$register}, $COMPOSE_DRAFT->decorate($CHAR_SEQUENCE)$CHAR_SEQUENCE
        move-result-object v$register
        iput-object v$register, v${assignment.registerB}, $fieldReference
    """)
    val staleCheck = intrinsics.methods.filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }.uniqueHook("paragraph stale check")
    val name = intrinsics.keepOriginalAs(staleCheck, "twitchPatchesStaleFontsOriginal")
    intrinsics.methods.add(inputMethod(intrinsics.type, name, emptyList(), "Z", 2, staleCheck.accessFlags, """
        invoke-virtual {p0}, ${staleCheck.reference}
        move-result v0
        if-nez v0, :stale
        iget-object v0, p0, $fieldReference
        invoke-static {v0}, $COMPOSE_DRAFT->stale($CHAR_SEQUENCE)Z
        move-result v0
        :stale
        return v0
    """))
}
