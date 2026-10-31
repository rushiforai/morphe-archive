package app.badfella.patches.ticktick.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// User.isPro() — primary gate, called in 40+ locations
// Returns proType == 1 || isActiveTeamUser()
object UserIsProFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/data/User;",
    name = "isPro",
    returnType = "Z",
    parameters = listOf()
)

// ProHelper.isPro(User) — static null-safe wrapper
// Returns user != null && (user.isPro() || user.isActiveTeamUser())
object ProHelperIsProFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/helper/pro/ProHelper;",
    name = "isPro",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/ticktick/task/data/User;")
)

// LimitHelper.getLimits(ZZ) — returns Free/Pro/Team limits based on subscription
// z11 ? getLimitsTeam() : z10 ? getLimitsPro() : getLimitsFree()
object GetLimitsFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/helper/LimitHelper;",
    name = "getLimits",
    returnType = "Lcom/ticktick/task/data/Limits;",
    parameters = listOf("Z", "Z"),
    filters = listOf(
        methodCall(definingClass = "Lcom/ticktick/task/helper/LimitHelper;", name = "getLimitsTeam"),
        methodCall(definingClass = "Lcom/ticktick/task/helper/LimitHelper;", name = "getLimitsPro"),
        methodCall(definingClass = "Lcom/ticktick/task/helper/LimitHelper;", name = "getLimitsFree")
    )
)

// SubscriptionInfo.getIsPro() — server billing verification response
object SubscriptionInfoIsProFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/network/sync/payment/model/SubscriptionInfo;",
    name = "getIsPro",
    returnType = "Z",
    parameters = listOf()
)

// SignUserInfo.isPro() — server sync response, sets proType in saveUserStatus()
// Patching this prevents server from resetting pro status back to free
object SignUserInfoIsProFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/network/sync/common/model/SignUserInfo;",
    name = "isPro",
    returnType = "Z",
    parameters = listOf()
)

// TickTickApplicationBase.et() — returns true if installed > 24 hours
object InstallTimeCheckFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/TickTickApplicationBase;",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "firstInstallTime",
            type = "J",
        ),
    )
)

// User.getProTypeForFake() — anti-tamper check, compared with isPro()
object GetProTypeForFakeFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/data/User;",
    name = "getProTypeForFake",
    returnType = "I",
    parameters = listOf()
)
