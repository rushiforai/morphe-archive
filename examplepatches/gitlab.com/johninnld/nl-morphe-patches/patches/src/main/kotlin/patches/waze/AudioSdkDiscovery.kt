package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import patches.waze.returnString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal data class AudioSdkMethods(
    val items: MutableMethod, val disconnect: MutableMethod, val connected: MutableMethod,
    val adapterType: String, val managerType: String
)

internal data class SoundCloudSdkMethods(
    val sdk: AudioSdkMethods, val availability: MutableMethod, val start: MutableMethod,
    val failed: MutableMethod, val suspended: MutableMethod, val rootGetter: MethodReference
)

private fun MethodReference.parameters() = parameterTypes.map { it.toString() }
private fun MutableMethod.calls() = implementation!!.instructions.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}
private fun String.javaName() = removePrefix("L").removeSuffix(";").replace('/', '.')
private fun <T> List<T>.unique(label: String): T = singleOrNull()
    ?: throw PatchException("Unsupported Waze audio SDK: expected one $label, found $size")

context(context: BytecodePatchContext)
internal fun discoverAudioSdk(): AudioSdkMethods {
    val callback = Fingerprint(name = "onConnected", returnType = "V", parameters = emptyList(),
        filters = listOf(string("WazeSdk: Connected to media browser service: ")))
        .matchAll().toList().unique("media-browser callback")
    val adapter = callback.originalClassDef.fields.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("Lcom/waze/sdk/")
    }.map { context.mutableClassDefBy(it.type) }.filter { candidate ->
        candidate.methods.any { it.name == "<init>" && it.parameters() == listOf(
            "Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/ComponentName;") }
    }.unique("media-browser adapter")
    adapter.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/String;" }
        .unique("adapter package field")
    val items = adapter.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags)
            && it.parameters().isEmpty() && it.returnType == "Ljava/util/List;" }.unique("audio list getter")
    val shelfType = items.implementation!!.instructions.filter { it.opcode == Opcode.CHECK_CAST }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
        .filter { it.startsWith("Lcom/waze/sdk/") }.distinct().unique("shelf item type")
    val shelf = context.mutableClassDefBy(context.mutableClassDefBy(shelfType).superclass
        ?: throw PatchException("Unsupported Waze audio SDK: missing shelf superclass"))
    shelf.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/util/List;" }
        .unique("shelf children field")
    val mediaType = shelf.methods.filter { it.name == "<init>" && it.parameterTypes.size == 1 }
        .unique("shelf constructor").parameterTypes.single().toString()

    val notify = adapter.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags)
            && it.parameters() == listOf(adapter.type) && it.returnType == "V"
            && it.calls().any { call -> call.definingClass == adapter.type && call.name == items.name
                && call.returnType == "Ljava/util/List;" && call.parameters().isEmpty() } }
        .unique("shelf notification bridge")
    val publish = notify.calls().filter { it.definingClass.startsWith("Lcom/waze/sdk/")
            && it.returnType == "V" && it.parameters() == listOf("Ljava/lang/String;", "Ljava/util/List;") }
        .unique("shelf publication method")
    val singleton = notify.calls().filter { it.definingClass == publish.definingClass
            && it.returnType == publish.definingClass && it.parameters().isEmpty() }
        .unique("audio manager singleton")
    val disconnect = adapter.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags)
            && it.parameters().isEmpty() && it.returnType == "V"
            && it.calls().any { call ->
                call.definingClass.startsWith("Lcom/waze/sdk/") && call.returnType == "V"
                    && call.parameters() == listOf("Ljava/lang/String;")
                    && context.mutableClassDefBy(call.definingClass).methods.any { helper ->
                        helper.name == call.name && helper.parameters() == call.parameters()
                            && helper.returnType == "V" && helper.calls().any { nested ->
                                nested.definingClass == "Ljava/util/Map;" && nested.name == "remove"
                                    && nested.parameters() == listOf("Ljava/lang/Object;")
                            }
                    }
            } }
        .unique("browser disconnect method")
    val bindings = "Lapp/wazeytm/extension/waze/WazeAudioBindings;"
    for ((name, value) in listOf(
        "adapterClass" to adapter.type.javaName(), "groupClass" to shelf.type.javaName(),
        "mediaItemClass" to mediaType.javaName(), "managerClass" to publish.definingClass.javaName(),
        "managerInstanceMethod" to singleton.name, "publishMethod" to publish.name
    )) returnString(bindings, name, value)
    return AudioSdkMethods(items, disconnect, callback.method, adapter.type, publish.definingClass)
}

