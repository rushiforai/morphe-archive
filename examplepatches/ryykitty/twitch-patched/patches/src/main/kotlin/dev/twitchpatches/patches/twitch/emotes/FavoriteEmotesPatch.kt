package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*
import org.w3c.dom.Element

private const val FAVORITES = "Ldev/twitchpatches/extension/emotes/FavoriteEmotes;"
private const val FAVORITE_PICKER = "Ldev/twitchpatches/extension/emotes/FavoriteEmotePicker;"
private const val FAVORITE_BRIDGE = "Ldev/twitchpatches/extension/emotes/FavoriteEmoteBridge;"
private const val INTEGER_BOX = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"

private object PickerLongClickEventFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("LongClick(emoteView="),
)

private class PickerFooterReducerFingerprint(event: String) : Fingerprint(
    filters = listOf(methodCall(INTEGER_BOX)),
    custom = { method, _ -> method.references().any { (it as? TypeReference)?.type == event } },
)

private val favoriteEmoteResources = resourcePatch {
    execute {
        val public = parseResourceXml(get("res/values/public.xml").readText()).getElementsByTagName("public")
        val symbols = (0 until public.length).map { public.item(it) as Element }
        listOf("drawable" to "ic_subscribe_button_star_empty", "drawable" to "ic_subscribe_button_star_filled",
            "drawable" to "rounded_gray_box_gray_border", "color" to "text_base").forEach { (type, name) ->
            symbols.filter { it.getAttribute("type") == type && it.getAttribute("name") == name }
                .uniqueHook("favorite emote $type/$name")
        }
        document("res/layout/emote_card_dialog.xml").use(::insertFavoriteEmoteStar)
    }
}

@Suppress("unused")
val favoriteEmotesPatch = bytecodePatch(
    name = "Favorite emotes",
    description = "Adds a Favorites section to the emote picker, filled from the picker and from emote cards.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, nativeEmotePickerPatch, reactNativeFavoriteEmotesPatch, favoriteEmoteResources)
    execute {
        val hooks = resolveNativePickerHooks()
        favoriteEmoteBridges(hooks)
        applyFavoriteEmoteCard(mutableClassDefBy(FAVORITE_BRIDGE))
        insertFavoriteLongClick(hooks)
        insertFavoriteFooterTarget(hooks)
        interceptReactNativeLink("twitchPatchesToggleFavoriteEmote", "$FAVORITES->openLink(Ljava/lang/String;)Z")
        generateReactNativeStringDispatch("dispatchFavorites", "TwitchPatchFavorites")
        val application = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods
            .filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }
            .uniqueHook("favorite emote initialization")
        application.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed()
            .forEach { application.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $FAVORITES->initialize(Landroid/app/Application;)V") }
    }
}

private fun BytecodePatchContext.insertFavoriteLongClick(hooks: NativePickerHooks) {
    val event = PickerLongClickEventFingerprint.originalClassDef
    val clicked = classDefBy(hooks.unlocked.definingClass).superclass.orEmpty()
    val constructor = mutableClassDefBy(event.type).methods.filter { it.name == "<init>" &&
        it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", clicked) }
        .uniqueHook("picker long click constructor")
    constructor.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
        constructor.insertAtReturn(it, "invoke-static/range {p1 .. p2}, $FAVORITE_PICKER->longClicked(Landroid/view/View;Ljava/lang/Object;)V")
    }
}

private fun BytecodePatchContext.insertFavoriteFooterTarget(hooks: NativePickerHooks) {
    val reducer = PickerFooterReducerFingerprint(hooks.event.definingClass).method
    val box = reducer.code().withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == INTEGER_BOX }
        .uniqueHook("picker footer scroll target")
    val register = (box.value as FiveRegisterInstruction).registerC
    reducer.replaceInstruction(box.index, "invoke-static {v$register}, $FAVORITE_PICKER->footerTarget(I)Ljava/lang/Integer;")
}

private fun BytecodePatchContext.favoriteEmoteBridges(h: NativePickerHooks) {
    val bridge = mutableClassDefBy(FAVORITE_BRIDGE)
    val locked = resolveLockedEmoteConstructor(h)
    lockedEmoteBridges(bridge, h, locked)
    val unlocked = classDefBy(h.unlocked.definingClass)
    val model = classDefBy(h.model.definingClass)
    val clicked = model.fields.filter { it.type == h.model.parameterTypes[1].toString() }.uniqueHook("picker model emote")
    val input = unlocked.fields.filter { it.type == h.input.definingClass }.uniqueHook("picker emote input")
    val variants = unlocked.fields.filter { it.type == PICKER_LIST }.uniqueHook("picker emote variants")
    val id = pickerParameterField(h.input, 1)
    val header = pickerParameterField(h.section, 0)
    val kind = h.header.references().filterIsInstance<FieldReference>().filter { it.name == "CHANNEL" }
        .uniqueHook("picker section kind").type
    val headerKind = classDefBy(header.type).methods.filter { it.parameterTypes.isEmpty() && it.returnType == kind }
        .uniqueHook("picker header kind")
    replacePickerBridge(bridge, "emoteId", 1, """
        instance-of v0, p0, ${h.unlocked.definingClass}
        if-eqz v0, :locked
        check-cast p0, ${h.unlocked.definingClass}
        iget-object v0, p0, ${input.definingClass}->${input.name}:${input.type}
        iget-object v0, v0, $id
        return-object v0
        :locked
        instance-of v0, p0, ${locked.definingClass}
        if-eqz v0, :other
        check-cast p0, ${locked.definingClass}
        iget-object v0, p0, ${pickerParameterField(locked, 1)}
        return-object v0
        :other
        const/4 v0, 0x0
        return-object v0
    """)
    replacePickerBridge(bridge, "entries", 1, """
        check-cast p0, ${h.section.definingClass}
        iget-object v0, p0, ${h.entries}
        return-object v0
    """)
    replacePickerBridge(bridge, "frequentlyUsed", 2, """
        check-cast p0, ${h.section.definingClass}
        iget-object v0, p0, $header
        invoke-virtual {v0}, ${headerKind.reference}
        move-result-object v0
        sget-object v1, $kind->FREQUENTLY_USED:$kind
        if-ne v0, v1, :other
        const/4 v0, 0x1
        return v0
        :other
        const/4 v0, 0x0
        return v0
    """)
    replacePickerBridge(bridge, "clicked", 1, """
        instance-of v0, p0, ${model.type}
        if-eqz v0, :other
        check-cast p0, ${model.type}
        iget-object v0, p0, ${clicked.definingClass}->${clicked.name}:${clicked.type}
        return-object v0
        :other
        const/4 v0, 0x0
        return-object v0
    """)
    replacePickerBridge(bridge, "hasVariants", 1, """
        instance-of v0, p0, ${h.unlocked.definingClass}
        if-eqz v0, :none
        check-cast p0, ${h.unlocked.definingClass}
        iget-object v0, p0, ${variants.definingClass}->${variants.name}:${variants.type}
        invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
        move-result v0
        if-nez v0, :none
        const/4 v0, 0x1
        return v0
        :none
        const/4 v0, 0x0
        return v0
    """)
}
