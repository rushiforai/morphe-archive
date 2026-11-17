/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.interaction.jam.ProtoAbi
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val ACTIVITY = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;"
private const val ACTIVITY_ACCESS =
    $$"Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative$ActivityAccess;"
private const val OBJECT = "Ljava/lang/Object;"

internal data class SmartActivityDispatcherRoute(
    val peer: FieldReference,
    val provider: FieldReference,
    val getter: MethodReference,
    val dispatch: MethodReference,
)

private fun Instruction.isInterfaceCall() =
    opcode == Opcode.INVOKE_INTERFACE || opcode == Opcode.INVOKE_INTERFACE_RANGE

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false

    val destination = (this as OneRegisterInstruction).registerA
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun MethodReference.matchesDispatch(nativeDispatch: MethodReference) =
    name == nativeDispatch.name && returnType == nativeDispatch.returnType &&
        parameterTypes.map(CharSequence::toString) == nativeDispatch.parameterTypes.map(CharSequence::toString)

/** Resolve only a provider value that stock Activity code actually uses for the single-Root dispatch. */
internal fun smartShuffleActivityRoute(
    activity: ClassDef,
    nativeDispatch: MethodReference,
): SmartActivityDispatcherRoute {
    check(nativeDispatch.parameterTypes.size == 1 && nativeDispatch.returnType == "V") {
        "Smart Shuffle requires a single-Root native dispatcher"
    }

    val routes = activity.methods.flatMap { method ->
        val code = method.implementation?.instructions?.toList() ?: return@flatMap emptyList()
        code.indices.mapNotNull { index -> activityRouteAt(activity, code, index, nativeDispatch) }.flatten()
    }.distinctBy { route ->
        listOf(route.peer.toString(), route.provider.toString(), route.getter.toString(), route.dispatch.toString())
    }

    check(routes.size == 1) {
        "Missing or ambiguous current MusicActivity dispatcher provider route (${routes.size})"
    }
    return routes.single()
}

private fun activityRouteAt(
    activity: ClassDef,
    code: List<Instruction>,
    index: Int,
    nativeDispatch: MethodReference,
): List<SmartActivityDispatcherRoute>? {
    val providerRead = code[index]
    if (providerRead.opcode != Opcode.IGET_OBJECT) return null

    val provider = providerRead.getReference<FieldReference>() ?: return null
    val getterCall = code.getOrNull(index + 1) ?: return null
    if (!getterCall.isInterfaceCall()) return null

    val getter = getterCall.getReference<MethodReference>() ?: return null
    if (getter.parameterTypes.isNotEmpty() || getter.returnType != OBJECT ||
        getter.definingClass != provider.type ||
        (getterCall as ReferenceInstruction).registerAt(0) !=
            (providerRead as TwoRegisterInstruction).registerA
    ) return null

    val result = code.getOrNull(index + 2) ?: return null
    val cast = code.getOrNull(index + 3) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT || cast.opcode != Opcode.CHECK_CAST) return null

    val receiver = (result as OneRegisterInstruction).registerA
    if ((cast as OneRegisterInstruction).registerA != receiver) return null

    val dispatcherType = cast.getReference<TypeReference>()?.type ?: return null
    val dispatch = observedDispatch(code, index + 4, receiver, dispatcherType, nativeDispatch) ?: return null
    return activity.fields.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == provider.definingClass
    }.map { SmartActivityDispatcherRoute(it, provider, getter, dispatch) }
}

private fun observedDispatch(
    code: List<Instruction>,
    start: Int,
    receiver: Int,
    dispatcherType: String,
    nativeDispatch: MethodReference,
): MethodReference? {
    for (index in start until code.size) {
        val instruction = code[index]
        if (instruction.isInterfaceCall()) {
            val call = instruction.getReference<MethodReference>()
            if (call != null && call.definingClass == dispatcherType && call.matchesDispatch(nativeDispatch) &&
                (instruction as ReferenceInstruction).registerAt(0) == receiver
            ) return call
        }
        if (instruction.writesRegister(receiver)) return null
    }
    return null
}

