package app.template.patches.telegram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// ════════════════════════════════════════════════════════════════════════════════
// Telegram shared fingerprints
// Historical named-class and older obfuscation fingerprints retained for backward compatibility.
// Earlier audit targets include Telegram 13.1.1 build 72371, Telegram Web 13.1.1 build 72379,
// and Plus Messenger 13.1.1.0 build 22621. Current 13.2.2 R8 targets are additive in the current-R8 section below. Earlier descriptors remain separately named legacy
// fingerprints; Constants.kt exposes only the three current APK targets.
// Distinct legacy descriptors remain available where their signatures differ. A descriptor found only
// in a reference table is not considered a patchable method unless a local method body exists.
// Several old UI owners are R8-renamed in these builds; their old named fingerprints stay below
// for compatibility but must not be treated as current verified targets. AccessFlags are
// omitted where APK variants differ.
// ════════════════════════════════════════════════════════════════════════════════

// ─── Premium ──────────────────────────────────────────────────────────────────
// StoriesControllerIsPremiumFingerprint is a legacy named-class candidate: controller return
// descriptors differ across Telegram, Web, and Plus.

val UserConfigIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "isPremium",
    returnType = "Z",
)

val MessagesControllerIsPremiumUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPremiumUser",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)

// Plus Messenger 13.1.1.0: verified update UI method. The core premium and translation
// gates are separately verified in the current Plus APK; this remains an optional UI hook.
val PlusUpdateButtonUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/UpdateButton;",
    name = "update",
    returnType = "V",
    parameters = listOf("Z"),
)

// Plus Messenger 13.2.1.0 build 22678: core update-availability predicate.
// DEX audit confirms gh1.v0(TL_help_appUpdate) stores the pending update and returns true
// only when a newer compatible build is available. This is the semantic gate used by
// Plus update UI; keep it separate from the older UpdateButton view hook.
val PlusR8IsAppUpdateAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/gh1;",
    name = "v0",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"),
)
// Plus update UI also consults gh1.P()Z, which checks the pending update object.
val PlusR8HasPendingAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/gh1;",
    name = "P",
    returnType = "Z",
    parameters = emptyList(),
)


// ─── Premium translation feature gates (Telegram/Web 13.1.1, Plus 13.1.1.0) ──
// Instruction audit: both methods return translations_*_enabled != "disabled".
// Their values are populated from app config; these hooks force the client-side
// feature gates open. Server-side eligibility / translation service responses are
// not changed by this patch.
val MessagesControllerIsTranslationsManualEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isTranslationsManualEnabled",
    returnType = "Z",
    parameters = listOf(),
)

val MessagesControllerIsTranslationsAutoEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isTranslationsAutoEnabled",
    returnType = "Z",
    parameters = listOf(),
)

// ─── Integrity bypass ─────────────────────────────────────────────────────────

val AndroidUtilitiesGetCertFingerprintFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/AndroidUtilities;",
    name = "getCertificateSHA256Fingerprint",
    returnType = "Ljava/lang/String;",
)

val SafetyNetCheckFingerprint = Fingerprint(
    filters = listOf(
        string("basicIntegrity"),
        string("ctsProfileMatch"),
        methodCall(
            definingClass = "Lorg/json/JSONObject;",
            name = "optBoolean",
            returnType = "Z",
        ),
    ),
    // Match the actual boolean reads, not a method that merely logs these words.
    // All three supplied builds have a key const-string immediately followed by
    // JSONObject.optBoolean(String)Z and move-result.
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        val keys = instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.CONST_STRING) return@mapIndexedNotNull null
            val string = (instruction as? ReferenceInstruction)?.reference as? StringReference
            val invoke = instructions.getOrNull(index + 1)
            val methodRef = (invoke as? ReferenceInstruction)?.reference as? MethodReference
            val result = instructions.getOrNull(index + 2)
            if (string?.string in setOf("basicIntegrity", "ctsProfileMatch") &&
                invoke?.opcode == Opcode.INVOKE_VIRTUAL &&
                methodRef != null &&
                methodRef.definingClass == "Lorg/json/JSONObject;" &&
                methodRef.name == "optBoolean" &&
                result?.opcode == Opcode.MOVE_RESULT
            ) string?.string else null
        }
        keys.toSet() == setOf("basicIntegrity", "ctsProfileMatch")
    },
)

// ─── Ads ──────────────────────────────────────────────────────────────────────
// UI ad fingerprints are retained candidates; named-method matches need body/caller validation.

val MessagesControllerIsSponsoredDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSponsoredDisabled",
    returnType = "Z",
)

val MessageObjectIsSponsoredFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSponsored",
    returnType = "Z",
)

val VideoAdsLoadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/video/VideoAds;",
    name = "load",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE),
)

// ─── Auto-update ──────────────────────────────────────────────────────────────
// Legacy UI/update names must not be redirected to obfuscated methods without body-level proof.

val SharedConfigIsAppUpdateAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "isAppUpdateAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

// Web: setNewAppVersionAvailable(TL_help_appUpdate)Z static
// Plus: same sig — both return Z so returnType = "Z" is safe
val SharedConfigSetNewAppVersionAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "setNewAppVersionAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"),
)

val MessagesControllerCheckPromoInfoInternalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkPromoInfoInternal",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf("Z"),
)

// ─── No-forwards controller/message targets ───────────────────────────────────

val MessagesControllerIsChatNoForwardsLongFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val MessagesControllerIsChatNoForwardsChatFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isChatNoForwards",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)

val MessagesControllerIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isPeerNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val CanForwardMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "canForwardMessage",
    returnType = "Z",
    parameters = listOf(),
)

// ─── Channel restriction controller/message targets ───────────────────────────

val GetRestrictionReasonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getRestrictionReason",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)

val MessagesControllerIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSensitive",
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)

val CheckChannelErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkChannelError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J"),
)

val ShowSensitiveContentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showSensitiveContent",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSensitive",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsHiddenSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isHiddenSensitive",
    returnType = "Z",
    parameters = listOf(),
)

val CreateNoAccessAlertFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/AlertsCreator;",
    name = "createNoAccessAlert",
    returnType = "Lorg/telegram/ui/ActionBar/AlertDialog\$Builder;",
)

val LoadFullChatErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    // 12.9.2: private synthetic lambda, params = (TL_error;J)
    // 12.10.0: R8 promoted to public static synthetic, added MessagesController as first param
    // Omit parameters so both generations match.
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "checkChannelError",
        ),
    ),
    // R8 name is unstable — exclude the NotificationCenter variant (GetChannelDiff)
    // by ensuring HashSet.remove is present in the body
    // LoadFullChat lambda calls HashSet.remove; GetChannelDiff calls postNotificationName.
    // This distinguishes the two without relying on unstable R8-generated method names.
    custom = { method, _ ->
        method.implementation?.instructions?.any { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/util/HashSet;" && ref.name == "remove"
        } == true
    },
)

val GetChannelDiffErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    returnType = "V",
    // 12.9.2: private synthetic lambda, params = (TL_error;J)
    // 12.10.0: R8 promoted to public static synthetic; params = (MessagesController;TL_error;J)
    // Omit parameters so both generations match.
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "checkChannelError",
        ),
        methodCall(
            definingClass = "Lorg/telegram/messenger/NotificationCenter;",
            name = "postNotificationName",
        ),
    ),
)

val SetContentSettingsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "setContentSettings",
    returnType = "V",
    parameters = listOf("Z"),
)

// Legacy 13.0.2 four-argument overloads (kept for older APKs): Telegram uses Lfe/e;, Web uses Lie/e;, and Plus uses Ldj/e$c;.
// Each descriptor is confirmed in its corresponding clean APK; the old Plus Lej/e$c; stays legacy-only.
val CheckCanOpenChat4NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lfe/e;",
    ),
)

val CheckCanOpenChat4WebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lie/e;",
    ),
)

val CheckCanOpenChat4Plus1302Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/i2;",
        "Lorg/telegram/messenger/MessageObject;",
        "Ldj/e\$c;",
    ),
)

// Telegram/Web channel-restriction targets. Identical historical/current descriptors are consolidated.
val ShowCantOpenAlertNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/r2;", "Ljava/lang/String;"),
)

val CheckSensitiveNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/r2;", "J", "Ljava/lang/Runnable;", "Ljava/lang/Runnable;"),
)

val CheckCanOpenChat2NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/r2;"),
)

val CheckCanOpenChat3NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/r2;", "Lorg/telegram/messenger/MessageObject;"),
)

val CheckCanOpenChat4NormalCurrentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/r2;", "Lorg/telegram/messenger/MessageObject;", "Lge/e;"),
)

val CheckCanOpenChat4WebCurrentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/r2;", "Lorg/telegram/messenger/MessageObject;", "Lje/e;"),
)


// Plus Messenger descriptor shared by the current and historical builds.
val ShowCantOpenAlertPlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/i2;", "Ljava/lang/String;"),
)


// Plus Messenger descriptor shared by the current and historical builds.
val CheckSensitivePlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/ActionBar/i2;", "J", "Ljava/lang/Runnable;", "Ljava/lang/Runnable;"),
)


// Plus Messenger descriptor shared by the current and historical builds.
val CheckCanOpenChat2PlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/i2;"),
)


// Plus Messenger descriptor shared by the current and historical builds.
val CheckCanOpenChat3PlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/i2;", "Lorg/telegram/messenger/MessageObject;"),
)

// Legacy Plus Messenger 13.0.3.0 build 22608 uses Lej/e$c; for the four-argument overload.
// The older 13.0.2 descriptor Ldj/e$c; is retained separately below.

// Plus Messenger descriptor shared by the current and historical builds.
val CheckCanOpenChat4PlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/i2;", "Lorg/telegram/messenger/MessageObject;", "Lej/e\$c;"),
)

// Telegram 13.0.3 build 71831 changed the standard UI fragment from ActionBar/s2 to ActionBar/r2.
// Telegram Web 13.0.3 build 71839 retains ActionBar/s2 but changed its final callback type from ie/e to je/e.





val CheckCanOpenChat4Web1303Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/s2;", "Lorg/telegram/messenger/MessageObject;", "Lje/e;",
    ),
)


// ─── Anti-delete ──────────────────────────────────────────────────────────────

// Current 13.2.2 Telegram/Web storage deletion worker. The method reads the persisted
// `out` column while resolving IDs and later deletes from messages_v2/messages_topics.
// This is the correct storage-side ownership source for a future update-origin-scoped
// anti-delete filter; it is deliberately not patched globally because this worker is also
// reused by user-initiated/local deletion paths.
val TelegramR8MessagesStorageDeleteWorkerAndroidFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/is;",
    name = "Q0",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("I", "I", "J", "Ljava/util/ArrayList;", "Z"),
    filters = listOf(
        string("SELECT uid, data, read_state, out, mention, mid FROM messages_v2 WHERE mid IN("),
        string("DELETE FROM messages_v2 WHERE mid IN("),
        string("DELETE FROM messages_topics WHERE mid IN("),
    ),
)

val TelegramR8MessagesStorageDeleteWorkerWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ds;",
    name = "Q0",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("I", "I", "J", "Ljava/util/ArrayList;", "Z"),
    filters = listOf(
        string("SELECT uid, data, read_state, out, mention, mid FROM messages_v2 WHERE mid IN("),
        string("DELETE FROM messages_v2 WHERE mid IN("),
        string("DELETE FROM messages_topics WHERE mid IN("),
    ),
)

// Plus Messenger 13.2.1.0 build 22678 uses the equivalent private N7 storage worker.
// It resolves the same `out` column and performs the corresponding message/topic deletes.
val TelegramPlusR8MessagesStorageDeleteWorkerFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/vz0;",
    name = "N7",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "I", "I"),
    filters = listOf(
        string("SELECT uid, data, read_state, out, mention, mid FROM messages_v2 WHERE mid IN(%s) AND uid = %d"),
        string("DELETE FROM messages_v2 WHERE mid IN(%s) AND uid = %d"),
        string("DELETE FROM messages_topics WHERE mid IN(%s) AND uid = %d"),
    ),
)

val MarkMessagesAsDeletedFingerprint1 = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "I", "Z", "Z"),
)

val MarkMessagesAsDeletedFingerprint2 = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesStorage;",
    name = "markMessagesAsDeleted",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I"),
)

// Telegram/Web body signatures are confirmed. The Plus descriptor is reference-level only in
// the supplied APK; omit accessFlags but do not treat this as a confirmed Plus patch target.
val DeleteMessagesByPushFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "deleteMessagesByPush",
    returnType = "V",
    parameters = listOf("J", "Ljava/util/ArrayList;", "J"),
)

