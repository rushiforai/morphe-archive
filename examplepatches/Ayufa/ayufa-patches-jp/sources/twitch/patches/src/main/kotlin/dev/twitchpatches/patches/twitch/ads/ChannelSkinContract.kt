package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.shared.*

private object ChannelSkinModelFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("ChannelSkin(campaignID=")),
)

private object ChannelSkinRenderContextFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("ChannelSkinRenderContext(hasTurbo=")),
)

private object ShowingModelFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(string("Showing(avatarURL=")),
)

private object ChannelSkinBannerFingerprint : Fingerprint(
    superclass = "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;",
    isStatic = false,
    returnType = "V",
    filters = listOf(methodCall("Landroid/view/ViewGroup;->addView(Landroid/view/View;)V")),
)

private object ChannelSkinHeaderFingerprint : Fingerprint(
    returnType = "V",
    isStatic = false,
    filters = listOf(methodCall(definingClass = "Ltv/twitch/android/feature/channelskins/ChannelSkinsCreatorBrandView;")),
)

private class ChannelSkinHiddenStateFingerprint(
    state: String,
) : Fingerprint(
    superclass = state,
    name = "<clinit>",
    returnType = "V",
)

internal data class ChannelSkinContract(val banner: Method, val hide: Method, val header: Method,
    val hidden: FieldReference)

internal fun BytecodePatchContext.channelSkinContract(): ChannelSkinContract {
    val skin = ChannelSkinModelFingerprint.originalClassDef.type
    val context = ChannelSkinRenderContextFingerprint.originalClassDef.type
    val state = ShowingModelFingerprint.originalClassDef.superclass ?: ""

    val bannerMatches = ChannelSkinBannerFingerprint.matchAllOrNull()
        ?: throw PatchException("Channel sponsorship: no banner candidate matched.")
    val banner = bannerMatches.map { it.originalMethod }.single {
        it.parameterTypes.size == 5 &&
            it.parameterTypes.take(2).map(CharSequence::toString) == listOf(skin, context) &&
            it.parameterTypes.drop(2).distinct().size == 1
    }
    val hide = classDefBy(banner.definingClass).methods.filter {
        it.isInstance(emptyList(), "V") &&
            it.references().any { ref -> ref.toString() == "Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V" }
    }.uniqueHook("native channel sponsorship removal")
    require(banner.references().none { it.toString() == hide.reference }) {
        "Channel sponsorship: rendering now clears the retained banner state."
    }

    val headerMatches = ChannelSkinHeaderFingerprint.matchAllOrNull()
        ?: throw PatchException("Channel sponsorship: no header candidate matched.")
    val header = headerMatches.map { it.originalMethod }.single {
        it.parameterTypes.size == 4 &&
            it.parameterTypes[1].toString() == "Ltv/twitch/android/models/channel/ChannelModel;" &&
            it.parameterTypes.last().toString() == state
    }

    val hiddenClass = ChannelSkinHiddenStateFingerprint(state).originalClassDef
    val hidden = hiddenClass.fields.filter { field ->
        field.type == field.definingClass &&
            AccessFlags.PUBLIC.isSet(field.accessFlags) &&
            AccessFlags.STATIC.isSet(field.accessFlags)
    }.uniqueHook("native hidden channel sponsorship state")

    return ChannelSkinContract(banner, hide, header, hidden)
}
