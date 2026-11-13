package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.Locale;

/** 左右・上下の反転と、拡大率・表示位置。文字・スタンプ・フレームには影響しない。 */
final class TransformPanel extends ToolPanel {
    static final float MAX_ZOOM = 3f;

    private final Context context;
    private TextView flipXChip;
    private TextView flipYChip;
    private SeekBar zoomBar;
    private SeekBar panXBar;
    private SeekBar panYBar;
    private TextView zoomLabel;

    TransformPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);

        LinearLayout flips = Ui.row(context);
        flipXChip = Ui.pillButton(context, "左右反転");
        flipXChip.setOnClickListener(v -> {
            host.spec().flipX = !host.spec().flipX;
            changed();
        });
        flipYChip = Ui.pillButton(context, "上下反転");
        flipYChip.setOnClickListener(v -> {
            host.spec().flipY = !host.spec().flipY;
            changed();
        });
        TextView reset = Ui.pillButton(context, "元に戻す");
        reset.setOnClickListener(v -> {
            EditSpec spec = host.spec();
            spec.flipX = false;
            spec.flipY = false;
            spec.zoom = 1f;
            spec.panX = 0f;
            spec.panY = 0f;
            changed();
        });
        for (TextView chip : new TextView[] {flipXChip, flipYChip, reset}) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.rightMargin = Ui.dp(context, 8);
            flips.addView(chip, params);
        }
        panel.addView(flips);

        zoomLabel = label("");
        zoomBar = slider(panel, zoomLabel, 200, progress -> {
            host.spec().zoom = 1f + (MAX_ZOOM - 1f) * progress / 200f;
            zoomLabel.setText(zoomText(host.spec().zoom));
        });
        panXBar = slider(panel, label("横位置"), 200, progress -> host.spec().panX = (progress - 100) / 100f);
        panYBar = slider(panel, label("縦位置"), 200, progress -> host.spec().panY = (progress - 100) / 100f);

        refresh();
        return panel;
    }

    private interface Setter {
        void set(int progress);
    }

    /** 動かしている間はラベルなどを更新し、指を離したらプレビューを作り直す。 */
    private SeekBar slider(LinearLayout panel, TextView label, int max, Setter setter) {
        LinearLayout row = Ui.row(context);
        row.setPadding(0, Ui.dp(context, 10), 0, 0);
        row.addView(label);
        SeekBar bar = Ui.seekBar(context, max, 0);
        bar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    setter.set(progress);
                }
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                changed();
            }
        });
        row.addView(bar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        panel.addView(row);
        return bar;
    }

    private TextView label(String text) {
        TextView label = Ui.text(context, text, 14, Ui.TEXT_SECONDARY, false);
        label.setMinWidth(Ui.dp(context, 88));
        return label;
    }

    private static String zoomText(float zoom) {
        return String.format(Locale.ROOT, "ズーム %.1fx", zoom);
    }

    private void changed() {
        refresh();
        host.videoEffectsChanged();
    }

    private void refresh() {
        EditSpec spec = host.spec();
        Ui.setChipSelected(context, flipXChip, spec.flipX);
        Ui.setChipSelected(context, flipYChip, spec.flipY);
        zoomBar.setProgress(Math.round((spec.zoom - 1f) / (MAX_ZOOM - 1f) * 200f));
        zoomLabel.setText(zoomText(spec.zoom));
        panXBar.setProgress(Math.round(spec.panX * 100f) + 100);
        panYBar.setProgress(Math.round(spec.panY * 100f) + 100);
        // 拡大していなければ動かせる範囲が無い。
        boolean zoomed = spec.zoom > 1f;
        for (SeekBar bar : new SeekBar[] {panXBar, panYBar}) {
            bar.setEnabled(zoomed);
            bar.setAlpha(zoomed ? 1f : 0.35f);
        }
    }
}
