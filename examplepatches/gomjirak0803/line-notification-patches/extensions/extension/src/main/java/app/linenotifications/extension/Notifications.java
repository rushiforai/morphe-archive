package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.service.notification.StatusBarNotification;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import app.linenotifications.extension.core.NotificationPolicy;

/** Called only from the verified native notification publish path. */
public final class Notifications {
    private static final String CHANNEL = "line_notification_patches.silent.v1";
    static final String ACCOUNT = "line_notification_patches.account";
    private static final String ORIGINAL_CHANNEL = "line_notification_patches.orig_channel";
    private static final String BYPASS_ALERTED = "line_notification_patches.bypass_alerted";
    private static final String ESCALATE_ALERT = "line_notification_patches.escalate_alert";
    private static final String HOLD_PENDING = "line_notification_patches.hold_pending";
    private static final String NATIVE_ACTIONS = "line_notification_patches.native_actions";
    private static final String NATIVE_WEARABLE_ACTIONS = "line_notification_patches.native_wearable_actions";
    private static final String ORIG_CONTEXTUAL_ACTIONS = "line_notification_patches.orig_contextual_actions";
    private static final String GENERIC_SUMMARY = "line_notification_patches.generic_summary";
    private static final String SLOT_GEN = "line_notification_patches.slot_gen";
    private static final String SLOT_EPOCH = "line_notification_patches.slot_epoch";
    private static final String WEARABLE_EXTENSIONS = "android.wearable.EXTENSIONS";
    private static final String WEARABLE_ACTIONS = "actions";
    private static final String MESSAGE_TAG = "NOTIFICATION_TAG_MESSAGE";
    private static final String DEBUG_TAG = "LineNotifyPatch";
    private static final long PENDING_HOLD_MS = 1200L;
    private static final long RECENT_ENQUEUE_WINDOW_MS = 3000L;
    private static final int POST_FRESH = 0;
    private static final int POST_FLUSH_IF_READY = 1;
    private static final int POST_FLUSH_FORCE = 2;
    private static final int CANCEL_DONE = 0;
    private static final int CANCEL_FOLLOW_UP = 1;
    private static final int CANCEL_INCOMPLETE = 2;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService REFRESH_WORKER = Executors.newSingleThreadExecutor();
    private static final Map<NotificationPolicy.ChatKey, Runnable> DEFERRED = new HashMap<>();
    private static final Map<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>> PENDING_POSTS = new HashMap<>();
    private static final Map<NotificationPolicy.ChatKey, Runnable> PENDING_TIMEOUTS = new HashMap<>();
    private static final Map<SlotKey, SlotRecord> SLOT_LEDGER = new LinkedHashMap<>();
    private static long processEpoch = newProcessEpoch();
    private static long nextPublishSeq = 0L;
    private static long nextPendingSeq = 0L;
    private Notifications() {}

    private static long newProcessEpoch() {
        long epoch = java.util.UUID.randomUUID().getMostSignificantBits();
        return epoch == 0L ? 1L : epoch;
    }

    private static long monotonicNowMillis() {
        return android.os.SystemClock.uptimeMillis();
    }

    static synchronized void resetProcessEpochForTest() {
        SLOT_LEDGER.clear();
        nextPublishSeq = 0L;
        if (++processEpoch == 0L) processEpoch = 1L;
    }

    static synchronized int slotLedgerSizeForTest() {
        return SLOT_LEDGER.size();
    }

    static void flushWorkerForTest() {
        try {
            REFRESH_WORKER.submit(() -> { }).get(3L, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new AssertionError("Interrupted while flushing Notifications worker", e);
        } catch (Exception e) {
            throw new AssertionError("Failed or timed out flushing Notifications worker", e);
        }
    }

    static void clearRuntimeStateForTest() {
        flushWorkerForTest();
        synchronized (Notifications.class) {
            for (Runnable r : DEFERRED.values()) MAIN.removeCallbacks(r);
            DEFERRED.clear();
            for (Runnable r : PENDING_TIMEOUTS.values()) MAIN.removeCallbacks(r);
            PENDING_TIMEOUTS.clear();
            for (LinkedHashMap<SlotKey, PendingPost> map : PENDING_POSTS.values()) {
                for (PendingPost item : map.values()) item.canceled = true;
            }
            PENDING_POSTS.clear();
            SLOT_LEDGER.clear();
            nextPublishSeq = 0L;
            nextPendingSeq = 0L;
            if (++processEpoch == 0L) processEpoch = 1L;
        }
    }

    private static final class SlotKey {
        final String tag;
        final int id;

        SlotKey(String tag, int id) {
            this.tag = tag;
            this.id = id;
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof SlotKey)) return false;
            SlotKey that = (SlotKey) other;
            return id == that.id && Objects.equals(tag, that.tag);
        }

