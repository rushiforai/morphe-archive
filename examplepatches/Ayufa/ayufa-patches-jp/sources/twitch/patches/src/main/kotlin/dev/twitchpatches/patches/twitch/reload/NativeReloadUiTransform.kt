package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.installNativeReloadUi(ui: NativeReloadUiHooks, player: NativeReloadPlayerHooks) {
    val action = mutableClassDefBy(NATIVE_ACTION)
    action.interfaces.add(ui.volume.parameterTypes[1].toString())
    val invoke = action.methods.filter { it.name == "invoke" && it.isInstance(emptyList(), "Ljava/lang/Object;") }
        .uniqueHook("native reload click action")
    invoke.code().withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }.asReversed().forEach {
        val register = (invoke.code()[it] as OneRegisterInstruction).registerA
        invoke.insertAtReturn(it, "sget-object v$register, ${ui.callbackUnit}")
    }
    val bridge = mutableClassDefBy(NATIVE_BRIDGE)
    val update = bridge.methods.filter { it.name == "update" && it.parameterTypes == listOf("Z") && it.returnType == "V" }
        .uniqueHook("native reload preference update")
    bridge.methods.remove(update)
    bridge.methods.add(nativeReloadMethod(NATIVE_BRIDGE, "update", listOf("Z"), "V", 4, """
        invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        move-result-object v1
        sget-object v0, $NATIVE_BRIDGE->state:Ljava/lang/Object;
        if-nez v0, :existing
        invoke-static {v1}, ${player.flowFactory}
        move-result-object v0
        sput-object v0, $NATIVE_BRIDGE->state:Ljava/lang/Object;
        return-void
        :existing
        check-cast v0, ${player.flowType}
        const/4 v2, 0x0
        invoke-virtual {v0, v2, v1}, ${player.flowSetter.reference}
        return-void
    """, static = true))
    val transparent = ui.volume.references().filterIsInstance<FieldReference>().filter { it.name == "TRANSPARENT" }
        .uniqueHook("native transparent button style")
    val render = nativeReloadMethod(NATIVE_BRIDGE, "renderReload", listOf("Ljava/lang/Object;", ui.composer), "V", 14, """
        move-object v11, p1
        check-cast v11, ${ui.concreteComposer}
        const v0, 0x5457524c
        invoke-virtual {v11, v0}, ${ui.groupStart}
        sget-object v0, $NATIVE_BRIDGE->state:Ljava/lang/Object;
        if-eqz v0, :done
        check-cast v0, ${ui.flowCollector.parameterTypes[0]}
        move-object v1, p1
        invoke-static {v0, v1}, ${ui.flowCollector}
        move-result-object v0
        invoke-interface {v0}, ${ui.stateValue}
        move-result-object v0
        check-cast v0, Ljava/lang/Boolean;
        invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v0
        if-eqz v0, :done
        invoke-static {p0}, $NATIVE_ACTION->forVolume(Ljava/lang/Object;)$NATIVE_ACTION
        move-result-object v7
        if-eqz v7, :done
        invoke-virtual {v7}, $NATIVE_ACTION->available()Z
        move-result v0
        if-eqz v0, :done
        const-string v0, "Reload stream"
        const v1, $nativeReloadIcon
        const/4 v2, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        const/4 v5, 0x0
        sget-object v6, $transparent
        move-object v8, p1
        const v9, 0x180000
        const/16 v10, 0x3c
        invoke-static/range {v0 .. v10}, ${ui.button}
        :done
        invoke-virtual {v11}, ${ui.groupEnd}
        return-void
    """, static = true)
    bridge.methods.add(render)
    val wrapper = nativeReloadMethod(NATIVE_BRIDGE, "renderVolumeAndReload", ui.volume.parameterTypes.map { it.toString() },
        "V", 6, """
            invoke-static/range {p0 .. p3}, ${ui.volume.reference}
            move-object v0, p1
            move-object v1, p2
            invoke-static {v0, v1}, ${render.reference}
            return-void
        """, static = true)
    bridge.methods.add(wrapper)
    for (original in ui.callers) {
        val method = mutableClassDefBy(original.definingClass).methods.single { it.reference == original.reference }
        method.code().withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == ui.volume.reference }
            .forEach { (index, instruction) ->
                method.replaceNativeVolume(index, ui.volume.reference, wrapper.reference)
            }
    }
}
