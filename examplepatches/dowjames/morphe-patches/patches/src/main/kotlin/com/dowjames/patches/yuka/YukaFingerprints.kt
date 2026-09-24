package com.dowjames.patches.yuka

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * Premium state getter: Vi.a.o()Z
 *
 * This is the app's main premium check used across features.
 */
object YukaPremiumStateFingerprint : Fingerprint(
    definingClass = "LVi/a;",
    name = "o",
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Lio/yuka/android/service/user/NewUserService;",
            name = "isLocalPremium",
        )
    )
)

/**
 * Was-premium state getter: Vi.a.l()Ljava/lang/Boolean;
 */
object YukaWasPremiumStateFingerprint : Fingerprint(
    definingClass = "LVi/a;",
    name = "l",
    returnType = "Ljava/lang/Boolean;",
    filters = listOf(
        methodCall(
            definingClass = "Lio/yuka/android/service/user/NewUserService;",
            name = "isLocalWasPremium",
        )
    )
)

/**
 * Premium availability flag: io.yuka.android.premium.b.M()Z
 */
object YukaPremiumAvailableFingerprint : Fingerprint(
    definingClass = "Lio/yuka/android/premium/b;",
    name = "M",
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lio/yuka/android/premium/b;",
        )
    )
)

/**
 * Billing ready flag: io.yuka.android.premium.b.N()Z
 */
object YukaBillingReadyFingerprint : Fingerprint(
    definingClass = "Lio/yuka/android/premium/b;",
    name = "N",
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/lifecycle/G;",
            name = "f",
        )
    )
)

/**
 * Local premium cache: NewUserService.isLocalPremium()Z
 */
object YukaLocalPremiumFingerprint : Fingerprint(
    definingClass = "Lio/yuka/android/service/user/NewUserService;",
    name = "isLocalPremium",
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
        )
    )
)

/**
 * Local was-premium cache: NewUserService.isLocalWasPremium()Ljava/lang/Boolean;
 */
object YukaLocalWasPremiumFingerprint : Fingerprint(
    definingClass = "Lio/yuka/android/service/user/NewUserService;",
    name = "isLocalWasPremium",
    returnType = "Ljava/lang/Boolean;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "contains",
        )
    )
)
