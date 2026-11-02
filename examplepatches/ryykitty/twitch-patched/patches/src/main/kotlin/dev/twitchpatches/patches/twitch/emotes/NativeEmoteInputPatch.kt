package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

private const val DRAFT = "Ldev/twitchpatches/extension/emotes/EmoteDraftRuntime;"
private const val INPUT_BRIDGE = "Ldev/twitchpatches/extension/emotes/EmoteInputBridge;"
private const val TWITCH_EMOTES = "Ldev/twitchpatches/extension/emotes/TwitchEmotes;"
private const val CONTEXT = "Landroid/content/Context;"
private const val LINKED_MAP = "Ljava/util/LinkedHashMap;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private val BRIDGE_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private object AutocompleteEmoteModelFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(
        string("Emote(emoteModel="),
        string(", emoteUrl="),
    ),
)

private class AutocompleteQueryFingerprint(
    constructorRef: String,
) : Fingerprint(
    parameters = listOf(PICKER_STRING),
    returnType = PICKER_LIST,
    filters = listOf(methodCall(constructorRef)),
)

internal fun inputMethod(owner: String, name: String, parameters: List<String>, returns: String, registers: Int,
                         flags: Int, body: String) = ImmutableMethod(owner, name,
    parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, body) }

internal fun MutableClass.keepOriginalAs(method: MutableMethod, originalName: String): String {
    val name = method.name
    methods.remove(method)
    method.name = originalName
    methods.add(method)
    return name
}

private fun BytecodePatchContext.resolveAutocompleteCatalogue(suggestion: ClassDef, picker: NativePickerHooks): MethodReference {
    val emoteModel = classDefBy(picker.generic.definingClass).superclass
    val constructor = suggestion.methods.filter { method ->
        method.name == "<init>" && method.parameterTypes.map(CharSequence::toString) == listOf(emoteModel, PICKER_STRING)
    }.uniqueHook("native autocomplete suggestion constructor")
    val query = AutocompleteQueryFingerprint(constructor.reference).originalMethod
    return query.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") && it.returnType == ARRAY_LIST
    }.uniqueHook("native emote suggestion catalogue")
}

private fun bindTwitchEmoteCatalogue(owner: MutableClass, lookup: MutableMethod) {
    val catalogueField = lookup.code().windowed(2).filter { (read, cast) ->
        read.opcode == Opcode.IGET_OBJECT && cast.opcode == Opcode.CHECK_CAST &&
            (cast as ReferenceInstruction).reference.toString() == LINKED_MAP
    }.map { (read, _) -> (read as ReferenceInstruction).reference.toString() }.distinct().uniqueHook("native emote token map")
    val (constructor, at) = owner.methods.filter { it.name == "<init>" }.flatMap { constructor ->
        val code = constructor.code()
        code.indices.filter { at ->
            code[at].opcode == Opcode.IPUT_OBJECT && (code[at] as ReferenceInstruction).reference.toString() == catalogueField &&
                code.take(at).any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == LINKED_MAP }
        }.map { constructor to it }
    }.uniqueHook("native emote token map creation")
    val register = (constructor.code()[at] as TwoRegisterInstruction).registerA
    constructor.addInstruction(at + 1, "invoke-static/range {v$register .. v$register}, $TWITCH_EMOTES->bind(Ljava/util/Map;)V")
}

private fun BytecodePatchContext.augmentAutocompleteCatalogue(catalogue: MethodReference) {
    val owner = mutableClassDefBy(catalogue.definingClass)
    val lookup = owner.methods.single { it.reference == catalogue.toString() }
    bindTwitchEmoteCatalogue(owner, lookup)
    val name = owner.keepOriginalAs(lookup, "twitchPatchesAutocompleteOriginal")
    val invoke = if (AccessFlags.PRIVATE.isSet(lookup.accessFlags)) "invoke-direct" else "invoke-virtual"
    owner.methods.add(inputMethod(owner.type, name, listOf("Ljava/lang/CharSequence;"), ARRAY_LIST, 4, lookup.accessFlags, """
        $invoke {p0, p1}, ${lookup.reference}
        move-result-object v0
        invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
        move-result-object v1
        invoke-static {v0, v1}, $DRAFT->augment(${PICKER_LIST}${PICKER_STRING})$PICKER_LIST
        move-result-object v0
        check-cast v0, $ARRAY_LIST
        return-object v0
    """))
}

