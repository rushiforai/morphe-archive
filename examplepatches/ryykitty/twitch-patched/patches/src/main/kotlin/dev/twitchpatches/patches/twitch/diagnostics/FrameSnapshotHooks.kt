package dev.twitchpatches.patches.twitch.diagnostics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.applyFrameSnapshot() {
    val player = "Lcom/amazonaws/ivs/player/Player;"
    val state = "Lcom/amazonaws/ivs/player/Player\$State;"
    val stats = "Lcom/amazonaws/ivs/player/Statistics;"
    val frames = "Ldev/twitchpatches/extension/diagnostics/PlaybackFrames;"
    if (!AccessFlags.PUBLIC.isSet(classDefBy(state).accessFlags) || !AccessFlags.ENUM.isSet(classDefBy(state).accessFlags))
        throw PatchException("Frame sampler requires the original public IVS state enum")
    val getter = classDefBy(player).methods.filter {
        it.name == "getState" && it.parameterTypes.isEmpty() && it.returnType == state &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueHook("IVS original player state")
    val playing = classDefBy(state).fields.filter {
        it.name == "PLAYING" && it.type == state && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags)
    }.uniqueHook("IVS original playing state")
    val destination = mutableClassDefBy(frames)
    val stub = destination.methods.filter {
        it.name == "readPlayingStatistics" && it.parameterTypes.map { parameter -> parameter.toString() } ==
            listOf("Ljava/lang/Object;") && it.returnType == stats && AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueHook("extension frame snapshot stub")
    val bridge = ImmutableMethod(frames, stub.name, listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
        stats, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3)).toMutable()
    bridge.addInstructionsWithLabels(0, """
        check-cast p0, $player
        invoke-interface {p0}, ${getter.reference}
        move-result-object v0
        sget-object v1, ${playing.definingClass}->${playing.name}:$state
        if-ne v0, v1, :stopped
        invoke-interface {p0}, $player->getStatistics()$stats
        move-result-object v0
        return-object v0
        :stopped
        const/4 v0, 0x0
        return-object v0
    """)
    destination.methods.remove(stub); destination.methods.add(bridge)
}
