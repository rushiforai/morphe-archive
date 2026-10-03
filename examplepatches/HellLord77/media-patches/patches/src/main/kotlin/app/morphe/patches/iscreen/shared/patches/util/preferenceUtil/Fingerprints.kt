package app.morphe.patches.iscreen.shared.patches.util.preferenceUtil

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreen/util/PreferenceUtil;",
    name = "isSubscribed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

internal object IsTVodSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreen/util/PreferenceUtil;",
    name = "isTVodSubscribed",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

internal object IsLoginFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreen/util/PreferenceUtil;",
    name = "isLogin",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.boolean,
    parameters = emptyList(),
)

internal object GetRefreshToken : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreen/util/PreferenceUtil;",
    name = "getRefreshToken",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.STRING,
    parameters = emptyList(),
)