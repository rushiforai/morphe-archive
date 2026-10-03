package app.morphe.patches.klikk.shared.patches.utils.ioUtils

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object IsUserLoggedInFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/utils/IOUtils;",
    name = "isUserLoggedIn",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.boolean,
    parameters = listOf(Type.CONTEXT),
)

private object HasValidSubscriptionContextFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/utils/IOUtils;",
    name = "hasValidSubscription",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.boolean,
    parameters = listOf(Type.CONTEXT),
)

private object HasValidSubscriptionStringFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/utils/IOUtils;",
    name = "hasValidSubscription",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.boolean,
    parameters = listOf(Type.STRING),
)

internal val HasValidSubscriptionFingerprints =
    listOf(HasValidSubscriptionContextFingerprint, HasValidSubscriptionStringFingerprint)

internal object IsVideoWithinValidityPeriodFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/utils/IOUtils;",
    name = "isVideoWithinValidityPeriod",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.boolean,
    parameters = listOf("Lcom/angel/klikk/Database/DownloadEntity;"),
)

internal object ValidateVideoFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/utils/IOUtils;",
    name = "validateVideo",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.boolean,
    parameters = listOf(
        "Lcom/brightcove/player/model/Video;",
        Type.CONTEXT,
        "Lcom/angel/klikk/Database/Repository;"
    ),
)