/** Read the peer and its provider afresh; a destroyed or not-yet-initialized Activity has no dispatcher. */
internal fun smartShuffleActivityGetter(
    activityType: String,
    route: SmartActivityDispatcherRoute,
): MutableMethod = ImmutableMethod(
    activityType,
    "smartCurrentDispatcher",
    emptyList(),
    OBJECT,
    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    null,
    null,
    MutableMethodImplementation(2),
).toMutable().apply {
    addInstructions(0, """
        iget-object v0, p0, ${route.peer}
        if-eqz v0, :missing
        iget-object v0, v0, ${route.provider}
        if-eqz v0, :missing
        invoke-interface {v0}, ${route.getter}
        move-result-object v0
        return-object v0
        :missing
        const/4 v0, 0x0
        return-object v0
    """)
}

/** Use stock's single-Root entry point, preserving its native default command context. */
internal fun smartShuffleActivityDispatch(
    activityType: String,
    route: SmartActivityDispatcherRoute,
    decode: String,
): MutableMethod = ImmutableMethod(
    activityType,
    "smartDispatch",
    listOf(ImmutableMethodParameter("[B", null, null)),
    "V",
    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    null,
    null,
    MutableMethodImplementation(6),
).toMutable().apply {
    addInstructions(0, """
        invoke-virtual {p0}, $activityType->smartCurrentDispatcher()$OBJECT
        move-result-object v3
        check-cast v3, ${route.dispatch.definingClass}
    """ + decode + """
        invoke-interface {v3, v0}, ${route.dispatch}
        return-void
    """)
}

/** Preflight every reference and both assembled methods before the caller mutates native classes. */
internal fun BytecodePatchContext.resolveSmartShuffleActivityDispatcher(
    proto: ProtoAbi,
    nativeDispatch: MethodReference,
): () -> Unit {
    check(nativeDispatch.parameterTypes.map(CharSequence::toString) == listOf(proto.type)) {
        "MusicActivity dispatcher does not accept the Smart Shuffle Root proto"
    }
    val activity = classDefByOrNull(ACTIVITY) ?: error("Missing native MusicActivity")
    val route = smartShuffleActivityRoute(activity, nativeDispatch)
    check(activity.methods.none { it.name == "smartCurrentDispatcher" || it.name == "smartDispatch" }) {
        "MusicActivity Smart Shuffle dispatcher bridge already exists"
    }

    val peerClass = classDefByOrNull(route.provider.definingClass)
        ?: error("Missing MusicActivity dispatcher peer class")
    val provider = peerClass.fields.single {
        it.name == route.provider.name && it.type == route.provider.type
    }
    check(AccessFlags.PUBLIC.isSet(peerClass.accessFlags) && AccessFlags.PUBLIC.isSet(provider.accessFlags) &&
        !AccessFlags.STATIC.isSet(provider.accessFlags)
    ) { "MusicActivity dispatcher provider is not publicly readable" }

    for (reference in listOf(route.getter, route.dispatch)) {
        val owner = classDefByOrNull(reference.definingClass)
            ?: error("Missing MusicActivity dispatcher interface: ${reference.definingClass}")
        val method = owner.methods.single { MethodUtil.methodSignaturesMatch(it, reference) }
        check(AccessFlags.PUBLIC.isSet(owner.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags) && invokeKind(reference) == "invoke-interface"
        ) { "MusicActivity dispatcher method is not a public interface call: $reference" }
    }
    check(classDefByOrNull(ACTIVITY_ACCESS) != null) { "Missing Smart Shuffle ActivityAccess interface" }

    val getter = smartShuffleActivityGetter(activity.type, route)
    val dispatch = smartShuffleActivityDispatch(activity.type, route, proto.decode("p1", "v0"))
    val mutableActivity = mutableClassDefBy(activity.type)
    return {
        mutableActivity.interfaces.add(ACTIVITY_ACCESS)
        mutableActivity.methods.add(getter)
        mutableActivity.methods.add(dispatch)
    }
}
