package app.kanup4m.patches.seven.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// MembershipStatus.isUserMember() — no-arg overload.
// Verified in se.perigee.android.seven 9.25.15 smali/classes5.
object IsUserMemberFingerprint : Fingerprint(
    name = "isUserMember",
    definingClass = "Lcom/perigee/seven/model/purchases/MembershipStatus;",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/perigee/seven/core/database/config/RealmDatabaseConfig;",
            name = "getDefaultRealm"
        )
    )
)

// MembershipStatus.isUserMember(Realm) — Realm overload.
// Verified in se.perigee.android.seven 9.25.15 smali/classes5.
object IsUserMemberRealmFingerprint : Fingerprint(
    name = "isUserMember",
    definingClass = "Lcom/perigee/seven/model/purchases/MembershipStatus;",
    returnType = "Z",
    parameters = listOf("Lio/realm/Realm;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/perigee/seven/core/database/source/dbmanager/SubscriptionPurchaseManager;",
            name = "newInstance"
        )
    )
)
