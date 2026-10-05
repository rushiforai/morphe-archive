package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.installNativeReloadPlayer(h: NativeReloadPlayerHooks, ui: NativeReloadUiHooks) {
    val vm = mutableClassDefBy(h.ownerType)
    vm.interfaces.add(NATIVE_HOST)
    val releasedField = "${vm.type}->reloadReleased:Z"
    vm.fields.add(ImmutableField(vm.type, "reloadReleased", "Z", AccessFlags.PRIVATE.value, null, null, null).toMutable())
    vm.methods.add(nativeReloadMethod(vm.type, "reloadIdentity", emptyList(), "Ljava/lang/Object;", 6, """
        const/4 v0, 0x0
        iget-boolean v1, p0, $releasedField
        if-nez v1, :done
        iget-object v1, p0, ${h.playable}
        instance-of v1, v1, Ltv/twitch/android/models/streams/StreamModel;
        if-eqz v1, :done
        iget-object v1, p0, ${h.castFlow}
        iget-object v1, v1, ${h.castValueFlow}
        invoke-interface {v1}, ${h.castValue}
        move-result-object v1
        instance-of v1, v1, ${h.castType}
        if-nez v1, :done
        iget-object v2, p0, ${h.player}
        iget-object v2, v2, ${h.wrapper}
        iget-object v1, v2, ${h.media}
        if-eqz v1, :done
        invoke-virtual {v2}, ${h.state.reference}
        move-result-object v3
        sget-object v4, ${h.state.returnType}->PLAYING:${h.state.returnType}
        if-eq v3, v4, :ready
        sget-object v4, ${h.state.returnType}->PAUSED:${h.state.returnType}
        if-ne v3, v4, :done
        :ready
        iget-object v0, v2, ${h.source}
        :done
        return-object v0
    """))
    vm.methods.add(nativeReloadMethod(vm.type, "reloadNativeStream", emptyList(), "Z", 9, """
        invoke-virtual {p0}, ${vm.type}->reloadIdentity()Ljava/lang/Object;
        move-result-object v0
        if-eqz v0, :unavailable
        check-cast v0, ${h.source.type}
        invoke-virtual {p0}, ${h.quality.reference}
        move-result-object v1
        iget-object v2, p0, ${h.player}
        iget-object v3, v2, ${h.wrapper}
        move-object v4, v0
        iget-object v5, v2, ${h.metadataOwner}
        iget-object v5, v5, ${h.metadata}
        invoke-virtual {v3}, ${h.wrapper.type}->stop()V
        invoke-virtual/range {v3 .. v5}, ${h.load.reference}
        if-eqz v1, :play
        invoke-virtual {p0, v1}, ${h.setQuality.reference}
        :play
        invoke-virtual {v3}, ${h.wrapper.type}->start()V
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, 0x0
        return v0
    """))
    vm.methods.add(nativeReloadMethod(vm.type, "releaseReload", emptyList(), "V", 2, """
        const/4 v0, 0x1
        iput-boolean v0, p0, $releasedField
        return-void
    """))
    val release = vm.methods.single { it.reference == h.released.reference }
    release.addInstructions(0, "invoke-virtual/range {p0 .. p0}, ${vm.type}->releaseReload()V")
    val callback = mutableClassDefBy(ui.callbackOwner.definingClass)
    callback.interfaces.add(NATIVE_OWNER)
    callback.methods.add(nativeReloadMethod(callback.type, "reloadControlsOwner", emptyList(), "Ljava/lang/Object;", 2, """
        iget-object v0, p0, ${ui.callbackOwner}
        return-object v0
    """))
    val fragment = mutableClassDefBy(NATIVE_FRAGMENT)
    fragment.methods.add(nativeReloadMethod(fragment.type, "bindReloadControls", emptyList(), "V", 3, """
        invoke-virtual {p0}, ${h.controlsGetter.reference}
        move-result-object v0
        invoke-virtual {p0}, ${h.playerGetter.reference}
        move-result-object v1
        invoke-static {v0, v1}, $NATIVE_ACTION->bind(Ljava/lang/Object;$NATIVE_HOST)V
        return-void
    """))
    val created = fragment.methods.filter { it.name == "onViewCreated" &&
        it.isInstance(listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V") }.uniqueHook("native player view creation")
    created.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
        created.insertAtReturn(it, "invoke-virtual/range {p0 .. p0}, $NATIVE_FRAGMENT->bindReloadControls()V")
    }
}
