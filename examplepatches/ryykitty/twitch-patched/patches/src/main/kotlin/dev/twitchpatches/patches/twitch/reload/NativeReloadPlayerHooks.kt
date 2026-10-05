package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.*

internal const val NATIVE_FRAGMENT = "Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;"
internal const val NATIVE_HOST = "Ldev/twitchpatches/extension/reload/NativeReloadHost;"
internal const val NATIVE_OWNER = "Ldev/twitchpatches/extension/reload/NativeReloadOwner;"
internal const val NATIVE_ACTION = "Ldev/twitchpatches/extension/reload/NativeReloadAction;"
internal const val NATIVE_BRIDGE = "Ldev/twitchpatches/extension/reload/NativeReloadBridge;"

internal data class NativeReloadPlayerHooks(
    val ownerType: String, val playerGetter: Method, val controlsGetter: Method,
    val playable: FieldReference, val player: FieldReference, val wrapper: FieldReference,
    val media: FieldReference, val source: FieldReference, val metadataOwner: FieldReference,
    val metadata: FieldReference, val load: Method, val quality: Method, val setQuality: Method,
    val state: Method, val released: Method, val flowFactory: MethodReference,
    val flowSetter: Method, val flowType: String, val castFlow: FieldReference,
    val castValueFlow: FieldReference, val castValue: MethodReference, val castType: String,
)

internal fun BytecodePatchContext.resolveNativeReloadPlayer(all: List<Method>, ui: NativeReloadUiHooks): NativeReloadPlayerHooks {
    val constructor = all.filter {
        it.name == "<init>" && it.hasStrings("VerticalTheatrePlayable", "VerticalTheatre", "video_cc")
    }.uniqueHook("native live player owner")
    val vm = classDefBy(constructor.definingClass)
    val fragment = classDefBy(NATIVE_FRAGMENT)
    val playerGetter = fragment.methods.filter { it.isInstance(emptyList(), vm.type) }
        .uniqueHook("native fragment player getter")
    val controlsGetter = fragment.methods.filter { it.isInstance(emptyList(), ui.callbackOwner.type) }
        .uniqueHook("native fragment controls getter")
    val quality = vm.methods.filter { method ->
        method.isInstance(emptyList(), "Ljava/lang/String;") && method.hasStrings("auto") &&
            method.references().any { it is MethodReference && it.name == "isAutoQualityMode" } &&
            method.references().any { it is MethodReference && it.definingClass == "Lcom/amazonaws/ivs/player/Quality;" && it.name == "getName" }
    }.uniqueHook("native selected quality getter")
    val player = quality.references().filterIsInstance<FieldReference>().filter { it.definingClass == vm.type }
        .distinctBy { it.toString() }.uniqueHook("native player instance field")
    val wrapper = quality.references().filterIsInstance<FieldReference>().filter { it.definingClass == player.type }
        .distinctBy { it.toString() }.uniqueHook("native player wrapper field")
    val media = quality.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == wrapper.type && it.type == "Lcom/amazonaws/ivs/player/MediaPlayer;"
    }.uniqueHook("native IVS media field")
    val load = classDefBy(wrapper.type).methods.filter { method ->
        method.returnType == "V" && method.parameterTypes.size == 2 &&
            method.references().any { it is MethodReference && it.name == "setSessionConfig" &&
                it.parameterTypes == listOf("Lcom/amazonaws/ivs/player/SessionConfig;") } &&
            method.references().any { it is MethodReference && it.name == "load" &&
                it.definingClass == media.type }
    }.uniqueHook("native source load action")
    val source = load.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == wrapper.type && it.type == load.parameterTypes[0]
    }.distinctBy { it.toString() }.uniqueHook("native current source descriptor")
    val playerLoad = classDefBy(player.type).methods.filter {
        it.isInstance(load.parameterTypes.map { p -> p.toString() }, "V") &&
            it.references().any { ref -> ref.toString() == load.reference }
    }.uniqueHook("native tracked source load")
    val trackerCall = playerLoad.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes == listOf(load.parameterTypes[1]) && it.returnType == "V"
    }.uniqueHook("native source metadata tracking")
    val metadataOwner = playerLoad.references().filterIsInstance<FieldReference>().filter { it.type == trackerCall.definingClass }
        .uniqueHook("native metadata owner field")
    val metadata = classDefBy(trackerCall.definingClass).fields.filter { it.type == load.parameterTypes[1] }
        .uniqueHook("native current source metadata")
    val playable = vm.fields.filter { it.type == "Ltv/twitch/android/models/Playable;" }
        .uniqueHook("native current playable")
    val setQuality = vm.methods.filter { it.isInstance(listOf("Ljava/lang/String;"), "V") }
        .uniqueHook("native selected quality action")
    val castFlow = setQuality.references().filterIsInstance<FieldReference>().filter {
        it.definingClass == vm.type && it.toString() !in setOf(player.toString(), playable.toString())
    }.uniqueHook("native remote playback flow")
    val castValueFlow = setQuality.references().filterIsInstance<FieldReference>().filter { it.definingClass == castFlow.type }
        .uniqueHook("native remote playback state flow")
    val castValue = setQuality.references().filterIsInstance<MethodReference>().filter { it.name == "getValue" }
        .uniqueHook("native remote playback state value")
    val castType = setQuality.code().filter { it.opcode == Opcode.INSTANCE_OF }.mapNotNull {
        ((it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? TypeReference)?.type
    }.filter { it != "Ltv/twitch/android/models/streams/StreamModel;" }.uniqueHook("native remote playback model")
    val state = classDefBy(wrapper.type).methods.filter { it.name == "getState" && it.parameterTypes.isEmpty() }
        .uniqueHook("native playback state getter")
    val released = vm.methods.filter { method ->
        method.isInstance(emptyList(), "V") && method.references().any { ref ->
            ref is MethodReference && ref.definingClass == vm.superclass && ref.parameterTypes.isEmpty() && ref.returnType == "V"
        } && method.hasStrings("VerticalTheatre")
    }.uniqueHook("native player release")
    val flowFactory = constructor.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes == listOf("Ljava/lang/Object;") &&
            it.returnType in all.filter { method -> method.name == "getValue" && method.parameterTypes.isEmpty() }
                .map { method -> method.definingClass }.toSet()
    }.distinctBy { it.toString() }.uniqueHook("native mutable preference flow factory")
    val flowSetter = classDefBy(flowFactory.returnType).methods.filter {
        it.isInstance(listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z") &&
            it.code().any { instruction -> instruction.opcode == Opcode.MONITOR_ENTER }
    }.uniqueHook("native mutable preference flow setter")
    for (field in listOf(playable, player, wrapper, media, source, metadataOwner, metadata, castFlow, castValueFlow)) {
        val definition = classDefBy(field.definingClass).fields.single { it.toString() == field.toString() }
        if (!com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.isSet(definition.accessFlags))
            throw PatchException("Reload stream: native player member is inaccessible: ${field.name}.")
    }
    return NativeReloadPlayerHooks(vm.type, playerGetter, controlsGetter, playable, player, wrapper, media,
        source, metadataOwner, metadata, load, quality, setQuality, state, released, flowFactory, flowSetter,
        flowFactory.returnType, castFlow, castValueFlow, castValue, castType)
}
