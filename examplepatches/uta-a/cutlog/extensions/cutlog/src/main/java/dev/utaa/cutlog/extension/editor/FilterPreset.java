package dev.utaa.cutlog.extension.editor;

/** フィルターのプリセット。色の計算は {@link dev.utaa.cutlog.extension.render.EffectsFactory} が持つ。 */
public enum FilterPreset {
    NONE("なし"),
    MONO("モノクロ"),
    SEPIA("セピア"),
    WARM("ウォーム"),
    COOL("クール"),
    FADE("フェード");

    public final String label;

    FilterPreset(String label) {
        this.label = label;
    }
}
