package dev.utaa.linimal.extension.features.readers;

import android.content.Context;

/**
 * この端末のアカウントの mid。
 *
 * <p>LINE は自分の Profile を暗号化して保存しているため、DB からは読みません。patch が生成した
 * {@code ReadReceiptReadersBridge.myMid} で LINE 自身の helper から取得します。生成メソッドがない build や
 * 取得に失敗した場合に備え、既読ラベルが表示される行（自分の送信メッセージ）の送信者 mid も覚えておき、
 * 代わりに使います。</p>
 */
final class ReadersSelf {
    private static volatile String resolved;
    private static volatile String learned;

    private ReadersSelf() {
    }

    static void rememberFromOwnMessage(String senderMid) {
        if (ReadersChat.isMid(senderMid)) {
            learned = senderMid;
        }
    }

    /** worker thread から呼びます。LINE から取得できた値は以後使い続けます。 */
    static String mid(Context context) {
        String value = resolved;
        if (value != null) {
            return value;
        }
        String fromLine = ReadReceiptReadersBridge.requestOwnMid(context);
        if (ReadersChat.isMid(fromLine)) {
            resolved = fromLine;
            return fromLine;
        }
        return learned;
    }

    /** 学習した値だけを返します。test 用です。 */
    static String learnedMid() {
        return learned;
    }

    static void resetForTesting() {
        resolved = null;
        learned = null;
    }
}
