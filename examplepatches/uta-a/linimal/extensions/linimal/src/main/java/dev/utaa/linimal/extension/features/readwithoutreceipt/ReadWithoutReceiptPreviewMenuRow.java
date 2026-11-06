package dev.utaa.linimal.extension.features.readwithoutreceipt;

/**
 * スクロールプレビュー画面のメニューへ「既読をつけずに読む」行を描く Compose コードの置き場です。
 *
 * <p>Java 側には何も実装がありません。bytecode patch が build 時に
 * {@code public static render(Ljava/lang/Object;<Composer>)V} を追加し、プレビューのメニューを描く
 * composable の行一覧の直前から、その呼び出しを 1 命令だけ注入します。第 1 引数は長押しされた
 * トークの model で、トーク ID は patch が導出した field から読みます。</p>
 */
public final class ReadWithoutReceiptPreviewMenuRow {
    private ReadWithoutReceiptPreviewMenuRow() {
    }
}
