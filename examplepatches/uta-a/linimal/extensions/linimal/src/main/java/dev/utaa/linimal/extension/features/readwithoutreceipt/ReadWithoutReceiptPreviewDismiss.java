package dev.utaa.linimal.extension.features.readwithoutreceipt;

import dev.utaa.linimal.extension.core.KotlinUnit;

/**
 * スクロールプレビュー画面の「既読をつけずに読む」行で、トークを開く前にプレビューを閉じる callback です。
 *
 * <p>{@link ReadWithoutReceiptAction} は {@code dismiss} の public な {@code invoke()} を reflection で
 * 呼びます。プレビューのメニューには閉じるための lambda が渡らないため、前面のプレビュー画面を
 * {@link ReadWithoutReceiptPreviewTracker} から取り出して finish します。閉じられなくてもトークは開きます。</p>
 */
public final class ReadWithoutReceiptPreviewDismiss {
    /** bytecode patch が {@code new-instance} + {@code invoke-direct} で使う public な no-arg constructor。 */
    public ReadWithoutReceiptPreviewDismiss() {
    }

    public Object invoke() {
        ReadWithoutReceiptPreviewTracker.finishCurrent();
        return KotlinUnit.get(ReadWithoutReceiptPreviewDismiss.class.getClassLoader());
    }
}
