package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** 再生の速さ。書き出す動画の長さが 1〜15 秒を外れる速さは選べない。 */
final class SpeedPanel extends ToolPanel {
    private final Context context;
    private final List<TextView> chips = new ArrayList<>();
    private TextView lengthLabel;
    private TextView reverseChip;

    SpeedPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);
        LinearLayout row = Ui.row(context);
        long base = host.baseDurationMs();
        for (float speed : Speed.CHOICES) {
            TextView chip = Ui.pillButton(context, Speed.label(speed));
            // 5 つを均等に並べるため、左右の余白を詰めて 1 行に収める。
            chip.setSingleLine(true);
            chip.setPadding(Ui.dp(context, 4), chip.getPaddingTop(), Ui.dp(context, 4), chip.getPaddingBottom());
            chip.setTag(speed);
            boolean allowed = Speed.allowed(base, speed);
            chip.setEnabled(allowed);
            chip.setAlpha(allowed ? 1f : 0.35f);
            chip.setOnClickListener(v -> {
                host.setSpeed(speed);
                refresh();
            });
            chips.add(chip);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            params.rightMargin = Ui.dp(context, 6);
            row.addView(chip, params);
        }
        panel.addView(row);

        reverseChip = Ui.pillButton(context, "⟲ 逆再生");
        reverseChip.setOnClickListener(v -> host.setReverse(!host.spec().reverse));
        LinearLayout.LayoutParams reverseParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        reverseParams.topMargin = Ui.dp(context, 12);
        panel.addView(reverseChip, reverseParams);

        lengthLabel = Ui.text(context, "", 14, Ui.TEXT_PRIMARY, false);
        lengthLabel.setPadding(0, Ui.dp(context, 16), 0, 0);
        panel.addView(lengthLabel);
        TextView hint = Ui.text(context,
                "速さを変えると、書き出す動画の長さと、文字・スタンプの表示区間も同じ比率で変わります。"
                        + "書き出す長さが 1〜15 秒に収まる速さだけ選べます",
                12, Ui.TEXT_SECONDARY, false);
        hint.setPadding(0, Ui.dp(context, 8), 0, 0);
        panel.addView(hint);
        refresh();
        return panel;
    }

    /** 逆再生の切り替えが終わったときにも呼ばれる。 */
    @Override
    void onLayerSelected(Layer layer) {
        if (lengthLabel != null) {
            refresh();
        }
    }

    private void refresh() {
        Ui.setChipSelected(context, reverseChip, host.spec().reverse);
        float current = host.spec().speed;
        for (TextView chip : chips) {
            Ui.setChipSelected(context, chip, (Float) chip.getTag() == current);
        }
        lengthLabel.setText("書き出す長さ " + TrimPanel.seconds(Speed.outputMs(host.baseDurationMs(), current))
                + " 秒（元の長さ " + TrimPanel.seconds(host.baseDurationMs()) + " 秒）");
    }
}
