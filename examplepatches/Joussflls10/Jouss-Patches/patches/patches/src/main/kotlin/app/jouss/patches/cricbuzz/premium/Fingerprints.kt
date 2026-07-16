package app.jouss.patches.cricbuzz.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Checks if user has active subscription — gates premium content (live streaming, articles)
object IsSubscribedUserFingerprint : Fingerprint(
    definingClass = "Lcom/cricbuzz/android/data/utils/datastore/SubscriptionManager;",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    strings = listOf("key.user.state", "NA", "ACTIVE", "userState: ", " and isActiveUser: "),
)
