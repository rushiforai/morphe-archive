package dev.utaa.cutlog.extension.editor;

/** 文字・スタンプの入り（表示区間の始まり）と出（終わり）のアニメーション。 */
public enum LayerAnimation {
    NONE("なし"),
    /** 透明度を変える。 */
    FADE("フェード"),
    /** 下から上がってくる（出は上へ抜ける）。透明度も合わせて変える。 */
    SLIDE("スライド"),
    /** 小さい所から弾むように大きくなる（出は縮んで消える）。 */
    POP("ポップ"),
    /** 1 文字ずつ出す（出は 1 文字ずつ消す）。スタンプではフェードとして扱う。 */
    TYPE("タイプ");

    public final String label;

    LayerAnimation(String label) {
        this.label = label;
    }
}
