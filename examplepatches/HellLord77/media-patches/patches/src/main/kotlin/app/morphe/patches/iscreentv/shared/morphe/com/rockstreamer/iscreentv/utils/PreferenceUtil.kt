package app.morphe.patches.iscreentv.shared.morphe.com.rockstreamer.iscreentv.utils

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object PreferenceUtil {
    override fun toString() = "Lcom/rockstreamer/iscreentv/utils/PreferenceUtil;"

    object IsTVodSubscribedFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isTVodSubscribed",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    object IsVastShowFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isVastShow",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    object IsSubscribedFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isSubscribed",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    object IsLoginFingerprint :
        Fingerprint(
            definingClass = PreferenceUtil.toString(),
            name = "isLogin",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.boolean,
            parameters = emptyList(),
        )
}
