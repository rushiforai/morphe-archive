package dev.utaa.cutlog.extension.editor;

import android.view.View;

/** ツールバーで選ぶ操作パネル。 */
abstract class ToolPanel {
    protected final EditorHost host;
    private View view;

    ToolPanel(EditorHost host) {
        this.host = host;
    }

    final View view() {
        if (view == null) {
            view = build();
        }
        return view;
    }

    protected abstract View build();

    /** 選んでいる要素が変わった。 */
    void onLayerSelected(Layer layer) {}
}
