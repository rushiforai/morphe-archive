package dev.twitchpatches.patches.twitch.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.shared.*

internal data class ChannelSkinContract(val banner: Method, val hide: Method, val header: Method,
    val hidden: FieldReference)

internal fun channelSkinContract(classes: List<ClassDef>): ChannelSkinContract {
    val methods = classes.flatMap { it.methods }
    fun model(label: String) = methods.filter { it.name == "toString" && it.hasStrings(label) }
        .uniqueHook("channel sponsorship $label model").definingClass
    val skin = model("ChannelSkin(campaignID=")
    val context = model("ChannelSkinRenderContext(hasTurbo=")
    val showing = model("Showing(avatarURL=")
    val state = classes.single { it.type == showing }.superclass
    val base = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;"
    val banner = methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            method.returnType == "V" && method.parameterTypes.size == 5 &&
            method.parameterTypes.take(2) == listOf(skin, context) &&
            method.parameterTypes.drop(2).distinct().size == 1 &&
            classes.single { it.type == method.definingClass }.superclass == base &&
            method.references().any { it.toString() == "Landroid/view/ViewGroup;->addView(Landroid/view/View;)V" }
    }.uniqueHook("native channel sponsorship banner")
    val hide = methods.filter { it.definingClass == banner.definingClass && it.isInstance(emptyList(), "V") &&
        it.references().any { ref -> ref.toString() == "Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V" }
    }.uniqueHook("native channel sponsorship removal")
    require(banner.references().none { it.toString() == hide.reference }) {
        "Channel sponsorship: rendering now clears the retained banner state."
    }
    val header = methods.filter { it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.size == 4 &&
        it.parameterTypes[1] == "Ltv/twitch/android/models/channel/ChannelModel;" &&
        it.parameterTypes.last() == state && it.references().any { ref ->
            ref.toString().startsWith("Ltv/twitch/android/feature/channelskins/ChannelSkinsCreatorBrandView;->") }
    }.uniqueHook("native channel sponsorship avatar")
    val hidden = classes.filter { it.superclass == state && it.type != showing }.flatMap { it.fields }.filter {
        it.type == it.definingClass && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
    }.uniqueHook("native hidden channel sponsorship state")
    return ChannelSkinContract(banner, hide, header, hidden)
}
