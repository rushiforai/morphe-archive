package app.morphe.patches.iscreen.shared.morphe.com.rockstreamer.iscreen.util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Type
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

object PreferenceUtil {
    override fun toString() = "Lcom/rockstreamer/iscreen/util/PreferenceUtil;"

    object IsVastShowFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isVastShow",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isVastShowPatch =
        bytecodePatch {
            execute {
                IsVastShowFingerprint.matchSingle().method.returnEarly(false)
            }
        }

    object IsBannerAdsShowFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isBannerAdsShow",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isBannerAdsShowPatch =
        bytecodePatch {
            execute {
                IsBannerAdsShowFingerprint.matchSingle().method.returnEarly(false)
            }
        }

    object IsSubscribedFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isSubscribed",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isSubscribedPatch =
        bytecodePatch {
            execute {
                IsSubscribedFingerprint.matchSingle().method.returnEarly(true)
            }
        }

    object IsTVodSubscribedFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isTVodSubscribed",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isTVodSubscribedPatch =
        bytecodePatch {
            execute {
                IsTVodSubscribedFingerprint.matchSingle().method.returnEarly(true)
            }
        }

    object IsLoginFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isLogin",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isLoginPatch =
        bytecodePatch {
            execute {
                IsLoginFingerprint.matchSingle().method.returnEarly(true)
            }
        }
}
