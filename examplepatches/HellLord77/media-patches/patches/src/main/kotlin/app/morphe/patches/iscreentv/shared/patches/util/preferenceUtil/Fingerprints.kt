package app.morphe.patches.iscreentv.shared.patches.util.preferenceUtil

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsTVodSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreentv/utils/PreferenceUtil;",
    name = "isTVodSubscribed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

internal object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreentv/utils/PreferenceUtil;",
    name = "isSubscribed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

internal object IsLoginFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreentv/utils/PreferenceUtil;",
    name = "isLogin",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)