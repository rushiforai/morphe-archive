package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.*

internal data class UiCompositionContract(
    val composer: String, val concrete: String, val start: MethodReference, val end: MethodReference,
    val collect: MethodReference, val value: MethodReference, val factory: MethodReference, val setter: Method,
    val classic: Method, val vertical: Method, val controls: Map<String, Method>, val support: Method,
    val subscribe: FieldReference, val gift: FieldReference, val bits: Method, val supportCallers: List<Method>,
    val classicActions: Map<String, Method>,
    val classicRow: UiClassicActionContract,
    val actionCallers: Map<String, List<Method>> = emptyMap(),
)

private class UiVolumeRendererFingerprint(nativeMuteLabel: Long) : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(literal(nativeMuteLabel)),
)

private object PlayerPreferenceFlowConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf(
        string("VerticalTheatrePlayable"),
        string("VerticalTheatre"),
        string("video_cc"),
    ),
)

private class ChannelActionRendererFingerprint(
    followId: Long,
    subscribeId: Long,
    giftASubId: Long,
) : Fingerprint(
    returnType = "V",
    filters = listOf(
        literal(followId),
        literal(subscribeId),
        literal(giftASubId),
    ),
)

private class ClassicGiftRendererFingerprint(giftASubId: Long) : Fingerprint(
    returnType = "V",
    filters = listOf(literal(giftASubId)),
)

private class BitsRendererFingerprint(bitsId: Long) : Fingerprint(
    returnType = "V",
    filters = listOf(literal(bitsId)),
)

