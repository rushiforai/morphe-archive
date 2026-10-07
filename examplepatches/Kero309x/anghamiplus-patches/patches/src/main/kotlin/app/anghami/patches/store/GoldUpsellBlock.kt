package app.anghami.patches.store

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Keeps Gold-tier surfaces hidden on builds without a Gold subscription.
 *
 * Gold membership is verified by the backend, so pretending a free account is
 * a Gold account only surfaces rows and badges that immediately fail the
 * server-side check. This patch instead makes every Gold entitlement query
 * report `false` — both the checks on `Account` and the three `GoldUtilsKt`
 * overloads — so Gold upsells and unsupported gated entries disappear rather
 * than render in a broken state. The toggle is separate from the Plus spoof,
 * and is meant to be used next to it on a free account.
 */
@Suppress("unused")
val goldUpsellBlockPatch = bytecodePatch(
    name = "Hide Gold Upsell",
    description = "Hides Gold-tier promotional sections and unsupported server-gated features.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)
    category("Hide Gold features")

    execute {
        IsGoldSignature.method.forceFalse()
        IsGoldUserSignature.method.forceFalse()
        GoldUtilsProfileSignature.method.forceFalse()
        GoldUtilsRankedUserSignature.method.forceFalse()
        GoldUtilsStoryUserSignature.method.forceFalse()
    }
}

/** Matches the static `Account.isGold()` entitlement check. */
object IsGoldSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isGold",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "getBooleanAttribute",
        ),
    )
)

/** Matches the instance-level `Account.isGoldUser()` entitlement check. */
object IsGoldUserSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isGoldUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_GOLD:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "equals",
        ),
    )
)

/** Matches the `GoldUtilsKt.isGold(Profile)` overload. */
object GoldUtilsProfileSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/GoldUtilsKt;",
    name = "isGold",
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/Profile;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lcom/anghami/ghost/pojo/Profile;",
            type = "I",
        ),
    )
)

/** Matches the `GoldUtilsKt.isGold(RankedUser)` overload. */
object GoldUtilsRankedUserSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/GoldUtilsKt;",
    name = "isGold",
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/RankedUser;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_GOLD:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
    )
)

/** Matches the `GoldUtilsKt.isGold(Story.User)` overload. */
object GoldUtilsStoryUserSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/utils/GoldUtilsKt;",
    name = "isGold",
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/stories/Story\$User;"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_GOLD:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
    )
)
