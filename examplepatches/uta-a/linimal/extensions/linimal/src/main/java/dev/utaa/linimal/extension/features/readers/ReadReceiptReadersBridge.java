package dev.utaa.linimal.extension.features.readers;

import android.content.Context;

import java.lang.reflect.Method;

/**
 * LINE の難読化された型を扱う static method の器です。中身は build 時に patch が生成します。
 *
 * <ul>
 *   <li>{@code onReadCountBound(TextView, <message>)}: 既読ラベルの bind 直後に LINE から呼ばれ、
 *       chat ID・server message ID・送信者 mid を取り出して {@link ReadReceiptReadersHooks} へ渡します。</li>
 *   <li>{@code onContextMenuBuilt(View, <params>, Object)}: 長押しメニューの項目を並べ終えた直後に呼ばれます。</li>
 *   <li>{@code myMid(Context)String}: LINE 自身の helper で、このアカウントの mid を返します。</li>
 *   <li>{@code syncReadRange(Context, String)Z}: LINE の ReadCountManager が全トークに対して行う
 *       既読範囲の同期（getMessageReadRange）を、1 トークだけ実行します。</li>
 * </ul>
 *
 * <p>Java のコードからは生成メソッドを直接参照できないため、同期だけは {@link #requestSync} から
 * reflection で呼び出します（生成メソッドと名前が重ならないよう、Java 側は別名にしています）。
 * patch が適用されていない build では見つからず、同期せずにローカルの記録だけを表示します。</p>
 */
public final class ReadReceiptReadersBridge {
    static final String SYNC_METHOD_NAME = "syncReadRange";
    static final String OWN_MID_METHOD_NAME = "myMid";

    private static volatile Method syncMethod;
    private static volatile boolean syncMethodResolved;
    private static volatile Method ownMidMethod;
    private static volatile boolean ownMidMethodResolved;

    private ReadReceiptReadersBridge() {
    }

    /**
     * LINE 自身の同期処理で、指定トークの既読範囲をサーバーから取り直します。通信を伴うため、
     * main thread からは呼びません。成功したときだけ true を返します。
     */
    static boolean requestSync(Context context, String chatId) {
        Method method = resolveSyncMethod();
        if (method == null || context == null || chatId == null) {
            return false;
        }
        try {
            Object result = method.invoke(null, context, chatId);
            return Boolean.TRUE.equals(result);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** このアカウントの mid。生成メソッドがない build や、取得に失敗した場合は null です。 */
    static String requestOwnMid(Context context) {
        if (context == null) {
            return null;
        }
        if (!ownMidMethodResolved) {
            Method found = null;
            try {
                Method candidate = ReadReceiptReadersBridge.class.getDeclaredMethod(
                        OWN_MID_METHOD_NAME, Context.class);
                if (candidate.getReturnType() == String.class) {
                    candidate.setAccessible(true);
                    found = candidate;
                }
            } catch (Throwable ignored) {
                found = null;
            }
            ownMidMethod = found;
            ownMidMethodResolved = true;
        }
        Method method = ownMidMethod;
        if (method == null) {
            return null;
        }
        try {
            Object result = method.invoke(null, context.getApplicationContext());
            return result instanceof String ? (String) result : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** 同期用の生成メソッドが build に含まれているかどうか。 */
    static boolean isSyncAvailable() {
        return resolveSyncMethod() != null;
    }

    private static Method resolveSyncMethod() {
        if (syncMethodResolved) {
            return syncMethod;
        }
        Method found = null;
        try {
            Method candidate = ReadReceiptReadersBridge.class.getDeclaredMethod(
                    SYNC_METHOD_NAME, Context.class, String.class);
            if (candidate.getReturnType() == boolean.class) {
                candidate.setAccessible(true);
                found = candidate;
            }
        } catch (Throwable ignored) {
            found = null;
        }
        syncMethod = found;
        syncMethodResolved = true;
        return found;
    }
}