internal fun BytecodePatchContext.resolveUiComposition(): UiCompositionContract {
    val volume = UiVolumeRendererFingerprint(uiResourceIds.getValue("string/mute_button_text")).originalMethod
    require(volume.parameterTypes.size == 4 && volume.parameterTypes.first().toString() == "Z") {
        "UI settings: native volume renderer changed."
    }
    val composer = volume.parameterTypes[2].toString()
    val callback = volume.parameterTypes[1].toString()
    val volumeClass = classDefBy(volume.definingClass)
    val callers = volumeClass.methods.filter {
        it.parameterTypes.count { p -> p == callback } >= 8 &&
        it.references().any { ref -> ref.toString() == volume.reference ||
            (ref is MethodReference && ref.definingClass == "Ldev/twitchpatches/extension/reload/NativeReloadBridge;" &&
                ref.name == "renderVolumeAndReload") }
    }
    require(callers.size == 2) { "UI settings: native player layouts changed." }
    val classic = callers.minBy { it.parameterTypes.size }
    val vertical = callers.maxBy { it.parameterTypes.size }
    val concrete = volume.code().filter { it.opcode == Opcode.CHECK_CAST }.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type
    }.uniqueHook("UI native concrete composer")
    val start = classic.references().filterIsInstance<MethodReference>().filter {
        it.definingClass == concrete && it.parameterTypes == listOf("I") && it.returnType == "V"
    }.distinctBy { it.toString() }.uniqueHook("UI replaceable composition group")
    val startIndex = classic.code().indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == start.toString() }
    val end = classic.code().drop(startIndex + 1).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .first { it.definingClass == concrete && it.parameterTypes.isEmpty() && it.returnType == "V" }
    val fragment = classDefBy("Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;")
    val controlTypes = fragment.methods.filter { it.parameterTypes.isEmpty() && it.returnType.startsWith("L") }.map { it.returnType }.toSet()
    val controls = controlTypes.flatMap { classDefBy(it).methods }.filter {
        it.hasStrings("mute_button", "go_to_classic_view", "player_settings_button")
    }.uniqueHook("UI native controls owner")
    val root = volumeClass.methods.filter {
        it.references().any { ref -> ref is TypeReference && ref.type == controls.definingClass } &&
            it.hasStrings("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner")
    }.uniqueHook("UI controls composition root")
    val collect = root.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes.size == 2 && it.parameterTypes[1] == composer && it.parameterTypes[0].startsWith("L") &&
            classDefBy(it.parameterTypes[0].toString()).methods.any { method ->
                method.name == "getValue" &&
                    method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/Object;"
            }
    }.distinctBy { it.toString() }.uniqueHook("UI lifecycle state collector")
    val value = root.references().filterIsInstance<MethodReference>().filter {
        it.name == "getValue" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
    }.distinctBy { it.toString() }.uniqueHook("UI collected preference value")
    val constructor = PlayerPreferenceFlowConstructorFingerprint.originalMethod
    val factory = constructor.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType.startsWith("L") && classDefBy(it.returnType).methods.any { method ->
            method.name == "getValue" && method.parameterTypes.isEmpty()
        }
    }.distinctBy { it.toString() }.uniqueHook("UI mutable preference flow factory")
    val setter = classDefBy(factory.returnType).methods.filter {
        it.isInstance(listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z") && it.code().any { code -> code.opcode == Opcode.MONITOR_ENTER }
    }.uniqueHook("UI mutable preference flow setter")
    val renderers = volumeClass.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags) }
    val share = renderers.filter { it.parameterTypes == listOf(callback, composer, "I") && it.hasResource("string/share") }
        .uniqueHook("UI native Share renderer")
    val cast = renderers.filter { it.parameterTypes == share.parameterTypes && it.references().filterIsInstance<MethodReference>()
        .filter { ref -> ref.name == "<init>" }.any { ref -> classDefBy(ref.definingClass).methods.any { method ->
            method.references().filterIsInstance<MethodReference>().any { call ->
                call.definingClass == "Landroidx/mediarouter/app/MediaRouteButton;" && call.name == "<init>"
            }
        } } }.uniqueHook("UI native Cast renderer")
    val clip = renderers.filter { it.parameterTypes == listOf("I", composer, callback, callback, "Z") &&
        vertical.references().any { ref -> ref.toString() == it.reference } }.uniqueHook("UI native Clip renderer")
    val support = ChannelActionRendererFingerprint(
        uiResourceIds.getValue("string/follow"),
        uiResourceIds.getValue("string/subscribe"),
        uiResourceIds.getValue("string/gift_a_sub"),
    ).matchAll().map { it.originalMethod }.filter {
        it.parameterTypes.size == 7 && it.parameterTypes[5].toString() == composer
    }.uniqueHook("UI native channel action renderer")
    val classicGift = ClassicGiftRendererFingerprint(uiResourceIds.getValue("string/gift_a_sub")).matchAll()
        .map { it.originalMethod }
        .filter {
            it.parameterTypes.map { p -> p.toString() } == listOf("I", composer, callback, support.parameterTypes[0].toString(), "Z")
        }.uniqueHook("UI classic Gift a Sub renderer")
    val classicSubscribe = classDefBy(classicGift.definingClass).methods.filter {
        it.parameterTypes == classicGift.parameterTypes + "Z" && it.hasResource("string/subscribe")
    }.uniqueHook("UI classic Subscribe renderer")
    val classicRow = resolveClassicActionRow(composer, concrete)
    val actionCallers = listOf(support, classicGift, classicSubscribe, classicRow.renderer).associate { target ->
        target.reference to nativeCallers(target)
    }
    val supportCallers = actionCallers.getValue(support.reference)
    val bits = BitsRendererFingerprint(uiResourceIds.getValue("string/bits")).matchAll()
        .map { it.originalMethod }
        .filter {
            it.parameterTypes.size == 7 && it.parameterTypes[4].toString() == composer &&
                supportCallers.any { caller -> caller.references().any { ref -> ref.toString() == it.reference } }
        }.uniqueHook("UI native Bits renderer")
    fun model(label: String): FieldReference {
        val index = support.code().indexOfFirst { (it as? WideLiteralInstruction)?.wideLiteral == uiResourceIds[label] }
        return support.code().take(index).last { it.opcode == Opcode.SGET_OBJECT }.let {
            (it as ReferenceInstruction).reference as FieldReference
        }.also { require(classDefBy(it.definingClass).superclass == support.parameterTypes[1]) {
            "UI settings: native channel action model changed."
        } }
    }
    return UiCompositionContract(composer, concrete, start, end, collect, value, factory, setter,
        classic, vertical, mapOf("clip" to clip, "cast" to cast, "share" to share), support,
        model("string/subscribe"), model("string/gift_a_sub"), bits, supportCallers,
        mapOf("subscribe" to classicSubscribe, "gift" to classicGift), classicRow, actionCallers)
}

private fun Method.hasResource(name: String) = implementation?.instructions?.any {
    (it as? WideLiteralInstruction)?.wideLiteral == uiResourceIds[name]
} == true
