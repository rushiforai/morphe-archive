package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.Locale;
import java.util.function.LongConsumer;

/** 取り込んだ動画から、撮影画面で選んだ長さの区間を選ぶ。 */
final class TrimPanel extends ToolPanel {
    private final Context context;
    private final long sourceDurationMs;
    private final long clipDurationMs;
    private final LongConsumer onStartChanged;
    private long startMs;

    TrimPanel(Context context, EditorHost host, long sourceDurationMs, long clipDurationMs, LongConsumer onStartChanged) {
        super(host);
        this.context = context;
        this.sourceDurationMs = sourceDurationMs;
        this.clipDurationMs = clipDurationMs;
        this.onStartChanged = onStartChanged;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);
        TextView range = Ui.text(context, "", 15, Ui.TEXT_PRIMARY, false);
        panel.addView(range);
        long maxStartMs = Math.max(0, sourceDurationMs - clipDurationMs);
        SeekBar bar = Ui.seekBar(context, (int) maxStartMs, 0);
        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        barParams.topMargin = Ui.dp(context, 16);
        panel.addView(bar, barParams);
        TextView hint = Ui.text(context,
                maxStartMs > 0
                        ? "撮影画面で選んだ長さ（" + seconds(clipDurationMs) + " 秒）を切り出します"
                        : "動画が選んだ長さより短いため、全体（" + seconds(clipDurationMs) + " 秒）を使います",
                12, Ui.TEXT_SECONDARY, false);
        hint.setPadding(0, Ui.dp(context, 12), 0, 0);
        panel.addView(hint);
        bar.setEnabled(maxStartMs > 0);
        Runnable updateLabel = () -> range.setText(seconds(startMs) + " 〜 " + seconds(startMs + clipDurationMs)
                + " 秒（全体 " + seconds(sourceDurationMs) + " 秒）");
        updateLabel.run();
        bar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    startMs = progress;
                    updateLabel.run();
                }
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                onStartChanged.accept(startMs);
            }
        });
        return panel;
    }

    static String seconds(long ms) {
        return String.format(Locale.ROOT, "%.1f", ms / 1000f);
    }
}
