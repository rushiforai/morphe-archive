package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import dev.utaa.linimal.extension.core.KotlinUnit;

import java.lang.reflect.Method;

/**
 * トーク一覧の長押しメニューにある「既読をつけずに読む」をタップしたときに実行される callback です。
 *
 * <p>bytecode patch がこのクラスをインスタンス化する時点で {@code interfaces} へ
 * 難読化された Kotlin {@code Function0}（{@code Lvb8/a;}）を追加します。extension は LINE の
 * 難読化クラスをコンパイル時に参照できないため、この interface はソース上で {@code implements}
 * せず、erased signature が一致する {@link #invoke()} だけを公開します。</p>
 *
 * <p>対象のトーク ID と、メニューを閉じるための Kotlin {@code Function0} は patch が
 * {@link #ReadWithoutReceiptAction(String, Object)} で渡します。ここでの失敗はすべて握りつぶし、
 * LINE の挙動へ影響させません。</p>
 */
public final class ReadWithoutReceiptAction {
    /**
     * LINE の正規のトーク起動口である {@code LineSchemeServiceActivity}（{@code scheme="line"}）が
     * 受け取る URL scheme です。ID だけを渡せば 1:1 かグループかは LINE 側が解決するため、
     * 呼び出し側でトーク種別を判定する必要がありません。
     */
    private static final String CHAT_ROOM_URI_PREFIX = "line://nv/openChatroom/?id=";

    /** Kotlin の Unit class 名を定数として書くと shrinker が同名クラスを extension へ取り込むため、
     * SettingsEntryFactory と同様に実行時に組み立てます。 */

    private final String chatId;
    private final Object dismiss;

    /**
     * bytecode patch が {@code new-instance} + {@code invoke-direct} で使う constructor です。
     * patch 側の smali が固定のシグネチャで呼ぶため、引数の順序と型を変更しないでください。
     *
     * @param chatId  長押しされたトークの ID。
     * @param dismiss メニューを閉じる難読化された Kotlin {@code Function0}。null 可。
     */
    public ReadWithoutReceiptAction(String chatId, Object dismiss) {
        this.chatId = chatId;
        this.dismiss = dismiss;
    }

    /**
     * {@code Lvb8/a;->invoke()Ljava/lang/Object;} と erased signature が一致する実装です。
     * 戻り値は呼び出し側で破棄されるため、Kotlin の Unit を取得できなければ null を返します。
     */
    public Object invoke() {
        // 先にメニューを閉じます。閉じられなくても既読抑制とトークの表示は続行します。
        dismissMenu(dismiss);
        try {
            open();
        } catch (Throwable ignored) {
            // メニューは既に閉じているため、ここでの失敗は LINE の挙動へ影響させません。
        }
        return unitInstance();
    }

    /**
     * 難読化された Kotlin {@code Function0} をコンパイル時に参照できないため、reflection で
     * {@code invoke()} を呼びます。呼べなかった場合もメニューが残るだけなので、失敗は無視します。
     */
    static void dismissMenu(Object dismiss) {
        if (dismiss == null) {
            return;
        }
        try {
            Method invoke = dismiss.getClass().getMethod("invoke");
            try {
                // 難読化されたラムダのクラス自体が public でない場合に備えます。
                invoke.setAccessible(true);
            } catch (Throwable ignored) {
                // setAccessible が拒否されても、public なクラスならそのまま呼べます。
            }
            invoke.invoke(dismiss);
        } catch (Throwable ignored) {
            // メニューが閉じないだけで、以降の処理は続行します。
        }
    }

    private void open() {
        if (chatId == null || chatId.length() == 0) {
            return;
        }
        Context context = ChatListMenuHooks.applicationContext();
        if (context == null) {
            return;
        }

        // 既読抑制は、トークを実際に開く前に登録します。開けなかった場合に抑制だけが残っても、
        // ReadWithoutReceiptHooks 側のタイムアウトが最終的に解除します。
        ReadWithoutReceiptHooks.markSuppressed(chatId);

        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(chatRoomUri(Uri.encode(chatId))));
        // scheme のハンドラは exported なため、明示的に LINE 自身へ限定して他アプリへ渡しません。
        intent.setPackage(context.getPackageName());
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    /**
     * {@code line://nv/openChatroom/?id=<chatId>} を組み立てます。
     * {@code encodedChatId} は {@code Uri.encode} 済みの値を渡してください。
     */
    static String chatRoomUri(String encodedChatId) {
        return CHAT_ROOM_URI_PREFIX + encodedChatId;
    }

    private static Object unitInstance() {
        return KotlinUnit.get(ReadWithoutReceiptAction.class.getClassLoader());
    }
}
