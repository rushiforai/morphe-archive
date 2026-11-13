package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** 選んでいる文字・スタンプの表示区間と、入り・出のアニメーション。 */
final class MotionPanel extends ToolPanel {
    private final Context context;
    private final List<TextView> inChips = new ArrayList<>();
    private final List<TextView> outChips = new ArrayList<>();
    private final List<View> controls = new ArrayList<>();
    private TextView rangeLabel;

    MotionPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);

        LinearLayout rangeRow = Ui.row(context);
        rangeLabel = Ui.text(context, "", 14, Ui.TEXT_PRIMARY, false);
        rangeRow.addView(rangeLabel, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView reset = Ui.pillButton(context, "全体に戻す");
        reset.setTextSize(13);
        reset.setOnClickListener(v -> {
            Layer layer = host.selectedLayer();
            if (layer != null) {
                layer.startMs = 0;
                layer.endMs = Layer.UNTIL_END;
                refresh(layer);
                host.layersChanged();
            }
        });
        rangeRow.addView(reset);
        controls.add(reset);
        panel.addView(rangeRow);

        TextView hint = Ui.text(context, "タイムラインのバーの両端で区間を伸び縮み、真ん中で区間ごと動かせます",
                12, Ui.TEXT_SECONDARY, false);
        hint.setPadding(0, Ui.dp(context, 6), 0, 0);
        panel.addView(hint);

        panel.addView(section("入り"), spaced());
        panel.addView(chipRow(inChips, true));
        panel.addView(section("出"), spaced());
        panel.addView(chipRow(outChips, false));

        onLayerSelected(host.selectedLayer());
        return panel;
    }

    private View chipRow(List<TextView> chips, boolean entering) {
        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = Ui.row(context);
        row.setPadding(0, Ui.dp(context, 6), 0, 0);
        for (LayerAnimation animation : LayerAnimation.values()) {
            TextView chip = Ui.pillButton(context, animation.label);
            chip.setTag(animation);
            chip.setOnClickListener(v -> {
                Layer layer = host.selectedLayer();
                if (layer != null) {
                    if (entering) {
                        layer.animationIn = animation;
                    } else {
                        layer.animationOut = animation;
                    }
                    refresh(layer);
                    host.layersChanged();
                    host.previewMotion(layer, entering);
                }
            });
            chips.add(chip);
            controls.add(chip);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.rightMargin = Ui.dp(context, 8);
            row.addView(chip, params);
        }
        scroll.addView(row);
        return scroll;
    }

    private TextView section(String label) {
        return Ui.text(context, label, 14, Ui.TEXT_SECONDARY, false);
    }

    private LinearLayout.LayoutParams spaced() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Ui.dp(context, 12);
        return params;
    }

    @Override
    void onLayerSelected(Layer layer) {
        if (rangeLabel == null) {
            return;
        }
        for (View control : controls) {
            control.setEnabled(layer != null);
            control.setAlpha(layer != null ? 1f : 0.35f);
        }
        refresh(layer);
    }

    private void refresh(Layer layer) {
        if (layer == null) {
            rangeLabel.setText("文字かスタンプを選ぶと、表示する区間と動きを変えられます");
            rangeLabel.setTextColor(Ui.TEXT_SECONDARY);
        } else {
            long duration = host.spec().durationMs;
            rangeLabel.setText("表示 " + TrimPanel.seconds(layer.startMs) + " 〜 "
                    + TrimPanel.seconds(layer.endMs(duration)) + " 秒");
            rangeLabel.setTextColor(Ui.TEXT_PRIMARY);
        }
        for (TextView chip : inChips) {
            Ui.setChipSelected(context, chip, layer != null && chip.getTag() == layer.animationIn);
        }
        for (TextView chip : outChips) {
            Ui.setChipSelected(context, chip, layer != null && chip.getTag() == layer.animationOut);
        }
    }
}
