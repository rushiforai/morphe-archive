package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.app.Activity;
import android.os.Bundle;
import android.os.SystemClock;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import dev.utaa.linimal.extension.config.LinimalConfig;

/** 「既読をつけずに読む」の予約と、検証済みトーク Activity の閲覧セッションを管理します。 */
public final class ReadWithoutReceiptHooks {
    static final long SUPPRESSION_TIMEOUT_MILLIS = TimeUnit.MINUTES.toMillis(30);
    static final String SESSION_TOKEN_KEY = "dev.utaa.linimal.readWithoutReceipt.sessionToken";
    private static final AtomicLong NEXT_TOKEN = new AtomicLong();
    private static final AtomicReference<Suppression> SUPPRESSION = new AtomicReference<>();
    private static final AtomicReference<RecentlyEnded> RECENTLY_ENDED = new AtomicReference<>();
    static final long ENDED_GRACE_MILLIS = 2000L;

    private static final class RecentlyEnded {
        final String chatId;
        final long atMillis;

        RecentlyEnded(String chatId, long atMillis) {
            this.chatId = chatId;
            this.atMillis = atMillis;
        }
    }

    /** セッション所有者の不変 snapshot。既読観測は同じ token の SendState にだけ保存します。 */
    static final class Suppression {
        final String chatId;
        final boolean fromNotification;
        final long atMillis;
        final long token;
        final boolean confirmed;
        final WeakReference<Object> owner;
        final ReadWithoutReceiptSendHooks.SendState sendState;
        final ReadWithoutReceiptManualHooks.State manualState;

        Suppression(String chatId, long atMillis, long token, boolean confirmed, Object owner,
                boolean fromNotification, ReadWithoutReceiptSendHooks.SendState sendState) {
            this.chatId = chatId;
            this.fromNotification = fromNotification;
            this.atMillis = atMillis;
            this.token = token;
            this.confirmed = confirmed;
            this.owner = owner == null ? null : new WeakReference<>(owner);
            this.sendState = sendState;
            this.manualState = sendState.manualState;
        }

        Suppression withOwner(Object activity) {
            return new Suppression(chatId, atMillis, token, true, activity, fromNotification, sendState);
        }

        boolean owns(Object activity) {
            return activity != null && owner != null && owner.get() == activity;
        }
    }

    private ReadWithoutReceiptHooks() {
    }

    /** トークを開く直前の予約。期限は壁時計ではなく単調時刻で判定します。 */
    public static void markSuppressed(String chatId) {
        try {
            if (!LinimalConfig.get().isReadWithoutReceiptEnabled()) {
                clearSuppression();
                return;
            }
            markSuppressedAt(chatId, SystemClock.elapsedRealtime());
        } catch (Throwable ignored) {
            clearSuppression();
        }
    }

    static void markSuppressedAt(String chatId, long atMillis) {
        if (chatId != null) {
            SUPPRESSION.set(new Suppression(chatId, atMillis, NEXT_TOKEN.incrementAndGet(), false, null, false,
                    new ReadWithoutReceiptSendHooks.SendState()));
        }
    }

    static void markNotificationSuppressedAt(String chatId, long atMillis) {
        if (chatId != null && !chatId.isEmpty()) {
            SUPPRESSION.set(new Suppression(chatId, atMillis, NEXT_TOKEN.incrementAndGet(), false, null, true,
                    new ReadWithoutReceiptSendHooks.SendState()));
        }
    }

    private static boolean isSuppressionEnabled(Suppression observed) {
        LinimalConfig config = LinimalConfig.get();
        return observed != null && (observed.fromNotification
                ? config.isNotificationReadWithoutReceiptEnabled() : config.isReadWithoutReceiptEnabled());
    }

    /** 片方の設定が ON でも、OFF にされた入口の状態は復活させません。 */
    public static void clearDisabledSuppression(boolean manualEnabled, boolean notificationEnabled) {
        Suppression observed = currentSuppression();
        if (observed != null && !(observed.fromNotification ? notificationEnabled : manualEnabled)) {
            SUPPRESSION.compareAndSet(observed, null);
        }
    }

    static void clearNotificationObserved(Suppression observed) {
        if (observed != null && observed.fromNotification) {
            SUPPRESSION.compareAndSet(observed, null);
        }
    }

