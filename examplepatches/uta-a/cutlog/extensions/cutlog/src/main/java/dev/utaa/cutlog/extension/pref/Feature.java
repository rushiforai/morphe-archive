package dev.utaa.cutlog.extension.pref;

/**
 * 設定画面で ON/OFF できる機能。OFF の間は、その機能が無いときの公式の動作に戻す。
 *
 * <p>パッチは機能ごとに選んで当てられるため、当てられていない機能は設定画面に出さない。各パッチのフックが
 * 撮影画面を作るたびに {@link #markAvailable()} を呼ぶ。
 */
public enum Feature {
    EDITOR("editor", "投稿前の編集",
            "撮影のあとに編集画面を開きます。OFF のときは公式と同じく、すぐに送信先を選ぶ画面へ進みます。"),
    IMPORT("import", "ファイルから投稿",
            "撮影画面に「ファイルから」ボタンを出し、端末内の動画を今のログとして投稿できるようにします。"),
    RECORD_DURATION("record_duration", "撮影する長さ",
            "撮影画面に長さのボタン（2〜15 秒）を出します。OFF のときは公式と同じ 2 秒で撮影します。");

    final String key;
    public final String title;
    public final String description;
    private boolean available;

    Feature(String key, String title, String description) {
        this.key = key;
        this.title = title;
        this.description = description;
    }

    /** この機能のパッチが当たっている。 */
    public boolean isAvailable() {
        return available;
    }

    public void markAvailable() {
        available = true;
    }
}
