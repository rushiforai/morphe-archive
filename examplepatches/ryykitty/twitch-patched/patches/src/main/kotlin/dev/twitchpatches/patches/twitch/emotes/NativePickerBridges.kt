package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.Opcode
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.emotePickerBindBridge(delegate: Method): String {
    val base = classDefBy("Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;")
    val view = base.fields.filter { it.type == "Landroid/view/View;" && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        .uniqueHook("picker delegate root view")
    val owner = mutableClassDefBy(delegate.definingClass)
    val method = ImmutableMethod(owner.type, "twitchPatchesBindPicker",
        listOf(ImmutableMethodParameter(owner.type, null, null)), "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(2)).toMutable()
    require(owner.methods.none { it.name == method.name })
    method.addInstructionsWithLabels(0, """
        iget-object v0, p0, $view
        invoke-static {p0, v0}, $PICKER_RUNTIME->bind(Ljava/lang/Object;Landroid/view/View;)V
        return-void
    """)
    owner.methods.add(method)
    return method.reference
}

internal fun BytecodePatchContext.pickerImageBridge(call: MethodReference, ownerType: String): String {
    require(call.parameterTypes.map(CharSequence::toString).take(4) == listOf(
        "Ltv/twitch/android/shared/ui/elements/image/NetworkImageWidget;", PICKER_STRING, "Z", "J") && call.returnType == "V")
    val owner = mutableClassDefBy(ownerType)
    val method = ImmutableMethod(owner.type, "twitchPatchesLoadPickerImage",
        call.parameterTypes.map { ImmutableMethodParameter(it.toString(), null, null) }, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(9)).toMutable()
    require(owner.methods.none { it.name == method.name })
    method.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, Ldev/twitchpatches/extension/emotes/EmotePickerImages;->bind(Landroid/widget/ImageView;Ljava/lang/String;)Z
        move-result v0
        if-nez v0, :done
        invoke-static/range {p0 .. p7}, $call
        :done
        return-void
    """)
    owner.methods.add(method)
    return method.reference
}

internal fun BytecodePatchContext.emotePickerStartBridge(start: Method): String {
    val owner = mutableClassDefBy(start.definingClass)
    val method = ImmutableMethod(owner.type, "twitchPatchesPickerChannel",
        listOf(ImmutableMethodParameter(owner.type, null, null), ImmutableMethodParameter(CHANNEL_ID, null, null)),
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3)).toMutable()
    require(owner.methods.none { it.name == method.name })
    method.addInstructionsWithLabels(0, """
        const/4 v0, 0x0
        if-eqz p1, :begin
        invoke-virtual {p1}, $CHANNEL_ID->toString()Ljava/lang/String;
        move-result-object v0
        :begin
        invoke-static {p0, v0}, $PICKER_RUNTIME->begin(Ljava/lang/Object;Ljava/lang/String;)V
        return-void
    """)
    owner.methods.add(method)
    return method.reference
}

internal fun BytecodePatchContext.nativePickerBridges(h: NativePickerHooks, footer: Int) {
    val bridge = mutableClassDefBy(PICKER_BRIDGE)
    fun replace(name: String, locals: Int, body: String) {
        val original = bridge.methods.filter { it.name == name }.uniqueHook("picker $name bridge")
        val method = ImmutableMethod(original.definingClass, original.name, original.parameters, original.returnType,
            original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            MutableMethodImplementation(locals + original.parameterTypes.size)).toMutable()
        method.addInstructionsWithLabels(0, body)
        bridge.methods.remove(original)
        bridge.methods.add(method)
    }
    val asset = h.generic.parameterTypes[2].toString()
    val kind = h.generic.parameterTypes[3].toString()
    val badge = h.model.parameterTypes[3].toString()
    fun parameterField(method: Method, parameter: Int) = method.code().filter {
        it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA ==
            requireNotNull(method.implementation).registerCount - method.parameterTypes.size + parameter
    }.map { (it as ReferenceInstruction).reference as FieldReference }.uniqueHook("picker model parameter field")
    val sectionHeader = parameterField(h.section, 0)
    val headerLogin = parameterField(h.header, 0)
    replace("insertionIndex", 6, """
        const/4 v0, 0x0
        const/4 v5, -0x1
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :fallback
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        add-int/lit8 v0, v0, 0x1
        check-cast v2, ${h.section.definingClass}
        iget-object v2, v2, $sectionHeader
        instance-of v3, v2, ${h.header.definingClass}
        if-eqz v3, :next
        if-eqz p1, :next
        check-cast v2, ${h.header.definingClass}
        iget-object v4, v2, $headerLogin
        invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
        move-result v3
        if-eqz v3, :next
        move v5, v0
        goto :next
        :fallback
        if-ltz v5, :default_position
        return v5
        :default_position
        if-eqz v0, :empty
        const/4 v0, 0x1
        :empty
        return v0
    """)
    replace("emote", 6, """
        sget-object v2, $asset->STATIC:$asset
        if-eqz p2, :asset_ready
        sget-object v2, $asset->ANIMATED:$asset
        :asset_ready
        sget-object v3, $kind->OTHER:$kind
        new-instance v0, ${h.generic.definingClass}
        invoke-direct {v0, p0, p1, v2, v3}, ${h.generic.reference}
        new-instance v1, ${h.input.definingClass}
        const/4 v3, 0x0
        invoke-direct {v1, p1, p0, v3}, ${h.input.reference}
        new-instance v4, ${h.unlocked.definingClass}
        invoke-direct {v4, v0, v1}, ${h.unlocked.reference}
        sget-object v3, $badge->NONE:$badge
        new-instance v5, ${h.model.definingClass}
        invoke-direct {v5, p0, v4, v2, v3}, ${h.model.reference}
        return-object v5
    """)
    replace("section", 4, """
        new-instance v0, ${h.header.definingClass}
        const/4 v1, 0x0
        const/4 v2, 0x0
        invoke-direct {v0, p0, p0, v1, v2}, ${h.header.reference}
        new-instance v3, ${h.section.definingClass}
        invoke-direct {v3, v0, p1}, ${h.section.reference}
        return-object v3
    """)
    replace("publish", 2, """
        check-cast p0, ${h.presenter.type}
        iget-object v0, p0, ${h.state}
        new-instance v1, ${h.event.definingClass}
        invoke-direct {v1, p1, p2}, ${h.event.reference}
        invoke-virtual {v0, v1}, ${h.update}
        return-void
    """)
    replace("scroll", 4, """
        check-cast p0, ${h.delegate.definingClass}
        iget-object v0, p0, ${h.delegateList}
        iget-object v0, v0, ${h.layout}
        if-eqz v0, :done
        invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
        move-result-object v1
        new-instance v2, ${h.smooth.definingClass}
        const/4 v3, 0x0
        invoke-direct {v2, v3, v1, v3}, ${h.smooth}
        iput p2, v2, ${h.target}
        invoke-virtual {v0, v2}, ${h.scroll}
        :done
        return-void
    """)
    replace("footerId", 1, "const v0, $footer\nreturn v0")
    replace("itemCount", 3, """
        const/4 v0, 0x0
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, ${h.section.definingClass}
        iget-object v2, v2, ${h.entries}
        invoke-interface {v2}, Ljava/util/List;->size()I
        move-result v2
        add-int/2addr v0, v2
        add-int/lit8 v0, v0, 0x1
        goto :next
        :done
        return v0
    """)
}
