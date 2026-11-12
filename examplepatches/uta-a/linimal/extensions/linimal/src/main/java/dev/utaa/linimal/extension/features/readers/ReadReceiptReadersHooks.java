package dev.utaa.linimal.extension.features.readers;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import dev.utaa.linimal.extension.config.LinimalConfig;

/**
 * 既読者の表示の入口。patch が生成した {@link ReadReceiptReadersBridge} の method から呼ばれます。
 *
 * <p>どの入口も fail-open です。設定 OFF・未初期化・対象外のトーク・例外のときは、LINE の表示と
 * 操作をそのまま残し、以前に Linimal が加えた変更だけを取り除きます。</p>
 */
public final class ReadReceiptReadersHooks {
    private ReadReceiptReadersHooks() {
    }

    /**
     * LINE が既読ラベルの文言と表示状態を決めた直後に呼ばれます。
     *
     * @param label           {@code chat_ui_row_read_count}
     * @param chatId          トークの chat ID
     * @param serverMessageId 行のメッセージの server ID。送信中は 0 以下
     * @param senderMid       行のメッセージの送信者。ラベルが表示される行は自分のメッセージです
     */
    public static void onReadCountBound(TextView label, String chatId, long serverMessageId, String senderMid) {
        if (label == null) {
            return;
        }
        try {
            boolean visible = label.getVisibility() == View.VISIBLE;
            if (visible) {
                ReadersSelf.rememberFromOwnMessage(senderMid);
            }
            LinimalConfig config = LinimalConfig.get();
            boolean icons = config.isReadReceiptReadersIconsEnabled();
            boolean tap = config.isReadReceiptReadersTapEnabled();
            if (!shouldDecorate(visible, icons, tap, chatId, serverMessageId)) {
                ReadCountLabelDecorator.clear(label);
                return;
            }
            ReadCountLabelDecorator.apply(label, chatId, serverMessageId, senderMid, icons, tap);
        } catch (Throwable throwable) {
            try {
                ReadCountLabelDecorator.clear(label);
            } catch (Throwable ignored) {
                // LINE の bind は続けます。
            }
        }
    }

    /**
     * 行の bind の入口で、すべての行について呼ばれます。他人のメッセージにだけ、時刻の上へ既読数と
     * 既読者のアイコンを描きます。自分のメッセージは既読ラベル側（{@link #onReadCountBound}）が扱います。
     *
     * @param timestamp         {@code chat_ui_row_timestamp}
     * @param isOtherUserMessage 他人が送ったメッセージかどうか
     */
    public static void onMessageBound(
            TextView timestamp,
            String chatId,
            long serverMessageId,
            String senderMid,
            boolean isOtherUserMessage) {
        if (timestamp == null) {
            return;
        }
        try {
            LinimalConfig config = LinimalConfig.get();
            boolean count = config.isReadReceiptReadersOthersCountEnabled();
            boolean icons = config.isReadReceiptReadersOthersIconsEnabled();
            if (!shouldDecorateReceived(isOtherUserMessage, count, icons, chatId, serverMessageId)) {
                ReceivedTimestampDecorator.clear(timestamp);
                return;
            }
            ReceivedTimestampDecorator.apply(timestamp, chatId, serverMessageId, senderMid, count, icons,
                    config.isReadReceiptReadersTapEnabled());
        } catch (Throwable throwable) {
            try {
                ReceivedTimestampDecorator.clear(timestamp);
            } catch (Throwable ignored) {
                // LINE の bind は続けます。
            }
        }
    }

    /**
     * 長押しメニューの項目を並べ終え、LINE が配色を当てる直前に呼ばれます。
     *
     * @param actionContainer {@code chat_ui_message_context_menu_action_content_container}
     * @param menuDialog      メニュー本体。項目を押したときに閉じます
     */
    public static void onContextMenuBuilt(
            Object actionContainer,
            Object menuDialog,
            String chatId,
            long serverMessageId,
            String senderMid) {
        try {
            if (!(actionContainer instanceof ViewGroup)
                    || !LinimalConfig.get().isReadReceiptReadersMenuEnabled()
                    || !ReadersChat.isMultiMemberChat(chatId)
                    || !ReadersChat.isServerMessage(serverMessageId)) {
                return;
            }
            ViewGroup container = (ViewGroup) actionContainer;
            ContextMenuReadersItem.add(container, ContextMenuReadersItem.openReaders(
                    menuDialog, container.getContext(), chatId, serverMessageId, senderMid));
        } catch (Throwable ignored) {
            // 項目を足せなくても、LINE のメニューはそのまま開きます。
        }
    }

    static boolean shouldDecorateReceived(
            boolean isOtherUserMessage, boolean count, boolean icons, String chatId, long serverMessageId) {
        return isOtherUserMessage
                && (count || icons)
                && ReadersChat.isMultiMemberChat(chatId)
                && ReadersChat.isServerMessage(serverMessageId);
    }

    static boolean shouldDecorate(
            boolean labelVisible, boolean icons, boolean tap, String chatId, long serverMessageId) {
        return labelVisible
                && (icons || tap)
                && ReadersChat.isMultiMemberChat(chatId)
                && ReadersChat.isServerMessage(serverMessageId);
    }
}
