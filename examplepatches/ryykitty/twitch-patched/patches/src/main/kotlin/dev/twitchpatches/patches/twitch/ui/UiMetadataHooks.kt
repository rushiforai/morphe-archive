package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.injectMetadataActions(all: List<Method>, owner: MutableClass, contract: UiCompositionContract) {
    val state = all.filter { it.name == "toString" && it.hasStrings("Visible(buttons=", ", onNotificationSettingSelected=") }
        .uniqueHook("fullscreen metadata action state")
    val model = classDefBy(state.definingClass)
    val buttons = model.fields.filter { it.type == "Ljava/util/ArrayList;" }.uniqueHook("metadata button list")
    val callback = model.fields.filter { it != buttons }.uniqueHook("metadata notification callback")
    val constructor = model.methods.filter { it.name == "<init>" && it.parameterTypes == listOf(buttons.type, callback.type) }
        .uniqueHook("metadata action constructor")
    require(listOf(buttons, callback).all { AccessFlags.PUBLIC.isSet(it.accessFlags) } &&
        AccessFlags.PUBLIC.isSet(constructor.accessFlags)) { "UI settings: metadata state access changed." }
    val renderer = all.filter { it.returnType == "V" && it.parameterTypes.size == 8 &&
        it.parameterTypes[1] == model.type && it.parameterTypes[6] == contract.composer && AccessFlags.STATIC.isSet(it.accessFlags) }
        .uniqueHook("fullscreen metadata renderer")
    val gift = all.filter { it.name == "toString" && it.hasStrings("GiftASubButton") &&
        classDefBy(it.definingClass).methods.any { method -> method.name == "<clinit>" && method.hasStrings("gift_button") }
    }.uniqueHook("metadata Gift action")
    val buttonBase = classDefBy(requireNotNull(classDefBy(gift.definingClass).superclass))
    val identity = classDefBy(requireNotNull(buttonBase.superclass)).methods.filter {
        it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }.uniqueHook("metadata button identity")
    val stub = owner.methods.single { it.name == "metadataButtonId" }
    owner.methods.remove(stub)
    owner.methods.add(nativeReloadMethod(owner.type, stub.name, listOf("Ljava/lang/Object;"), "Ljava/lang/String;", 2, """
        check-cast p0, ${identity.definingClass}
        invoke-virtual {p0}, ${identity.reference}
        move-result-object v0
        return-object v0
    """, static = true))
    val filter = nativeReloadMethod(owner.type, "filterMetadataModel", listOf(model.type), model.type, 4, """
        iget-object v0, p0, $buttons
        invoke-static {v0}, Ldev/twitchpatches/extension/ui/UiClassicActions;->filterMetadata(Ljava/util/ArrayList;)Ljava/util/ArrayList;
        move-result-object v1
        if-eq v0, v1, :unchanged
        new-instance v0, ${model.type}
        iget-object v2, p0, $callback
        invoke-direct {v0, v1, v2}, ${constructor.reference}
        return-object v0
        :unchanged
        return-object p0
    """, static = true)
    owner.methods.add(filter)
    val wrapper = uiWrapper(renderer, "metadataActions", contract, """
        const-string v1, "classic_support_hide_subscribe"
        invoke-static {v1, v0}, ${owner.type}->hidden(Ljava/lang/String;${contract.composer})Z
        invoke-static/range {p1 .. p1}, ${filter.reference}
        move-result-object p1
    """)
    owner.methods.add(wrapper)
    replaceNativeUiCalls(all.filter { it.references().any { ref -> ref.toString() == renderer.reference } }, renderer.reference, wrapper)
}
