package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

internal const val PLAYER_VIEW = "Ltv/twitch/android/shared/player/core/TwitchPlayerView;"
internal const val BASE_DELEGATE = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"
internal const val NATIVE_VIEWS = "Ldev/twitchpatches/extension/reload/NativeReloadViews;"

internal data class NativeReloadViewHooks(val bind: Method,
    val root: FieldReference, val controlsDelegate: FieldReference, val qualitySetter: MethodReference,
    val controllerBind: Method, val delegate: FieldReference, val transport: FieldReference,
    val playerPresenter: FieldReference, val controller: FieldReference)

private class OverlayConstructorFingerprint(nativeMuteButton: Int) : Fingerprint(
    name = "<init>",
    filters = listOf(
        literal(nativeMuteButton),
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate"),
    ),
)

private class XmlLiveTheatreViewFactoryFingerprint(overlayReference: String) : Fingerprint(
    parameters = listOf("Landroid/view/ViewGroup;"),
    returnType = BASE_DELEGATE,
    filters = listOf(methodCall(overlayReference)),
)

private object LegacySurfacePlayerControllerFingerprint : Fingerprint(
    strings = listOf("playerStateAndEventDisposable"),
)

private class MuteLabelFingerprint(nativeMuteLabel: Long) : Fingerprint(
    filters = listOf(literal(nativeMuteLabel)),
)

internal fun BytecodePatchContext.resolveNativeReloadViews(h: NativeReloadPlayerHooks): NativeReloadViewHooks {
    val overlay = OverlayConstructorFingerprint(nativeMuteButton).originalMethod
    val create = XmlLiveTheatreViewFactoryFingerprint(overlay.reference).originalMethod
    val presenter = classDefBy(create.definingClass)
    val bind = presenter.methods.filter { method -> method.isInstance(listOf(overlay.definingClass), "V") &&
        method.references().any { it is MethodReference && it.definingClass == presenter.superclass &&
            it.parameterTypes == listOf(BASE_DELEGATE) && it.returnType == "V" }
    }.uniqueHook("native XML theatre view attachment")
    val root = classDefBy(BASE_DELEGATE).fields.filter { it.type == "Landroid/view/View;" }
        .uniqueHook("native view delegate root")
    val playerGetter = classDefBy(PLAYER_VIEW).methods.filter { it.name == "getPlayer" &&
        it.parameterTypes.isEmpty() && it.returnType in classDefBy(h.wrapper.type).interfaces
    }.uniqueHook("native playback view transport getter")
    val setter = h.setQuality.references().filterIsInstance<MethodReference>().filter {
        it.definingClass == h.wrapper.type && it.parameterTypes == listOf("Ljava/lang/String;", "Z") && it.returnType == "V"
    }.uniqueHook("native wrapper quality action")
    if (!AccessFlags.PUBLIC.isSet(root.accessFlags))
        throw PatchException("Reload stream: native XML bridge access changed.")
    if (h.load.implementation == null || (h.load.implementation?.registerCount ?: 17) > 16 ||
        AccessFlags.STATIC.isSet(h.load.accessFlags) || h.load.parameterTypes.size != 2 ||
        h.load.parameterTypes.any { !it.startsWith("L") })
        throw PatchException("Reload stream: native source metadata register contract changed.")
    val legacy = classDefBy(LegacySurfacePlayerControllerFingerprint.originalMethod.definingClass)
    require(legacy.fields.any { it.type == playerGetter.returnType } && legacy.fields.any { it.type == h.source.type }) {
        "native surface player controller missing expected fields"
    }
    val transport = legacy.fields.filter { it.type == playerGetter.returnType && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .uniqueHook("native surface controller transport")
    fun delegate(type: String): Boolean {
        var current: String? = type
        repeat(8) {
            val cursor = current ?: return false
            if (cursor == BASE_DELEGATE) return true
            if (cursor.startsWith("Ljava") || cursor.startsWith("Landroid")) return false
            current = classDefBy(cursor).superclass
            if (current == null || current == "Ljava/lang/Object;") return false
        }
        return false
    }
    val controllerBind = legacy.methods.filter { method -> method.parameterTypes.size == 1 &&
        method.parameterTypes[0].startsWith("L") && !method.parameterTypes[0].startsWith("Ljava") &&
        !method.parameterTypes[0].startsWith("Landroid") &&
        delegate(method.parameterTypes[0].toString()) && method.returnType == "V" &&
        method.references().filterIsInstance<FieldReference>().any { it.definingClass == legacy.type &&
            it.type == method.parameterTypes[0].toString() }
    }.uniqueHook("native surface player view attachment")
    requireReloadParametersPreserved(bind, setOf(0, 1))
    requireReloadParametersPreserved(controllerBind, setOf(0))
    val savedDelegate = resolveReloadDelegate(controllerBind)
    val muteOwners = MuteLabelFingerprint(nativeMuteLabel).matchAllOrNull()?.map { it.classDef.type }?.toSet() ?: emptySet()
    val controlsDelegate = classDefBy(overlay.definingClass).fields.filter { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && field.type.startsWith("L") &&
            !field.type.startsWith("Ljava") && !field.type.startsWith("Landroid") && delegate(field.type) &&
            classDefBy(field.type).fields.any { it.type in muteOwners }
    }.uniqueHook("native detached controls delegate")
    if (!AccessFlags.PUBLIC.isSet(controlsDelegate.accessFlags))
        throw PatchException("Reload stream: native controls delegate is inaccessible.")
    val candidates = presenter.fields.flatMap { parent ->
        if (!parent.type.startsWith("L") || parent.type.startsWith("Landroid") || parent.type.startsWith("Ljava")) emptyList()
        else classDefBy(parent.type).fields.filter { field -> field.type.startsWith("L") &&
            !field.type.startsWith("Ljava") && !field.type.startsWith("Landroid") &&
            classDefBy(field.type).methods.any { it.parameterTypes == listOf("Ltv/twitch/android/models/streams/StreamModel;") &&
                it.returnType == "V" } && AccessFlags.INTERFACE.isSet(classDefBy(field.type).accessFlags)
        }.map { parent to it }
    }.filter { (parent, _) -> bind.references().any { it.toString() == parent.toString() } }
    val (playerPresenter, controller) = candidates.uniqueHook("native XML controls player presenter")
    if (listOf(transport, playerPresenter, controller).any { !AccessFlags.PUBLIC.isSet(it.accessFlags) })
        throw PatchException("Reload stream: native controller bridge fields are inaccessible.")
    return NativeReloadViewHooks(bind, root, controlsDelegate, setter, controllerBind, savedDelegate, transport, playerPresenter, controller)
}