// Current Plus Messenger 13.1.1.0 (build 22621) has no locally declared
// deleteMessagesByPush(J, ArrayList, J)V method. The equivalent push-deletion
// worker is the verified synthetic method below: its body schedules a UI runnable,
// calls MessagesStorage.deletePushMessages(J, ArrayList), then
// MessagesStorage.markMessagesAsDeleted(J, ArrayList, Z, Z, I, I). Keep the
// named target above for Telegram/Web and any legacy build where its local body exists; use this exact
// current Plus descriptor only as the Plus fallback.
val MessagesControllerDeletePushMessagesPlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "m3",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "Lorg/telegram/messenger/MessagesController;",
        "Ljava/util/ArrayList;",
        "J",
        "J",
    ),
)


// Telegram and Telegram Web 13.0.2 declare this method locally with Lz/f;.
val NotificationsControllerRemoveDeletedMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/NotificationsController;",
    name = "removeDeletedMessagesFromNotifications",
    returnType = "V",
    parameters = listOf("Lz/f;", "Z"),
)

// Plus Messenger 13.1.1.0 declares the current method locally with Landroidx/collection/k;.
val NotificationsControllerRemoveDeletedMessagesPlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/NotificationsController;",
    name = "removeDeletedMessagesFromNotifications",
    returnType = "V",
    parameters = listOf("Landroidx/collection/k;", "Z"),
)


// Backward-compatible fallback for older Plus builds.
val NotificationsControllerRemoveDeletedMessagesPlusLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/NotificationsController;",
    name = "removeDeletedMessagesFromNotifications",
    returnType = "V",
    parameters = listOf("Landroidx/collection/h;", "Z"),
)

// ─── Anti-disappearing media ──────────────────────────────────────────────────

val IsSecretMediaInstanceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf(),
)

val IsSecretMediaStaticFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretMedia",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

val IsSecretPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSecretPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)

// Static overload (I, Message)Z — present in both Web and Plus.
// Paresh uses this overload. The instance ()Z delegates to this,
// but targeting the static ensures we hit the actual implementation.
val ShouldEncryptPhotoOrVideoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "shouldEncryptPhotoOrVideo",
    returnType = "Z",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$Message;"),
)

val IsVoiceOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoiceOnce",
    returnType = "Z",
)

val IsRoundOnceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isRoundOnce",
    returnType = "Z",
)

// Web: private; Plus: public final. Omit accessFlags.
val SendSecretMediaDeleteFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMediaDelete",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf("Lorg/telegram/messenger/MessageObject;"),
)

val SendSecretMessageReadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "sendSecretMessageRead",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf("Lorg/telegram/messenger/MessageObject;", "Z"),
)

// ─── Download boost ───────────────────────────────────────────────────────────

val FileLoadOperationUpdateParamsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/FileLoadOperation;",
    name = "updateParams",
    returnType = "V",
    parameters = listOf(),
)

// ─── Stories / translate / misc premium UI ────────────────────────────────────

val ApplicationLoaderOnCreateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

val MessagesControllerStoriesEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storiesEnabled",
    returnType = "Z",
)

val MessagesControllerStoryEntitiesAllowedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storyEntitiesAllowed",
    returnType = "Z",
    parameters = listOf(),
)

val MessagesControllerStoryEntitiesAllowedUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "storyEntitiesAllowed",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)

val TranslateControllerIsTranslateDialogHiddenFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/TranslateController;",
    name = "isTranslateDialogHidden",
    returnType = "Z",
    parameters = listOf("J"),
)

val ProfileActivityIsSwipeBackEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ProfileActivity;",
    name = "isSwipeBackEnabled",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

val ChatActivityIsSwipeBackEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "isSwipeBackEnabled",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

val MediaDataControllerLoadPinnedMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MediaDataController;",
    name = "loadPinnedMessages",
    returnType = "V",
    parameters = listOf("J", "I", "I"),
)

// ─── VoiceToMusic ─────────────────────────────────────────────────────────────

val MessageObjectIsVoiceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isVoice",
    returnType = "Z",
    parameters = listOf(),
)

val MessageObjectIsMusicFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isMusic",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessageObject;",
            name = "isMusicMessage",
        ),
    ),
)

// ─── Anti-disappearing media (additional) ────────────────────────────────────

// MessageObject.needDrawBluredPreview()Z — current method body verified in Telegram,
// Telegram Web, and Plus Messenger 13.1.1.0. Retained as a shared direct target.
val MessageObjectNeedDrawBluredPreviewFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "needDrawBluredPreview",
    returnType = "Z",
    parameters = listOf(),
)

// ─── Anti-screenshot notification ─────────────────────────────────────────────

// SendMessagesHelper.sendScreenshotMessage(User,I,Message)V
// Notifies the other user when you screenshot a conversation.
val SendScreenshotMessageUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SendMessagesHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;",
        "I",
        "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)

// SecretChatHelper.sendScreenshotMessage(EncryptedChat,ArrayList,Message)V
val SendScreenshotMessageSecretFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SecretChatHelper;",
    name = "sendScreenshotMessage",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;",
        "Ljava/util/ArrayList;",
        "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)

// ─── Stories hide-read receipt flow: current targets ─────────────────────────
// Instruction sequence verified in Telegram 13.1.1 build 72371, Web 13.1.1 build 72379,
// and Plus Messenger 13.1.1.0 build 22621. Current owner names are isolated from legacy owners.
// Each method accepts (PeerStories, StoryItem, boolean), returns boolean, then calls
// processReadStories(JI)V, constructs TL_stories_readStories, and sends it via sendRequest.
val StoriesReadReceiptFlowFingerprint = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/NotificationsController;",
            name = "processReadStories",
            returnType = "V",
        ),
        methodCall(
            definingClass = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_readStories;",
            name = "<init>",
            returnType = "V",
        ),
        methodCall(
            definingClass = "Lorg/telegram/tgnet/ConnectionsManager;",
            name = "sendRequest",
            returnType = "I",
        ),
    ),
    custom = { method, _ ->
        method.returnType.toString() == "Z" &&
            method.parameterTypes.map { it.toString() } == listOf(
                "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
                "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
                "Z",
            ) &&
            method.definingClass.toString() in setOf(
                "Lug/s5;", // Telegram 13.1.1 build 72371
                "Lxg/o5;", // Telegram Web 13.1.1 build 72379
                "Lorg/telegram/ui/Stories/yc;", // Plus Messenger 13.1.1.0 build 22621
            )
    },
)

