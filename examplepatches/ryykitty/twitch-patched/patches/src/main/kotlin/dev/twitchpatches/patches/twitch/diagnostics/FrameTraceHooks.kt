package dev.twitchpatches.patches.twitch.diagnostics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

private const val PLAYER = "Lcom/amazonaws/ivs/player/Player;"
private const val STATS = "Lcom/amazonaws/ivs/player/Statistics;"
private const val FRAMES = "Ldev/twitchpatches/extension/diagnostics/PlaybackFrames;"

internal fun BytecodePatchContext.applyFrameTrace() {
    listOf("getDecodedFrames", "getRenderedFrames", "getDroppedFrames").forEach { name ->
        val getter = classDefBy(STATS).methods.filter { it.name == name && it.isInstance(emptyList(), "I") }
            .uniqueHook("IVS numeric statistics getter")
        if (!AccessFlags.PUBLIC.isSet(getter.accessFlags)) throw PatchException("IVS frame getter is inaccessible")
    }
    val getter = classDefBy(PLAYER).methods.filter {
        it.name == "getStatistics" && it.parameterTypes.isEmpty() && it.returnType == STATS &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags)
    }.uniqueHook("IVS original statistics getter")
    if (!AccessFlags.PUBLIC.isSet(getter.accessFlags) || !AccessFlags.INTERFACE.isSet(classDefBy(PLAYER).accessFlags))
        throw PatchException("IVS frame trace requires a public player interface getter")
    val owner = classDefBy("Lcom/twitchrn/player/PlayerEventPayloads;")
    val signatures = listOf(
        listOf("Lcom/amazonaws/ivs/player/MediaPlayer;", "I", "I") to "Lcom/facebook/react/bridge/WritableMap;",
        listOf("Lcom/amazonaws/ivs/player/MediaPlayer;", "Lcom/facebook/react/bridge/WritableMap;", "I", "I") to "V",
    )
    val targets = signatures.map { (parameters, returns) ->
        owner.methods.filter { it.parameterTypes.map { parameter -> parameter.toString() } == parameters &&
            it.returnType == returns && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null &&
            it.references().any { ref -> ref.toString() == getter.reference } }
            .uniqueHook("React Native statistics event")
    }
    val bridge = ImmutableMethod(FRAMES, "readNativeStatistics", listOf(ImmutableMethodParameter(PLAYER, null, null)),
        STATS, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(2)).toMutable()
    val destination = mutableClassDefBy(FRAMES)
    if (destination.methods.any { it.name == bridge.name }) throw PatchException("Frame observer bridge already exists")
    bridge.addInstructions(0, """
        invoke-interface {p0}, ${getter.reference}
        move-result-object v0
        invoke-static {p0, v0}, $FRAMES->observe(Ljava/lang/Object;$STATS)V
        return-object v0
    """)
    destination.methods.add(bridge)
    for (target in targets) {
        val method = mutableClassDefBy(target.definingClass).methods.filter { it.reference == target.reference }
            .uniqueHook("resolved statistics event")
        val index = method.code().withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == getter.reference }
            .uniqueHook("original statistics read").index
        method.wrapStatisticsRead(index, bridge.reference)
    }
}

internal fun MutableMethod.wrapStatisticsRead(index: Int, bridge: String) {
    if (code().getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT)
        throw PatchException("Statistics getter result is not an object")
    val register = statisticsReceiver(this, index)
    if (register >= (implementation?.registerCount ?: 0)) throw PatchException("Statistics receiver is outside the register file")
    val opcode = if (code()[index].opcode == Opcode.INVOKE_INTERFACE_RANGE) "invoke-static/range" else "invoke-static"
    val arguments = if (opcode.endsWith("/range")) "v$register .. v$register" else "v$register"
    replaceInstruction(index, "$opcode {$arguments}, $bridge")
}

internal fun statisticsReceiver(method: Method, index: Int): Int {
    val instruction = method.code().getOrNull(index) ?: throw PatchException("Statistics call is absent")
    return when (instruction.opcode) {
        Opcode.INVOKE_INTERFACE -> (instruction as? FiveRegisterInstruction)?.let {
            if (it.registerCount == 1) it.registerC else null
        }
        Opcode.INVOKE_INTERFACE_RANGE -> (instruction as? RegisterRangeInstruction)?.let {
            if (it.registerCount == 1) it.startRegister else null
        }
        else -> null
    } ?: throw PatchException("Statistics getter needs exactly one instance receiver")
}
