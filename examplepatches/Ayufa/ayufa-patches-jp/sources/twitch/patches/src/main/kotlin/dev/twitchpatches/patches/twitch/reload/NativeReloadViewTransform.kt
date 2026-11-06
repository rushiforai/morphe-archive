package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.installNativeReloadViews(v: NativeReloadViewHooks, h: NativeReloadPlayerHooks) {
    val presenter = mutableClassDefBy(v.bind.definingClass)
    val bind = nativeReloadMethod(presenter.type, "bindReloadViews", v.bind.parameterTypes.map { it.toString() }, "V", 7, """
        iget-object v0, p1, ${v.controlsDelegate}
        if-eqz v0, :done
        iget-object v0, v0, ${v.root}
        const/4 v1, 0x1
        iget-object v2, p0, ${v.playerPresenter}
        iget-object v3, v2, ${v.controller}
        const v4, $nativeMuteButton
        invoke-static {v0, v3, v1, v4}, $NATIVE_VIEWS->install(Landroid/view/View;Ljava/lang/Object;ZI)V
        :done
        return-void
    """)
    presenter.methods.add(bind)
    val attached = presenter.methods.single { it.reference == v.bind.reference }
    attached.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
        attached.insertAtReturn(it, "invoke-virtual/range {p0 .. p1}, ${bind.reference}")
    }
    val controller = mutableClassDefBy(v.transport.definingClass)
    val controllerBridge = nativeReloadMethod(controller.type, "bindReloadPlayerViews",
        emptyList(), "V", 4, """
        iget-object v0, p0, ${v.delegate}
        if-eqz v0, :done
        iget-object v0, v0, ${v.root}
        instance-of v1, p0, ${v.controller.type}
        const v2, $nativeMuteButton
        invoke-static {v0, p0, v1, v2}, $NATIVE_VIEWS->install(Landroid/view/View;Ljava/lang/Object;ZI)V
        :done
        return-void
    """)
    controller.methods.add(controllerBridge)
    val controllerAttach = controller.methods.single { it.reference == v.controllerBind.reference }
    controllerAttach.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
        controllerAttach.insertAtReturn(it, "invoke-virtual/range {p0 .. p0}, ${controllerBridge.reference}")
    }
    val wrapper = mutableClassDefBy(h.wrapper.type)
    wrapper.interfaces.add(NATIVE_HOST)
    val metadata = "${wrapper.type}->reloadMetadata:${h.load.parameterTypes[1]}"
    wrapper.fields.add(ImmutableField(wrapper.type, "reloadMetadata", h.load.parameterTypes[1].toString(),
        AccessFlags.PRIVATE.value, null, null, null).toMutable())
    val load = wrapper.methods.single { it.reference == h.load.reference }
    load.addInstructions(0, "iput-object p2, p0, $metadata")
    wrapper.methods.add(nativeReloadMethod(wrapper.type, "reloadIdentity", emptyList(), "Ljava/lang/Object;", 5, """
        const/4 v0, 0x0
        iget-object v1, p0, ${h.media}
        if-eqz v1, :done
        invoke-virtual {p0}, ${h.state.reference}
        move-result-object v1
        sget-object v2, ${h.state.returnType}->PLAYING:${h.state.returnType}
        if-eq v1, v2, :ready
        sget-object v2, ${h.state.returnType}->PAUSED:${h.state.returnType}
        if-ne v1, v2, :done
        :ready
        iget-object v0, p0, ${h.source}
        :done
        return-object v0
    """))
    wrapper.methods.add(nativeReloadMethod(wrapper.type, "reloadNativeStream", emptyList(), "Z", 7, """
        invoke-virtual {p0}, ${wrapper.type}->reloadIdentity()Ljava/lang/Object;
        move-result-object v0
        if-eqz v0, :unavailable
        check-cast v0, ${h.source.type}
        iget-object v1, p0, $metadata
        iget-object v2, p0, ${h.media}
        const-string v3, "auto"
        invoke-interface {v2}, ${h.media.type}->isAutoQualityMode()Z
        move-result v4
        if-nez v4, :reload
        invoke-interface {v2}, ${h.media.type}->getQuality()Lcom/amazonaws/ivs/player/Quality;
        move-result-object v2
        if-eqz v2, :reload
        invoke-virtual {v2}, Lcom/amazonaws/ivs/player/Quality;->getName()Ljava/lang/String;
        move-result-object v3
        :reload
        invoke-virtual {p0}, ${wrapper.type}->stop()V
        invoke-virtual {p0, v0, v1}, ${h.load.reference}
        const/4 v4, 0x0
        invoke-virtual {p0, v3, v4}, ${v.qualitySetter}
        invoke-virtual {p0}, ${wrapper.type}->start()V
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, 0x0
        return v0
    """))
}