context(context: BytecodePatchContext)
internal fun discoverSoundCloudSdk(): SoundCloudSdkMethods {
    val sdk = discoverAudioSdk()
    val adapter = context.mutableClassDefBy(sdk.adapterType)
    val manager = context.mutableClassDefBy(sdk.managerType)
    val callback = context.mutableClassDefBy(sdk.connected.definingClass)
    val init = Fingerprint(returnType = "Landroid/content/Intent;",
        parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        filters = listOf(string("com.waze.sdk.audio.ACTION_INIT")))
        .matchAll().toList().unique("audio init-intent factory")
    val startup = context.mutableClassDefBy(init.originalClassDef.type)
    val availability = startup.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags)
            && it.returnType == "Z" && it.parameters() == listOf("Landroid/content/Intent;")
            && it.calls().any { call -> call.definingClass == "Landroid/content/pm/PackageManager;"
                && call.name == "queryBroadcastReceivers" } }.unique("audio receiver check")
    val start = startup.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags)
            && it.returnType == "Z" && it.parameters() == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Runnable;")
            && it.calls().any { call -> call.definingClass == "Landroid/os/Handler;"
                && call.name == "postDelayed" } }.unique("audio startup watchdog")
    val register = manager.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags)
            && it.returnType == "Z" && it.parameters() == listOf("Landroid/content/res/Resources;",
                "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Landroid/os/Messenger;") }
        .unique("audio partner registration")
    val packageChanged = manager.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags)
            && it.returnType == "V" && it.parameters() == listOf("Ljava/lang/String;", "Z")
            && it.calls().any { call -> call.definingClass == "Ljava/util/Iterator;" && call.name == "remove"
                && call.parameters().isEmpty() } }.unique("audio package-disconnect callback")
    val transport = adapter.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        .map { it.type }.distinct().mapNotNull { context.classDefByOrNull(it) }
        .filter { type -> AccessFlags.ABSTRACT.isSet(type.accessFlags)
            && type.fields.none { !AccessFlags.STATIC.isSet(it.accessFlags) }
            && type.methods.any { it.returnType == "V" && it.parameters() == listOf(
                "Ljava/lang/String;", "Landroid/os/Bundle;") } }.unique("media transport-control type")
    adapter.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == transport.type }
        .unique("media transport-control field")
    val remove = sdk.disconnect.calls().filter { call -> call.definingClass.startsWith("Lcom/waze/sdk/")
        && call.returnType == "V" && call.parameters() == listOf("Ljava/lang/String;")
        && context.mutableClassDefBy(call.definingClass).methods.any { helper ->
            helper.name == call.name && helper.parameters() == call.parameters() && helper.calls().any { nested ->
                nested.definingClass == "Ljava/util/Map;" && nested.name == "remove"
            }
        } }.unique("cached-browser removal")
    val factory = context.mutableClassDefBy(remove.definingClass)
    factory.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == factory.type }
        .unique("browser-factory singleton field")
    factory.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/util/Map;" }
        .unique("browser-factory cache field")
    val rootGetter = sdk.connected.calls().filter { it.returnType == "Ljava/lang/String;"
        && it.parameters().isEmpty() && adapter.fields.any { field -> field.type == it.definingClass } }
        .unique("media-browser root getter")
    fun callbackMethod(name: String) = callback.methods.filter { it.name == name
        && it.parameters().isEmpty() && it.returnType == "V" }.unique("$name browser callback")
    for ((name, value) in listOf(
        "factoryClass" to factory.type.javaName(), "registerMethod" to register.name,
        "packageChangedMethod" to packageChanged.name, "transportClass" to transport.type.javaName(),
        "disconnectMethod" to sdk.disconnect.name
    )) returnString("Lapp/wazeytm/extension/waze/WazeAudioBindings;", name, value)
    return SoundCloudSdkMethods(sdk, availability, start, callbackMethod("onConnectionFailed"),
        callbackMethod("onConnectionSuspended"), rootGetter)
}
