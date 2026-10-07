package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Gold-visibility targets (Anghami 8.0.28, verified in Anghami 8.0.28).
 *
 * Rationale: Gold features are server-authorized (planType=Gold, artist
 * badges, live-radio roles). Spoofing isGold=true (as the Kero module does)
 * shows UI that then fails server checks. This patch does the opposite:
 * forces every Gold check to FALSE so Gold-gated rows/badges/entries stay
 * hidden instead of broken. Separate patch so it can be toggled
 * independently of the Plus spoof.
 *
 * - Account.isGold()Z (static, via Account$5 getBooleanAttribute)
 * - Account.isGoldUser()Z (instance, PLAN_TYPE_GOLD compare)
 * - GoldUtilsKt.isGold(Profile|RankedUser|Story$User)Z (3 overloads, each
 *   compares profile planType int against PLAN_TYPE_GOLD getValue())
 */

object IsGoldFingerprint : Fingerprint(
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

object IsGoldUserFingerprint : Fingerprint(
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

object GoldUtilsProfileFingerprint : Fingerprint(
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

object GoldUtilsRankedUserFingerprint : Fingerprint(
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

object GoldUtilsStoryUserFingerprint : Fingerprint(
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
