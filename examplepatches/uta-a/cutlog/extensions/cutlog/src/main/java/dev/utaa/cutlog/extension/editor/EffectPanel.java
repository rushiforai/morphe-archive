package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * 動画全体の効果。チップのタップでオン・オフを切り替え、最後に触った効果の強さをスライダーで変える。
 * 効果はいくつでも重ねられる。
 */
final class EffectPanel extends ToolPanel {
    private final Context context;
    private final List<TextView> chips = new ArrayList<>();
    private VideoEffect focused;
    private TextView strengthLabel;
    private SeekBar strengthBar;

    EffectPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);

        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = Ui.row(context);
        for (VideoEffect effect : VideoEffect.values()) {
            TextView chip = Ui.pillButton(context, effect.label);
            chip.setTag(effect);
            chip.setOnClickListener(v -> toggle(effect));
            chips.add(chip);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.rightMargin = Ui.dp(context, 8);
            row.addView(chip, params);
        }
        scroll.addView(row);
        panel.addView(scroll);

        LinearLayout strengthRow = Ui.row(context);
        strengthRow.setPadding(0, Ui.dp(context, 16), 0, 0);
        strengthLabel = Ui.text(context, "", 14, Ui.TEXT_SECONDARY, false);
        strengthLabel.setMinWidth(Ui.dp(context, 104));
        strengthRow.addView(strengthLabel);
        strengthBar = Ui.seekBar(context, 100, 50);
        strengthBar.setOnSeekBarChangeListener(new Ui.SeekListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser && focused != null) {
                    strengthLabel.setText(strengthText(focused, progress));
                }
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                if (focused != null && host.spec().effects.containsKey(focused)) {
                    // 0 にすると効果が消えて見えるため、最小でも少しはかける。
                    host.spec().effects.put(focused, Math.max(0.05f, seekBar.getProgress() / 100f));
                    host.videoEffectsChanged();
                }
            }
        });
        strengthRow.addView(strengthBar, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        panel.addView(strengthRow);

        TextView hint = Ui.text(context, "タップでオン・オフ。いくつでも重ねられます。文字とスタンプにはかかりません",
                12, Ui.TEXT_SECONDARY, false);
        hint.setPadding(0, Ui.dp(context, 12), 0, 0);
        panel.addView(hint);

        refresh();
        return panel;
    }

    private void toggle(VideoEffect effect) {
        if (host.spec().effects.containsKey(effect)) {
            host.spec().effects.remove(effect);
            if (focused == effect) {
                focused = null;
            }
        } else {
            host.spec().effects.put(effect, VideoEffect.DEFAULT_INTENSITY);
            focused = effect;
        }
        refresh();
        host.videoEffectsChanged();
    }

    private void refresh() {
        for (TextView chip : chips) {
            Ui.setChipSelected(context, chip, host.spec().effects.containsKey((VideoEffect) chip.getTag()));
        }
        Float intensity = focused != null ? host.spec().effects.get(focused) : null;
        boolean enabled = intensity != null;
        strengthBar.setEnabled(enabled);
        strengthBar.setAlpha(enabled ? 1f : 0.35f);
        if (enabled) {
            int progress = Math.round(intensity * 100f);
            strengthBar.setProgress(progress);
            strengthLabel.setText(strengthText(focused, progress));
        } else {
            strengthLabel.setText("強さ");
        }
    }

    private static String strengthText(VideoEffect effect, int progress) {
        return String.format(Locale.ROOT, "%s %d", effect.label, progress);
    }
}
