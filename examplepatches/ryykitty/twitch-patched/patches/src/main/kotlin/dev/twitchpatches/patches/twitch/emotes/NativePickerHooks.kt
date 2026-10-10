package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.Opcode
import dev.twitchpatches.patches.twitch.shared.*

internal const val PICKER_RUNTIME = "Ldev/twitchpatches/extension/emotes/EmotePickerRuntime;"
internal const val PICKER_BRIDGE = "Ldev/twitchpatches/extension/emotes/EmotePickerBridge;"
internal const val PICKER_LIST = "Ljava/util/List;"
internal const val PICKER_STRING = "Ljava/lang/String;"

internal data class NativePickerHooks(
    val presenter: ClassDef, val start: Method, val event: Method, val delegate: Method,
    val generic: Method, val input: Method, val unlocked: Method, val model: Method,
    val header: Method, val section: Method, val entries: FieldReference,
    val state: FieldReference, val update: MethodReference, val delegateList: FieldReference,
    val layout: FieldReference, val smooth: MethodReference, val target: FieldReference,
    val scroll: MethodReference, val url: Method, val imageBinder: Method,
)

internal fun BytecodePatchContext.resolveNativePickerHooks(): NativePickerHooks {
    val classes = mutableListOf<ClassDef>().apply { classDefForEach { add(it) } }
    fun model(marker: String) = classes.filter { type -> type.methods.any {
        it.name == "toString" && it.hasStrings(marker)
    } }.uniqueHook("picker $marker")
    fun ClassDef.constructor(parameters: List<String>) = methods.filter {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == parameters
    }.uniqueHook("picker $type constructor")
    val generic = model("Generic(id=")
    val input = model("EmoteMessageInput(code=")
    val unlocked = model("Unlocked(emote=")
    val emote = model("EmoteUiModel(id=")
    val header = model("EmoteHeaderNamedUiModel(loginName=")
    val section = model("EmoteUiSet(header=")
    val event = model("NewEmoteSets(emotes=")
    val presenter = classes.filter { type -> type.methods.any { it.name == "<init>" &&
        it.hasStrings("createEmotePickerState") }
    }.uniqueHook("native picker presenter")
    val start = presenter.methods.filter { method -> method.returnType == "V" &&
        method.parameterTypes.size == 2 && method.parameterTypes.first().toString() == CHANNEL_ID &&
        method.references().filterIsInstance<MethodReference>().any { it.definingClass == "Ltv/twitch/android/util/RxHelperKt;" }
    }.uniqueHook("native picker catalog subscription")
    val viewBinding = presenter.methods.filter { it.isInstance(
        listOf("Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"), "V") }
        .uniqueHook("native picker delegate binding")
    val delegateRegister = requireNotNull(viewBinding.implementation).registerCount - 1
    val delegateType = viewBinding.code().filter { it.opcode == Opcode.CHECK_CAST &&
        (it as OneRegisterInstruction).registerA == delegateRegister }.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type
    }.uniqueHook("native picker delegate cast")
    val delegateField = viewBinding.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == presenter.type && it.type == delegateType
    }.distinctBy { it.toString() }.uniqueHook("native picker delegate field")
    val delegate = classDefBy(delegateField.type).methods.filter { it.name == "<init>" &&
        it.parameterTypes.take(2).map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/view/View;")
    }.uniqueHook("native picker delegate constructor")
    val render = classDefBy(delegate.definingClass).methods.filter { it.isInstance(
        listOf("Ltv/twitch/android/core/mvp/viewdelegate/ViewDelegateState;"), "V") }
        .uniqueHook("native picker delegate render")
    val fields = render.references().filterIsInstance<FieldReference>()
    val layout = fields.filter { it.type == "Landroidx/recyclerview/widget/GridLayoutManager;" }.uniqueHook("picker grid layout")
    val delegateList = fields.filter { it.definingClass == delegate.definingClass && it.type == layout.definingClass }
        .uniqueHook("picker content list")
    val smooth = render.references().filterIsInstance<MethodReference>().filter {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/Object;", "Landroid/content/Context;", "I")
    }.uniqueHook("picker smooth scroller")
    val target = fields.filter { it.type == "I" }.uniqueHook("picker scroll target")
    val scroll = render.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes.map(CharSequence::toString) == listOf(target.definingClass) && it.returnType == "V"
    }.uniqueHook("picker scroll invocation")
    val state = presenter.fields.filter { it.type == "Ltv/twitch/android/core/mvp/presenter/StateMachine;" }
        .uniqueHook("picker state machine")
    val update = classDefBy(state.type).methods.filter { it.isInstance(
        listOf("Ltv/twitch/android/core/mvp/presenter/StateUpdateEvent;"), "V") }
        .uniqueHook("picker update dispatch")
    val genericConstructor = generic.methods.filter { it.name == "<init>" && it.parameterTypes.size == 4 }
        .uniqueHook("picker generic emote constructor")
    val assetType = genericConstructor.parameterTypes[2].toString()
    val descriptor = emote.methods.filter { it.name == "<init>" && it.parameterTypes.size == 4 }
        .uniqueHook("picker emote model constructor")
    val entries = section.fields.filter { it.type == PICKER_LIST }.uniqueHook("picker section entries")
    val imageBuilders = classes.filter { type -> type.methods.any {
        it.hasStrings("https://static-cdn.jtvnw.net/emoticons/v2/", "/")
    } }
    val url = imageBuilders.flatMap { it.methods }.filter {
        it.isInstance(listOf("Landroid/content/Context;", PICKER_STRING, "Ljava/lang/Float;"), PICKER_STRING)
    }.uniqueHook("native picker image URL")
    val imageBinder = classes.flatMap { it.methods }.filter { method -> method.returnType == "V" &&
        method.references().filterIsInstance<MethodReference>().any { it.toString() == url.reference } &&
        method.references().filterIsInstance<TypeReference>().any { it.type == emote.type } }
        .uniqueHook("native picker image binder")
    return NativePickerHooks(presenter, start, event.constructor(listOf(PICKER_LIST, "Z")), delegate,
        genericConstructor, input.constructor(listOf(PICKER_STRING, PICKER_STRING, "Z")),
        unlocked.constructor(listOf(generic.superclass.orEmpty(), input.type)), descriptor,
        header.constructor(listOf(PICKER_STRING, PICKER_STRING, PICKER_STRING, "Z")),
        section.constructor(listOf(header.superclass.orEmpty(), PICKER_LIST)), entries,
        state, update, delegateList, layout, smooth, target, scroll, url, imageBinder).also {
        classDefBy(assetType).fields.filter { field -> field.name in setOf("STATIC", "ANIMATED") }.let { fields ->
            require(fields.size == 2) { "Emotes: picker asset types changed." }
        }
    }
}
