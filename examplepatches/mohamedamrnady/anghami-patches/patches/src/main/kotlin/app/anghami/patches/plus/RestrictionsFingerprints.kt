package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Second-layer targets derived from the Kero309x/AnghamiPlus Xposed module
 * (Nov 2025, targets ~8.0.20) after verifying each method still exists in
 * Anghami 8.0.28 smali. Only LIVE targets were ported; see
 * morphe-lab/analysis/AnghamiPlus_hooks.md §4 for everything deliberately left out
 * (hardcoded SID swap, okhttp null-build, universal Object hooks, inverted
 * karaoke-false hooks, PlanType "7" magic constant, stale popupwindow.A hook).
 *
 * Verified signatures in 8.0.28 (see REPORT.md):
 * - PlayQueue.skipLimitReached(Lcom/anghami/ghost/local/Account;)Z (instance)
 * - PlayQueue.queueRestrictionsEnabled()Z (instance)
 * - PlayQueue.getDisableSkipLimit/QueueRestrictions/PlayerRestrictions/DisableAds()Z
 * - DownloadManager.isOnLimitedPlan(Lcom/anghami/ghost/local/Account;)Z (private static,
 *   body is `maxOfflineSongs <= 100 && > 0`, NOT an isPlusUser call)
 * - DownloadManager.assertDownloadLimitReached(Account,I)V /
 *   assertDownloadRestrictions(Account,ILSongDownloadReason;)V (private static, throw)
 * - AdSettings.noAd(Lcom/anghami/ghost/pojo/Song;)Z (public static, via fetch()+getNoAd)
 * - AdSettings.getNoAd(Song)Z (public instance, reads noAd:Z field)
 * - ProtoAccount$Account.getMaxOfflineSongs/Time()I, getEnablePlayerRestrictions()Z,
 *   getCanGoLive()Z (public instance, iget field + return)
 *
 * Note: method name + defining class already pin each target exactly
 * (com.anghami.* is not obfuscated in 8.0.28); instruction filters only
 * guard against accidental cross-matching after app updates.
 */

// --- PlayQueue gates ---

object SkipLimitReachedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "skipLimitReached",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/local/Account;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/System;",
            name = "currentTimeMillis",
        ),
    )
)

object QueueRestrictionsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "queueRestrictionsEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "isPlusUser",
        ),
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "getDisableQueueRestrictions",
        ),
    )
)

object GetDisableSkipLimitFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableSkipLimit",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

object GetDisableQueueRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableQueueRestrictions",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

object GetDisablePlayerRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisablePlayerRestrictions",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

object GetDisableAdsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableAds",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

// --- Download gates ---

object IsOnLimitedPlanFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "isOnLimitedPlan",
    returnType = "Z",
    // 8.0.28 body: `iget maxOfflineSongs; const/16 v0, 0x64; if-gt ...` —
    // matches the "limited plan iff 0 < maxOfflineSongs <= 100" check.
    parameters = listOf("Lcom/anghami/ghost/local/Account;"),
    filters = listOf(
        literal(100),
        opcode(Opcode.RETURN),
    )
)

object AssertDownloadLimitReachedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "assertDownloadLimitReached",
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/local/Account;", "I"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lcom/anghami/ghost/local/Account;",
            type = "I",
        ),
        opcode(Opcode.THROW),
    )
)

object AssertDownloadRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "assertDownloadRestrictions",
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/ghost/local/Account;",
        "I",
        "Lcom/anghami/ghost/objectbox/models/downloads/SongDownloadReason;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "isPlusUser",
        ),
        opcode(Opcode.THROW),
    )
)

// --- Ad gates ---

object NoAdStaticFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
    name = "noAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/Song;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
            name = "fetch",
        ),
        methodCall(
            definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
            name = "getNoAd",
        ),
    )
)

object GetNoAdFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
    name = "getNoAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/Song;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

// --- Server-proto defaults (local interpretation only) ---

object MaxOfflineSongsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getMaxOfflineSongs",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "I",
        ),
    )
)

object MaxOfflineTimeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getMaxOfflineTime",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "I",
        ),
    )
)

object ProtoEnablePlayerRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getEnablePlayerRestrictions",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

object GetCanGoLiveFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getCanGoLive",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)
