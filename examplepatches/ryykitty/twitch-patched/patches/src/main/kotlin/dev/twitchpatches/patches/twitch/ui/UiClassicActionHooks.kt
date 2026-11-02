package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

internal data class UiClassicActionContract(
    val renderer: Method, val buttons: FieldReference, val following: FieldReference,
    val constructor: MethodReference, val identity: MethodReference,
)

private object ClassicActionStateFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(
        string("Visible(buttons="),
        string(", isViewerFollowing="),
    ),
)

private class ClassicActionRendererFingerprint(concrete: String) : Fingerprint(
    returnType = "V",
    isStatic = true,
    filters = listOf(checkCast(concrete)),
)

private object ClassicBitsModelFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(string("BitsIconButton")),
)

internal fun BytecodePatchContext.resolveClassicActionRow(composer: String, concrete: String): UiClassicActionContract {
    val state = ClassicActionStateFingerprint.originalMethod
    val model = classDefBy(state.definingClass)
    val buttons = model.fields.filter { it.type == "Ljava/util/List;" }.uniqueHook("UI classic action list")
    val following = model.fields.filter { it.type == "Z" }.uniqueHook("UI classic Follow state")
    require(listOf(buttons, following).all { AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
        "UI settings: classic action state fields changed."
    }
    val constructor = model.methods.filter { it.name == "<init>" &&
        it.parameterTypes == listOf("Ljava/util/List;", "Z") && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        .uniqueHook("UI classic action state constructor")
    val renderer = ClassicActionRendererFingerprint(concrete).matchAll().map { it.originalMethod }.filter {
        it.returnType == "V" && it.parameterTypes.size == 7 &&
            it.parameterTypes[0] == model.type && it.parameterTypes[5].toString() == composer &&
            AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueHook("UI classic action row renderer")
    val bits = ClassicBitsModelFingerprint.originalMethod
    val identity = classDefBy(bits.definingClass).methods.filter {
        it.isInstance(emptyList(), "Ljava/lang/String;") && it.hasStrings("bits_button_chat")
    }.uniqueHook("UI classic button identity")
    val base = resolveClassicButtonIdentity(identity, classDefBy(requireNotNull(classDefBy(bits.definingClass).superclass)).methods)
    return UiClassicActionContract(renderer, buttons, following, constructor, base)
}

internal fun resolveClassicButtonIdentity(identity: Method, methods: Iterable<Method>): Method = methods.filter {
    it.name == identity.name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
        AccessFlags.ABSTRACT.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}.uniqueHook("UI classic button identity contract")

internal fun injectClassicActionState(owner: MutableClass, contract: UiClassicActionContract) {
    val bridge = owner.type
    val identity = owner.methods.filter { it.name == "classicButtonId" }.uniqueHook("UI button identity bridge")
    owner.methods.remove(identity)
    owner.methods.add(nativeReloadMethod(bridge, "classicButtonId", listOf("Ljava/lang/Object;"), "Ljava/lang/String;", 2, """
        check-cast p0, ${contract.identity.definingClass}
        invoke-virtual {p0}, ${contract.identity}
        move-result-object v0
        return-object v0
    """, static = true))
    val model = contract.renderer.parameterTypes[0].toString()
    owner.methods.add(nativeReloadMethod(bridge, "filteredClassicModel", listOf(model), model, 4, """
        iget-object v0, p0, ${contract.buttons}
        invoke-static {v0}, Ldev/twitchpatches/extension/ui/UiClassicActions;->filter(Ljava/util/List;)Ljava/util/List;
        move-result-object v1
        if-eq v0, v1, :unchanged
        new-instance v0, $model
        iget-boolean v2, p0, ${contract.following}
        invoke-direct {v0, v1, v2}, ${contract.constructor}
        return-object v0
        :unchanged
        return-object p0
    """, static = true))
    owner.methods.add(nativeReloadMethod(bridge, "classicActionsEmpty", listOf(model), "Z", 2, """
        iget-object v0, p0, ${contract.buttons}
        invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
        move-result v0
        return v0
    """, static = true))
}
