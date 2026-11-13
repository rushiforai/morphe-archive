package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.Locale;

/**
 * 文字・スタンプで共通の、サイズ・角度・削除の行。type の要素を選んでいる間だけ使える。
 * 角度のラベルをタップすると 0 度に戻す。
 */
final class LayerControls {
    private final Context context;
    private final EditorHost host;
    private final Class<? extends Layer> type;
    private SeekBar sizeBar;
    private SeekBar angleBar;
    private TextView angleLabel;
    private TextView delete;

    LayerControls(Context context, EditorHost host, Class<? extends Layer> type) {
        this.context = context;
        this.host = host;
        this.type = type;
    }

    private Layer selected() {
        Layer layer = host.selectedLayer();
        return type.isInstance(layer) ? layer : null;
    }

    View sizeRow() {
        LinearLayout row = Ui.row(context);
        row.addView(label("サイズ"));
        sizeBar = Ui.seekBar(context, 100, 0);
        sizeBar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                Layer selected = selected();
                if (fromUser && selected != null) {
                    selected.size = LayerOverlayView.MIN_SIZE
                            + (LayerOverlayView.MAX_SIZE - LayerOverlayView.MIN_SIZE) * progress / 100f;
                    host.layersChanged();
                }
            }
        });
        row.addView(sizeBar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return row;
    }

    View angleRow() {
        LinearLayout row = Ui.row(context);
        row.setPadding(0, Ui.dp(context, 4), 0, 0);
        angleLabel = label("角度");
        angleLabel.setOnClickListener(v -> {
            Layer selected = selected();
            if (selected != null) {
                selected.rotation = 0f;
                refresh(selected);
                host.layersChanged();
            }
        });
        row.addView(angleLabel);
        angleBar = Ui.seekBar(context, 360, 180);
        angleBar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                Layer selected = selected();
                if (fromUser && selected != null) {
                    selected.rotation = progress - 180;
                    angleLabel.setText(angleText(selected.rotation));
                    host.layersChanged();
                }
            }
        });
        row.addView(angleBar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return row;
    }

    /** ヒントと削除ボタンの行。 */
    View footer(String hint) {
        LinearLayout footer = Ui.row(context);
        footer.setPadding(0, Ui.dp(context, 8), 0, Ui.dp(context, 8));
        TextView hintView = Ui.text(context, hint, 12, Ui.TEXT_SECONDARY, false);
        footer.addView(hintView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        delete = Ui.pillButton(context, "削除");
        delete.setOnClickListener(v -> {
            Layer selected = selected();
            if (selected != null) {
                host.spec().layers.remove(selected);
                host.selectLayer(null);
                host.layersChanged();
            }
        });
        footer.addView(delete);
        return footer;
    }

    /** 選んでいる要素の値をスライダーに映し、使えるかどうかを切り替える。 */
    void refresh(Layer layer) {
        Layer selected = type.isInstance(layer) ? layer : null;
        for (View control : new View[] {sizeBar, angleBar, angleLabel, delete}) {
            if (control != null) {
                control.setEnabled(selected != null);
                control.setAlpha(selected != null ? 1f : 0.35f);
            }
        }
        if (selected == null) {
            if (angleLabel != null) {
                angleLabel.setText("角度");
            }
            return;
        }
        if (sizeBar != null) {
            sizeBar.setProgress(Math.round((selected.size - LayerOverlayView.MIN_SIZE)
                    / (LayerOverlayView.MAX_SIZE - LayerOverlayView.MIN_SIZE) * 100f));
        }
        if (angleBar != null) {
            angleBar.setProgress(Math.round(selected.rotation) + 180);
            angleLabel.setText(angleText(selected.rotation));
        }
    }

    private TextView label(String text) {
        TextView label = Ui.text(context, text, 14, Ui.TEXT_SECONDARY, false);
        label.setMinWidth(Ui.dp(context, 64));
        label.setGravity(Gravity.CENTER_VERTICAL);
        return label;
    }

    private static String angleText(float rotation) {
        return String.format(Locale.ROOT, "角度 %d°", Math.round(rotation));
    }
}
