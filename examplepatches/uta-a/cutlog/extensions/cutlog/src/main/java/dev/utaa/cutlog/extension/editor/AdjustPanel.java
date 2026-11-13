package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/** 明るさ・コントラスト・彩度。 */
final class AdjustPanel extends ToolPanel {
    private interface Value {
        float get(EditSpec spec);

        void set(EditSpec spec, float value);
    }

    private final Context context;

    AdjustPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);
        panel.addView(slider("明るさ", new Value() {
            @Override
            public float get(EditSpec spec) {
                return spec.brightness;
            }

            @Override
            public void set(EditSpec spec, float value) {
                spec.brightness = value;
            }
        }));
        panel.addView(slider("コントラスト", new Value() {
            @Override
            public float get(EditSpec spec) {
                return spec.contrast;
            }

            @Override
            public void set(EditSpec spec, float value) {
                spec.contrast = value;
            }
        }));
        panel.addView(slider("彩度", new Value() {
            @Override
            public float get(EditSpec spec) {
                return spec.saturation;
            }

            @Override
            public void set(EditSpec spec, float value) {
                spec.saturation = value;
            }
        }));
        return panel;
    }

    /** -1〜1 の値を 0〜200 のスライダーで動かす。真ん中が無調整。 */
    private View slider(String name, Value value) {
        LinearLayout row = Ui.row(context);
        row.setPadding(0, Ui.dp(context, 12), 0, 0);
        TextView label = Ui.text(context, name, 14, Ui.TEXT_SECONDARY, false);
        label.setMinWidth(Ui.dp(context, 104));
        row.addView(label);
        SeekBar bar = Ui.seekBar(context, 200, Math.round(value.get(host.spec()) * 100f) + 100);
        bar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                value.set(host.spec(), (seekBar.getProgress() - 100) / 100f);
                host.videoEffectsChanged();
            }
        });
        row.addView(bar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return row;
    }
}
