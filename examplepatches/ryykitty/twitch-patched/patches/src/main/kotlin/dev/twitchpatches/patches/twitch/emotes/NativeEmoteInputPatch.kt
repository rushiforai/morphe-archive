package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

private const val DRAFT = "Ldev/twitchpatches/extension/emotes/EmoteDraftRuntime;"
private const val INPUT_BRIDGE = "Ldev/twitchpatches/extension/emotes/EmoteInputBridge;"

internal fun inputMethod(owner: String, name: String, parameters: List<String>, returns: String, registers: Int,
                         flags: Int, body: String) = ImmutableMethod(owner, name,
    parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
    MutableMethodImplementation(registers)).toMutable().apply { addInstructionsWithLabels(0, body) }

internal val nativeEmoteInputPatch = bytecodePatch {
    dependsOn(nativeEmotePickerPatch)
    execute {
        val all = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>().apply { classDefForEach { add(it) } }
        val suggestion = all.filter { type -> type.methods.any {
            it.name == "toString" && it.hasStrings("Emote(emoteModel=", ", emoteUrl=")
        } }.uniqueHook("native autocomplete emote model")
        val picker = resolveNativePickerHooks()
        val constructor = suggestion.methods.filter { it.name == "<init>" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(picker.generic.definingClass.let { classDefBy(it).superclass }, PICKER_STRING)
        }.uniqueHook("native autocomplete suggestion constructor")
        val query = all.flatMap { it.methods }.filter { it.isInstance(listOf(PICKER_STRING), PICKER_LIST) &&
            it.references().filterIsInstance<MethodReference>().any { call -> call.toString() == constructor.reference }
        }.uniqueHook("native autocomplete query")
        val lookup = query.references().filterIsInstance<MethodReference>().filter {
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") && it.returnType == "Ljava/util/ArrayList;"
        }.uniqueHook("native emote suggestion catalogue")
        val queryOwner = mutableClassDefBy(lookup.definingClass)
        val original = queryOwner.methods.single { it.reference == lookup.toString() }
        val queryName = original.name
        val queryFlags = original.accessFlags
        queryOwner.methods.remove(original)
        original.name = "twitchPatchesAutocompleteOriginal"
        queryOwner.methods.add(original)
        val invoke = if (AccessFlags.PRIVATE.isSet(original.accessFlags)) "invoke-direct" else "invoke-virtual"
        queryOwner.methods.add(inputMethod(queryOwner.type, queryName, listOf("Ljava/lang/CharSequence;"), "Ljava/util/ArrayList;", 4, queryFlags, """
            $invoke {p0, p1}, ${original.reference}
            move-result-object v0
            invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $DRAFT->augment(${PICKER_LIST}${PICKER_STRING})$PICKER_LIST
            move-result-object v0
            check-cast v0, Ljava/util/ArrayList;
            return-object v0
        """))
        val bridge = mutableClassDefBy(INPUT_BRIDGE)
        val base = classDefBy(requireNotNull(suggestion.superclass))
        val code = base.methods.filter { it.parameterTypes.isEmpty() && it.returnType == PICKER_STRING &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }.uniqueHook("autocomplete insertion text")
        val codeGetter = suggestion.methods.single { it.name == code.name && it.parameterTypes.isEmpty() }
            .references().filterIsInstance<MethodReference>().filter {
                it.definingClass == classDefBy(picker.generic.definingClass).superclass &&
                    it.parameterTypes.isEmpty() && it.returnType == PICKER_STRING
            }.uniqueHook("native emote insertion code")
        val flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val identity = bridge.methods.single { it.name == "code" }
        bridge.methods.remove(identity)
        bridge.methods.add(inputMethod(INPUT_BRIDGE, "code", listOf("Ljava/lang/Object;"), PICKER_STRING, 2, flags, """
            check-cast p0, ${codeGetter.definingClass}
            invoke-virtual {p0}, $codeGetter
            move-result-object v0
            return-object v0
        """))
        val model = bridge.methods.single { it.name == "model" }
        bridge.methods.remove(model)
        val asset = picker.generic.parameterTypes[2].toString()
        val kind = picker.generic.parameterTypes[3].toString()
        bridge.methods.add(inputMethod(INPUT_BRIDGE, "model", listOf(PICKER_STRING, PICKER_STRING, "Z"),
            "Ljava/lang/Object;", 6, flags, """
                sget-object v1, $asset->STATIC:$asset
                if-eqz p2, :ready
                sget-object v1, $asset->ANIMATED:$asset
                :ready
                sget-object v2, $kind->OTHER:$kind
                new-instance v0, ${picker.generic.definingClass}
                invoke-direct {v0, p0, p1, v1, v2}, ${picker.generic.reference}
                return-object v0
            """))
        injectLegacyEmoteInput(all.flatMap { it.methods })
        val input = mutableClassDefBy("Ltv/twitch/android/core/ui/kit/primitives/input/ChatInput;")
        val edit = classDefBy(requireNotNull(input.superclass)).methods.filter { it.name == "getInputEditText" &&
            it.parameterTypes.isEmpty() && it.returnType == "Landroidx/appcompat/widget/AppCompatEditText;"
        }.uniqueHook("native chat input editor")
        require(input.methods.none { it.name == "onAttachedToWindow" }) { "Emotes: chat input attachment changed." }
        input.methods.add(inputMethod(input.type, "onAttachedToWindow", emptyList(), "V", 2, AccessFlags.PROTECTED.value, """
            invoke-super {p0}, ${input.superclass}->onAttachedToWindow()V
            invoke-virtual {p0}, ${edit.reference}
            move-result-object v0
            invoke-static {v0}, $DRAFT->bind(Landroid/widget/EditText;)V
            return-void
        """))
        val rich = mutableClassDefBy("Lcom/twitchrn/emoteinput/TwitchEmoteInputView;")
        val setter = rich.methods.filter { it.name == "setTokenImageMap" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Lcom/facebook/react/bridge/ReadableMap;") }.uniqueHook("native rich input image map")
        val images = setter.references().filterIsInstance<com.android.tools.smali.dexlib2.iface.reference.FieldReference>()
            .filter { it.definingClass == rich.type && it.type == "Ljava/util/Map;" }.distinctBy { it.toString() }
            .uniqueHook("native rich input image storage")
        val spans = rich.methods.filter { it.name == "applyEmoteSpans" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            it.returnType == "V" && AccessFlags.PRIVATE.isSet(it.accessFlags)
        }.uniqueHook("native rich input span reconciliation")
        rich.methods.remove(spans)
        spans.name = "twitchPatchesApplyEmoteSpansOriginal"
        rich.methods.add(spans)
        rich.methods.add(inputMethod(rich.type, "applyEmoteSpans", listOf("Z"), "V", 4, spans.accessFlags, """
            iget-object v0, p0, $images
            invoke-static {p0, p1, v0}, $DRAFT->protectCaret(Landroid/widget/EditText;ZLjava/util/Map;)Z
            move-result p1
            invoke-direct {p0, p1}, ${spans.reference}
            return-void
        """))
    }
}