private fun BytecodePatchContext.generateEmoteInputBridge(suggestion: ClassDef, picker: NativePickerHooks) {
    val emoteModel = classDefBy(picker.generic.definingClass).superclass
    val insertionText = classDefBy(requireNotNull(suggestion.superclass)).methods.filter {
        it.parameterTypes.isEmpty() && it.returnType == PICKER_STRING &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
    }.uniqueHook("autocomplete insertion text")
    val codeGetter = suggestion.methods.single { it.name == insertionText.name && it.parameterTypes.isEmpty() }
        .references().filterIsInstance<MethodReference>().filter {
            it.definingClass == emoteModel && it.parameterTypes.isEmpty() && it.returnType == PICKER_STRING
        }.uniqueHook("native emote insertion code")
    val idGetter = classDefBy(codeGetter.definingClass).methods.filter {
        it.parameterTypes.isEmpty() && it.returnType == PICKER_STRING &&
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.name != codeGetter.name
    }.uniqueHook("native emote id")
    val asset = picker.generic.parameterTypes[2].toString()
    val kind = picker.generic.parameterTypes[3].toString()
    val bridge = mutableClassDefBy(INPUT_BRIDGE)
    bridge.methods.removeIf { it.name in setOf("code", "id", "model") }
    bridge.methods.add(inputMethod(INPUT_BRIDGE, "code", listOf("Ljava/lang/Object;"), PICKER_STRING, 2, BRIDGE_FLAGS, """
        check-cast p0, ${codeGetter.definingClass}
        invoke-virtual {p0}, $codeGetter
        move-result-object v0
        return-object v0
    """))
    bridge.methods.add(inputMethod(INPUT_BRIDGE, "id", listOf("Ljava/lang/Object;"), PICKER_STRING, 2, BRIDGE_FLAGS, """
        check-cast p0, ${idGetter.definingClass}
        invoke-virtual {p0}, ${idGetter.reference}
        move-result-object v0
        return-object v0
    """))
    bridge.methods.add(inputMethod(INPUT_BRIDGE, "model", listOf(PICKER_STRING, PICKER_STRING, "Z"),
        "Ljava/lang/Object;", 6, BRIDGE_FLAGS, """
            sget-object v1, $asset->STATIC:$asset
            if-eqz p2, :ready
            sget-object v1, $asset->ANIMATED:$asset
            :ready
            sget-object v2, $kind->OTHER:$kind
            new-instance v0, ${picker.generic.definingClass}
            invoke-direct {v0, p0, p1, v1, v2}, ${picker.generic.reference}
            return-object v0
        """))
}

private fun BytecodePatchContext.serveProviderImagesFromEmoteUrls() {
    val owner = mutableClassDefBy("Ltv/twitch/android/util/EmoteUrlUtil;")
    val address = owner.methods.filter {
        it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, PICKER_STRING) && it.returnType == PICKER_STRING &&
            it.hasStrings("https://static-cdn.jtvnw.net/emoticons/v1/")
    }.uniqueHook("native emote image address")
    val name = owner.keepOriginalAs(address, "twitchPatchesEmoteUrlOriginal")
    owner.methods.add(inputMethod(owner.type, name, listOf(CONTEXT, PICKER_STRING), PICKER_STRING, 3, address.accessFlags, """
        invoke-static {p1}, $PICKER_RUNTIME->imageURL($PICKER_STRING)$PICKER_STRING
        move-result-object v0
        if-nez v0, :provider
        invoke-static {p0, p1}, ${address.reference}
        move-result-object v0
        :provider
        return-object v0
    """))
}

private fun BytecodePatchContext.bindChatInputDrafts() {
    val input = mutableClassDefBy("Ltv/twitch/android/core/ui/kit/primitives/input/ChatInput;")
    val editor = classDefBy(requireNotNull(input.superclass)).methods.filter {
        it.name == "getInputEditText" && it.parameterTypes.isEmpty() && it.returnType == "Landroidx/appcompat/widget/AppCompatEditText;"
    }.uniqueHook("native chat input editor")
    require(input.methods.none { it.name == "onAttachedToWindow" }) { "Emotes: chat input attachment changed." }
    input.methods.add(inputMethod(input.type, "onAttachedToWindow", emptyList(), "V", 2, AccessFlags.PROTECTED.value, """
        invoke-super {p0}, ${input.superclass}->onAttachedToWindow()V
        invoke-virtual {p0}, ${editor.reference}
        move-result-object v0
        invoke-static {v0}, $DRAFT->bind(Landroid/widget/EditText;)V
        return-void
    """))
}

private fun BytecodePatchContext.protectRichInputCaret() {
    val rich = mutableClassDefBy("Lcom/twitchrn/emoteinput/TwitchEmoteInputView;")
    val setter = rich.methods.filter {
        it.name == "setTokenImageMap" && it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/facebook/react/bridge/ReadableMap;")
    }.uniqueHook("native rich input image map")
    val images = setter.references().filterIsInstance<FieldReference>()
        .filter { it.definingClass == rich.type && it.type == "Ljava/util/Map;" }.distinctBy { it.toString() }
        .uniqueHook("native rich input image storage")
    val spans = rich.methods.filter {
        it.name == "applyEmoteSpans" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            it.returnType == "V" && AccessFlags.PRIVATE.isSet(it.accessFlags)
    }.uniqueHook("native rich input span reconciliation")
    val name = rich.keepOriginalAs(spans, "twitchPatchesApplyEmoteSpansOriginal")
    rich.methods.add(inputMethod(rich.type, name, listOf("Z"), "V", 4, spans.accessFlags, """
        iget-object v0, p0, $images
        invoke-static {p0, p1, v0}, $DRAFT->protectCaret(Landroid/widget/EditText;ZLjava/util/Map;)Z
        move-result p1
        invoke-direct {p0, p1}, ${spans.reference}
        return-void
    """))
}

internal val nativeEmoteInputPatch = bytecodePatch {
    dependsOn(nativeEmotePickerPatch)
    execute {
        val suggestion = AutocompleteEmoteModelFingerprint.originalClassDef
        val picker = resolveNativePickerHooks()
        augmentAutocompleteCatalogue(resolveAutocompleteCatalogue(suggestion, picker))
        generateEmoteInputBridge(suggestion, picker)
        serveProviderImagesFromEmoteUrls()
        injectLegacyEmoteInput()
        injectComposeEmoteDraft()
        bindChatInputDrafts()
        protectRichInputCaret()
    }
}
