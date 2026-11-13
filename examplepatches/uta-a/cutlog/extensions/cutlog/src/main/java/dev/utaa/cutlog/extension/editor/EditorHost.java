package dev.utaa.cutlog.extension.editor;

/** ツールのパネルから編集画面への窓口。 */
interface EditorHost {
    EditSpec spec();

    /** 動画全体にかかる効果（色など）を変えた。プレビューを作り直す。 */
    void videoEffectsChanged();

    /** 文字・スタンプの見た目や数を変えた。プレビューとタイムラインを描き直す。 */
    void layersChanged();

    Layer selectedLayer();

    /** 要素を選ぶ。null で選択を外す。 */
    void selectLayer(Layer layer);

    /** 速さを変える前の動画の長さ。 */
    long baseDurationMs();

    /** 再生の速さを変える。書き出した動画の長さと、文字・スタンプの表示区間も合わせて変わる。 */
    void setSpeed(float speed);

    /** 逆再生を切り替える。オンにするときは中間ファイルを作り、できあがってから切り替わる。 */
    void setReverse(boolean reverse);

    /** 端末の画像を選んで縮小して読み、main thread で渡す。選ばなかった・読めなかったときは呼ばない。 */
    void pickImage(java.util.function.Consumer<android.graphics.Bitmap> callback);

    /** 要素の入り（entering）または出のアニメーションの少し前から再生して見せる。 */
    void previewMotion(Layer layer, boolean entering);
}