        @Override public int hashCode() {
            return 31 * (tag == null ? 0 : tag.hashCode()) + id;
        }
    }

    private static final class PendingPost {
        final String account;
        final NotificationManager manager;
        final String tag;
        final int id;
        final Notification original;
        final long deadlineMillis;
        final long enqueuedSeq;
        boolean canceled;

        PendingPost(String account, NotificationManager manager, String tag, int id,
                    Notification original, long deadlineMillis, long enqueuedSeq) {
            this.account = account;
            this.manager = manager;
            this.tag = tag;
            this.id = id;
            this.original = original;
            this.deadlineMillis = deadlineMillis;
            this.enqueuedSeq = enqueuedSeq;
        }
    }

    /** Single bounded non-PII ledger of recent successful notify/cancel operations per slot. */
    private static final class SlotRecord {
        final boolean canceled;
        final String account;
        final String chat;
        final String messageId;
        final String group;
        final boolean summary;
        final boolean regularMessage;
        final long publishSeq;
        final long uptimeMillis;

        SlotRecord(boolean canceled, String account, String chat, String messageId, String group,
                   boolean summary, boolean regularMessage, long publishSeq, long uptimeMillis) {
            this.canceled = canceled;
            this.account = account;
            this.chat = chat;
            this.messageId = messageId;
            this.group = group;
            this.summary = summary;
            this.regularMessage = regularMessage;
            this.publishSeq = publishSeq;
            this.uptimeMillis = uptimeMillis;
        }
    }

    private static final class ActionRewrite {
        final Notification.Action[] actions;
        final Notification.Action[] savedNativeActions;
        final boolean rewriteWearable;
        final ArrayList<Notification.Action> wearableActions;
        final Notification.Action[] savedNativeWearableActions;
        final Boolean savedOrigContextualActions;

        ActionRewrite(Notification.Action[] actions, Notification.Action[] savedNativeActions,
                      boolean rewriteWearable, ArrayList<Notification.Action> wearableActions,
                      Notification.Action[] savedNativeWearableActions, Boolean savedOrigContextualActions) {
            this.actions = actions;
            this.savedNativeActions = savedNativeActions;
            this.rewriteWearable = rewriteWearable;
            this.wearableActions = wearableActions;
            this.savedNativeWearableActions = savedNativeWearableActions;
            this.savedOrigContextualActions = savedOrigContextualActions;
        }
    }

    private enum Outcome { DELIVER, HOLD, DISCARD, CANCEL_SLOT, DEFER_HIDE }

    private static final class TransformResult {
        final Outcome outcome;
        final Notification notification;
        final String account;
        final String chat;
        final boolean summary;
        final boolean scheduleRefresh;
        final boolean readCancel;
        final String readUp;
        final String privacyCancelMessageId;
        final boolean keywordOnlyBypass;
        final String silentSourceChannel;
        final int originalVisibility;

        private TransformResult(Outcome outcome, Notification notification, String account,
                                String chat, boolean summary, boolean scheduleRefresh,
                                boolean readCancel, String readUp, String privacyCancelMessageId,
                                boolean keywordOnlyBypass, String silentSourceChannel, int originalVisibility) {
            this.outcome = outcome;
            this.notification = notification;
            this.account = account;
            this.chat = chat;
            this.summary = summary;
            this.scheduleRefresh = scheduleRefresh;
            this.readCancel = readCancel;
            this.readUp = readUp;
            this.privacyCancelMessageId = privacyCancelMessageId;
            this.keywordOnlyBypass = keywordOnlyBypass;
            this.silentSourceChannel = silentSourceChannel;
            this.originalVisibility = originalVisibility;
        }

        static TransformResult deliver(Notification n, String account, String chat, boolean summary) {
            return new TransformResult(Outcome.DELIVER, n, account, chat, summary, false,
                    false, null, null, false, null, Notification.VISIBILITY_PRIVATE);
        }

        static TransformResult deliver(Notification n, String account, String chat, boolean summary,
                                       boolean scheduleRefresh, boolean keywordOnlyBypass,
                                       String silentSourceChannel, int originalVisibility) {
            return new TransformResult(Outcome.DELIVER, n, account, chat, summary, scheduleRefresh,
                    false, null, null, keywordOnlyBypass, silentSourceChannel, originalVisibility);
        }

        static TransformResult hold(Notification n, String account, String chat, boolean summary,
                                    boolean keywordOnlyBypass, String silentSourceChannel, int originalVisibility) {
            return new TransformResult(Outcome.HOLD, n, account, chat, summary, false,
                    false, null, null, keywordOnlyBypass, silentSourceChannel, originalVisibility);
        }

        static TransformResult discard() {
            return new TransformResult(Outcome.DISCARD, null, null, null, false, false,
                    false, null, null, false, null, Notification.VISIBILITY_PRIVATE);
        }

        static TransformResult cancelSlot(String account, String chat, boolean summary) {
            return new TransformResult(Outcome.CANCEL_SLOT, null, account, chat, summary, false,
                    false, null, null, false, null, Notification.VISIBILITY_PRIVATE);
        }

        static TransformResult cancelPrivacySlot(String account, String chat, boolean summary, String postedMsgId) {
            return new TransformResult(Outcome.CANCEL_SLOT, null, account, chat, summary, false,
                    false, null, postedMsgId, false, null, Notification.VISIBILITY_PRIVATE);
        }

        static TransformResult cancelReadSlot(String account, String chat, boolean summary, String readUp) {
            return new TransformResult(Outcome.CANCEL_SLOT, null, account, chat, summary, false,
                    true, readUp, null, false, null, Notification.VISIBILITY_PRIVATE);
        }

        static TransformResult deferHide(String account, String chat, boolean summary) {
            return new TransformResult(Outcome.DEFER_HIDE, null, account, chat, summary, false,
                    false, null, null, false, null, Notification.VISIBILITY_PRIVATE);
        }
    }

    // Disabled by default; adb can enable this tag for a reproduction. Only fixed stage
    // names are recorded, never room/account IDs, message contents or exception messages.
    private static void trace(String stage) {
        if (android.util.Log.isLoggable(DEBUG_TAG, android.util.Log.DEBUG)) android.util.Log.d(DEBUG_TAG, stage);
    }

    /** Scoped replacement of the two regular-chat presentation mute checks. */
    public static boolean allowMuted(Object manager, String chat) {
        try {
            boolean nativeEnabled = NativeLine.notificationEnabled(manager, chat);
            if (!Settings.enabled(Settings.SILENT) || !NativeLine.regularChat(chat)) {
                trace("mute gate: native policy");
                return nativeEnabled;
            }
            String account = NativeLine.account();
            Settings.ensureAccountReconciled(account, true);
            // Confirmed hidden rooms stop here; in-flight hide transitions continue to post()
            // so messages are invisibly deferred and recovered if the native mute call fails.
            boolean show = !Settings.fullyMuted(account, chat);
            trace(!show ? "mute gate: fully hidden" : nativeEnabled ? "mute gate: normal" : "mute gate: silent allowed");
            return show;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("mute gate: adapter failed");
            return false;
        }
    }

    /** Suppress before the native child + summary pair is posted. */
    public static boolean suppressBuilder(Object nativeBuilder) {
        if (!Settings.enabled(Settings.SILENT)) return false;
        try {
            Bundle extras = (Bundle) NativeLine.field(nativeBuilder, "p");
            if (extras == null) return false;
            String chat = extras.getString("line.chat.id");
            if (!NativeLine.regularChat(chat)) return false;
            String account = NativeLine.account();
            return Settings.fullyMuted(account, chat);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }

    private static SlotRecord freshLedgerLocked(SlotKey key, long now) {
        SlotRecord record = SLOT_LEDGER.get(key);
        if (record == null) return null;
        return (now - record.uptimeMillis) <= RECENT_ENQUEUE_WINDOW_MS ? record : null;
    }

    /** True when a current-process ledger entry is strictly newer than a visible OS notification. */
    private static boolean isVisibleOlderThanLedger(Notification visible, SlotRecord recent) {
        if (recent == null) return false;
        if (visible == null || visible.extras == null) return true;
        if (visible.extras.getLong(SLOT_EPOCH, 0L) != processEpoch) return true;
        return recent.publishSeq > visible.extras.getLong(SLOT_GEN, 0L);
    }

    private static boolean isVisibleMatchingLedger(Notification visible, SlotRecord latest) {
        if (latest == null) return true;
        if (latest.canceled || visible == null || visible.extras == null) return false;
        return visible.extras.getLong(SLOT_EPOCH, 0L) == processEpoch
                && visible.extras.getLong(SLOT_GEN, 0L) == latest.publishSeq;
    }

    private static void putSlotRecordLocked(SlotKey key, SlotRecord record) {
        SLOT_LEDGER.remove(key);
        if (SLOT_LEDGER.size() >= 256) {
            Iterator<Map.Entry<SlotKey, SlotRecord>> it = SLOT_LEDGER.entrySet().iterator();
            while (it.hasNext() && SLOT_LEDGER.size() > 192) {
                if (!hasPendingSlotLocked(it.next().getKey())) it.remove();
            }
            Iterator<Map.Entry<SlotKey, SlotRecord>> strictIt = SLOT_LEDGER.entrySet().iterator();
            while (strictIt.hasNext() && SLOT_LEDGER.size() >= 256) {
                strictIt.next();
                strictIt.remove();
            }
        }
        SLOT_LEDGER.put(key, record);
    }

    /** Only advances publish sequence and ledger AFTER manager.notify() succeeds. */
    private static void deliverToManagerLocked(NotificationManager manager, String tag, int id,
                                               Notification notification, String account,
                                               String chat, boolean regularMessage) {
        long seq = nextPublishSeq + 1L;
        if (notification.extras == null) notification.extras = new Bundle();
        notification.extras.remove(HOLD_PENDING);
        notification.extras.remove(ESCALATE_ALERT);
        notification.extras.putLong(SLOT_EPOCH, processEpoch);
        notification.extras.putLong(SLOT_GEN, seq);
        manager.notify(tag, id, notification);
        nextPublishSeq = seq;
        String msgId = notification.extras.getString("line.message.id");
        boolean isSummary = (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
        putSlotRecordLocked(new SlotKey(tag, id), new SlotRecord(
                false, account, chat, msgId, notification.getGroup(), isSummary,
                regularMessage, seq, monotonicNowMillis()));
    }

    /** Only records cancellation in ledger AFTER manager.cancel() succeeds. */
    private static void cancelOnManagerLocked(NotificationManager manager, String tag, int id) {
        manager.cancel(tag, id);
        long seq = ++nextPublishSeq;
        putSlotRecordLocked(new SlotKey(tag, id), new SlotRecord(
                true, null, null, null, null, false, false, seq, monotonicNowMillis()));
    }

    private static boolean accountStillValid(String expectedAccount) {
        try {
            return NotificationPolicy.sameAccount(expectedAccount, NativeLine.account());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    private static Boolean tryPreviewsAllowed() {
        try {
            return Boolean.valueOf(NativeLine.previewsAllowed());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static boolean isManagedMessage(String tag, Notification original) {
        if (!isMessage(original)) return false;
        NotificationPolicy.Settings settings = Settings.values();
        if (!settings.notTooMuchSilent && !settings.moreChatInfo && !settings.noReply
                && !Settings.silentIncluded() && !Settings.readIncluded() && !Settings.noReplyIncluded()
                && !Settings.hasCustomActions() && !Settings.hasAnySnooze()) {
            return false;
        }
        String chat = original.extras.getString("line.chat.id");
        if (!NativeLine.regularChat(chat) || original.extras.getBoolean("line.square.notification")) {
            return false;
        }
        boolean summary = (original.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
        return summary || MESSAGE_TAG.equals(tag);
    }

    private static boolean isMessageNewerThanBoundary(String messageId, String readUp) {
        if (messageId == null || messageId.isEmpty()) return false;
        try {
            long msg = Long.parseLong(messageId);
            long boundary = (readUp == null || readUp.isEmpty()) ? 0L : Long.parseLong(readUp);
            return msg > boundary;
        } catch (NumberFormatException ignored) {
            return false;
        }
    }

    private static boolean isVerifiedReadAtOrBefore(String messageId, String readUp) {
        if (messageId == null || messageId.isEmpty() || readUp == null || readUp.isEmpty()) return false;
        try {
            long id = Long.parseLong(messageId);
            long boundary = Long.parseLong(readUp);
            return id > 0L && boundary > 0L && id <= boundary;
        } catch (NumberFormatException ignored) {
            return false;
        }
    }

    private static StatusBarNotification findActiveSlot(StatusBarNotification[] active, String tag, int id) {
        if (active == null) return null;
        for (StatusBarNotification sbn : active) {
            if (id == sbn.getId() && Objects.equals(tag, sbn.getTag())) return sbn;
        }
        return null;
    }

    private static boolean hasPendingSlotLocked(SlotKey slotKey) {
        for (LinkedHashMap<SlotKey, PendingPost> map : PENDING_POSTS.values()) {
            PendingPost item = map.get(slotKey);
            if (item != null && !item.canceled) return true;
        }
        return false;
    }

    private static void clearPendingSlotForChatLocked(String account, String chat, SlotKey slotKey,
                                                      boolean readCancel, String readUp,
                                                      String privacyCancelMsgId) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return;
        NotificationPolicy.ChatKey key = new NotificationPolicy.ChatKey(account, chat);
        LinkedHashMap<SlotKey, PendingPost> map = PENDING_POSTS.get(key);
        if (map == null) return;
        PendingPost item = map.get(slotKey);
        if (item == null) return;
        String pendingMsgId = item.original.extras == null ? null : item.original.extras.getString("line.message.id");
        if (readCancel && !isVerifiedReadAtOrBefore(pendingMsgId, readUp)) return;
        if (privacyCancelMsgId != null && isMessageNewerThanBoundary(pendingMsgId, privacyCancelMsgId)) return;
        item.canceled = true;
        map.remove(slotKey);
        if (map.isEmpty()) {
            PENDING_POSTS.remove(key);
            Runnable timeout = PENDING_TIMEOUTS.remove(key);
            if (timeout != null) MAIN.removeCallbacks(timeout);
        }
    }

    public static synchronized void post(NotificationManager manager, String tag, int id, Notification original) {
        postInternal(manager, tag, id, original, POST_FRESH, null, null, null);
    }

    private static boolean postInternal(NotificationManager manager, String tag, int id,
                                        Notification original, int postMode,
                                        String expectedAccount, PendingPost pendingItem,
                                        Set<SlotKey> handledSlots) {
        if (original == null) return true;
        SlotKey slotKey = new SlotKey(tag, id);
        if (postMode != POST_FRESH) {
            if (pendingItem != null && pendingItem.canceled) {
                trace("post: pending dropped on newer slot post");
                return true;
            }
            if (!accountStillValid(expectedAccount)) {
                trace("post: pending dropped without active account");
                return true;
            }
        }
        String chat = original.extras == null ? null : original.extras.getString("line.chat.id");
        boolean managed = (postMode != POST_FRESH) || isManagedMessage(tag, original);
        String requiredAccount = postMode != POST_FRESH ? expectedAccount : null;
        TransformResult result;
        try {
            result = transform(manager, tag, original, managed, requiredAccount);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("transform: adapter failed");
            result = managed ? TransformResult.discard() : TransformResult.deliver(original, null, null, false);
        }
        if (result.outcome == Outcome.DISCARD) {
            trace("post: discarded unverifiable state");
            return true;
        }
        if (postMode != POST_FRESH) {
            if ((pendingItem != null && pendingItem.canceled)
                    || !NotificationPolicy.sameAccount(expectedAccount, result.account)
                    || !accountStillValid(expectedAccount)) {
                trace("post: pending dropped on account change");
                return true;
            }
        }
        if (result.outcome == Outcome.CANCEL_SLOT) {
            clearPendingSlotForChatLocked(result.account, result.chat, slotKey,
                    result.readCancel, result.readUp, result.privacyCancelMessageId);
            trace("post: suppressed");
            cancelVerifiedSlotLocked(manager, tag, id, result.account, result.chat,
                    result.summary, result.readCancel, result.readUp, result.privacyCancelMessageId);
            if (handledSlots != null) handledSlots.add(slotKey);
            return true;
        }
        if (result.outcome == Outcome.DEFER_HIDE) {
            if (postMode == POST_FRESH) {
                deferForInFlightHideLocked(result.account, result.chat, manager, tag, id, original);
                return true;
            }
            trace("post: pending retained while hide in flight");
            return false;
        }
        Notification notification = result.notification;
        if (notification == null) return true;
        if (notification.extras != null) {
            notification.extras.remove(HOLD_PENDING);
            notification.extras.remove(ESCALATE_ALERT);
        }
        if (result.outcome == Outcome.HOLD) {
            if (postMode == POST_FRESH) {
                if (isMessage(original) && NativeLine.regularChat(chat)
                        && result.account != null && !result.account.isEmpty()) {
                    purgeForeignPendingLocked(result.account);
                    removePendingSlotLocked(slotKey);
                    queuePending(new NotificationPolicy.ChatKey(result.account, result.chat),
                            manager, tag, id, original, monotonicNowMillis() + PENDING_HOLD_MS, true);
                    trace("post: held awaiting local save");
                } else {
                    trace("post: pending dropped without active account");
                }
                return true;
            }
            if (postMode == POST_FLUSH_IF_READY) {
                trace("post: still awaiting local save");
                return false;
            }
        }
        String stampedAccount = notification.extras == null ? null : notification.extras.getString(ACCOUNT);
        String notifyChat = notification.extras == null ? chat : notification.extras.getString("line.chat.id");
        boolean isSummary = (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
        if (managed) {
            if (stampedAccount == null || stampedAccount.isEmpty() || !accountStillValid(stampedAccount)) {
                trace("post: dropped without verified active account");
                return true;
            }
            if (postMode != POST_FRESH && !NotificationPolicy.sameAccount(expectedAccount, stampedAccount)) {
                trace("post: pending dropped on account change");
                return true;
            }
            Boolean allowedNow = tryPreviewsAllowed();
            if (allowedNow == null || !accountStillValid(stampedAccount)) {
                trace("post: dropped on privacy/account lookup failure");
                return true;
            }
            if (!allowedNow.booleanValue()) {
                if (result.keywordOnlyBypass) {
                    notification = revokeKeywordOnlyBypass(
                            manager, notification, result.silentSourceChannel, result.originalVisibility);
                    if (notification == null) {
                        trace("post: dropped blocked silent channel on privacy revoke");
                        return true;
                    }
                }
                notification = redactPreview(notification);
                if (notification == null || !accountStillValid(stampedAccount)) return true;
            }
            if (Settings.enabled(Settings.SILENT) && NativeLine.regularChat(notifyChat)) {
                int hideState = ChatNotifications.hideDisposition(stampedAccount, notifyChat);
                if (hideState == ChatNotifications.HIDE_CONFIRMED) {
                    trace("post: suppressed by concurrent hide completion");
                    clearPendingSlotForChatLocked(stampedAccount, notifyChat, slotKey, false, null, null);
                    cancelVerifiedSlotLocked(manager, tag, id, stampedAccount, notifyChat, isSummary, false, null, null);
                    if (handledSlots != null) handledSlots.add(slotKey);
                    return true;
                }
                if (hideState == ChatNotifications.HIDE_IN_FLIGHT) {
                    trace("post: deferred by concurrent hide start");
                    if (postMode == POST_FRESH) {
                        deferForInFlightHideLocked(stampedAccount, notifyChat, manager, tag, id, original);
                        return true;
                    }
                    return false;
                }
            }
            if (!accountStillValid(stampedAccount)) {
                trace("post: dropped on final account check");
                return true;
            }
        }
        boolean regularMsg = isMessage(notification) && notification.extras != null
                && NativeLine.regularChat(notifyChat)
                && !notification.extras.getBoolean("line.square.notification");
        deliverToManagerLocked(manager, tag, id, notification, stampedAccount, notifyChat, regularMsg);
        if (postMode == POST_FRESH) {
            removePendingSlotLocked(slotKey);
        } else if (pendingItem != null) {
            invalidateOlderPendingOnSlotLocked(slotKey, pendingItem);
        }
        if (handledSlots != null) handledSlots.add(slotKey);
        trace("post: delivered to Android");
        if (stampedAccount != null && (result.scheduleRefresh || isMessage(notification)) && notifyChat != null) {
            deferRefresh(stampedAccount, notifyChat);
        }
        return true;
    }

    private static void deferForInFlightHideLocked(String account, String chat, NotificationManager manager,
                                                   String tag, int id, Notification original) {
        if (isMessage(original) && NativeLine.regularChat(chat) && account != null && !account.isEmpty()) {
            purgeForeignPendingLocked(account);
            clearPendingSlotForChatLocked(account, chat, new SlotKey(tag, id), false, null, null);
            queuePending(new NotificationPolicy.ChatKey(account, chat),
                    manager, tag, id, original, monotonicNowMillis() + PENDING_HOLD_MS, false);
            trace("post: held while hide in flight");
        }
    }

    private static void schedulePrivacyRefresh() {
        MAIN.postDelayed(Notifications::refreshActivePreviews, 250L);
    }

    private static void redactVerifiedActiveSlotLocked(NotificationManager manager, StatusBarNotification sbn,
                                                       Notification visible, String account, String chat,
                                                       boolean isSummary) {
        if (manager == null || sbn == null || visible == null || !accountStillValid(account)) return;
        Boolean allowedNow = tryPreviewsAllowed();
        if (allowedNow == null || allowedNow.booleanValue() || !accountStillValid(account)) return;
        SlotKey slotKey = new SlotKey(sbn.getTag(), sbn.getId());
        long observedSeq = visible.extras == null ? 0L : visible.extras.getLong(SLOT_GEN, 0L);
        long observedEpoch = visible.extras == null ? 0L : visible.extras.getLong(SLOT_EPOCH, 0L);
        String observedMsgId = visible.extras == null ? null : visible.extras.getString("line.message.id");
        Notification redacted = redactPreview(visible);
        if (redacted == null) return;
        if (redacted.extras == null) redacted.extras = new Bundle();
        redacted.extras.remove(HOLD_PENDING);
        redacted.extras.remove(ESCALATE_ALERT);
        redacted.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
        StatusBarNotification current = findActiveSlot(manager.getActiveNotifications(), sbn.getTag(), sbn.getId());
        if (current == null || !sbn.getKey().equals(current.getKey()) || sbn.getPostTime() != current.getPostTime()) {
            return;
        }
        Notification cn = current.getNotification();
        if (cn == null || cn.extras == null
                || !Objects.equals(observedMsgId, cn.extras.getString("line.message.id"))
                || observedSeq != cn.extras.getLong(SLOT_GEN, 0L)
                || observedEpoch != cn.extras.getLong(SLOT_EPOCH, 0L)
                || !isVisibleMatchingLedger(visible, freshLedgerLocked(slotKey, monotonicNowMillis()))
                || !accountStillValid(account)) {
            return;
        }
        Boolean allowedCommit = tryPreviewsAllowed();
        if (allowedCommit == null || allowedCommit.booleanValue() || !accountStillValid(account)) return;
        boolean regularMsg = isMessage(redacted) && NativeLine.regularChat(chat)
                && !redacted.extras.getBoolean("line.square.notification");
        deliverToManagerLocked(manager, sbn.getTag(), sbn.getId(), redacted, account, chat, regularMsg);
        trace("privacy: redacted newer active slot in place");
    }

    private static void cancelVerifiedSlotLocked(NotificationManager manager, String tag, int id,
                                                 String account, String chat, boolean isSummary,
                                                 boolean readCancel, String readUp,
                                                 String privacyCancelMsgId) {
        if (manager == null || !accountStillValid(account) || !NativeLine.regularChat(chat)) return;
        StatusBarNotification[] active = manager.getActiveNotifications();
        if (!accountStillValid(account)) return;
        long now = monotonicNowMillis();
        SlotKey slotKey = new SlotKey(tag, id);
        SlotRecord recent = freshLedgerLocked(slotKey, now);

        if (!isSummary) {
            StatusBarNotification current = findActiveSlot(active, tag, id);
            if (current != null) {
                Notification cn = current.getNotification();
                if (isVisibleOlderThanLedger(cn, recent)) {
                    if (recent.canceled || recent.summary
                            || !NotificationPolicy.sameAccount(account, recent.account)
                            || !chat.equals(recent.chat)) {
                        return;
                    }
                    if (readCancel && !isVerifiedReadAtOrBefore(recent.messageId, readUp)) return;
                    if (privacyCancelMsgId != null && isMessageNewerThanBoundary(recent.messageId, privacyCancelMsgId)) {
                        schedulePrivacyRefresh();
                        return;
                    }
                } else {
                    String cAccount = cn == null || cn.extras == null ? null : cn.extras.getString(ACCOUNT);
                    String cChat = cn == null || cn.extras == null ? null : cn.extras.getString("line.chat.id");
                    String cMsgId = cn == null || cn.extras == null ? null : cn.extras.getString("line.message.id");
                    boolean cSummary = cn != null && (cn.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
                    if (cSummary || !NotificationPolicy.sameAccount(account, cAccount) || !chat.equals(cChat)) return;
                    if (readCancel && !isVerifiedReadAtOrBefore(cMsgId, readUp)) return;
                    if (privacyCancelMsgId != null && isMessageNewerThanBoundary(cMsgId, privacyCancelMsgId)) {
                        redactVerifiedActiveSlotLocked(manager, current, cn, account, chat, false);
                        return;
                    }
                }
            } else {
                if (recent == null || recent.canceled || recent.summary
                        || !NotificationPolicy.sameAccount(account, recent.account)
                        || !chat.equals(recent.chat)) {
                    return;
                }
                if (readCancel && !isVerifiedReadAtOrBefore(recent.messageId, readUp)) return;
                if (privacyCancelMsgId != null && isMessageNewerThanBoundary(recent.messageId, privacyCancelMsgId)) {
                    schedulePrivacyRefresh();
                    return;
                }
            }
            if (!accountStillValid(account)) return;
            cancelOnManagerLocked(manager, tag, id);
            return;
        }

        StatusBarNotification summarySbn = findActiveSlot(active, tag, id);
        if (summarySbn == null) {
            if (recent == null || recent.canceled || !recent.summary
                    || !NotificationPolicy.sameAccount(account, recent.account)) {
                return;
            }
            if (recent.chat != null && !chat.equals(recent.chat)) return;
            if (readCancel && !isVerifiedReadAtOrBefore(recent.messageId, readUp)) return;
            if (privacyCancelMsgId != null && isMessageNewerThanBoundary(recent.messageId, privacyCancelMsgId)) {
                schedulePrivacyRefresh();
                return;
            }
            if (recent.group == null) {
                if (chat.equals(recent.chat) && accountStillValid(account)) {
                    cancelOnManagerLocked(manager, tag, id);
                }
                return;
            }
            List<NotificationPolicy.ActiveChild> remainingInfo = new ArrayList<>();
            collectRemainingGroupChildrenLocked(
                    active, recent.group, account, Collections.emptySet(), Collections.singleton(chat),
                    readCancel, readUp, remainingInfo);
            if (NotificationPolicy.resolveGroupSummary(account, remainingInfo) == NotificationPolicy.SummaryAction.CANCEL
                    && accountStillValid(account)) {
                cancelOnManagerLocked(manager, tag, id);
            }
            return;
        }

        Notification summary = summarySbn.getNotification();
        if (summary == null || summary.extras == null || (summary.flags & Notification.FLAG_GROUP_SUMMARY) == 0) return;
        boolean recentFresher = isVisibleOlderThanLedger(summary, recent);
        if (recentFresher && recent.canceled) return;
        String summaryAccount = recentFresher ? recent.account : summary.extras.getString(ACCOUNT);
        if (!NotificationPolicy.sameAccount(account, summaryAccount)) return;
        String summaryChat = recentFresher ? recent.chat : summary.extras.getString("line.chat.id");
        String summaryMsgId = recentFresher ? recent.messageId : summary.extras.getString("line.message.id");
        if (summaryChat != null && !chat.equals(summaryChat)) return;
        if (readCancel && !isVerifiedReadAtOrBefore(summaryMsgId, readUp)) return;
        if (privacyCancelMsgId != null && isMessageNewerThanBoundary(summaryMsgId, privacyCancelMsgId)) {
            if (recentFresher) schedulePrivacyRefresh();
            else if (chat.equals(summaryChat)) redactVerifiedActiveSlotLocked(manager, summarySbn, summary, account, chat, true);
            return;
        }

        String group = recentFresher ? recent.group : summary.getGroup();
        if (group == null) {
            if (chat.equals(summaryChat) && accountStillValid(account)) {
                cancelOnManagerLocked(manager, tag, id);
            }
            return;
        }
        List<NotificationPolicy.ActiveChild> remainingInfo = new ArrayList<>();
        StatusBarNotification latestRemaining = collectRemainingGroupChildrenLocked(
                active, group, account, Collections.emptySet(), Collections.singleton(chat),
                readCancel, readUp, remainingInfo);
        NotificationPolicy.SummaryAction action = NotificationPolicy.resolveGroupSummary(account, remainingInfo);
        if (action == NotificationPolicy.SummaryAction.CANCEL) {
            if (accountStillValid(account)) cancelOnManagerLocked(manager, tag, id);
        } else if (!recentFresher && (chat.equals(summaryChat) || isGenericSummary(summary))) {
            rebuildSummaryWithoutCanceledChat(manager, summarySbn, summary, account, null, action, latestRemaining);
        }
    }

    /**
     * Collects remaining non-summary group children from active Android notifications and fresh
     * ledger entries. During READ cancellation, only children verified at-or-before readUp are excluded.
     */
    private static StatusBarNotification collectRemainingGroupChildrenLocked(
            StatusBarNotification[] active, String group, String account,
            Set<String> canceledKeys, Set<String> targetChats,
            boolean readCancel, String readUp,
            List<NotificationPolicy.ActiveChild> outRemaining) {
        StatusBarNotification latestRemaining = null;
        long now = monotonicNowMillis();
        Map<SlotKey, Long> visibleCurrentEpochSeqs = new HashMap<>();
        if (active != null) {
            for (StatusBarNotification candidate : active) {
                Notification child = candidate.getNotification();
                if (child == null || (child.flags & Notification.FLAG_GROUP_SUMMARY) != 0) continue;
                SlotKey cKey = new SlotKey(candidate.getTag(), candidate.getId());
                if (child.extras != null && child.extras.getLong(SLOT_EPOCH, 0L) == processEpoch) {
                    visibleCurrentEpochSeqs.put(cKey, Long.valueOf(child.extras.getLong(SLOT_GEN, 0L)));
                }
                if (canceledKeys.contains(candidate.getKey())) continue;

                SlotRecord recent = freshLedgerLocked(cKey, now);
                boolean useRecent = isVisibleOlderThanLedger(child, recent);
                if (useRecent && recent.canceled) continue;
                String childGroup = useRecent ? recent.group : child.getGroup();
                if (!group.equals(childGroup)) continue;

                String childAccount = useRecent ? recent.account
                        : (child.extras == null ? null : child.extras.getString(ACCOUNT));
                String childChat = useRecent ? recent.chat
                        : (child.extras == null ? null : child.extras.getString("line.chat.id"));
                String childMsgId = useRecent ? recent.messageId
                        : (child.extras == null ? null : child.extras.getString("line.message.id"));
                if (shouldExcludeChild(account, targetChats, readCancel, readUp, childAccount, childChat, childMsgId)) {
                    continue;
                }
                boolean regular = useRecent ? recent.regularMessage
                        : (isMessage(child) && child.extras != null
                                && NativeLine.regularChat(childChat)
                                && !child.extras.getBoolean("line.square.notification"));
                outRemaining.add(new NotificationPolicy.ActiveChild(childAccount, childChat, regular));
                if (!useRecent && (latestRemaining == null || candidate.getPostTime() > latestRemaining.getPostTime())) {
                    latestRemaining = candidate;
                }
            }
        }
        for (Map.Entry<SlotKey, SlotRecord> entry : SLOT_LEDGER.entrySet()) {
            SlotRecord d = entry.getValue();
            if (d.canceled || d.summary || !group.equals(d.group)) continue;
            if ((now - d.uptimeMillis) > RECENT_ENQUEUE_WINDOW_MS) continue;
            Long visible = visibleCurrentEpochSeqs.get(entry.getKey());
            if (visible != null && visible.longValue() >= d.publishSeq) continue;
            if (shouldExcludeChild(account, targetChats, readCancel, readUp, d.account, d.chat, d.messageId)) {
                continue;
            }
            outRemaining.add(new NotificationPolicy.ActiveChild(d.account, d.chat, d.regularMessage));
        }
        return latestRemaining;
    }

    private static boolean shouldExcludeChild(String account, Set<String> targetChats,
                                              boolean readCancel, String readUp,
                                              String childAccount, String childChat, String childMsgId) {
        if (targetChats == null || childChat == null || !targetChats.contains(childChat)
                || !NotificationPolicy.sameAccount(account, childAccount)) {
            return false;
        }
        return !readCancel || isVerifiedReadAtOrBefore(childMsgId, readUp);
    }

    private static void removePendingSlotLocked(SlotKey slotKey) {
        Iterator<Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>>> it =
                PENDING_POSTS.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>> entry = it.next();
            LinkedHashMap<SlotKey, PendingPost> map = entry.getValue();
            PendingPost removed = map.remove(slotKey);
            if (removed != null) removed.canceled = true;
            if (map.isEmpty()) {
                it.remove();
                Runnable timeout = PENDING_TIMEOUTS.remove(entry.getKey());
                if (timeout != null) MAIN.removeCallbacks(timeout);
            }
        }
    }

    private static void clearPendingChatLocked(String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return;
        NotificationPolicy.ChatKey key = new NotificationPolicy.ChatKey(account, chat);
        LinkedHashMap<SlotKey, PendingPost> removed = PENDING_POSTS.remove(key);
        if (removed != null) {
            for (PendingPost item : removed.values()) item.canceled = true;
        }
        Runnable timeout = PENDING_TIMEOUTS.remove(key);
        if (timeout != null) MAIN.removeCallbacks(timeout);
    }

    private static void purgeForeignPendingLocked(String activeAccount) {
        if (activeAccount == null || activeAccount.isEmpty() || PENDING_POSTS.isEmpty()) return;
        Iterator<Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>>> it =
                PENDING_POSTS.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>> entry = it.next();
            if (!NotificationPolicy.sameAccount(entry.getKey().accountId, activeAccount)) {
                for (PendingPost item : entry.getValue().values()) item.canceled = true;
                it.remove();
                Runnable timeout = PENDING_TIMEOUTS.remove(entry.getKey());
                if (timeout != null) MAIN.removeCallbacks(timeout);
            }
        }
    }

    private static void invalidateOlderPendingOnSlotLocked(SlotKey slotKey, PendingPost delivered) {
        Iterator<Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>>> it =
                PENDING_POSTS.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<NotificationPolicy.ChatKey, LinkedHashMap<SlotKey, PendingPost>> entry = it.next();
            LinkedHashMap<SlotKey, PendingPost> map = entry.getValue();
            PendingPost existing = map.get(slotKey);
            if (existing != null && existing != delivered && existing.enqueuedSeq < delivered.enqueuedSeq) {
                existing.canceled = true;
                map.remove(slotKey);
                if (map.isEmpty()) {
                    it.remove();
                    Runnable timeout = PENDING_TIMEOUTS.remove(entry.getKey());
                    if (timeout != null) MAIN.removeCallbacks(timeout);
                }
            }
        }
    }

    private static void queuePending(NotificationPolicy.ChatKey key, NotificationManager manager,
                                     String tag, int id, Notification original,
                                     long deadlineMillis, boolean scheduleTimer) {
        LinkedHashMap<SlotKey, PendingPost> map = PENDING_POSTS.get(key);
        if (map == null) {
            map = new LinkedHashMap<>();
            PENDING_POSTS.put(key, map);
        }
        SlotKey slotKey = new SlotKey(tag, id);
        PendingPost old = map.put(slotKey,
                new PendingPost(key.accountId, manager, tag, id, original, deadlineMillis, ++nextPendingSeq));
        if (old != null) old.canceled = true;
        if (scheduleTimer && !PENDING_TIMEOUTS.containsKey(key)) {
            long delay = NotificationPolicy.remainingHoldMillis(
                    earliestDeadline(map.values()), monotonicNowMillis(), PENDING_HOLD_MS);
            schedulePendingTimeoutLocked(key, Math.max(1L, delay));
        }
    }

    private static long earliestDeadline(java.util.Collection<PendingPost> items) {
        long earliest = Long.MAX_VALUE;
        for (PendingPost item : items) {
            if (!item.canceled && item.deadlineMillis < earliest) earliest = item.deadlineMillis;
        }
        return earliest;
    }

    private static void schedulePendingTimeoutLocked(NotificationPolicy.ChatKey key, long delayMillis) {
        Runnable timeout = new Runnable() {
            @Override public void run() {
                REFRESH_WORKER.execute(() -> {
                    synchronized (Notifications.class) {
                        if (PENDING_TIMEOUTS.get(key) != this) return;
                        PENDING_TIMEOUTS.remove(key);
                        flushPendingLocked(key, true);
                    }
                });
            }
        };
        PENDING_TIMEOUTS.put(key, timeout);
        MAIN.postDelayed(timeout, Math.max(1L, delayMillis));
    }

    private static Set<SlotKey> flushPendingLocked(NotificationPolicy.ChatKey key, boolean timedOut) {
        Runnable timeout = PENDING_TIMEOUTS.remove(key);
        if (timeout != null) MAIN.removeCallbacks(timeout);
        LinkedHashMap<SlotKey, PendingPost> map = PENDING_POSTS.get(key);
        if (map == null || map.isEmpty()) return Collections.emptySet();
        String currentAccount;
        try {
            currentAccount = NativeLine.account();
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            clearPendingChatLocked(key.accountId, key.chatId);
            trace("post: pending dropped without active account");
            return Collections.emptySet();
        }
        if (!NotificationPolicy.sameAccount(key.accountId, currentAccount)) {
            clearPendingChatLocked(key.accountId, key.chatId);
            trace("post: pending dropped on account change");
            return Collections.emptySet();
        }
        if (ChatNotifications.isHideInFlight(key.accountId, key.chatId)) {
            trace("post: pending deferred while hide in flight");
            return Collections.emptySet();
        }
        Set<SlotKey> handledSlots = new HashSet<>();
        List<Map.Entry<SlotKey, PendingPost>> snapshot = new ArrayList<>(map.entrySet());
        for (Map.Entry<SlotKey, PendingPost> entry : snapshot) {
            SlotKey slotKey = entry.getKey();
            PendingPost item = entry.getValue();
            if (item.canceled || !NotificationPolicy.sameAccount(item.account, currentAccount)) {
                if (map.get(slotKey) == item) map.remove(slotKey);
                continue;
            }
            long left = NotificationPolicy.remainingHoldMillis(
                    item.deadlineMillis, monotonicNowMillis(), PENDING_HOLD_MS);
            int mode = left <= 0L ? POST_FLUSH_FORCE : POST_FLUSH_IF_READY;
            boolean handled;
            try {
                handled = postInternal(item.manager, item.tag, item.id, item.original, mode,
                        item.account, item, handledSlots);
            } catch (RuntimeException ignored) {
                trace("post: pending item failed during flush");
                handled = left <= 0L;
            }
            if ((handled || item.canceled) && map.get(slotKey) == item) {
                map.remove(slotKey);
            }
        }
        if (map.isEmpty()) {
            PENDING_POSTS.remove(key);
            trace(timedOut ? "post: pending timeout flushed" : "post: flushed after local save");
        } else {
            if (!ChatNotifications.isHideInFlight(key.accountId, key.chatId)) {
                long delay = NotificationPolicy.remainingHoldMillis(
                        earliestDeadline(map.values()), monotonicNowMillis(), PENDING_HOLD_MS);
                schedulePendingTimeoutLocked(key, Math.max(1L, delay));
            }
            trace(timedOut ? "post: pending partial timeout flushed" : "post: pending retained after unrelated save");
        }
        return handledSlots;
    }

    static synchronized void clearPendingChat(String account, String chat) {
        clearPendingChatLocked(account, chat);
    }

    static void reconcileAccountAsync(String account) {
        if (account == null || account.isEmpty()) return;
        REFRESH_WORKER.execute(() -> Settings.runAccountReconcile(account));
    }

    static void onHideCompletedAsync(NotificationManager manager, String account, String chat, Runnable afterCleanup) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) {
            if (afterCleanup != null) afterCleanup.run();
            return;
        }
        REFRESH_WORKER.execute(() -> {
            boolean needsFollowUp = false;
            try {
                synchronized (Notifications.class) {
                    if (ChatNotifications.hideDisposition(account, chat) != ChatNotifications.HIDE_CONFIRMED) {
                        trace("hide: cleanup skipped after mode change");
                    } else if (accountStillValid(account)) {
                        int status = cancelChatNotificationsLocked(manager, account, Collections.singleton(chat));
                        if (status == CANCEL_INCOMPLETE) {
                            Settings.markNeedsReconcile(account);
                        } else if (status == CANCEL_FOLLOW_UP) {
                            needsFollowUp = true;
                        }
                    } else {
                        clearPendingChatLocked(account, chat);
                        Settings.markNeedsReconcile(account);
                    }
                }
            } catch (RuntimeException ignored) {
                if (ChatNotifications.hideDisposition(account, chat) == ChatNotifications.HIDE_CONFIRMED) {
                    Settings.markNeedsReconcile(account);
                }
            } finally {
                if (afterCleanup != null) afterCleanup.run();
            }
            if (needsFollowUp) {
                MAIN.postDelayed(() -> REFRESH_WORKER.execute(() -> {
                    try {
                        synchronized (Notifications.class) {
                            if (ChatNotifications.hideDisposition(account, chat) != ChatNotifications.HIDE_CONFIRMED) {
                                return;
                            }
                            if (accountStillValid(account)) {
                                int followStatus = cancelChatNotificationsLocked(manager, account, Collections.singleton(chat));
                                if (followStatus != CANCEL_DONE) {
                                    Settings.markNeedsReconcile(account);
                                }
                            } else {
                                clearPendingChatLocked(account, chat);
                                Settings.markNeedsReconcile(account);
                            }
                        }
                    } catch (RuntimeException ignored) {
                        if (ChatNotifications.hideDisposition(account, chat) == ChatNotifications.HIDE_CONFIRMED) {
                            Settings.markNeedsReconcile(account);
                        }
                    }
                }), 250L);
            }
        });
    }

    static void onHideAborted(String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return;
        REFRESH_WORKER.execute(() -> {
            synchronized (Notifications.class) {
                if (!accountStillValid(account)) {
                    clearPendingChatLocked(account, chat);
                    return;
                }
                Set<SlotKey> flushed = flushPendingLocked(new NotificationPolicy.ChatKey(account, chat), false);
                if (needsPostSaveRefresh()) {
                    refreshActive(account, chat, false, flushed);
                }
                trace("hide: aborted, pending re-evaluated");
            }
        });
    }

    private static boolean silentBypassActive() {
        return Settings.enabled(Settings.SILENT)
                && (Settings.enabled(Settings.MENTION_BYPASS) || Settings.keywordBypassActive());
    }

    private static boolean needsPostSaveRefresh() {
        return Settings.enabled(Settings.INFO) || Settings.readActionActive() || silentBypassActive();
    }

    /** Native save completion only: flush held posts and refresh active notifications. */
    public static synchronized void onMessageStored(String chat) {
        if (!NativeLine.regularChat(chat)) return;
        String account;
        try {
            account = NativeLine.account();
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            NativeLine.invalidateChatListPreviewCache(null, chat);
            trace("local save: pending flush skipped without active account");
            return;
        }
        NativeLine.invalidateChatListPreviewCache(account, chat);
        Settings.ensureAccountReconciled(account, false);
        purgeForeignPendingLocked(account);
        Set<SlotKey> flushedSlots = flushPendingLocked(new NotificationPolicy.ChatKey(account, chat), false);
        if (!needsPostSaveRefresh() || !accountStillValid(account)) return;
        refreshActive(account, chat, false, flushedSlots);
        deferRefresh(account, chat);
    }

    /**
     * Coalesces each room's burst into one trailing refresh of still-active notifications,
     * bound to the original account that posted or saved the message.
     */
    private static void deferRefresh(String account, String chat) {
        if (!needsPostSaveRefresh() || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return;
        NotificationPolicy.ChatKey key = new NotificationPolicy.ChatKey(account, chat);
        Runnable callback = new Runnable() {
            @Override public void run() {
                REFRESH_WORKER.execute(() -> {
                    synchronized (Notifications.class) {
                        if (DEFERRED.get(key) != this) return;
                        DEFERRED.remove(key);
                        try {
                            if (!needsPostSaveRefresh() || !key.accountId.equals(NativeLine.account())) return;
                            refreshActive(key.accountId, key.chatId, false, null);
                            trace("local save: trailing refresh completed");
                        } catch (ReflectiveOperationException | RuntimeException ignored) {
                            trace("local save: trailing refresh unavailable");
                        }
                    }
                });
            }
        };
        Runnable previous = DEFERRED.put(key, callback);
        if (previous != null) MAIN.removeCallbacks(previous);
        MAIN.postDelayed(callback, 400);
    }

    /** Switching action settings updates only actions, without changing quiet/hidden-room state. */
    static synchronized void refreshReadActions() { refreshActive(null, null, true, null); }

    static void refreshActivePreviews() {
        REFRESH_WORKER.execute(() -> {
            synchronized (Notifications.class) {
                refreshActive(null, null, false, null);
            }
        });
    }

    private static void refreshActive(String expectedAccount, String chat, boolean actionsOnly, Set<SlotKey> skipSlots) {
        try {
            String account = NativeLine.account();
            if (expectedAccount != null && !NotificationPolicy.sameAccount(expectedAccount, account)) return;
            NotificationManager manager = Settings.context().getSystemService(NotificationManager.class);
            long now = monotonicNowMillis();
            for (StatusBarNotification active : manager.getActiveNotifications()) {
                Notification original = active.getNotification();
                if (!isMessage(original) || (chat != null && !chat.equals(original.extras.getString("line.chat.id")))
                        || !account.equals(original.extras.getString(ACCOUNT))) continue;
                String activeChat = original.extras.getString("line.chat.id");
                if (!NativeLine.regularChat(activeChat) || original.extras.getBoolean("line.square.notification")) continue;
                SlotKey slotKey = new SlotKey(active.getTag(), active.getId());
                if (skipSlots != null && skipSlots.contains(slotKey)) {
                    trace("local save: refresh skipped for flushed slot");
                    continue;
                }
                if (ChatNotifications.isHideInFlight(account, activeChat)) {
                    trace("local save: refresh skipped while hide in flight");
                    continue;
                }
                SlotRecord latest = freshLedgerLocked(slotKey, now);
                long observedSeq = original.extras.getLong(SLOT_GEN, 0L);
                long observedEpoch = original.extras.getLong(SLOT_EPOCH, 0L);
                if (!isVisibleMatchingLedger(original, latest)) {
                    trace("local save: refresh skipped for stale active snapshot");
                    continue;
                }
                Boolean allowedNow = tryPreviewsAllowed();
                if (allowedNow == null) continue;
                boolean hasPending = hasPendingSlotLocked(slotKey);
                if (hasPending && allowedNow.booleanValue()) {
                    trace("local save: refresh skipped for pending slot");
                    continue;
                }
                boolean isSummary = (original.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
                TransformResult res;
                try {
                    if (hasPending) {
                        // Privacy turned OFF while a newer push is held pending: redact in place without touching PENDING_POSTS.
                        Notification redacted = redactPreview(original);
                        res = redacted == null ? TransformResult.discard()
                                : TransformResult.deliver(redacted, account, activeChat, isSummary);
                    } else if (actionsOnly || (!isSummary && !silentBypassActive()
                            && (!Settings.enabled(Settings.INFO) || !allowedNow.booleanValue()))) {
                        if (!isSummary && !MESSAGE_TAG.equals(active.getTag())) continue;
                        if (isSummary && allowedNow.booleanValue() && !Settings.enabled(Settings.NO_REPLY)
                                && !original.extras.containsKey(ORIG_CONTEXTUAL_ACTIONS)) continue;
                        Notification base = cloneWithoutManagedExtras(original);
                        Notification.Builder builder = Notification.Builder.recoverBuilder(Settings.context(), base);
                        ActionRewrite rewrite = computeActions(builder, original, account, activeChat, isSummary);
                        Notification actionUpdated = finalizeNotification(builder.build(), account,
                                original.extras.getString(ORIGINAL_CHANNEL),
                                original.extras.getString(BYPASS_ALERTED), false, rewrite,
                                !allowedNow.booleanValue());
                        res = TransformResult.deliver(actionUpdated, account, activeChat, isSummary);
                    } else {
                        res = transform(manager, active.getTag(), original, true, account);
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    continue;
                }
                if (res.outcome == Outcome.DEFER_HIDE || res.outcome == Outcome.HOLD) {
                    continue;
                }
                if (res.outcome == Outcome.DISCARD) {
                    if (allowedNow.booleanValue()) continue;
                    Notification redacted = redactPreview(original);
                    if (redacted == null) continue;
                    res = TransformResult.deliver(redacted, account, activeChat, isSummary);
                }
                boolean stillActive = false;
                for (StatusBarNotification current : manager.getActiveNotifications()) {
                    if (active.getKey().equals(current.getKey()) && active.getPostTime() == current.getPostTime()
                            && Objects.equals(original.extras.getString("line.message.id"),
                                current.getNotification().extras.getString("line.message.id"))
                            && observedSeq == current.getNotification().extras.getLong(SLOT_GEN, 0L)
                            && observedEpoch == current.getNotification().extras.getLong(SLOT_EPOCH, 0L)) {
                        stillActive = true;
                        break;
                    }
                }
                SlotRecord latestNow = freshLedgerLocked(slotKey, monotonicNowMillis());
                if (!stillActive || !accountStillValid(account) || !isVisibleMatchingLedger(original, latestNow)) {
                    continue;
                }
                if (res.outcome == Outcome.CANCEL_SLOT) {
                    if (hasPending || (hasPendingSlotLocked(slotKey) && res.privacyCancelMessageId == null)) continue;
                    cancelVerifiedSlotLocked(manager, active.getTag(), active.getId(), account, activeChat,
                            isSummary, res.readCancel, res.readUp, res.privacyCancelMessageId);
                    trace("local save: active notification refreshed");
                    continue;
                }
                if (!hasPending && hasPendingSlotLocked(slotKey)) continue;
                Notification updated = res.notification;
                if (updated == null) continue;
                Boolean allowedCommit = tryPreviewsAllowed();
                if (allowedCommit == null || !accountStillValid(account)) continue;
                if (!allowedCommit.booleanValue()) {
                    if (res.keywordOnlyBypass) {
                        updated = revokeKeywordOnlyBypass(
                                manager, updated, res.silentSourceChannel, res.originalVisibility);
                        if (updated == null) continue;
                    }
                    updated = redactPreview(updated);
                    if (updated == null || !accountStillValid(account)) continue;
                }
                if (Settings.enabled(Settings.SILENT)) {
                    int hideState = ChatNotifications.hideDisposition(account, activeChat);
                    if (hideState == ChatNotifications.HIDE_IN_FLIGHT) continue;
                    if (hideState == ChatNotifications.HIDE_CONFIRMED) {
                        cancelVerifiedSlotLocked(manager, active.getTag(), active.getId(), account, activeChat, isSummary, false, null, null);
                        trace("local save: active notification refreshed");
                        continue;
                    }
                }
                boolean escalate = updated.extras != null && updated.extras.getBoolean(ESCALATE_ALERT, false);
                if (updated.extras == null) updated.extras = new Bundle();
                updated.extras.remove(HOLD_PENDING);
                updated.extras.remove(ESCALATE_ALERT);
                if (escalate) updated.flags &= ~Notification.FLAG_ONLY_ALERT_ONCE;
                else updated.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
                if (!accountStillValid(account)) continue;
                deliverToManagerLocked(manager, active.getTag(), active.getId(), updated, account, activeChat, true);
                if (!hasPending && res.scheduleRefresh) deferRefresh(account, activeChat);
                trace("local save: active notification refreshed");
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            trace("local save: refresh unavailable");
        }
    }

    private static boolean isMessage(Notification n) {
        return n.extras != null && n.extras.getString("line.chat.id") != null
                && (n.flags & (Notification.FLAG_FOREGROUND_SERVICE | Notification.FLAG_ONGOING_EVENT)) == 0;
    }

    private static boolean isGenericSummary(Notification n) {
        return n != null && n.extras != null && n.extras.getBoolean(GENERIC_SUMMARY, false)
                && (n.flags & Notification.FLAG_GROUP_SUMMARY) != 0
                && (n.flags & (Notification.FLAG_FOREGROUND_SERVICE | Notification.FLAG_ONGOING_EVENT)) == 0;
    }

    private static PendingIntent genericSummaryContentIntent() {
        try {
            Context ctx = Settings.context();
            Intent launch = ctx.getPackageManager().getLaunchIntentForPackage(ctx.getPackageName());
            if (launch == null) return null;
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            return PendingIntent.getActivity(ctx, 0, launch,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    private static Notification cloneWithoutManagedExtras(Notification original) {
        Notification base = original.clone();
        base.extras = original.extras == null ? new Bundle() : new Bundle(original.extras);
        base.extras.remove(GENERIC_SUMMARY);
        base.extras.remove(HOLD_PENDING);
        base.extras.remove(ESCALATE_ALERT);
        base.extras.remove(NATIVE_ACTIONS);
        base.extras.remove(NATIVE_WEARABLE_ACTIONS);
        base.extras.remove(ORIG_CONTEXTUAL_ACTIONS);
        base.extras.remove(ACCOUNT);
        base.extras.remove(ORIGINAL_CHANNEL);
        base.extras.remove(BYPASS_ALERTED);
        base.extras.remove(SLOT_GEN);
        base.extras.remove(SLOT_EPOCH);
        return base;
    }

    private static Notification finalizeNotification(Notification built, String account, String originalChannel,
                                                     String bypassAlerted, boolean escalateAlert,
                                                     ActionRewrite rewrite, boolean redact) {
        stampManagedExtras(built, account, originalChannel, bypassAlerted, escalateAlert);
        applyFinalActions(built, rewrite);
        return redact ? redactPreview(built) : built;
    }

    private static TransformResult transform(NotificationManager manager, String tag, Notification original,
                                             boolean managed, String expectedAccount)
            throws ReflectiveOperationException {
        if (!managed) return TransformResult.deliver(original, null, null, false);
        NotificationPolicy.Settings settings = Settings.values();
        String chat = original.extras.getString("line.chat.id");
        boolean summary = (original.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
        String account = NativeLine.account();
        if (expectedAccount != null && !NotificationPolicy.sameAccount(expectedAccount, account)) {
            return TransformResult.discard();
        }
        String postedAccount = original.extras.getString(ACCOUNT);
        if (postedAccount != null && !account.equals(postedAccount)) {
            return TransformResult.discard();
        }
        Settings.ensureAccountReconciled(account, false);
        if (settings.notTooMuchSilent) {
            int hideState = ChatNotifications.hideDisposition(account, chat);
            if (hideState == ChatNotifications.HIDE_IN_FLIGHT) return TransformResult.deferHide(account, chat, summary);
            if (hideState == ChatNotifications.HIDE_CONFIRMED) return TransformResult.cancelSlot(account, chat, summary);
        }
        boolean previewAllowed = NativeLine.previewsAllowed();
        String originalChannel = original.extras.getString(ORIGINAL_CHANNEL);
        if (originalChannel == null && !CHANNEL.equals(original.getChannelId())) {
            originalChannel = original.getChannelId();
        }
        String posted = original.extras.getString("line.message.id");
        boolean snoozed = Settings.isSnoozed(account, chat);
        boolean muted = (settings.notTooMuchSilent
                && (Settings.quiet(account, chat) || ChatNotifications.isQuietInFlight(account, chat) || NativeLine.muted(chat)))
                || snoozed;
        String silentSourceChannel = originalChannel != null ? originalChannel : original.getChannelId();
        NativeLine.BypassMatch bypass = NativeLine.BypassMatch.NONE;
        if (muted) {
            Boolean allowedBeforeBypass = tryPreviewsAllowed();
            if (allowedBeforeBypass == null) return TransformResult.discard();
            previewAllowed = allowedBeforeBypass.booleanValue();
            List<String> keywords = previewAllowed && Settings.enabled(Settings.KEYWORD_BYPASS)
                    ? Settings.keywords() : Collections.emptyList();
            bypass = NativeLine.checkSilentBypass(chat, account, posted,
                    Settings.enabled(Settings.MENTION_BYPASS), keywords);
        }
        boolean keywordOnlyBypass = false;
        Notification base = cloneWithoutManagedExtras(original);
        Notification.Builder builder = Notification.Builder.recoverBuilder(Settings.context(), base);
        Bundle extras = new Bundle(base.extras);
        extras.putString(ACCOUNT, account);
        if (originalChannel != null) extras.putString(ORIGINAL_CHANNEL, originalChannel);
        String bypassAlertedValue = original.extras.getString(BYPASS_ALERTED);
        boolean escalateAlert = false;
        if (bypass.matched()) {
            muted = false;
            keywordOnlyBypass = bypass.keyword && !bypass.mention;
            if (posted != null && !posted.equals(bypassAlertedValue)) {
                bypassAlertedValue = posted;
                extras.putString(BYPASS_ALERTED, posted);
                if (CHANNEL.equals(original.getChannelId()) && originalChannel != null) {
                    builder.setChannelId(originalChannel).setOnlyAlertOnce(false);
                    extras.putBoolean(ESCALATE_ALERT, true);
                    escalateAlert = true;
                }
            }
            trace(bypass.mention && bypass.keyword ? "silent: bypassed for @mention and keyword"
                    : bypass.mention ? "silent: bypassed for @mention"
                    : "silent: bypassed for keyword");
        } else if (bypassAlertedValue != null) {
            extras.putString(BYPASS_ALERTED, bypassAlertedValue);
        }
        builder.setExtras(extras);
        if (muted) {
            NotificationChannel source = manager.getNotificationChannel(silentSourceChannel);
            if (source == null || source.getImportance() == NotificationManager.IMPORTANCE_NONE) {
                trace("silent: source channel unavailable or blocked");
                return TransformResult.discard();
            }
            if (source.getGroup() != null && manager.getNotificationChannelGroup(source.getGroup()) != null
                    && manager.getNotificationChannelGroup(source.getGroup()).isBlocked()) {
                return TransformResult.discard();
            }
            int channelVisibility = source.getLockscreenVisibility();
            if (channelVisibility == Notification.VISIBILITY_SECRET || channelVisibility == Notification.VISIBILITY_PRIVATE) {
                builder.setVisibility(Math.min(original.visibility, channelVisibility));
            }
            silent(manager, builder);
            trace(snoozed ? "silent: snoozed 1h" : "silent: channel applied");
        }

        boolean singleRoom = !summary || !hasOtherRoom(manager, original, account, chat);
        if (summary && (settings.notTooMuchSilent || snoozed)) {
            boolean nativePreview = singleRoom && previewAllowed;
            String newMessage = Strings.get("line_notify_new_message", "You have a new message.");
            Notification builtForSummary = builder.build();
            stampManagedExtras(builtForSummary, account, originalChannel, bypassAlertedValue, escalateAlert);
            Notification fallback = plainSummary(builtForSummary, nativePreview
                    ? original.extras.getCharSequence(Notification.EXTRA_TITLE, "LINE") : "LINE", nativePreview
                    ? original.extras.getCharSequence(Notification.EXTRA_TEXT, newMessage) : newMessage);
            if (!nativePreview) fallback = redactPreview(fallback);
            if (original.publicVersion != null) {
                fallback.publicVersion = redactPublicNotification(original.publicVersion, newMessage);
            }
            builder = Notification.Builder.recoverBuilder(Settings.context(), fallback);
        }
        if (summary && !singleRoom) {
            if (settings.moreChatInfo && posted != null) {
                try {
                    NativeLine.Chat state = NativeLine.chat(chat);
                    if (state != null && NotificationPolicy.previewState(
                            state.unread, state.readUp, posted, Collections.emptyList(), false)
                            == NotificationPolicy.PreviewState.READ) {
                        return state.unread > 0
                                ? TransformResult.discard()
                                : TransformResult.cancelReadSlot(account, chat, true, state.readUp);
                    }
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    if (!accountStillValid(account)) return TransformResult.discard();
                    Boolean curPreview = tryPreviewsAllowed();
                    if (curPreview == null) return TransformResult.discard();
                    previewAllowed = curPreview.booleanValue();
                }
            }
            Notification built = finalizeNotification(builder.build(), account, originalChannel,
                    bypassAlertedValue, escalateAlert, null, !previewAllowed);
            return TransformResult.deliver(built, account, chat, true,
                    false, keywordOnlyBypass, silentSourceChannel, original.visibility);
        }

        ActionRewrite actionRewrite = computeActions(builder, original, account, chat, summary);
        if (settings.moreChatInfo) {
            try {
                NativeLine.Chat state = NativeLine.chat(chat);
                // Always check read boundary immediately after reading chat state, BEFORE any preview/SQL call.
                if (state != null && posted != null
                        && NotificationPolicy.previewState(state.unread, state.readUp, posted, Collections.emptyList(), false)
                                == NotificationPolicy.PreviewState.READ) {
                    return state.unread > 0
                            ? TransformResult.discard()
                            : TransformResult.cancelReadSlot(account, chat, summary, state.readUp);
                }
                boolean preview = NativeLine.previewsAllowed();
                if (!preview) {
                    Notification redacted = finalizeNotification(builder.build(), account, originalChannel,
                            bypassAlertedValue, escalateAlert, actionRewrite, true);
                    return TransformResult.deliver(redacted, account, chat, summary,
                            false, keywordOnlyBypass, silentSourceChannel, original.visibility);
                }
                if (state != null && posted != null) {
                    Map<String, NativeLine.MediaPreview> mediaPreviews = null;
                    boolean mediaAttempted = false;
                    for (int attempt = 0; attempt < 2; attempt++) {
                        if (!accountStillValid(account)) return TransformResult.discard();
                        if (NotificationPolicy.previewState(state.unread, state.readUp, posted, Collections.emptyList(), false)
                                == NotificationPolicy.PreviewState.READ) {
                            return state.unread > 0
                                    ? TransformResult.discard()
                                    : TransformResult.cancelReadSlot(account, chat, summary, state.readUp);
                        }
                        Boolean curPreview = tryPreviewsAllowed();
                        if (curPreview == null) return TransformResult.discard();
                        if (!curPreview.booleanValue()) return TransformResult.cancelPrivacySlot(account, chat, summary, posted);
                        if (!Settings.enabled(Settings.INFO)) {
                            Notification built = finalizeNotification(builder.build(), account, originalChannel,
                                    bypassAlertedValue, escalateAlert, actionRewrite, false);
                            return TransformResult.deliver(built, account, chat, summary,
                                    false, keywordOnlyBypass, silentSourceChannel, original.visibility);
                        }
                        NativeLine.RecentSnapshot recent = NativeLine.recent(
                                chat, account, state, settings.maxRecentMessages);
                        List<NotificationPolicy.Message> messages = recent.messages;
                        boolean postedInRecent = false;
                        for (NotificationPolicy.Message m : messages) {
                            if (posted.equals(m.id)) { postedInRecent = true; break; }
                        }
                        boolean postedStored = postedInRecent
                                || NativeLine.messageStored(Settings.context(), chat, account, posted);
                        NotificationPolicy.PreviewState readiness = NotificationPolicy.previewState(
                                state.unread, state.readUp, posted, messages, postedStored);
                        if (readiness == NotificationPolicy.PreviewState.READ) {
                            return state.unread > 0
                                    ? TransformResult.discard()
                                    : TransformResult.cancelReadSlot(account, chat, summary, state.readUp);
                        }
                        if (readiness == NotificationPolicy.PreviewState.NATIVE) {
                            if (attempt > 0) {
                                Notification redacted = finalizeNotification(builder.build(), account, originalChannel,
                                        bypassAlertedValue, escalateAlert, actionRewrite, true);
                                return TransformResult.deliver(redacted, account, chat, summary,
                                        true, keywordOnlyBypass, silentSourceChannel, original.visibility);
                            }
                            trace("preview: waiting for local save");
                            Notification held = finalizeNotification(builder.build(), account, originalChannel,
                                    bypassAlertedValue, escalateAlert, actionRewrite, false);
                            return TransformResult.hold(held, account, chat, summary,
                                    keywordOnlyBypass, silentSourceChannel, original.visibility);
                        }
                        NativeLine.Chat afterQuery = NativeLine.chat(chat);
                        if (!accountStillValid(account)) return TransformResult.discard();
                        if (afterQuery == null) return TransformResult.discard();
                        if (NotificationPolicy.previewState(afterQuery.unread, afterQuery.readUp, posted, Collections.emptyList(), false)
                                == NotificationPolicy.PreviewState.READ) {
                            return afterQuery.unread > 0
                                    ? TransformResult.discard()
                                    : TransformResult.cancelReadSlot(account, chat, summary, afterQuery.readUp);
                        }
                        curPreview = tryPreviewsAllowed();
                        if (curPreview == null) return TransformResult.discard();
                        if (!curPreview.booleanValue()) return TransformResult.cancelPrivacySlot(account, chat, summary, posted);
                        if (afterQuery.unread == 0) return TransformResult.discard();
                        if (!NotificationPolicy.snapshotConsistent(
                                state.unread, state.readUp, afterQuery.unread, afterQuery.readUp)) {
                            if (attempt == 0) { state = afterQuery; continue; }
                            Notification redacted = finalizeNotification(builder.build(), account, originalChannel,
                                    bypassAlertedValue, escalateAlert, actionRewrite, true);
                            return TransformResult.deliver(redacted, account, chat, summary,
                                    true, keywordOnlyBypass, silentSourceChannel, original.visibility);
                        }
                        NotificationPolicy.Snapshot snapshot = new NotificationPolicy.Snapshot(
                                new NotificationPolicy.ChatKey(account, chat), muted, true, state.unread, false, messages);
                        NotificationPolicy.Decision decision = NotificationPolicy.evaluate(settings, snapshot, false);
                        String name = state.name == null || state.name.isEmpty()
                                ? String.valueOf(original.extras.getCharSequence(Notification.EXTRA_TITLE, "LINE")) : state.name;
                        Map<String, android.graphics.drawable.Icon> icons = NativeLine.senderIcons(
                                Settings.context(), account, !chat.startsWith("u"), original, decision.recentMessages);
                        if (!mediaAttempted && Settings.mediaPreviewAllowed()) {
                            mediaAttempted = true;
                            mediaPreviews = NativeLine.mediaPreviews(
                                    Settings.context(), account, chat, original, decision.recentMessages, recent.media);
                            if (mediaPreviews != null) {
                                if (!mediaPreviews.isEmpty()) trace("media: previews attached");
                                else if (!recent.media.isEmpty()) trace("media: no preview resolved");
                            }
                        }
                        NativeLine.Chat afterImages = NativeLine.chat(chat);
                        if (!accountStillValid(account)) {
                            trace("preview: state changed during image load");
                            return TransformResult.discard();
                        }
                        if (afterImages == null) {
                            trace("preview: state changed during image load");
                            return TransformResult.discard();
                        }
                        if (NotificationPolicy.previewState(afterImages.unread, afterImages.readUp, posted, Collections.emptyList(), false)
                                == NotificationPolicy.PreviewState.READ) {
                            trace("preview: state changed during image load");
                            return afterImages.unread > 0
                                    ? TransformResult.discard()
                                    : TransformResult.cancelReadSlot(account, chat, summary, afterImages.readUp);
                        }
                        curPreview = tryPreviewsAllowed();
                        if (curPreview == null) {
                            trace("preview: state changed during image load");
                            return TransformResult.discard();
                        }
                        if (!curPreview.booleanValue()) {
                            trace("preview: state changed during image load");
                            return TransformResult.cancelPrivacySlot(account, chat, summary, posted);
                        }
                        if (afterImages.unread == 0) {
                            trace("preview: state changed during image load");
                            return TransformResult.discard();
                        }
                        if (!Settings.enabled(Settings.INFO)) {
                            Notification built = finalizeNotification(builder.build(), account, originalChannel,
                                    bypassAlertedValue, escalateAlert, actionRewrite, false);
                            return TransformResult.deliver(built, account, chat, summary,
                                    false, keywordOnlyBypass, silentSourceChannel, original.visibility);
                        }
                        if (!NotificationPolicy.snapshotConsistent(
                                state.unread, state.readUp, afterImages.unread, afterImages.readUp)) {
                            if (attempt == 0) {
                                trace("preview: snapshot changed during image load, re-querying");
                                state = afterImages;
                                continue;
                            }
                            trace("preview: state changed during image load");
                            Notification redacted = finalizeNotification(builder.build(), account, originalChannel,
                                    bypassAlertedValue, escalateAlert, actionRewrite, true);
                            return TransformResult.deliver(redacted, account, chat, summary,
                                    true, keywordOnlyBypass, silentSourceChannel, original.visibility);
                        }
                        if (mediaPreviews != null) {
                            if (!Settings.mediaPreviewAllowed()) {
                                mediaPreviews = null;
                                trace("media: preview disabled during load");
                            } else if (!mediaPreviews.isEmpty()) {
                                Map<String, NativeLine.MediaPreview> filtered = new HashMap<>();
                                for (NotificationPolicy.Message msg : decision.recentMessages) {
                                    NativeLine.MediaPreview mp = mediaPreviews.get(msg.id);
                                    if (mp != null) filtered.put(msg.id, mp);
                                }
                                mediaPreviews = filtered;
                            }
                        }
                        Notification styled = ConversationPreview.apply(
                                builder, snapshot.chat, name, state.unread, decision.recentMessages, icons, mediaPreviews);
                        styled = finalizeNotification(styled, account, originalChannel,
                                bypassAlertedValue, escalateAlert, actionRewrite, false);
                        return TransformResult.deliver(styled, account, chat, summary,
                                false, keywordOnlyBypass, silentSourceChannel, original.visibility);
                    }
                    return TransformResult.discard();
                }
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                if (!accountStillValid(account)) {
                    trace("preview: state unverifiable after adapter failure");
                    return TransformResult.discard();
                }
                Boolean curPreview = tryPreviewsAllowed();
                if (curPreview == null) {
                    trace("preview: state unverifiable after adapter failure");
                    return TransformResult.discard();
                }
                if (!curPreview.booleanValue()) {
                    trace("preview: privacy off after adapter failure");
                    Notification redacted = finalizeNotification(builder.build(), account, originalChannel,
                            bypassAlertedValue, escalateAlert, actionRewrite, true);
                    return TransformResult.deliver(redacted, account, chat, summary,
                            false, keywordOnlyBypass, silentSourceChannel, original.visibility);
                }
                trace("preview: adapter failed, keeping native notification");
            }
        }
        Notification built = finalizeNotification(builder.build(), account, originalChannel,
                bypassAlertedValue, escalateAlert, actionRewrite, !previewAllowed);
        return TransformResult.deliver(built, account, chat, summary,
                false, keywordOnlyBypass, silentSourceChannel, original.visibility);
    }

    private static void stampManagedExtras(Notification n, String account, String originalChannel,
                                           String bypassAlerted, boolean escalateAlert) {
        if (n == null) return;
        if (n.extras == null) n.extras = new Bundle();
        n.extras.putString(ACCOUNT, account);
        n.extras.remove(GENERIC_SUMMARY);
        if (originalChannel != null) n.extras.putString(ORIGINAL_CHANNEL, originalChannel);
        if (bypassAlerted != null) n.extras.putString(BYPASS_ALERTED, bypassAlerted);
        if (escalateAlert) n.extras.putBoolean(ESCALATE_ALERT, true);
    }

    private static Notification revokeKeywordOnlyBypass(NotificationManager manager, Notification source,
                                                        String sourceChannel, int originalVisibility) {
        if (source == null || sourceChannel == null) return null;
        NotificationChannel channel = manager.getNotificationChannel(sourceChannel);
        if (channel == null || channel.getImportance() == NotificationManager.IMPORTANCE_NONE) return null;
        if (channel.getGroup() != null && manager.getNotificationChannelGroup(channel.getGroup()) != null
                && manager.getNotificationChannelGroup(channel.getGroup()).isBlocked()) return null;
        Notification clean = source.clone();
        clean.extras = source.extras == null ? new Bundle() : new Bundle(source.extras);
        clean.extras.remove(BYPASS_ALERTED);
        clean.extras.remove(ESCALATE_ALERT);
        Notification.Builder builder = Notification.Builder.recoverBuilder(Settings.context(), clean);
        int channelVisibility = channel.getLockscreenVisibility();
        if (channelVisibility == Notification.VISIBILITY_SECRET || channelVisibility == Notification.VISIBILITY_PRIVATE) {
            builder.setVisibility(Math.min(originalVisibility, channelVisibility));
        }
        silent(manager, builder);
        Notification silenced = builder.build();
        silenced.actions = source.actions == null ? new Notification.Action[0] : source.actions.clone();
        silenced.publicVersion = source.publicVersion;
        if (silenced.extras != null) {
            silenced.extras.remove(BYPASS_ALERTED);
            silenced.extras.remove(ESCALATE_ALERT);
        }
        trace("silent: keyword-only bypass revoked on privacy off");
        return silenced;
    }

    private static boolean hasOtherRoom(NotificationManager manager, Notification summary, String account, String chat) {
        if (summary.getGroup() == null) return true;
        StatusBarNotification[] active = manager.getActiveNotifications();
        if (active != null) {
            for (StatusBarNotification entry : active) {
                Notification child = entry.getNotification();
                if ((child.flags & Notification.FLAG_GROUP_SUMMARY) != 0
                        || !Objects.equals(summary.getGroup(), child.getGroup())) continue;
                if (!isMessage(child) || !chat.equals(child.extras.getString("line.chat.id"))
                        || !account.equals(child.extras.getString(ACCOUNT))) return true;
            }
        }
        long now = monotonicNowMillis();
        for (SlotRecord d : SLOT_LEDGER.values()) {
            if (d.canceled || d.summary || !Objects.equals(summary.getGroup(), d.group)) continue;
            if ((now - d.uptimeMillis) > RECENT_ENQUEUE_WINDOW_MS) continue;
            if (!d.regularMessage || !chat.equals(d.chat) || !NotificationPolicy.sameAccount(account, d.account)) {
                return true;
            }
        }
        return false;
    }

    private static Notification plainSummary(Notification source, CharSequence title, CharSequence text) {
        Notification clean = ConversationPreview.copyWithoutPresentationExtras(source);
        Notification result = Notification.Builder.recoverBuilder(Settings.context(), clean)
                .setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setContentTitle(title).setContentText(text)
                .setTicker(text).setSubText(null).setContentInfo(null).setNumber(0).build();
        ConversationPreview.clearPresentationExtras(result.extras);
        return result;
    }

    private static Notification redactPublicNotification(Notification sourcePub, String newMessage) {
        Notification pubClean = sourcePub.clone();
        pubClean.extras = sourcePub.extras == null ? new Bundle() : new Bundle(sourcePub.extras);
        ConversationPreview.clearRedactedMediaExtras(pubClean.extras);
        pubClean.extras.remove(NATIVE_WEARABLE_ACTIONS);
        pubClean.extras.remove(Notification.EXTRA_TITLE);
        pubClean.extras.remove(Notification.EXTRA_TEXT);
        Notification pub = Notification.Builder.recoverBuilder(Settings.context(), pubClean)
                .setActions(new Notification.Action[0])
                .setShortcutId(null)
                .setLargeIcon((android.graphics.drawable.Icon) null)
                .setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setContentTitle("LINE").setContentText(newMessage)
                .setTicker(newMessage).setSubText(null).setContentInfo(null).setNumber(0).build();
        ConversationPreview.clearRedactedMediaExtras(pub.extras);
        pub.extras.remove(NATIVE_WEARABLE_ACTIONS);
        pub.actions = new Notification.Action[0];
        return pub;
    }

    private static Notification redactPreview(Notification source) {
        if (source == null) return null;
        String newMessage = Strings.get("line_notify_new_message", "You have a new message.");
        Notification clean = source.clone();
        clean.extras = source.extras == null ? new Bundle() : new Bundle(source.extras);
        ConversationPreview.clearRedactedMediaExtras(clean.extras);
        clean.extras.remove(NATIVE_WEARABLE_ACTIONS);
        clean.extras.remove(Notification.EXTRA_TITLE);
        clean.extras.remove(Notification.EXTRA_TEXT);
        Notification result = Notification.Builder.recoverBuilder(Settings.context(), clean)
                .setLargeIcon((android.graphics.drawable.Icon) null)
                .setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setContentTitle("LINE").setContentText(newMessage)
                .setTicker(newMessage).setSubText(null).setContentInfo(null).setNumber(0).build();
        ConversationPreview.clearRedactedMediaExtras(result.extras);
        result.extras.remove(NATIVE_WEARABLE_ACTIONS);
        result.actions = source.actions == null ? new Notification.Action[0] : source.actions.clone();
        if (source.publicVersion != null) {
            result.publicVersion = redactPublicNotification(source.publicVersion, newMessage);
        }
        return result;
    }

    private static Notification.Builder silent(NotificationManager manager, Notification.Builder builder) {
        NotificationChannel channel = new NotificationChannel(CHANNEL,
                Strings.get("line_notify_channel_silent_name", "Silent chat notifications"), NotificationManager.IMPORTANCE_LOW);
        channel.setSound(null, null); channel.enableVibration(false); channel.enableLights(false);
        channel.setDescription(Strings.get("line_notify_channel_silent_desc",
                "Chats delivered quietly via Not Too Much Silent"));
        manager.createNotificationChannel(channel);
        return builder.setChannelId(CHANNEL).setOnlyAlertOnce(true)
                .setDefaults(0).setSound(null).setVibrate(null);
    }

    private static Notification.Action[] restoreActionBackup(Bundle extras, String key) {
        Parcelable[] saved = extras.getParcelableArray(key);
        if (saved == null) return null;
        Notification.Action[] restored = new Notification.Action[saved.length];
        for (int i = 0; i < saved.length; i++) {
            if (!(saved[i] instanceof Notification.Action)) return null;
            restored[i] = (Notification.Action) saved[i];
        }
        return restored;
    }

    private static int findUniqueMuteIndex(Notification.Action[] actions, CharSequence muteTitle) {
        int muteIndex = -1;
        for (int i = 0; i < actions.length; i++) {
            Notification.Action action = actions[i];
            if (action == null) continue;
            RemoteInput[] inputs = action.getRemoteInputs();
            boolean hasRemoteInput = inputs != null && inputs.length > 0;
            if (isNativeMuteAction(action, muteTitle, hasRemoteInput)) {
                if (muteIndex != -1) return -1;
                muteIndex = i;
            }
        }
        return muteIndex;
    }

    private static ActionRewrite computeActions(Notification.Builder builder, Notification original, String account,
                                                String chat, boolean summary) throws ReflectiveOperationException {
        Notification.Action[] restoredNative = restoreActionBackup(original.extras, NATIVE_ACTIONS);
        Notification.Action[] nativeActions = restoredNative != null ? restoredNative : original.actions;
        boolean noReplyOn = Settings.enabled(Settings.NO_REPLY);
        boolean hasSavedOrigCtx = original.extras.containsKey(ORIG_CONTEXTUAL_ACTIONS);
        boolean origCtxValue = hasSavedOrigCtx
                ? original.extras.getBoolean(ORIG_CONTEXTUAL_ACTIONS, true)
                : original.getAllowSystemGeneratedContextualActions();
        Boolean savedOrigContextual = null;
        Notification.Action[] actions = nativeActions;
        Notification.Action[] savedNativeBackup = null;
        if (noReplyOn) {
            builder.setAllowSystemGeneratedContextualActions(false);
            savedOrigContextual = Boolean.valueOf(origCtxValue);
            actions = withoutSuggestions(actions);
            if (nativeActions != null && nativeActions.length > 0) savedNativeBackup = nativeActions;
        } else if (hasSavedOrigCtx) {
            builder.setAllowSystemGeneratedContextualActions(origCtxValue);
        }

        Notification.Action[] restoredWear = restoreActionBackup(original.extras, NATIVE_WEARABLE_ACTIONS);
        Notification.Action[] nativeWearArray = restoredWear;
        if (nativeWearArray == null) {
            Bundle origWearable = original.extras.getBundle(WEARABLE_EXTENSIONS);
            ArrayList<Notification.Action> rawWear = origWearable == null
                    ? null : origWearable.getParcelableArrayList(WEARABLE_ACTIONS);
            if (rawWear != null) nativeWearArray = rawWear.toArray(new Notification.Action[0]);
        }
        boolean hasWearable = nativeWearArray != null;
        Notification.Action[] wearArray = nativeWearArray;
        Notification.Action[] savedWearBackup = null;
        if (hasWearable && noReplyOn) {
            wearArray = withoutSuggestions(wearArray);
            if (nativeWearArray.length > 0) savedWearBackup = nativeWearArray;
        }

        if (!summary) {
            int muteTitleId = Settings.context().getResources().getIdentifier("notification_button_mute", "string",
                    Settings.context().getPackageName());
            CharSequence muteTitle = muteTitleId == 0 ? null : Settings.context().getText(muteTitleId);
            int replyTitleId = Settings.context().getResources().getIdentifier("notification_button_reply", "string",
                    Settings.context().getPackageName());
            CharSequence replyTitle = replyTitleId == 0 ? null : Settings.context().getText(replyTitleId);
            String layout = Settings.actionLayout();
            boolean defaultLayout = NotificationPolicy.ACTION_LAYOUT_DEFAULT.equals(layout);
            boolean readReadyComputed = false;
            boolean readReadyValue = false;

            if (actions != null) {
                int muteIndex = findUniqueMuteIndex(actions, muteTitle);
                Notification.Action replyAction = null;
                for (Notification.Action action : actions) {
                    if (action == null) continue;
                    RemoteInput[] inputs = action.getRemoteInputs();
                    if ((inputs != null && inputs.length > 0)
                            || (replyTitle != null && android.text.TextUtils.equals(replyTitle, action.title))) {
                        replyAction = action;
                        break;
                    }
                }
                if (defaultLayout) {
                    if (Settings.enabled(Settings.READ) && muteIndex >= 0) {
                        readReadyValue = NativeLine.readReady(Settings.context(), chat, original.extras.getString("line.message.id"))
                                && account.equals(NativeLine.account());
                        readReadyComputed = true;
                        ArrayList<Notification.Action> changed = new ArrayList<>();
                        for (int i = 0; i < actions.length; i++) {
                            if (i != muteIndex) changed.add(actions[i]);
                            else if (readReadyValue) changed.add(ReadActions.action(Settings.context(), account, chat));
                        }
                        savedNativeBackup = nativeActions;
                        actions = changed.toArray(new Notification.Action[0]);
                        trace(readReadyValue ? "read: action ready" : "read: awaiting local storage");
                    } else if (Settings.enabled(Settings.SILENT) && muteIndex >= 0) {
                        Notification.Action[] wrapped = actions.clone();
                        wrapped[muteIndex] = MuteActions.action(Settings.context(), account, chat, actions[muteIndex]);
                        savedNativeBackup = nativeActions;
                        actions = wrapped;
                        trace("mute: account-bound action applied");
                    }
                } else {
                    List<NotificationPolicy.ActionSlot> slots = NotificationPolicy.resolveActionSlots(
                            layout, Settings.enabled(Settings.READ), Settings.readIncluded());
                    boolean wantsRead = slots.contains(NotificationPolicy.ActionSlot.READ);
                    readReadyValue = wantsRead
                            && NativeLine.readReady(Settings.context(), chat, original.extras.getString("line.message.id"))
                            && account.equals(NativeLine.account());
                    readReadyComputed = true;
                    ArrayList<Notification.Action> changed = new ArrayList<>(slots.size());
                    for (NotificationPolicy.ActionSlot slot : slots) {
                        if (slot == NotificationPolicy.ActionSlot.READ) {
                            if (readReadyValue) changed.add(ReadActions.action(Settings.context(), account, chat));
                        } else if (slot == NotificationPolicy.ActionSlot.SNOOZE_1H) {
                            changed.add(SnoozeActions.action(Settings.context(), account, chat));
                        } else if (slot == NotificationPolicy.ActionSlot.MUTE && muteIndex >= 0) {
                            changed.add(Settings.enabled(Settings.SILENT)
                                    ? MuteActions.action(Settings.context(), account, chat, actions[muteIndex])
                                    : actions[muteIndex]);
                        } else if (slot == NotificationPolicy.ActionSlot.REPLY && replyAction != null) {
                            changed.add(replyAction);
                        }
                    }
                    savedNativeBackup = nativeActions;
                    actions = changed.toArray(new Notification.Action[0]);
                    trace("actions: custom layout applied");
                    if (wantsRead && !readReadyValue) trace("read: awaiting local storage");
                }
            }

            if (hasWearable) {
                int wearMuteIndex = findUniqueMuteIndex(wearArray, muteTitle);
                if (wearMuteIndex >= 0) {
                    ArrayList<Notification.Action> wearList = new ArrayList<>();
                    Collections.addAll(wearList, wearArray);
                    boolean keepWearMute;
                    boolean replaceWearRead;
                    if (defaultLayout) {
                        replaceWearRead = Settings.enabled(Settings.READ);
                        keepWearMute = !replaceWearRead;
                    } else {
                        List<NotificationPolicy.ActionSlot> slots = NotificationPolicy.resolveActionSlots(
                                layout, Settings.enabled(Settings.READ), Settings.readIncluded());
                        keepWearMute = slots.contains(NotificationPolicy.ActionSlot.MUTE);
                        replaceWearRead = !keepWearMute && slots.contains(NotificationPolicy.ActionSlot.READ);
                    }
                    if (replaceWearRead) {
                        if (!readReadyComputed) {
                            readReadyValue = NativeLine.readReady(Settings.context(), chat, original.extras.getString("line.message.id"))
                                    && account.equals(NativeLine.account());
                        }
                        if (readReadyValue) wearList.set(wearMuteIndex, ReadActions.action(Settings.context(), account, chat));
                        else wearList.remove(wearMuteIndex);
                        savedWearBackup = nativeWearArray;
                    } else if (keepWearMute && Settings.enabled(Settings.SILENT)) {
                        wearList.set(wearMuteIndex,
                                MuteActions.action(Settings.context(), account, chat, wearList.get(wearMuteIndex)));
                        savedWearBackup = nativeWearArray;
                    } else if (!keepWearMute) {
                        wearList.remove(wearMuteIndex);
                        savedWearBackup = nativeWearArray;
                    }
                    wearArray = wearList.toArray(new Notification.Action[0]);
                }
            }
        }
        Notification.Action[] finalActions = actions == null ? new Notification.Action[0] : actions;
        builder.setActions(finalActions);
        ArrayList<Notification.Action> finalWear = null;
        if (hasWearable) {
            finalWear = new ArrayList<>();
            Collections.addAll(finalWear, wearArray);
        }
        return new ActionRewrite(finalActions, savedNativeBackup, hasWearable, finalWear, savedWearBackup, savedOrigContextual);
    }

    private static boolean isNativeMuteAction(Notification.Action action, CharSequence muteTitle, boolean hasRemoteInput) {
        return action.actionIntent != null && muteTitle != null
                && android.text.TextUtils.equals(muteTitle, action.title) && !hasRemoteInput;
    }

    /** Commits final phone/wearable actions and backups after build() to bypass Android 11/12 quirks. */
    private static void applyFinalActions(Notification built, ActionRewrite rewrite) {
        if (built == null || rewrite == null) return;
        built.actions = rewrite.actions == null ? new Notification.Action[0] : rewrite.actions;
        if (built.extras == null) built.extras = new Bundle();
        if (rewrite.savedNativeActions != null) built.extras.putParcelableArray(NATIVE_ACTIONS, rewrite.savedNativeActions);
        else built.extras.remove(NATIVE_ACTIONS);
        if (rewrite.rewriteWearable) {
            Bundle existing = built.extras.getBundle(WEARABLE_EXTENSIONS);
            Bundle updatedWear = existing == null ? new Bundle() : new Bundle(existing);
            updatedWear.putParcelableArrayList(WEARABLE_ACTIONS,
                    rewrite.wearableActions == null ? new ArrayList<>() : new ArrayList<>(rewrite.wearableActions));
            built.extras.putBundle(WEARABLE_EXTENSIONS, updatedWear);
        }
        if (rewrite.savedNativeWearableActions != null) {
            built.extras.putParcelableArray(NATIVE_WEARABLE_ACTIONS, rewrite.savedNativeWearableActions);
        } else {
            built.extras.remove(NATIVE_WEARABLE_ACTIONS);
        }
        if (rewrite.savedOrigContextualActions != null) {
            built.extras.putBoolean(ORIG_CONTEXTUAL_ACTIONS, rewrite.savedOrigContextualActions.booleanValue());
        } else {
            built.extras.remove(ORIG_CONTEXTUAL_ACTIONS);
        }
    }

    private static Notification.Action[] withoutSuggestions(Notification.Action[] actions) {
        ArrayList<Notification.Action> result = new ArrayList<>();
        if (actions == null) return new Notification.Action[0];
        for (Notification.Action action : actions) {
            if (action == null) continue;
            RemoteInput[] inputs = action.getRemoteInputs();
            if (inputs != null && inputs.length > 0) {
                boolean freeform = false;
                for (RemoteInput input : inputs) freeform |= input.getAllowFreeFormInput();
                if (!freeform) continue;
            }
            Notification.Action.Builder copy = new Notification.Action.Builder(action.getIcon(), action.title, action.actionIntent)
                    .addExtras(new Bundle(action.getExtras())).setAllowGeneratedReplies(false)
                    .setSemanticAction(action.getSemanticAction())
                    .setContextual(action.isContextual());
            if (Build.VERSION.SDK_INT >= 31) copy.setAuthenticationRequired(action.isAuthenticationRequired());
            if (inputs != null) for (RemoteInput input : inputs) {
                RemoteInput.Builder remote = new RemoteInput.Builder(input.getResultKey()).setLabel(input.getLabel())
                        .setAllowFreeFormInput(input.getAllowFreeFormInput()).setChoices(null).addExtras(new Bundle(input.getExtras()));
                for (String mime : input.getAllowedDataTypes()) remote.setAllowDataType(mime, true);
                remote.setEditChoicesBeforeSending(RemoteInput.EDIT_CHOICES_BEFORE_SENDING_AUTO);
                copy.addRemoteInput(remote.build());
            }
            result.add(copy.build());
        }
        return result.toArray(new Notification.Action[0]);
    }

    static synchronized void cancelChatNotifications(NotificationManager manager, String account, String chat) {
        if (chat == null) return;
        cancelChatNotificationsLocked(manager, account, Collections.singleton(chat));
    }

    static synchronized void cancelChatNotifications(NotificationManager manager, String account, Set<String> targetChats) {
        cancelChatNotificationsLocked(manager, account, targetChats);
    }

    /** Re-verifies HIDE_CONFIRMED under Notifications.class lock so concurrent unhides are never canceled. */
    static synchronized boolean cancelConfirmedHiddenChats(NotificationManager manager, String account, Set<String> candidateChats) {
        if (manager == null || account == null || account.isEmpty() || !accountStillValid(account)) return false;
        if (candidateChats == null || candidateChats.isEmpty()) return true;
        Set<String> confirmed = new HashSet<>();
        for (String chat : candidateChats) {
            if (ChatNotifications.hideDisposition(account, chat) == ChatNotifications.HIDE_CONFIRMED) {
                confirmed.add(chat);
            }
        }
        if (confirmed.isEmpty()) return accountStillValid(account);
        return cancelChatNotificationsLocked(manager, account, confirmed) == CANCEL_DONE && accountStillValid(account);
    }

    /** Returns CANCEL_DONE, CANCEL_FOLLOW_UP (lag/rebuild retry), or CANCEL_INCOMPLETE (account changed). */
    private static int cancelChatNotificationsLocked(NotificationManager manager, String account, Set<String> targetChats) {
        if (manager == null || account == null || account.isEmpty() || targetChats == null || targetChats.isEmpty()) {
            return CANCEL_DONE;
        }
        for (String chat : targetChats) clearPendingChatLocked(account, chat);
        StatusBarNotification[] active = manager.getActiveNotifications();
        if (!accountStillValid(account)) return CANCEL_INCOMPLETE;

        Set<String> affectedGroups = new HashSet<>();
        Set<String> canceledKeys = new HashSet<>();
        Set<SlotKey> canceledSlots = new HashSet<>();
        boolean cancelUngroupedTargetSummaries = false;
        long now = monotonicNowMillis();
        // Snapshot ledger BEFORE mutating it via cancelOnManagerLocked so slot-ownership conflicts are visible.
        List<Map.Entry<SlotKey, SlotRecord>> ledgerCopy = new ArrayList<>(SLOT_LEDGER.entrySet());
        if (active != null) {
            for (StatusBarNotification sbn : active) {
                Notification n = sbn.getNotification();
                if (n == null || n.extras == null) continue;
                SlotKey sKey = new SlotKey(sbn.getTag(), sbn.getId());
                SlotRecord recent = freshLedgerLocked(sKey, now);
                boolean recentFresher = isVisibleOlderThanLedger(n, recent);
                if (recentFresher && recent.canceled) continue;
                String nChat = recentFresher ? recent.chat : n.extras.getString("line.chat.id");
                if (nChat == null || !targetChats.contains(nChat)) continue;
                String nAccount = recentFresher ? recent.account : n.extras.getString(ACCOUNT);
                if (!NotificationPolicy.sameAccount(account, nAccount)) continue;
                boolean isSummarySlot = recentFresher ? recent.summary : ((n.flags & Notification.FLAG_GROUP_SUMMARY) != 0);
                String group = recentFresher ? recent.group : n.getGroup();
                if (isSummarySlot) {
                    if (group != null) affectedGroups.add(group);
                    else cancelUngroupedTargetSummaries = true;
                } else {
                    if (group != null) affectedGroups.add(group);
                    canceledKeys.add(sbn.getKey());
                    canceledSlots.add(sKey);
                    cancelOnManagerLocked(manager, sbn.getTag(), sbn.getId());
                }
            }
        }
        // Also cancel any fresh recently-submitted matching slots not yet visible in active IPC.
        boolean hadRecentLag = false;
        for (Map.Entry<SlotKey, SlotRecord> entry : ledgerCopy) {
            SlotKey sKey = entry.getKey();
            SlotRecord rec = entry.getValue();
            if (rec.canceled || (now - rec.uptimeMillis) > RECENT_ENQUEUE_WINDOW_MS) continue;
            if (!NotificationPolicy.sameAccount(account, rec.account) || rec.chat == null || !targetChats.contains(rec.chat)) {
                continue;
            }
            if (rec.summary) {
                if (rec.group != null) affectedGroups.add(rec.group);
                else if (findActiveSlot(active, sKey.tag, sKey.id) == null) {
                    hadRecentLag = true;
                    cancelOnManagerLocked(manager, sKey.tag, sKey.id);
                }
            } else if (!canceledSlots.contains(sKey)) {
                if (rec.group != null) affectedGroups.add(rec.group);
                canceledSlots.add(sKey);
                hadRecentLag = true;
                cancelOnManagerLocked(manager, sKey.tag, sKey.id);
            }
        }
        if (affectedGroups.isEmpty() && !cancelUngroupedTargetSummaries) {
            return hadRecentLag ? CANCEL_FOLLOW_UP : CANCEL_DONE;
        }
        Set<SlotKey> handledSummaries = new HashSet<>();
        if (active != null) {
            for (StatusBarNotification sbn : active) {
                Notification summary = sbn.getNotification();
                if (summary == null || summary.extras == null) continue;
                SlotKey sKey = new SlotKey(sbn.getTag(), sbn.getId());
                SlotRecord recentSummary = freshLedgerLocked(sKey, now);
                boolean recentFresher = isVisibleOlderThanLedger(summary, recentSummary);
                if (recentFresher && recentSummary.canceled) {
                    handledSummaries.add(sKey);
                    continue;
                }
                boolean isSummarySlot = recentFresher
                        ? recentSummary.summary
                        : ((summary.flags & Notification.FLAG_GROUP_SUMMARY) != 0);
                if (!isSummarySlot) continue;
                if (!recentFresher && !isMessage(summary) && !isGenericSummary(summary)) continue;
                String summaryAccount = recentFresher ? recentSummary.account : summary.extras.getString(ACCOUNT);
                if (!NotificationPolicy.sameAccount(account, summaryAccount)) {
                    if (recentFresher) handledSummaries.add(sKey);
                    continue;
                }
                handledSummaries.add(sKey);
                String summaryChat = recentFresher ? recentSummary.chat : summary.extras.getString("line.chat.id");
                if (recentFresher && summaryChat != null && !targetChats.contains(summaryChat)) {
                    continue;
                }
                String group = recentFresher ? recentSummary.group : summary.getGroup();
                if (group == null) {
                    if (cancelUngroupedTargetSummaries && summaryChat != null && targetChats.contains(summaryChat)) {
                        if (!accountStillValid(account)) return CANCEL_INCOMPLETE;
                        cancelOnManagerLocked(manager, sbn.getTag(), sbn.getId());
                    }
                    continue;
                }
                if (!affectedGroups.contains(group)) continue;
                List<NotificationPolicy.ActiveChild> remainingInfo = new ArrayList<>();
                StatusBarNotification latestRemaining = collectRemainingGroupChildrenLocked(
                        active, group, account, canceledKeys, targetChats, false, null, remainingInfo);
                NotificationPolicy.SummaryAction action = NotificationPolicy.resolveGroupSummary(account, remainingInfo);
                if (action == NotificationPolicy.SummaryAction.CANCEL) {
                    if (!accountStillValid(account)) return CANCEL_INCOMPLETE;
                    cancelOnManagerLocked(manager, sbn.getTag(), sbn.getId());
                } else if (!recentFresher) {
                    int rb = rebuildSummaryWithoutCanceledChat(manager, sbn, summary, account, targetChats, action, latestRemaining);
                    if (rb == CANCEL_INCOMPLETE) return CANCEL_INCOMPLETE;
                    if (rb == CANCEL_FOLLOW_UP) hadRecentLag = true;
                } else if (summaryChat != null && targetChats.contains(summaryChat)) {
                    hadRecentLag = true;
                    int rb = rebuildSummaryWithoutCanceledChat(manager, sbn, summary, account, targetChats, action, latestRemaining);
                    if (rb == CANCEL_INCOMPLETE) return CANCEL_INCOMPLETE;
                }
            }
        }
        for (Map.Entry<SlotKey, SlotRecord> entry : ledgerCopy) {
            SlotKey sKey = entry.getKey();
            SlotRecord rec = entry.getValue();
            if (handledSummaries.contains(sKey) || rec.canceled || !rec.summary || rec.group == null) continue;
            if ((now - rec.uptimeMillis) > RECENT_ENQUEUE_WINDOW_MS) continue;
            if (!NotificationPolicy.sameAccount(account, rec.account) || !affectedGroups.contains(rec.group)) continue;
            if (rec.chat != null && !targetChats.contains(rec.chat)) continue;
            List<NotificationPolicy.ActiveChild> remainingInfo = new ArrayList<>();
            collectRemainingGroupChildrenLocked(
                    active, rec.group, account, canceledKeys, targetChats, false, null, remainingInfo);
            NotificationPolicy.SummaryAction action = NotificationPolicy.resolveGroupSummary(account, remainingInfo);
            if (action == NotificationPolicy.SummaryAction.CANCEL) {
                if (!accountStillValid(account)) return CANCEL_INCOMPLETE;
                hadRecentLag = true;
                cancelOnManagerLocked(manager, sKey.tag, sKey.id);
            } else if (rec.chat != null && targetChats.contains(rec.chat)) {
                hadRecentLag = true;
            }
        }
        return hadRecentLag ? CANCEL_FOLLOW_UP : CANCEL_DONE;
    }

    private static int rebuildSummaryWithoutCanceledChat(NotificationManager manager, StatusBarNotification sbn,
                                                         Notification summary, String account,
                                                         Set<String> targetChats,
                                                         NotificationPolicy.SummaryAction action,
                                                         StatusBarNotification latestRemaining) {
        try {
            if (!accountStillValid(account)) {
                trace("summary: rebuild skipped on account change");
                return CANCEL_INCOMPLETE;
            }
            StatusBarNotification currentSummary = findActiveSlot(manager.getActiveNotifications(), sbn.getTag(), sbn.getId());
            if (!accountStillValid(account)) {
                trace("summary: rebuild skipped on account change");
                return CANCEL_INCOMPLETE;
            }
            if (currentSummary == null || !sbn.getKey().equals(currentSummary.getKey())
                    || sbn.getPostTime() != currentSummary.getPostTime()) {
                trace("summary: rebuild aborted on missing or replaced summary");
                return CANCEL_DONE;
            }
            Notification currentNotification = currentSummary.getNotification();
            SlotRecord recentSummary = freshLedgerLocked(new SlotKey(sbn.getTag(), sbn.getId()), monotonicNowMillis());
            if (isVisibleOlderThanLedger(currentNotification, recentSummary)) {
                boolean fresherOwnedByTarget = recentSummary != null && !recentSummary.canceled
                        && recentSummary.summary
                        && NotificationPolicy.sameAccount(account, recentSummary.account)
                        && recentSummary.chat != null && targetChats != null && targetChats.contains(recentSummary.chat);
                if (!fresherOwnedByTarget) {
                    trace("summary: rebuild aborted on newer ledger delivery");
                    return CANCEL_DONE;
                }
            }
            String currentAccount = currentNotification == null || currentNotification.extras == null
                    ? null : currentNotification.extras.getString(ACCOUNT);
            if (!NotificationPolicy.sameAccount(account, currentAccount)) {
                trace("summary: rebuild aborted on foreign active summary");
                return CANCEL_DONE;
            }
            Boolean allowed = tryPreviewsAllowed();
            if (!accountStillValid(account)) {
                trace("summary: rebuild skipped on account change");
                return CANCEL_INCOMPLETE;
            }
            boolean previewsAllowed = Boolean.TRUE.equals(allowed);
            String newMessage = Strings.get("line_notify_new_message", "You have a new message.");
            Notification remainingChild = latestRemaining == null ? null : latestRemaining.getNotification();
            boolean keepSingleRoom = allowed != null
                    && action == NotificationPolicy.SummaryAction.KEEP_SINGLE_ROOM
                    && remainingChild != null && remainingChild.extras != null
                    && NotificationPolicy.sameAccount(account, remainingChild.extras.getString(ACCOUNT));
            String remainingChat = keepSingleRoom ? remainingChild.extras.getString("line.chat.id") : null;
            if (keepSingleRoom && remainingChat != null && Settings.enabled(Settings.SILENT)
                    && ChatNotifications.hideDisposition(account, remainingChat) != ChatNotifications.HIDE_NONE) {
                keepSingleRoom = false;
                remainingChat = null;
            }
            CharSequence title = "LINE";
            CharSequence text = newMessage;
            if (keepSingleRoom && previewsAllowed) {
                title = remainingChild.extras.getCharSequence(Notification.EXTRA_TITLE, "LINE");
                text = remainingChild.extras.getCharSequence(Notification.EXTRA_TEXT, newMessage);
            }
            String remainingMessage = keepSingleRoom ? remainingChild.extras.getString("line.message.id") : null;
            String remainingShortcut = keepSingleRoom ? remainingChild.getShortcutId() : null;
            PendingIntent targetIntent = keepSingleRoom && remainingChild.contentIntent != null
                    ? remainingChild.contentIntent : genericSummaryContentIntent();
            Notification rebuilt = buildCleanSummaryNotification(
                    summary, account, title, text, newMessage, keepSingleRoom,
                    remainingChat, remainingMessage, remainingShortcut, targetIntent);
            Boolean allowedAtCommit = tryPreviewsAllowed();
            if (!accountStillValid(account)) {
                trace("summary: rebuild aborted before notify on account change");
                return CANCEL_INCOMPLETE;
            }
            boolean hiddenAtCommit = keepSingleRoom && remainingChat != null && Settings.enabled(Settings.SILENT)
                    && ChatNotifications.hideDisposition(account, remainingChat) != ChatNotifications.HIDE_NONE;
            if (allowedAtCommit == null || hiddenAtCommit || (!allowedAtCommit.booleanValue() && previewsAllowed)) {
                keepSingleRoom = allowedAtCommit != null && !hiddenAtCommit && keepSingleRoom;
                rebuilt = buildCleanSummaryNotification(
                        summary, account, "LINE", newMessage, newMessage, keepSingleRoom,
                        keepSingleRoom ? remainingChat : null,
                        keepSingleRoom ? remainingMessage : null,
                        keepSingleRoom ? remainingShortcut : null,
                        keepSingleRoom ? targetIntent : genericSummaryContentIntent());
                if (!accountStillValid(account)) {
                    trace("summary: rebuild aborted before notify on account change");
                    return CANCEL_INCOMPLETE;
                }
            }
            deliverToManagerLocked(manager, sbn.getTag(), sbn.getId(), rebuilt,
                    account, keepSingleRoom ? remainingChat : null, keepSingleRoom);
            trace(keepSingleRoom ? "summary: kept remaining room" : "summary: kept multi-room");
            return CANCEL_DONE;
        } catch (RuntimeException ignored) {
            trace("summary: rebuild failed");
            return CANCEL_FOLLOW_UP;
        }
    }

    private static Notification buildCleanSummaryNotification(Notification summary, String account,
                                                              CharSequence title, CharSequence text, String newMessage,
                                                              boolean keepSingleRoom, String remainingChat,
                                                              String remainingMessage, String remainingShortcut,
                                                              PendingIntent targetIntent) {
        boolean hasOrigCtx = summary.extras != null && summary.extras.containsKey(ORIG_CONTEXTUAL_ACTIONS);
        boolean origCtxValue = hasOrigCtx
                ? summary.extras.getBoolean(ORIG_CONTEXTUAL_ACTIONS, true)
                : summary.getAllowSystemGeneratedContextualActions();
        boolean applyNoReplyOnSingle = keepSingleRoom && Settings.enabled(Settings.NO_REPLY);
        Notification cleanSummary = ConversationPreview.copyWithoutPresentationExtras(summary);
        ConversationPreview.clearRedactedMediaExtras(cleanSummary.extras);
        cleanSummary.extras.remove(GENERIC_SUMMARY);
        cleanSummary.extras.remove(HOLD_PENDING);
        cleanSummary.extras.remove(ESCALATE_ALERT);
        cleanSummary.extras.remove(NATIVE_ACTIONS);
        cleanSummary.extras.remove(NATIVE_WEARABLE_ACTIONS);
        cleanSummary.extras.remove(ORIG_CONTEXTUAL_ACTIONS);
        cleanSummary.extras.remove(SLOT_EPOCH);
        cleanSummary.extras.remove(ACCOUNT);
        cleanSummary.extras.remove("line.chat.id");
        cleanSummary.extras.remove("line.message.id");
        Notification rebuilt = Notification.Builder.recoverBuilder(Settings.context(), cleanSummary)
                .setLargeIcon((android.graphics.drawable.Icon) null)
                .setAllowSystemGeneratedContextualActions(applyNoReplyOnSingle ? false : origCtxValue)
                .setOnlyAlertOnce(true).setShortcutId(remainingShortcut)
                .setContentIntent(targetIntent).setActions(new Notification.Action[0])
                .setStyle(null).setCustomContentView(null).setCustomBigContentView(null)
                .setCustomHeadsUpContentView(null).setContentTitle(title).setContentText(text)
                .setTicker(text).setSubText(null).setContentInfo(null).setNumber(0).build();
        ConversationPreview.clearRedactedMediaExtras(rebuilt.extras);
        rebuilt.actions = new Notification.Action[0];
        rebuilt.contentIntent = targetIntent;
        rebuilt.extras.putString(ACCOUNT, account);
        rebuilt.extras.remove(NATIVE_ACTIONS);
        rebuilt.extras.remove(NATIVE_WEARABLE_ACTIONS);
        if (applyNoReplyOnSingle) {
            rebuilt.extras.putBoolean(ORIG_CONTEXTUAL_ACTIONS, origCtxValue);
        } else {
            rebuilt.extras.remove(ORIG_CONTEXTUAL_ACTIONS);
        }
        if (keepSingleRoom) {
            rebuilt.extras.remove(GENERIC_SUMMARY);
            if (remainingChat != null && !remainingChat.isEmpty()) rebuilt.extras.putString("line.chat.id", remainingChat);
            else rebuilt.extras.remove("line.chat.id");
            if (remainingMessage != null && !remainingMessage.isEmpty()) rebuilt.extras.putString("line.message.id", remainingMessage);
            else rebuilt.extras.remove("line.message.id");
        } else {
            rebuilt.extras.putBoolean(GENERIC_SUMMARY, true);
            rebuilt.extras.remove("line.chat.id");
            rebuilt.extras.remove("line.message.id");
        }
        rebuilt.extras.remove(HOLD_PENDING);
        rebuilt.extras.remove(ESCALATE_ALERT);
        if (summary.publicVersion != null) {
            Notification pub = redactPublicNotification(summary.publicVersion, newMessage);
            pub.contentIntent = null;
            pub.extras.remove(GENERIC_SUMMARY);
            pub.extras.remove("line.chat.id");
            pub.extras.remove("line.message.id");
            rebuilt.publicVersion = pub;
        }
        rebuilt.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
        return rebuilt;
    }
}