// Legacy Stories owners are kept as a separate fingerprint and are not part of the current
// compatibility targets. This avoids silently treating an older obfuscated owner as current.
val StoriesReadReceiptFlowLegacyFingerprint = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/NotificationsController;",
            name = "processReadStories",
            returnType = "V",
        ),
        methodCall(
            definingClass = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_readStories;",
            name = "<init>",
            returnType = "V",
        ),
        methodCall(
            definingClass = "Lorg/telegram/tgnet/ConnectionsManager;",
            name = "sendRequest",
            returnType = "I",
        ),
    ),
    custom = { method, _ ->
        method.returnType.toString() == "Z" &&
            method.parameterTypes.map { it.toString() } == listOf(
                "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
                "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
                "Z",
            ) &&
            method.definingClass.toString() in setOf(
                "Ltg/p5;", // Telegram/Web 13.0.3 legacy owners
                "Lwg/m5;",
                "Lsg/q5;", // Telegram/Web 13.0.2 legacy owners
                "Lvg/o5;",
            )
    },
)

// ─── User no-forwards (missing from original set) ─────────────────────────────

val MessagesControllerIsUserNoForwardsLongFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isUserNoForwards",
    returnType = "Z",
    parameters = listOf("J"),
)

val MessagesControllerIsUserNoForwardsUserFullFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isUserNoForwards",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)

// ─── Premium account count / device class (Killergram) ───────────────────────

val UserConfigGetMaxAccountCountFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "getMaxAccountCount",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val UserConfigHasPremiumOnAccountsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/UserConfig;",
    name = "hasPremiumOnAccounts",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val SharedConfigGetDevicePerformanceClassFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "getDevicePerformanceClass",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

// Plus Messenger 13.1.1.0 current ad-loader owner. The older no-argument signature is
// retained below as a legacy fallback; do not confuse the two method descriptors.
val PlusApplicationLoaderLoadAdsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "loadAds",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lorg/telegram/ui/Cells/m3;",
    ),
)


// Legacy Plus builds used ApplicationLoader.loadAds()V.
val PlusApplicationLoaderLoadAdsLegacyFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "loadAds",
    returnType = "V",
    parameters = emptyList(),
)

// MessagesController.getSponsoredMessages(J) — fetches sponsored msg cache entry
val MessagesControllerGetSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getSponsoredMessages",
    returnType = "Lorg/telegram/messenger/MessagesController\$SponsoredMessagesInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("J"),
)

// ─── Copyright / restriction message bypass ───────────────────────────────────

// MessageObject.updateMessageText() — called at construction and on refresh.
// When getRestrictionReason returns non-null, this sets isRestrictedMessage=true
// and replaces messageText with the copyright string.
// Patching getRestrictionReason→null already prevents this, but patching
// updateMessageText directly gives belt-and-suspenders protection.
val MessageObjectUpdateMessageTextFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "updateMessageText",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

// DialogCell.buildLayout()V — calls getRestrictionReason twice; we use matchAll on the
// getRestrictionReason methodCall filter to find and neutralise both result registers.
val DialogCellBuildLayoutFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Cells/DialogCell;",
    name = "buildLayout",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "getRestrictionReason",
        ),
    ),
)

// DialogCell.updateMessageThumbs()V — also calls getRestrictionReason
val DialogCellUpdateMessageThumbsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Cells/DialogCell;",
    name = "updateMessageThumbs",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/MessagesController;",
            name = "getRestrictionReason",
        ),
    ),
)

// ─── Plus-specific (safe to probe via methodOrNull on non-Plus builds) ────────

// MessagesController.premiumFeaturesBlocked()Z — legacy catalogue entry; current Plus
// MessagesController is present in the 13.0.2.0 APK. Keep this declaration separate from
// active paid-entitlement behavior; signature presence alone does not authorize patching it.
val PremiumFeaturesBlockedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "premiumFeaturesBlocked",
    returnType = "Z",
)

// MessagesController.sendTyping(JJII)Z — Plus-specific signature
val PlusSendTypingFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "sendTyping",
    returnType = "Z",
    parameters = listOf("J", "J", "I", "I"),
)

// ─── Legacy declarations restored from the original catalogue ──────────────────
// Kept to avoid breaking downstream imports. The instruction-level audit found that these old
// named UI/Plus targets are not declared under those names in the supplied 13.0.2 DEX sets.
// Do not wire them into active patches until a body-level replacement is confirmed.

val StoriesControllerIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/StoriesController;",
    name = "isPremium",
    returnType = "Z",
    parameters = listOf("J"),
)

val ChatActivityAddSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "addSponsoredMessages",
    returnType = "V",
    parameters = listOf("Z"),
)

val CheckAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/LaunchActivity;",
    name = "checkAppUpdate",
    returnType = "V",
    parameters = listOf("Z", "Lorg/telegram/messenger/browser/Browser\$Progress;"),
)

val BlockingUpdateViewShowFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/BlockingUpdateView;",
    name = "show",
    returnType = "V",
    parameters = listOf("I", "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;", "Z"),
)

val ChatActivityIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

val ProfileActivityIsPeerNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ProfileActivity;",
    name = "isPeerNoForwards",
    returnType = "Z",
)

val ChatActivityHasSelectedNoforwardsMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "hasSelectedNoforwardsMessage",
    returnType = "Z",
)

val ShowCantOpenAlertFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
)

val CheckSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/BaseFragment;",
        "J",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

val CheckCanOpenChat2Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf("Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/BaseFragment;"),
)

val CheckCanOpenChat3Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/BaseFragment;",
        "Lorg/telegram/messenger/MessageObject;",
    ),
)

val CheckCanOpenChat4Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/BaseFragment;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lorg/telegram/messenger/browser/Browser\$Progress;",
    ),
)

val SecretMediaViewerClosePhotoFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/SecretMediaViewer;",
    name = "closePhoto",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Z", "Z"),
)

val StoriesControllerHasStoriesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/StoriesController;",
    name = "hasStories",
    returnType = "Z",
    parameters = listOf(),
)

val StoriesControllerMarkStoryAsReadFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/StoriesController;",
    name = "markStoryAsRead",
    returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;"),
)

val PeerStoriesViewAllowScreenshotsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/PeerStoriesView\$StoryItemHolder;",
    name = "allowScreenshots",
    returnType = "Z",
)

val ChatPullingDownDrawableGetNextFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatPullingDownDrawable;",
    name = "getNextUnreadDialog",
    returnType = "Lorg/telegram/tgnet/TLRPC\$Dialog;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val ChatPullingDownDrawableDrawBottomPanelFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatPullingDownDrawable;",
    name = "drawBottomPanel",
    returnType = "V",
)