    /** ChatHistoryActivity の super.onCreate 直後に注入する、唯一の所有者確定入口です。 */
    public static void onChatCreated(Activity activity, Bundle savedState) {
        Suppression observed = currentSuppression();
        try {
            Bundle extras = activity.getIntent().getExtras();
            Object request = extras == null ? null : extras.getParcelable("chatHistoryRequest");
            if (RECENTLY_ENDED.get() != null) {
                clearRecentlyEnded(chatIdFromRequest(request));
            }
            if (!isSuppressionEnabled(observed)) {
                SUPPRESSION.compareAndSet(observed, null);
                return;
            }
            long savedToken = savedState == null ? 0L : savedState.getLong(SESSION_TOKEN_KEY, 0L);
            boolean registered = ReadWithoutReceiptForegroundTracker.ensureRegistered(activity);
            onChatCreatedRequestObserved(activity, request, savedToken, SystemClock.elapsedRealtime(),
                    true, registered, observed);
        } catch (Throwable ignored) {
            // 古い作成通知の失敗で、並行して登録された新しいセッションを消しません。
            SUPPRESSION.compareAndSet(observed, null);
        }
    }

    /** LINE 型に compile 依存せず、確認済みの公開 getter だけを呼びます。 */
    static String chatIdFromRequest(Object request) throws ReflectiveOperationException {
        if (request == null) {
            return null;
        }
        Method getter = request.getClass().getMethod("getChatId");
        if (getter.getReturnType() != String.class) {
            return null;
        }
        return (String) getter.invoke(request);
    }

    /** Android 非依存の作成境界。観測した状態だけを CAS で移管または解除します。 */
    static void onChatCreatedRequestObserved(Object activity, Object request, long savedToken,
            long nowMillis, boolean enabled, boolean registered, Suppression observed) {
        try {
            if (!enabled) {
                clearSuppression();
                return;
            }
            onChatCreatedObserved(activity, chatIdFromRequest(request), savedToken, nowMillis,
                    true, registered, observed);
        } catch (Throwable ignored) {
            SUPPRESSION.compareAndSet(observed, null);
        }
    }

    static void onChatCreatedObserved(Object activity, String chatId, long savedToken, long nowMillis,
            boolean enabled, boolean registered, Suppression observed) {
        if (!enabled) {
            clearSuppression();
            return;
        }
        if (observed == null) {
            return;
        }
        if (savedToken != 0L) {
            // 古い restore は、すでに別 Activity に移ったセッションへ干渉できません。
            if (observed.token != savedToken || !observed.confirmed || observed.owner != null) {
                return;
            }
            Suppression restored = registered && activity != null && observed.chatId.equals(chatId)
                    ? observed.withOwner(activity) : null;
            SUPPRESSION.compareAndSet(observed, restored);
            return;
        }
        // saved token のない再入室は、同じ chatId でも以前の閲覧セッションではありません。
        Suppression confirmed = !observed.confirmed && registered && activity != null
                && observed.chatId.equals(chatId)
                && nowMillis - observed.atMillis <= SUPPRESSION_TIMEOUT_MILLIS
                ? observed.withOwner(activity) : null;
        SUPPRESSION.compareAndSet(observed, confirmed);
    }

    /** ローカル未読反映と送信 RPC の両方で使う入口です。 */
    public static boolean shouldBlockMarkAsRead(String chatId) {
        try {
            if (ReadWithoutReceiptManualHooks.hasManualInvocation()) {
                return ReadWithoutReceiptManualHooks.blockManualInvocation(chatId);
            }
            if (isRecentlyEnded(chatId, monotonicMillis())) {
                return true;
            }
            LinimalConfig config = LinimalConfig.get();
            return shouldBlockGivenSources(chatId, SystemClock.elapsedRealtime(), currentSuppression(),
                    config.isReadWithoutReceiptEnabled(), config.isNotificationReadWithoutReceiptEnabled());
        } catch (Throwable ignored) {
            clearSuppression();
            return false;
        }
    }

    static boolean shouldBlockGivenEnabled(String chatId, long nowMillis, boolean enabled) {
        if (!enabled) {
            clearSuppression();
            return false;
        }
        return shouldBlockGivenObserved(chatId, nowMillis, currentSuppression());
    }

