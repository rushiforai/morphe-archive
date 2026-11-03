package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.os.AsyncTask;

import java.lang.reflect.Method;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.features.readreceipts.ReadReceiptHooks;

/** 抑制した実際の既読処理を閲覧セッションに保存し、送信操作で一回だけ反映します。 */
public final class ReadWithoutReceiptSendHooks {
    private static final String BRIDGE = "linimalMarkReadAfterSend";

    /** セッションが終了すれば executor も解放します。移管時だけ同じ状態を引き継ぎます。 */
    static final class SendState {
        final ReadWithoutReceiptManualHooks.State manualState = new ReadWithoutReceiptManualHooks.State();
        private Object executor;
        private Method markRead;
        private long readPoint;
        private boolean submitted;
        private boolean scheduled;

        synchronized ReadAttempt record(Object candidate, long point) throws ReflectiveOperationException {
            if (candidate == null || point <= 0L || point < readPoint) {
                return null;
            }
            if (executor == null || executor.getClass() != candidate.getClass()) {
                Method method = candidate.getClass().getMethod(BRIDGE, long.class, String.class);
                if (method.getReturnType() != void.class) {
                    return null;
                }
                markRead = method;
            }
            executor = candidate;
            readPoint = point;
            return claimIfReady();
        }

        synchronized ReadAttempt onSubmitted(boolean keepUnreadAfterSend) {
            if (keepUnreadAfterSend) {
                return null;
            }
            submitted = true;
            return claimIfReady();
        }

        synchronized boolean hasReadAttempt() {
            return executor != null;
        }

        synchronized ReadAttempt snapshot() {
            return executor == null ? null : new ReadAttempt(executor, markRead, readPoint);
        }

        private ReadAttempt claimIfReady() {
            if (!submitted || executor == null || scheduled) {
                return null;
            }
            scheduled = true;
            return new ReadAttempt(executor, markRead, readPoint);
        }
    }

    static final class ReadAttempt {
        final Object executor;
        final Method markRead;
        final long readPoint;

        ReadAttempt(Object executor, Method markRead, long readPoint) {
            this.executor = executor;
            this.markRead = markRead;
            this.readPoint = readPoint;
        }
    }

    private ReadWithoutReceiptSendHooks() {
    }

    /** ローカル更新を止める入口で、その executor・既読位置・トーク ID を parameter のまま受け取ります。 */
    public static void recordReadAttempt(Object executor, long readPoint, String chatId) {
        try {
            if (ReadWithoutReceiptManualHooks.hasManualInvocation()) {
                return;
            }
            ReadWithoutReceiptHooks.Suppression session = matchingSession(chatId);
            if (session != null) {
                schedule(session, chatId, session.sendState.record(executor, readPoint));
            }
        } catch (Throwable ignored) {
            // bridge の取得に失敗しても、元の既読抑制判定をそのまま続けます。
        }
    }

    /** 通信の成功ではなく、確認済みのチャット UI による送信キュー投入後に呼びます。 */
    public static void onMessageSubmitted(String chatId) {
        try {
            ReadWithoutReceiptHooks.Suppression session = matchingSession(chatId);
            if (session != null) {
                // 送信が最初の既読観測より早い場合は、後続の recordReadAttempt が反映を開始します。
                schedule(session, chatId, session.sendState.onSubmitted(
                        LinimalConfig.get().isKeepUnreadAfterSendEnabled()));
            }
        } catch (Throwable ignored) {
            // hook の異常を送信操作へ伝播させません。
        }
    }

    private static ReadWithoutReceiptHooks.Suppression matchingSession(String chatId) {
        ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
        return session != null && session.confirmed && session.chatId.equals(chatId)
                && ReadWithoutReceiptHooks.shouldBlockMarkAsRead(chatId) ? session : null;
    }

    private static void schedule(ReadWithoutReceiptHooks.Suppression session, String chatId, ReadAttempt attempt) {
        if (attempt == null) {
            return;
        }
        // ローカル DB と RPC は UI thread で実行しません。新しい入室への遅延通知も CAS で拒否します。
        AsyncTask.THREAD_POOL_EXECUTOR.execute(() -> {
            try {
                if (!ReadWithoutReceiptHooks.shouldBlockMarkAsRead(chatId)
                        || !ReadWithoutReceiptHooks.endConfirmedSuppression(chatId, session)) {
                    return;
                }
                attempt.markRead.invoke(attempt.executor, attempt.readPoint, chatId);
            } catch (Throwable ignored) {
                // RPC の再送は LINE の既存処理に任せ、既読処理の失敗を送信操作へ伝播させません。
            } finally {
                ReadReceiptHooks.clearPreparedSupplier();
            }
        });
    }
}