val ChatPullingDownDrawableNeedDrawBottomPanelFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatPullingDownDrawable;",
    name = "needDrawBottomPanel",
    returnType = "Z",
)

val ChatActivityGetSponsoredMessagesCountFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "getSponsoredMessagesCount",
    returnType = "I",
    // Web=private, Plus=public final — omit accessFlags for cross-variant compat
)

val PlusUpdaterCheckAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/update/PlusUpdater;",
    name = "checkAppUpdate",
    returnType = "V",
)

val PlusSettingsIsUpdateEnabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/ActionBar/PlusSettings;",
    name = "isUpdateEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

val AdsControllerAdsDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsController;",
    name = "adsDisabled",
    returnType = "Z",
)

val AdsInstanceLoadAdsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadAds",
    returnType = "V",
)

val AdsInstanceLoadNativeAdFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadNativeAd",
    parameters = listOf(
        "Landroid/content/Context;",
        "Z",
        "Lorg/telegram/plus/ads/AdsInstance\$AdsInstanceInterface;",
    ),
)

val AnalyticsEnableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "enableAnalytics",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
)

val AnalyticsTrackEventFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

val AnalyticsTrackEventMapFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/HashMap;"),
)

// ════════════════════════════════════════════════════════════════════════════════
// Privacy / telemetry fingerprints (merged from the 2026-10-04 instruction audit)
// ════════════════════════════════════════════════════════════════════════════════

/**
 * Instruction-audited privacy/telemetry fingerprints for Telegram/Web 13.1.1
 * and Plus Messenger 13.1.1.0.
 *
 * Telegram/Web do not bundle Firebase Analytics or Crashlytics in their standard
 * DEX files. Their ApplicationLoader App Center entry points are no-op stubs in
 * the audited builds. Plus bundles Firebase Analytics and Crashlytics under the
 * exact descriptors below.
 */

val TelegramPrivacyAppCenterLogFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "appCenterLogInternal",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
)

val TelegramPrivacyAppCenterStartFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "startAppCenterInternal",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

// Plus Messenger 13.1.1.0 build 22621: FirebaseAnalytics.smali.
val TelegramPrivacyFirebaseLogEventFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

val TelegramPrivacyFirebaseSetCollectionFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "b",
    returnType = "V",
    parameters = listOf("Z"),
)

val TelegramPrivacyFirebaseSetUserPropertyFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "c",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

val TelegramPrivacyFirebaseSetCurrentScreenFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setCurrentScreen",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

// Plus Messenger 13.1.1.0: Firebase Crashlytics public wrapper is R8-obfuscated.
// c(Z) forwards collection state, d(String,String) records a custom key, and
// e(String) records a log line. Exact descriptors and forwarding bodies were inspected.
val TelegramPrivacyCrashlyticsSetCollectionFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/a;",
    name = "c",
    returnType = "V",
    parameters = listOf("Z"),
)

val TelegramPrivacyCrashlyticsSetCustomKeyFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/a;",
    name = "d",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

val TelegramPrivacyCrashlyticsLogFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/a;",
    name = "e",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

// ════════════════════════════════════════════════════════════════════════════════
// CURRENT TELEGRAM 13.2.2 R8 FINGERPRINTS (ADDITIVE)
// These exact R8 targets are preferred by revised patches; legacy fingerprints above
// remain available as fallbacks for earlier Telegram/Web/Plus builds.
// Do not delete or rename the legacy declarations when updating current R8 targets.
// ════════════════════════════════════════════════════════════════════════════════

// MessageObject: Telegram Android = mj; Telegram Web = hj; Plus remains named.
private const val MESSAGE_OBJECT_NORMAL = "Lorg/telegram/messenger/mj;"
private const val MESSAGE_OBJECT_WEB = "Lorg/telegram/messenger/hj;"

val TelegramR8MessageObjectIsSecretMediaStaticNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "m4", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)
val TelegramR8MessageObjectIsSecretMediaStaticWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "m4", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)
// Current-build instance classifiers that feed the secret-media expiry/view-once
// path. l4/m5 in Android/Web are structurally matched by A6/T7 in Plus.
val TelegramR8MessageObjectIsSecretMediaInstanceNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "l4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsSecretMediaInstanceWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "l4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsSecretMediaExpiryNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "m5", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsSecretMediaExpiryWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "m5", returnType = "Z", parameters = emptyList(),
)

// Current-build MessageObject predicates retained for anti-disappearing media are
// the static TTL-based secret-media classifier m4(Message) and the two separately
// verified instance-level secret-media/viewer predicates l4()/m5() (Plus A6()/T7()).
// l4/A6 are used to guard the close-time expiry callback; m5/T7 gate viewer eligibility.
// The other
// candidates (n4, S5, h4, T4, n5) were inspected in the supplied 13.2.2 DEX and
// do not represent the labelled predicates: T4 reads voice transcription state;
// S5 reads dialog-bar preferences; n4 checks send/video processing age.
val TelegramR8MessageObjectIsSponsoredNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "s4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsSponsoredWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "s4", returnType = "Z", parameters = emptyList(),
)

// Screenshot notification dispatchers independently verified in the supplied 13.2.2 APKs.
// Android and Web share the owner/name but their MessageObject descriptors differ.
val TelegramR8SendScreenshotNotificationNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/rz;", name = "k0", returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/messenger/mj;", "Z"),
)
val TelegramR8SendScreenshotNotificationWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/rz;", name = "k0", returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/messenger/hj;", "Z"),
)
// Plus 13.2.1.0 uses a dedicated void helper which constructs and sends the
// TL_messages_sendScreenshotNotification request.
val TelegramPlusSendScreenshotNotificationFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pg1;", name = "H4", returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;", "I", "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)


// Plus Messenger 13.2.1.0 (build 22678) independently obfuscated controller/message
// classes. Each target below is tied to the corresponding request or field semantics.
val TelegramPlusR8SendTypingFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Pi", returnType = "Z",
    parameters = listOf("J", "J", "I", "Ljava/lang/String;", "I"),
)
val TelegramPlusR8GetRestrictionReasonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Wd", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramPlusR8IsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Bf", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramPlusR8MessageObjectIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "E6", returnType = "Z",
)
val TelegramPlusR8ShowSensitiveContentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "sj", returnType = "Z",
)
val TelegramPlusR8CheckCanOpenChat4Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "ua", returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/l2;",
        "Lorg/telegram/messenger/x20;", "Lgl/e\$c;",
    ),
)
val TelegramPlusR8IsChatNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Ze", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val TelegramPlusR8CanForwardMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "O", returnType = "Z",
)