    static boolean shouldBlockGivenObserved(String chatId, long nowMillis, Suppression observed) {
        return shouldBlockGivenSources(chatId, nowMillis, observed, true, true);
    }

    static boolean shouldBlockGivenSources(String chatId, long nowMillis, Suppression observed,
            boolean manualEnabled, boolean notificationEnabled) {
        while (observed != null) {
            Suppression current = SUPPRESSION.get();
            if (current != observed) {
                observed = current;
                continue;
            }
            if (!(observed.fromNotification ? notificationEnabled : manualEnabled)) {
                if (SUPPRESSION.compareAndSet(observed, null)) {
                    return false;
                }
                observed = SUPPRESSION.get();
                continue;
            }
            if (chatId == null || !observed.chatId.equals(chatId)) {
                return false;
            }
            if (!observed.confirmed && nowMillis - observed.atMillis > SUPPRESSION_TIMEOUT_MILLIS) {
                if (SUPPRESSION.compareAndSet(observed, null)) {
                    return false;
                }
                // 判定中に確定されたセッションは期限切れにせず、現在の状態で判定し直します。
                observed = SUPPRESSION.get();
                continue;
            }
            return true;
        }
        return false;
    }

    /** 指定トークの確定セッションだけを終了します。予約や別トークには触れません。 */
    static boolean endConfirmedSuppression(String chatId, Suppression observed) {
        if (observed == null || !observed.confirmed || chatId == null || !observed.chatId.equals(chatId)) {
            return false;
        }
        Suppression current = currentSuppression();
        while (current != null && current.confirmed && current.token == observed.token) {
            if (SUPPRESSION.compareAndSet(current, null)) {
                return true;
            }
            current = currentSuppression();
        }
        return false;
    }

    static long sessionTokenFor(Object activity) {
        Suppression observed = currentSuppression();
        return observed != null && observed.confirmed && observed.owns(activity) ? observed.token : 0L;
    }

    static void endActivity(Object activity, boolean changingConfigurations, boolean ending) {
        endActivityObserved(activity, changingConfigurations, ending, currentSuppression());
    }

    static void endActivityObserved(Object activity, boolean changingConfigurations, boolean ending,
            Suppression observed) {
        endActivityObserved(activity, changingConfigurations, ending, observed, monotonicMillis());
    }

    static void endActivityObserved(Object activity, boolean changingConfigurations, boolean ending,
            Suppression observed, long endMillis) {
        if (observed == null || !observed.confirmed || !observed.owns(activity)) {
            return;
        }
        if (changingConfigurations) {
            SUPPRESSION.compareAndSet(observed, observed.withOwner(null));
        } else if (ending && SUPPRESSION.compareAndSet(observed, null)) {
            RECENTLY_ENDED.set(new RecentlyEnded(observed.chatId, endMillis));
        }
    }

    private static long monotonicMillis() {
        return System.nanoTime() / 1_000_000L;
    }

    /**
     * 閲覧中に予約された公式の既読タスクが、閉じた直後に抑制なしで実行されないようにします。
     * タスクの出所は判別できないため、閉じた直後の短い間だけ同じトークの自動既読を止めます。
     * 同じトークへの再入室では {@link #onChatCreated} の時点で解除します。別トークの入室では解除しません。
     */
    static void clearRecentlyEnded(String chatId) {
        RecentlyEnded ended = RECENTLY_ENDED.get();
        if (ended != null && ended.chatId.equals(chatId)) {
            RECENTLY_ENDED.compareAndSet(ended, null);
        }
    }

    static boolean isRecentlyEnded(String chatId, long nowMillis) {
        RecentlyEnded ended = RECENTLY_ENDED.get();
        if (ended == null) {
            return false;
        }
        if (nowMillis < ended.atMillis || nowMillis - ended.atMillis >= ENDED_GRACE_MILLIS) {
            RECENTLY_ENDED.compareAndSet(ended, null);
            return false;
        }
        return ended.chatId.equals(chatId);
    }

    /** 設定 OFF・patch health 失敗時にも、以前の予約と閲覧セッションを破棄します。 */
    public static void clearSuppression() {
        SUPPRESSION.set(null);
        RECENTLY_ENDED.set(null);
    }

    static Suppression currentSuppression() {
        return SUPPRESSION.get();
    }

    static void resetForTesting() {
        clearSuppression();
    }
}
