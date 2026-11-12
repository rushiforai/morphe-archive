package dev.utaa.linimal.extension.features.readers;

/**
 * 既読者を表示できるトークかどうかの判定。
 *
 * <p>LINE は chat ID の先頭 1 文字で種類を区別します（{@code c} がグループ、{@code r} が複数人トーク、
 * {@code u} が 1 対 1、{@code m}/{@code s}/{@code t}/{@code p} がオープンチャット系）。既読者を
 * 列挙する意味があり、かつ {@code read_message_range} にメンバーごとの範囲が保存されるのは
 * グループと複数人トークだけです。</p>
 */
public final class ReadersChat {
    private ReadersChat() {
    }

    /** グループまたは複数人トークの chat ID かどうか。 */
    public static boolean isMultiMemberChat(String chatId) {
        if (chatId == null || chatId.length() < 2) {
            return false;
        }
        char kind = chatId.charAt(0);
        return kind == 'c' || kind == 'r';
    }

    /** server 上の message ID が確定しているかどうか。送信中の行は 0 以下です。 */
    public static boolean isServerMessage(long serverMessageId) {
        return serverMessageId > 0;
    }

    /** LINE の mid として扱える値かどうか。 */
    static boolean isMid(String mid) {
        return mid != null && mid.length() > 1;
    }
}