// Plus 13.2.1.0 MessageObject secret-media predicates. B6(Message) is the
// static TTL classifier; A6() and T7() are the two instance secret-media/expiry
// gates, structurally matched to Telegram/Web l4() and m5(). C6() is deliberately
// not used: it checks send-state/date/video-processing age rather than media TTL.
val TelegramPlusR8MessageObjectIsSecretMediaStaticFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "B6", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)
val TelegramPlusR8MessageObjectIsSecretMediaInstanceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "A6", returnType = "Z",
)
val TelegramPlusR8MessageObjectIsSecretMediaExpiryFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "T7", returnType = "Z",
)

// SecretMediaViewer close callbacks: Android/Web run SecretMediaViewer.o1 in
// e(ZZ)Z; Plus runs the supplied Runnable in the synthetic close-animation h().
val TelegramR8SecretMediaViewerCloseFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/SecretMediaViewer;", name = "e", returnType = "Z",
    parameters = listOf("Z", "Z"),
)
val TelegramPlusR8SecretMediaViewerCloseFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/SecretMediaViewer;", name = "h", returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/SecretMediaViewer;",
        "Ljava/lang/Runnable;",
        "Lorg/telegram/messenger/x20;",
    ),
)
val TelegramPlusR8UserConfigIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/jm1;", name = "H", returnType = "Z",
)
val TelegramPlusR8MessagesControllerIsPremiumUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "yf", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val TelegramPlusR8UserConfigHasPremiumOnAccountsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/jm1;", name = "D", returnType = "Z",
)
val TelegramPlusR8UserConfigGetMaxAccountCountFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/jm1;", name = "v", returnType = "I",
)
val TelegramPlusR8GetSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "je",
    returnType = "Lorg/telegram/messenger/ko0\$i0;", parameters = listOf("J"),
)
val TelegramPlusR8IsSponsoredDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Df", returnType = "Z",
)

// Plus Messenger 13.2.1.0 Stories read-receipt paths. R1 sends the receipt for
// an explicitly selected story; O1(J)V advances the maximum-read marker and
// sends the receipt when the next unread story is selected.
val TelegramPlusR8StoriesReadReceiptFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/rc;",
    name = "R1",
    returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
        "Z",
    ),
)
val TelegramPlusR8StoriesReadReceiptByDialogFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/rc;",
    name = "O1",
    returnType = "V",
    parameters = listOf("J"),
)

// Stories read receipt senders: wg/f5 (Android) and zg/d5 (Web). Each is
// verified by the TL_stories_readStories request construction and sendRequest
// call in its own current APK; keep them independent to avoid cross-build aliasing.
val TelegramR8StoriesReadReceiptNormalFingerprint = Fingerprint(
    definingClass = "Lwg/f5;", name = "Y", returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
        "Z",
    ),
)
val TelegramR8StoriesReadReceiptWebFingerprint = Fingerprint(
    definingClass = "Lzg/d5;", name = "Y", returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
        "Z",
    ),
)

// Current controller methods: wp; (Android), sp; (Web).
val TelegramR8GetRestrictionReasonNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "F1", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramR8GetRestrictionReasonWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "F1", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramR8IsSensitiveNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "s", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramR8IsSensitiveWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "s", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramR8ShowSensitiveContentNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "T4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8ShowSensitiveContentWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "T4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8CheckCanOpenChat4NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "E", returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/j2;",
        "Lorg/telegram/messenger/mj;", "Lorg/telegram/ui/aj;",
    ),
)
val TelegramR8CheckCanOpenChat4WebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "E", returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/i2;",
        "Lorg/telegram/messenger/hj;", "Lorg/telegram/ui/xi;",
    ),
)
val TelegramR8CheckPromoInfoInternalNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "N", returnType = "V", parameters = listOf("Z"),
)
val TelegramR8CheckPromoInfoInternalWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "N", returnType = "V", parameters = listOf("Z"),
)
val TelegramR8IsChatNoForwardsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "o2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val TelegramR8IsChatNoForwardsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "o2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val TelegramR8IsPeerNoForwardsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "A2", returnType = "Z", parameters = listOf("J"),
)
val TelegramR8IsPeerNoForwardsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "A2", returnType = "Z", parameters = listOf("J"),
)
val TelegramR8CanForwardMessageNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "w", returnType = "Z", parameters = emptyList(),
)
val TelegramR8CanForwardMessageWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "w", returnType = "Z", parameters = emptyList(),
)

// Current shared configuration, user configuration and file-load operation methods.
val TelegramR8IsAppUpdateAvailableWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tz;", name = "s", returnType = "Z", parameters = emptyList(),
)
val TelegramR8FileLoadOperationUpdateParamsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/g7;", name = "t", returnType = "V", parameters = emptyList(),
)
val TelegramR8FileLoadOperationUpdateParamsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/d7;", name = "t", returnType = "V", parameters = emptyList(),
)
// Plus Messenger 13.2.1.0 build 22678: FileLoadOperation equivalent is uc.G0().
// Its body computes chunk size in q, concurrent request limits in s/t, and CDN part cap in v.
val PlusR8FileLoadOperationUpdateParamsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/uc;", name = "G0", returnType = "V", parameters = emptyList(),
)

val TelegramR8MessagesControllerIsSponsoredDisabledNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "E2", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessagesControllerIsSponsoredDisabledWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "E2", returnType = "Z", parameters = emptyList(),
)

// Telegram Android/Web 13.2.2 current-account Premium predicate. The DEX body
// reads UserConfig.currentUser.premium; this is distinct from the controller's
// per-user predicate below and is required for account-level Premium UI/features.
val TelegramR8UserConfigIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/d20;", name = "q", returnType = "Z", parameters = emptyList(),
)

val TelegramR8MessagesControllerIsPremiumUserNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "B2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val TelegramR8MessagesControllerIsPremiumUserWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "B2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val TelegramR8TranslationsManualNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "G2", returnType = "Z", parameters = emptyList(),
)
val TelegramR8TranslationsManualWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "G2", returnType = "Z", parameters = emptyList(),
)
val TelegramR8TranslationsAutoNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "H2", returnType = "Z", parameters = emptyList(),
)
val TelegramR8TranslationsAutoWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "H2", returnType = "Z", parameters = emptyList(),
)
val TelegramR8DevicePerformanceClassNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/uz;", name = "o", returnType = "I", parameters = emptyList(),
)
val TelegramR8DevicePerformanceClassWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tz;", name = "o", returnType = "I", parameters = emptyList(),
)
val TelegramR8IsUserNoForwardsUserFullNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "K2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)
val TelegramR8IsUserNoForwardsUserFullWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "K2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)
val TelegramR8MessageObjectIsSensitiveNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "q4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsSensitiveWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "q4", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsHiddenSensitiveNormalFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_NORMAL, name = "y3", returnType = "Z", parameters = emptyList(),
)
val TelegramR8MessageObjectIsHiddenSensitiveWebFingerprint = Fingerprint(
    definingClass = MESSAGE_OBJECT_WEB, name = "y3", returnType = "Z", parameters = emptyList(),
)
val TelegramR8ShowCantOpenAlertNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "S4", returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/telegram/ui/ActionBar/j2;"),
)
val TelegramR8ShowCantOpenAlertWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "S4", returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/telegram/ui/ActionBar/i2;"),
)

// The current R8 MessagesController.update-array dispatcher. Its two
// delete-update list appends are handled separately from scheduled/ephemeral deletes.
val TelegramR8ProcessUpdateArrayNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "N3", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)
val TelegramR8ProcessUpdateArrayWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "N3", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)



// Telegram Web 13.2.2 build 73039: storage-side normal/private deletion worker.
// Restored verbatim from the earlier telegram-web-antidelete-repair.zip which
// the user confirmed fixed private-chat deletion.
val TelegramWebR8MarkMessagesAsDeletedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ds;",
    name = "P0",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I"),
)

// R8 13.2.2 / Plus 13.2.1 remote-push deletion handler. The owner and method
// signature are stable across the three supplied APKs; the notification-controller
// call inside it is variant-specific and is validated by AntiDeletePatch.
val TelegramR8PushRemoteMessageDeleteFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/PushListenerController;",
    name = "lambda\$processRemoteMessage\$6",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "J"),
)

// Android and Web 13.2.2 receive-content path on the same R8 EditText subclass.
// This is separate from onTextContextMenuItem: AndroidX can deliver rich ClipData
// directly through this method without invoking the context-menu override.

// Plus Messenger 13.2.1.0 AppCompat EditText receive-content callback.
// DEX: androidx.appcompat.widget.l implements Ls0/b0 and receives Ls0/d;.

val TelegramR8SendTypingNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wp;", name = "D4", returnType = "Z",
    parameters = listOf("I", "I", "J", "J", "Ljava/lang/String;"),
)
val TelegramR8SendTypingWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/sp;", name = "D4", returnType = "Z",
    parameters = listOf("I", "I", "J", "J", "Ljava/lang/String;"),
)

// Exact document-level music classifiers for the supplied three APKs.
// These are deliberately separate from MessageObject.isMusic(): the latter is a
// different API and does not accept a TLRPC.Document argument.
val TelegramR8DocumentIsMusicNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mj;", name = "J3", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)
val TelegramR8DocumentIsMusicWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/hj;", name = "J3", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)
val TelegramPlusR8DocumentIsMusicFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/x20;", name = "R5", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)

// The update-array dispatchers are fork/build-specific; do not reuse Android/Web
// owners for Plus Messenger even though the erased parameter list is identical.
val TelegramPlusR8ProcessUpdateArrayFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ko0;", name = "Bh", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)

// Current 13.2.1 computes the certificate hash inline in ConnectionsManager.<init>(I).
val TelegramR8ConnectionManagerCertificateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/tgnet/ConnectionsManager;",
    name = "<init>", returnType = "V", parameters = listOf("I"),
    filters = listOf(
        app.morphe.patcher.methodCall(
            definingClass = "Lorg/telegram/messenger/Utilities;",
            name = "f", returnType = "Ljava/lang/String;",
        ),
    ),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions?.toList() ?: emptyList()
        instructions.indices.any { index ->
            val reference = (instructions[index] as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
            reference?.definingClass == "Lorg/telegram/messenger/Utilities;" &&
                reference.name == "f" && reference.parameterTypes == listOf("[B") &&
                reference.returnType == "Ljava/lang/String;" &&
                instructions.getOrNull(index + 1)?.opcode == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT
        }
    },
)

// Plus Messenger 13.2.1.0 computes the same X.509 DER SHA-256 certificate hash
// in Utilities-adjacent helper m0.g2(). f2() is SHA-1 and must not be patched.
// ConnectionsManager invokes g2() directly while constructing its protocol config.
val TelegramPlusR8CertificateHashFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/m0;",
    name = "g2",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

// Morphe Settings list builders and application startup hooks (Telegram 13.3.1).
// The main settings/profile row builders are v41.f0 (Android) and y41.f0 (Web).
// d51/i51 are unrelated synthetic classes and do not own the row-building method.
val TelegramR8MorpheSettingsRowsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/v41;", name = "f0", returnType = "V",
    parameters = listOf("Lorg/telegram/ui/v41;", "Ljava/util/ArrayList;"),
)
val TelegramR8MorpheSettingsRowsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/y41;", name = "f0", returnType = "V",
    parameters = listOf("Lorg/telegram/ui/y41;", "Ljava/util/ArrayList;"),
)
val TelegramR8ApplicationOnCreateNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/t0;", name = "onCreate", returnType = "V",
    parameters = emptyList(),
)
val TelegramR8ApplicationOnCreateWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/s0;", name = "onCreate", returnType = "V",
    parameters = emptyList(),
)


