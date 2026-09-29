package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Target: Anghami 8.0.28 (versionCode 8000280, package com.anghami)
 *
 * Evidence (base.apk, apktool smali):
 * - Lcom/anghami/ghost/local/Account;->isPlus()Z (static) delegates to
 *   Account$4 -> Account.isPlusUser()Z (instance)
 * - Account.isPlusUser()Z compares Account.planType against
 *   Account$PlanType.PLAN_TYPE_PLUS / PLAN_TYPE_FREE_TRIAL
 * - planType is filled from server proto:
 *   ProtoAccount$Account.getPlanType() -> Account.planType (fillFromProto)
 * - 22 isPlusUser call sites: DownloadManager, PlayQueue, PlayQueueManager,
 *   PlayerService, settings UI, etc.
 * - PlayQueue.canPlayOfflineAndFree()Z currently returns const/4 v0, 0x0
 *
 * These fingerprints use explicit class names because com.anghami.* is NOT
 * obfuscated in 8.0.28 (verified in smali). Re-verify on every version bump.
 */

object IsPlusFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isPlus",
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

object IsPlusUserFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isPlusUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_PLUS:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_FREE_TRIAL:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "equals",
        ),
    )
)

object EnablePlayerRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "enablePlayerRestrictions",
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

object CanPlayOfflineAndFreeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "canPlayOfflineAndFree",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.CONST_4),
        opcode(Opcode.RETURN),
    )
)
