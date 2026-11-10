package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.app.Activity;
import android.os.AsyncTask;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

import dev.utaa.linimal.extension.features.readreceipts.ReadReceiptHooks;
import dev.utaa.linimal.extension.i18n.LinimalText;

/** 「すべて既読にする」だけを worker に許可します。成功すると閲覧セッションを終えます。 */
public final class ReadWithoutReceiptManualHooks {
    private static final String BRIDGE = "linimalMarkReadManually";
    private static final ThreadLocal<ReadWithoutReceiptHooks.Suppression> INVOCATION = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> INVOCATION_BLOCKED = new ThreadLocal<>();

    /** 構成変更では引き継ぎ、再入室では破棄する操作状態です。 */
    static final class State {
        private boolean pending;

        synchronized boolean begin() {
            if (pending) {
                return false;
            }
            pending = true;
            return true;
        }

        synchronized void finish() {
            pending = false;
        }

        synchronized boolean isPending() {
            return pending;
        }
    }

    private ReadWithoutReceiptManualHooks() {
    }

    static boolean isReady(Activity activity) {
        ReadWithoutReceiptHooks.Suppression session = sessionFor(activity);
        return session != null && session.sendState.hasReadAttempt() && !session.manualState.isPending();
    }

    private static ReadWithoutReceiptHooks.Suppression sessionFor(Activity activity) {
        try {
            ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
            return session != null && session.confirmed && session.owns(activity)
                    && ReadWithoutReceiptHooks.shouldBlockMarkAsRead(session.chatId) ? session : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** 実行中にセッションが替わって送信を止めた場合は、この呼び出しを未送信として記録します。 */
    static boolean blockManualInvocation(String chatId) {
        if (isManualRead(chatId)) {
            return false;
        }
        INVOCATION_BLOCKED.set(Boolean.TRUE);
        return true;
    }

    static boolean hasManualInvocation() {
        return INVOCATION.get() != null;
    }

    /** local gate と RPC gate の両方で使う、同一 worker・同一 token 限定の許可です。 */
    static boolean isManualRead(String chatId) {
        ReadWithoutReceiptHooks.Suppression allowed = INVOCATION.get();
        ReadWithoutReceiptHooks.Suppression current = ReadWithoutReceiptHooks.currentSuppression();
        return allowed != null && current != null && current.confirmed
                && current.token == allowed.token && current.chatId.equals(chatId);
    }

    static void markAll(Activity activity) {
        ReadWithoutReceiptHooks.Suppression session = sessionFor(activity);
        if (session == null) {
            return;
        }
        ReadWithoutReceiptSendHooks.ReadAttempt attempt = session.sendState.snapshot();
        if (attempt == null || !session.manualState.begin()) {
            return;
        }
        WeakReference<Activity> owner = new WeakReference<>(activity);
        try {
            AsyncTask.SERIAL_EXECUTOR.execute(() -> execute(owner, session, attempt.executor, attempt.readPoint));
        } catch (Throwable ignored) {
            session.manualState.finish();
            showResult(resultTarget(session), false, false);
        }
    }

    private static void execute(WeakReference<Activity> owner, ReadWithoutReceiptHooks.Suppression session,
            Object executor, long point) {
        long completed = 0L;
        try {
            Activity activity = owner.get();
            ReadWithoutReceiptHooks.Suppression current = sessionFor(activity);
            if (current == null || current.token != session.token) {
                return;
            }
            completed = invokeRead(session, executor, point);
        } catch (Throwable ignored) {
            // 元の RPC 再送経路は変更せず、bridge の例外を UI へ伝播させません。
        } finally {
            // 実行中の回転で所有者が移っても、終了前に最新の Activity を通知先として確定します。
            ReadWithoutReceiptHooks.Suppression target = resultTarget(session);
            showResult(target, completed > 0L, finishRead(session, completed));
        }
    }

    /** 同じセッションが続いていれば、構成変更後の所有者を持つ最新の状態を返します。 */
    static ReadWithoutReceiptHooks.Suppression resultTarget(ReadWithoutReceiptHooks.Suppression session) {
        ReadWithoutReceiptHooks.Suppression current = ReadWithoutReceiptHooks.currentSuppression();
        return current != null && current.token == session.token ? current : session;
    }

    /** トーク全体を既読にできた場合は閲覧セッションを終え、以降を通常の LINE へ戻します。失敗時は続けます。 */
    static boolean finishRead(ReadWithoutReceiptHooks.Suppression session, long completed) {
        session.manualState.finish();
        return completed > 0L && ReadWithoutReceiptHooks.endConfirmedSuppression(session.chatId, session);
    }

    /** Android に依存しない worker 境界。失敗・入室変更時にも thread 上の許可を残しません。 */
    static long invokeRead(ReadWithoutReceiptHooks.Suppression session, Object executor,
            long point) throws ReflectiveOperationException {
        ReadWithoutReceiptHooks.Suppression current = ReadWithoutReceiptHooks.currentSuppression();
        if (current == null || !current.confirmed || current.token != session.token) {
            return 0L;
        }
        Method bridge = executor.getClass().getMethod(BRIDGE, long.class, String.class);
        if (bridge.getReturnType() != long.class) {
            return 0L;
        }
        try {
            INVOCATION.set(session);
            ReadReceiptHooks.prepareSentMessageRead(session.chatId);
            long completed = (Long) bridge.invoke(executor, point, session.chatId);
            return INVOCATION_BLOCKED.get() == null ? completed : 0L;
        } finally {
            INVOCATION.remove();
            INVOCATION_BLOCKED.remove();
            ReadReceiptHooks.clearPreparedSupplier();
        }
    }

    private static void showResult(ReadWithoutReceiptHooks.Suppression session, boolean success, boolean ended) {
        ReadWithoutReceiptHooks.Suppression current = ReadWithoutReceiptHooks.currentSuppression();
        long token = session.token;
        Object candidate = (ended || (current != null && current.token == token)) && session.owner != null
                ? session.owner.get() : null;
        if (!(candidate instanceof Activity)) {
            return;
        }
        Activity activity = (Activity) candidate;
        activity.runOnUiThread(() -> {
            try {
                if (!activity.isFinishing() && !activity.isDestroyed()
                        && (ended || ReadWithoutReceiptHooks.sessionTokenFor(activity) == token)) {
                    // worker の状態変更だけでは次の描画が起きないため、案内とボタンの更新を促します。
                    activity.getWindow().getDecorView().invalidate();
                    Toast.makeText(activity, success ? LinimalText.t("既読処理を実行しました") : LinimalText.t("既読を反映できませんでした"),
                            Toast.LENGTH_SHORT).show();
                }
            } catch (Throwable ignored) {
                // 案内を表示できなくても、公式の画面操作は続けます。
            }
        });
    }
}
