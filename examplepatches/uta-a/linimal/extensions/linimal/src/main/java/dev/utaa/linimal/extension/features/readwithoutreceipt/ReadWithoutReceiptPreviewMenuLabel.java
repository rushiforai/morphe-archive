package dev.utaa.linimal.extension.features.readwithoutreceipt;

/**
 * スクロールプレビュー画面のメニューに出す「既読をつけずに読む」行のラベルを描く Compose ラムダの器です。
 *
 * <p>Java 側には何も実装がありません。bytecode patch が build 時に、プレビューのメニュー行のラベル
 * lambda と同じ interface を {@code interfaces} へ加え、{@code invoke(Object, Object)Object} を
 * 追加します。追加される本体は {@link ChatListMenuHooks#menuLabel()} の文字列をプレビューの行の
 * Text composable へ渡します。</p>
 *
 * <p>この前提のため、ソース上で {@code invoke} を定義してはいけません。</p>
 */
public final class ReadWithoutReceiptPreviewMenuLabel {
    /** bytecode patch が {@code new-instance} + {@code invoke-direct} で使う public な no-arg constructor。 */
    public ReadWithoutReceiptPreviewMenuLabel() {
    }
}
