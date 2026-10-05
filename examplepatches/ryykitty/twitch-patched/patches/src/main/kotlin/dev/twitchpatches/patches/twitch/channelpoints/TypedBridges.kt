package dev.twitchpatches.patches.twitch.channelpoints

import dev.twitchpatches.patches.twitch.shared.reference

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.addBridge(owner: String, name: String, params: List<String>, locals: Int, body: String): String {
    val type = mutableClassDefBy(owner)
    if (type.methods.any { it.name == name }) throw PatchException("Channel points: bridge name already present: $name.")
    val method = ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, null, null) }, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(locals + params.size)).toMutable()
    method.addInstructionsWithLabels(0, body)
    type.methods.add(method)
    return method.reference
}

internal fun BytecodePatchContext.pointsBridge(hooks: PointsHooks): String = with(hooks) {
    addBridge(provider.type, "twitchPatchesClaimBonus", listOf(provider.type, MODEL), 5, """
        if-eqz p1, :done
        invoke-virtual {p1}, $MODEL->getEnabled()Z
        move-result v0
        if-eqz v0, :disabled
        invoke-virtual {p1}, ${getClaim.reference}
        move-result-object v0
        if-eqz v0, :no_claim
        iget-object v1, v0, ${claimChannel.definingClass}->${claimChannel.name}:$CHANNEL
        if-eqz v1, :done
        invoke-interface {v1}, $CHANNEL->getTuid()$TUID
        move-result-object v1
        if-eqz v1, :done
        iget-object v2, p0, ${delegate.definingClass}->${delegate.name}:${delegate.type}
        if-eqz v2, :done
        iget-object v2, v2, ${delegateChannel.definingClass}->${delegateChannel.name}:$CHANNEL
        if-eqz v2, :done
        invoke-interface {v2}, $CHANNEL->getTuid()$TUID
        move-result-object v2
        invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result v2
        if-eqz v2, :channel_mismatch
        iget-object v3, v0, ${id.definingClass}->${id.name}:Ljava/lang/String;
        invoke-static {v1, v3}, $RUNTIME->offer(Ljava/lang/Object;Ljava/lang/String;)Z
        move-result v2
        if-eqz v2, :done
        const/4 v4, 0x0
        invoke-virtual {p0, v3, v4}, ${claim.reference}
        goto :done
        :disabled
        const-string v4, "provider model disabled"
        goto :observe
        :no_claim
        const-string v4, "provider model has no bonus"
        goto :observe
        :channel_mismatch
        const-string v4, "bonus channel differs from provider"
        :observe
        invoke-static {v4}, $RUNTIME->observation(Ljava/lang/String;)V
        :done
        return-void
    """)
}

internal fun BytecodePatchContext.playerConfigurationBridge(hooks: PlayerHooks): String = with(hooks) {
    addBridge(player.type, "twitchPatchesObservePlayback", listOf(player.type) + configure.parameterTypes.map { it.toString() }, 3, """
        const/4 v0, 0x0
        const/4 v1, 0x0
        if-eqz p2, :report
        invoke-virtual {p2}, ${metadataChannel.reference}
        move-result-object v0
        invoke-virtual {p2}, ${metadataMode.reference}
        move-result-object v1
        sget-object v2, $CONTENT_MODE->LIVE:$CONTENT_MODE
        if-ne v1, v2, :not_live
        const/4 v1, 0x1
        goto :report
        :not_live
        const/4 v1, 0x0
        :report
        invoke-static {p0, v0, v1}, $RUNTIME->configure(Ljava/lang/Object;Ljava/lang/Object;Z)V
        return-void
    """)
}

internal fun BytecodePatchContext.playerStateBridge(hooks: PlayerHooks): String = with(hooks) {
    addBridge(player.type, "twitchPatchesObservePlayerState", listOf(player.type, state.parameterTypes.single().toString()), 2, """
        const/4 v0, 0x0
        sget-object v1, ${playing.definingClass}->${playing.name}:${playing.type}
        if-ne p1, v1, :report
        const/4 v0, 0x1
        :report
        invoke-static {p0, v0}, $RUNTIME->state(Ljava/lang/Object;Z)V
        return-void
    """)
}
