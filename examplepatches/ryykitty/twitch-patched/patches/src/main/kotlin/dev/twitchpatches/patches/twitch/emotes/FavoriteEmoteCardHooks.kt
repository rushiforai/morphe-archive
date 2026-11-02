package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val CARD = "Ldev/twitchpatches/extension/emotes/FavoriteEmoteCard;"
private const val STAR = "twitch_patches_favorite_emote_star"

internal fun insertFavoriteEmoteStar(document: Document) {
    val nodes = document.getElementsByTagName("*")
    val elements = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
    fun element(name: String) = elements.filter { it.getAttribute("android:id") == "@id/$name" }.uniqueHook("emote card $name")
    val name = element("emote_name")
    val subscribeChildren = element("subscribe_button").childNodes
    val subscribeIcon = (0 until subscribeChildren.length).mapNotNull { subscribeChildren.item(it) as? Element }
        .filter { it.tagName == "ImageView" }.uniqueHook("emote card subscribe star")
    val star = subscribeIcon.cloneNode(false) as Element
    listOf("android:contentDescription", "android:layout_marginStart").forEach(star::removeAttribute)
    star.setAttribute("android:id", "@+id/$STAR")
    star.setAttribute("android:visibility", "gone")
    star.setAttribute("android:padding", "@dimen/default_margin")
    star.setAttribute("android:layout_marginEnd", "@dimen/default_margin")
    star.setAttribute("android:background", "?android:attr/selectableItemBackgroundBorderless")
    star.setAttribute("app:layout_constraintEnd_toEndOf", "parent")
    star.setAttribute("app:layout_constraintTop_toTopOf", "@id/emote_icon")
    star.setAttribute("app:layout_constraintBottom_toBottomOf", "@id/emote_icon")
    name.removeAttribute("app:layout_constraintEnd_toEndOf")
    name.setAttribute("app:layout_constraintEnd_toStartOf", "@id/$STAR")
    name.parentNode.insertBefore(star, name)
}

private class EmoteCardModelFingerprint(marker: String, parent: String? = null) : Fingerprint(
    superclass = parent,
    name = "toString",
    strings = listOf(marker),
)

private class EmoteCardRenderFingerprint(state: String) : Fingerprint(
    superclass = "Ltv/twitch/android/core/mvp/viewdelegate/RxViewDelegate;",
    isStatic = false,
    returnType = "V",
    parameters = listOf(state),
)

internal fun BytecodePatchContext.applyFavoriteEmoteCard(bridge: MutableClass) {
    val loaded = EmoteCardModelFingerprint("Loaded(emoteCardUiModel=").originalClassDef
    val channel = EmoteCardModelFingerprint("ChannelEmoteCardModel(emoteId=").originalClassDef
    val generic = EmoteCardModelFingerprint("GenericEmoteCardModel(emoteId=").originalClassDef
    val render = EmoteCardRenderFingerprint(loaded.superclass.orEmpty()).originalMethod
    val channelConstructor = channel.methods.filter { it.name == "<init>" && it.parameterTypes.size == 6 }.uniqueHook("channel emote card constructor")
    val genericConstructor = generic.methods.filter { it.name == "<init>" && it.parameterTypes.size == 4 }.uniqueHook("generic emote card constructor")
    val cardType = channelConstructor.parameterTypes[3].toString()
    fun variant(marker: String) = EmoteCardModelFingerprint(marker, cardType).originalClassDef
    val cardModel = loaded.fields.filter { it.type == channel.superclass }.uniqueHook("emote card state model")
    val channelModel = channelConstructor.parameterTypes[4].toString()
    val channelId = classDefBy(channelModel).methods.filter { it.name == "getTuid" && it.parameterTypes.isEmpty() }.uniqueHook("emote card channel id")
    val readModel = """
        instance-of v0, p0, ${loaded.type}
        if-eqz v0, :none
        check-cast p0, ${loaded.type}
        iget-object v0, p0, $cardModel
    """
    val none = ":none\nconst/4 v0, 0x0\nreturn-object v0"
    fun cardText(name: String, parameter: Int) = replacePickerBridge(bridge, name, 2, """
        $readModel
        instance-of v1, v0, ${channel.type}
        if-eqz v1, :generic
        check-cast v0, ${channel.type}
        iget-object v0, v0, ${pickerParameterField(channelConstructor, parameter)}
        return-object v0
        :generic
        instance-of v1, v0, ${generic.type}
        if-eqz v1, :none
        check-cast v0, ${generic.type}
        iget-object v0, v0, ${pickerParameterField(genericConstructor, parameter)}
        return-object v0
        $none
    """)
    cardText("cardEmoteId", 0)
    cardText("cardEmoteToken", 1)
    replacePickerBridge(bridge, "cardChannel", 1, """
        $readModel
        instance-of v0, v0, ${channel.type}
        if-eqz v0, :none
        iget-object v0, p0, $cardModel
        check-cast v0, ${channel.type}
        iget-object v0, v0, ${pickerParameterField(channelConstructor, 4)}
        invoke-virtual {v0}, ${channelId.reference}
        move-result-object v0
        invoke-virtual {v0}, Ltv/twitch/android/models/Tuid;->toString()Ljava/lang/String;
        move-result-object v0
        return-object v0
        $none
    """)
    replacePickerBridge(bridge, "cardKind", 2, """
        $readModel
        instance-of v1, v0, ${channel.type}
        if-eqz v1, :none
        check-cast v0, ${channel.type}
        iget-object v0, v0, ${pickerParameterField(channelConstructor, 3)}
        instance-of v1, v0, ${variant("Subscriber(tier=").type}
        if-eqz v1, :follower
        const-string v0, "SUBSCRIPTIONS"
        return-object v0
        :follower
        instance-of v1, v0, ${variant("Follower(tier=").type}
        if-eqz v1, :bits
        const-string v0, "FOLLOWER"
        return-object v0
        :bits
        instance-of v1, v0, ${variant("Bits(usageStatus=").type}
        if-eqz v1, :other
        const-string v0, "BITS_BADGE_TIERS"
        return-object v0
        :other
        const-string v0, "OTHER"
        return-object v0
        $none
    """)
    insertFavoriteCardBind(render)
}

private fun BytecodePatchContext.insertFavoriteCardBind(render: Method) {
    val rootView = classDefBy("Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;").fields
        .filter { it.type == "Landroid/view/View;" && AccessFlags.PUBLIC.isSet(it.accessFlags) }.uniqueHook("emote card root view")
    val owner = mutableClassDefBy(render.definingClass)
    val bind = ImmutableMethod(owner.type, "twitchPatchesBindFavoriteRow",
        listOf(owner.type, "Ljava/lang/Object;").map { ImmutableMethodParameter(it, null, null) }, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(3)).toMutable()
    require(owner.methods.none { it.name == bind.name })
    bind.addInstructionsWithLabels(0, """
        iget-object v0, p0, $rootView
        invoke-static {v0, p1}, $CARD->bind(Landroid/view/View;Ljava/lang/Object;)V
        return-void
    """)
    owner.methods.add(bind)
    owner.methods.single { it.reference == render.reference }.addInstructions(0, "invoke-static/range {p0 .. p1}, ${bind.reference}")
}
