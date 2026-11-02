package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.*

internal data class NativeReloadUiHooks(
    val volume: Method, val button: MethodReference, val callers: List<Method>,
    val composer: String, val concreteComposer: String, val groupStart: MethodReference,
    val groupEnd: MethodReference, val callbackOwner: FieldReference,
    val callbackUnit: FieldReference, val flowCollector: MethodReference, val stateValue: MethodReference,
)

private class VolumeRendererFingerprint(nativeMuteLabel: Long) : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(literal(nativeMuteLabel)),
)

internal fun BytecodePatchContext.resolveNativeReloadUi(): NativeReloadUiHooks {
    val volume = VolumeRendererFingerprint(nativeMuteLabel).originalMethod
    require(volume.parameterTypes.size == 4 && volume.parameterTypes.first().toString() == "Z" &&
        volume.parameterTypes.last().toString() == "I") {
        "Reload stream: native volume renderer signature changed."
    }
    val callback = volume.parameterTypes[1].toString()
    val composer = volume.parameterTypes[2].toString()
    val button = volume.references().filterIsInstance<MethodReference>().filter {
        it.returnType == "V" && it.parameterTypes.size == 11 &&
            it.parameterTypes[0] == "Ljava/lang/String;" && it.parameterTypes[1] == "I" &&
            it.parameterTypes[7] == callback && it.parameterTypes[8] == composer &&
            it.parameterTypes.takeLast(2) == listOf("I", "I")
    }.uniqueHook("native transparent player button")
    val concrete = volume.code().filter { it.opcode == Opcode.CHECK_CAST }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
        .uniqueHook("native volume concrete composer")
    val callers = classDefBy(volume.definingClass).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.references().any { it.toString() == volume.reference }
    }
    if (callers.size != 2 || callers.any { it.parameterTypes.count { p -> p == callback } < 8 })
        throw PatchException("Reload stream: native classic/vertical controls call contract changed.")
    val start = callers.first().references().filterIsInstance<MethodReference>().filter {
        it.definingClass == concrete && it.parameterTypes == listOf("I") && it.returnType == "V"
    }.distinctBy { it.toString() }.uniqueHook("native replaceable composition group")
    val startIndex = callers.first().code().indexOfFirst {
        (it as? ReferenceInstruction)?.reference?.toString() == start.toString()
    }
    val end = callers.first().code().drop(startIndex + 1).mapNotNull {
        (it as? ReferenceInstruction)?.reference as? MethodReference
    }.firstOrNull { it.definingClass == concrete && it.parameterTypes.isEmpty() && it.returnType == "V" }
        ?: throw PatchException("Reload stream: native composition group end missing.")
    val fragmentGetters = classDefBy(NATIVE_FRAGMENT).methods.filter { it.parameterTypes.isEmpty() }.map { it.returnType }.toSet()
    val controls = fragmentGetters.mapNotNull { classDefByOrNull(it) }.flatMap { it.methods }.filter {
        it.hasStrings("mute_button", "go_to_classic_view", "player_settings_button")
    }.uniqueHook("native controls event owner")
    val root = classDefBy(volume.definingClass).methods.filter { method ->
        method.references().any { ref ->
            ref is TypeReference && ref.type == controls.definingClass
        } && method.hasStrings("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner")
    }.uniqueHook("native controls composition root")
    val callbackConstructors = root.references().filterIsInstance<MethodReference>()
        .filter { it.name == "<init>" }.map { it.definingClass }.toSet()
    val callbackTypes = callbackConstructors.mapNotNull { classDefByOrNull(it) }.filter { type ->
        callback in type.interfaces && type.fields.count { it.type == controls.definingClass } == 1 &&
            type.methods.any { it.name == "<init>" && it.parameterTypes == listOf(controls.definingClass, "I") }
    }.map { it.type }
    val callbackClass = classDefBy(callbackTypes.uniqueHook("native volume owner callback"))
    val owner = callbackClass.fields.filter { it.type == controls.definingClass }.uniqueHook("native callback owner field")
    val invoke = callbackClass.methods.filter { it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" }
        .uniqueHook("native volume callback invocation")
    val returned = invoke.code().filter { it.opcode == Opcode.RETURN_OBJECT }
        .map { (it as OneRegisterInstruction).registerA }.toSet()
    val unit = invoke.code().filter { it.opcode == Opcode.SGET_OBJECT &&
        (it as OneRegisterInstruction).registerA in returned }.mapNotNull {
            ((it as ReferenceInstruction).reference as? FieldReference)?.takeIf { field -> field.type == field.definingClass }
        }.distinctBy { it.toString() }.uniqueHook("native volume callback Unit")
    val collector = root.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes.size == 2 && it.parameterTypes[1] == composer && it.returnType.startsWith("L") &&
            classDefBy(it.parameterTypes[0].toString()).methods.any { method ->
                method.name == "getValue" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/Object;"
            }
    }.distinctBy { it.toString() }.uniqueHook("native lifecycle state collector")
    val value = root.references().filterIsInstance<MethodReference>().filter {
        it.name == "getValue" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
    }.distinctBy { it.toString() }.uniqueHook("native collected state value")
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(volume.accessFlags) ||
        !AccessFlags.PUBLIC.isSet(classDefBy(button.definingClass).accessFlags))
        throw PatchException("Reload stream: native controls bridge members are inaccessible.")
    return NativeReloadUiHooks(volume, button, callers, composer, concrete, start, end, owner, unit, collector, value)
}