// Plus Messenger 13.2.2.1 build 22718 — independently mapped current R8 targets.
// The 13.2.1.0 declarations above are intentionally retained unchanged as legacy
// fallbacks. Class names below were confirmed from the seven supplied DEX files.
val TelegramPlus13221R8SendTypingFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Pi", returnType = "Z",
    parameters = listOf("J", "J", "I", "Ljava/lang/String;", "I"),
)
val TelegramPlus13221R8GetRestrictionReasonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Wd", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramPlus13221R8IsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Bf", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val TelegramPlus13221R8MessageObjectIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "E6", returnType = "Z",
)
val TelegramPlus13221R8ShowSensitiveContentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "sj", returnType = "Z",
)
val TelegramPlus13221R8CheckCanOpenChat4Fingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "ua", returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;", "Lorg/telegram/ui/ActionBar/l2;",
        "Lorg/telegram/messenger/z20;", "Lgl/e\$c;",
    ),
)
val TelegramPlus13221R8IsChatNoForwardsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Ze", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val TelegramPlus13221R8CanForwardMessageFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "O", returnType = "Z",
)
val TelegramPlus13221R8MessageObjectIsSecretMediaStaticFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "B6", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Message;"),
)
val TelegramPlus13221R8MessageObjectIsSecretMediaInstanceFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "A6", returnType = "Z",
)
val TelegramPlus13221R8MessageObjectIsSecretMediaExpiryFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "T7", returnType = "Z",
)
val TelegramPlus13221R8SecretMediaViewerCloseFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/SecretMediaViewer;", name = "h", returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/SecretMediaViewer;", "Ljava/lang/Runnable;", "Lorg/telegram/messenger/z20;",
    ),
)
val TelegramPlus13221R8UserConfigIsPremiumFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/lm1;", name = "H", returnType = "Z",
)
val TelegramPlus13221R8MessagesControllerIsPremiumUserFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "yf", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val TelegramPlus13221R8UserConfigHasPremiumOnAccountsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/lm1;", name = "D", returnType = "Z",
)
val TelegramPlus13221R8UserConfigGetMaxAccountCountFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/lm1;", name = "v", returnType = "I",
)
val TelegramPlus13221R8GetSponsoredMessagesFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "je",
    returnType = "Lorg/telegram/messenger/mo0\$i0;", parameters = listOf("J"),
)
val TelegramPlus13221R8IsSponsoredDisabledFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Df", returnType = "Z",
)
val TelegramPlus13221R8StoriesReadReceiptFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/rc;", name = "R1", returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;", "Z",
    ),
)
val TelegramPlus13221R8StoriesReadReceiptByDialogFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Stories/rc;", name = "O1", returnType = "V",
    parameters = listOf("J"),
)
val TelegramPlus13221R8FileLoadOperationUpdateParamsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/wc;", name = "G0", returnType = "V", parameters = emptyList(),
)
val TelegramPlus13221R8IsAppUpdateAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ih1;", name = "v0", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"),
)
val TelegramPlus13221R8HasPendingAppUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ih1;", name = "P", returnType = "Z", parameters = emptyList(),
)
val TelegramPlus13221R8SendScreenshotNotificationFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/rg1;", name = "H4", returnType = "V",
    parameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;", "I", "Lorg/telegram/tgnet/TLRPC\$Message;",
    ),
)
val TelegramPlus13221R8DocumentIsMusicFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/z20;", name = "R5", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)
val TelegramPlus13221R8ProcessUpdateArrayFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/mo0;", name = "Bh", returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)
val TelegramPlus13221R8MessagesStorageDeleteWorkerFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/xz0;", name = "N7", returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "I", "I"),
)
val TelegramPlus13221R8CertificateHashFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/m0;", name = "g2", returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)


val TelegramPlus13221UpdateButtonUpdateFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/Components/UpdateButton;",
    name = "update", returnType = "V", parameters = listOf("Z"),
)

// ─── Telegram / Telegram Web 13.3.1 (builds 73461 / 73469) ─────────────────────
// Independently extracted from the supplied APK DEX files. These are current
// target fingerprints; the pre-13.3.1 R8 and named legacy fingerprints above
// remain separate and are not repurposed.

val Telegram1331ProcessUpdateArrayNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;",
    name = "U3",
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)

val Telegram1331ProcessUpdateArrayWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;",
    name = "U3",
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;", "Z", "I"),
)

val Telegram1331SendScreenshotNotificationNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/nz;",
    name = "k0",
    returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/messenger/jj;", "Z"),
)

val Telegram1331SendScreenshotNotificationWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pz;",
    name = "k0",
    returnType = "Z",
    parameters = listOf("J", "Lorg/telegram/messenger/fj;", "Z"),
)

val Telegram1331SendTypingNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;",
    name = "O4",
    returnType = "Z",
    parameters = listOf("I", "I", "J", "J", "Ljava/lang/String;"),
)

val Telegram1331SendTypingWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;",
    name = "O4",
    returnType = "Z",
    parameters = listOf("I", "I", "J", "J", "Ljava/lang/String;"),
)

val Telegram1331IsChatNoForwardsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "r2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val Telegram1331IsChatNoForwardsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "r2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Chat;"),
)
val Telegram1331IsUserFullNoForwardsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "Q2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)
val Telegram1331IsUserFullNoForwardsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "Q2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;"),
)
val Telegram1331IsPeerNoForwardsNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "G2", returnType = "Z", parameters = listOf("J"),
)
val Telegram1331IsPeerNoForwardsWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "G2", returnType = "Z", parameters = listOf("J"),
)

val Telegram1331GetRestrictionReasonNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "H1", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val Telegram1331GetRestrictionReasonWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "H1", returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)
val Telegram1331ShowSensitiveContentNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "f5", returnType = "Z",
)
val Telegram1331ShowSensitiveContentWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "f5", returnType = "Z",
)
val Telegram1331IsSponsoredDisabledNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "K2", returnType = "Z",
)
val Telegram1331IsSponsoredDisabledWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "K2", returnType = "Z",
)

val Telegram1331PremiumUserNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/tp;", name = "H2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val Telegram1331PremiumUserWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/pp;", name = "H2", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$User;"),
)
val Telegram1331UserConfigPremiumNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/y10;", name = "q", returnType = "Z",
)
val Telegram1331UserConfigPremiumWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/a20;", name = "q", returnType = "Z",
)

val Telegram1331DocumentIsMusicNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/jj;", name = "J3", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)
val Telegram1331DocumentIsMusicWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/fj;", name = "J3", returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$Document;"),
)

val Telegram1331MessageObjectIsSecretMediaNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/jj;", name = "m5", returnType = "Z",
)
val Telegram1331MessageObjectIsSecretMediaWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/fj;", name = "m5", returnType = "Z",
)
val Telegram1331WebMarkMessagesAsDeletedFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/as;",
    name = "P0",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("J", "Ljava/util/ArrayList;", "Z", "Z", "I", "I"),
)

val Telegram1331FileLoadOperationUpdateParamsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/d7;",
    name = "t",
    returnType = "V",
    parameters = emptyList(),
)
val Telegram1331StoriesReadReceiptNormalFingerprint = Fingerprint(
    definingClass = "Lyg/e5;",
    name = "Y",
    returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
        "Z",
    ),
)
val Telegram1331StoriesReadReceiptWebFingerprint = Fingerprint(
    definingClass = "Lbh/b9;",
    name = "Y",
    returnType = "Z",
    parameters = listOf(
        "Lorg/telegram/tgnet/tl/TL_stories\$PeerStories;",
        "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;",
        "Z",
    ),
)
