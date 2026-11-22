package dev.utaa.linimal.extension.features.readers;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * トークを開いたときに、そのトークの既読範囲を 1 回だけサーバーと同期します。
 *
 * <p>端末内の {@code read_message_range} には、他人のメッセージを誰が読んだかが同期まで入らないことがあり、
 * 一覧を開いて同期するまでアイコンが出ませんでした。「開くたびにサーバーと同期」が ON のときは、
 * 他人のメッセージの行が最初に bind された時点で同期し、表示中の行を読み直します。</p>
 *
 * <p>「開いた」は、画面（Activity）とトークの組で初めて行が bind されたことで判定します。同じ画面の中での
 * スクロールや新着の bind では同期しません。同期に失敗したときは {@link #RETRY_MILLIS} あけた次の bind で
 * 再試行します。画面は弱参照で持つため、閉じた画面の記録は一緒に捨てられます。main thread からだけ呼びます。</p>
 */
final class ChatOpenSync {
    /** 失敗した同期を再試行するまでの間隔。オフラインのときに bind のたびに通信しないようにします。 */
    static final long RETRY_MILLIS = 30_000L;
    /** 同期を始めた、または同期が済んだ組の印。失敗した組には再試行してよい時刻を入れます。 */
    private static final long DONE = Long.MAX_VALUE;
    private static final Map<Object, Map<String, Long>> OPENED = new WeakHashMap<>();

    private ChatOpenSync() {
    }

    /** 他人のメッセージの行を表示する直前に呼びます。同期しない場合は何もしません。 */
    static void onReceivedRowBound(TextView timestamp, String chatId, boolean syncEnabled) {
        // 設定 OFF なら reflection の解決も行いません。
        if (!syncEnabled || !shouldSync(true, ReadReceiptReadersBridge.isSyncAvailable(), chatId)) {
            return;
        }
        Context context = timestamp.getContext();
        Object screen = screenOf(context);
        if (!markFirstOpen(screen, chatId, SystemClock.elapsedRealtime())) {
            return;
        }
        // 通信中に画面が閉じても Activity を引き留めないよう、弱参照で持ちます。
        WeakReference<Object> target = new WeakReference<>(screen);
        ReadersRepository.get(context).sync(chatId, success -> {
            if (success) {
                ReceivedTimestampDecorator.reloadChat(chatId);
            } else {
                markFailed(target.get(), chatId, SystemClock.elapsedRealtime());
            }
        });
    }

    static boolean shouldSync(boolean syncEnabled, boolean syncAvailable, String chatId) {
        return syncEnabled && syncAvailable && ReadersChat.isMultiMemberChat(chatId);
    }

    /**
     * 画面とトークの組で初めてのとき、または失敗した同期の再試行の時刻を過ぎたときだけ true を返し、
     * その組を同期済みとして記録します。
     */
    static boolean markFirstOpen(Object screen, String chatId, long nowMillis) {
        if (screen == null || chatId == null) {
            return false;
        }
        synchronized (OPENED) {
            Map<String, Long> chats = OPENED.get(screen);
            if (chats == null) {
                chats = new HashMap<>();
                OPENED.put(screen, chats);
            }
            Long retryAt = chats.get(chatId);
            if (retryAt != null && nowMillis < retryAt) {
                return false;
            }
            chats.put(chatId, DONE);
            return true;
        }
    }

    /** 同期に失敗した組を、{@link #RETRY_MILLIS} 後に再試行できるようにします。記録のない組は無視します。 */
    static void markFailed(Object screen, String chatId, long nowMillis) {
        if (screen == null || chatId == null) {
            return;
        }
        synchronized (OPENED) {
            Map<String, Long> chats = OPENED.get(screen);
            if (chats != null && chats.containsKey(chatId)) {
                chats.put(chatId, nowMillis + RETRY_MILLIS);
            }
        }
    }

    /** View の Context から Activity を探します。見つからなければ Context 自身を画面として扱います。 */
    private static Object screenOf(Context context) {
        Context current = context;
        for (int depth = 0; current != null && depth < 16; depth++) {
            if (current instanceof Activity) {
                return current;
            }
            if (!(current instanceof ContextWrapper)) {
                break;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) {
                break;
            }
            current = base;
        }
        return context;
    }

    static void resetForTesting() {
        synchronized (OPENED) {
            OPENED.clear();
        }
    }
}
