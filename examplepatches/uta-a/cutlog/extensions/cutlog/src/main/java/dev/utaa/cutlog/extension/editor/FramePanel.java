package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** 動画に重ねるフレームを 1 つ選ぶ。 */
final class FramePanel extends ToolPanel {
    private final Context context;
    private final List<TextView> chips = new ArrayList<>();

    FramePanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        LinearLayout panel = Ui.column(context);
        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = Ui.row(context);
        for (FrameStyle style : FrameStyle.values()) {
            TextView chip = Ui.pillButton(context, style.label);
            chip.setTag(style);
            chip.setOnClickListener(v -> {
                host.spec().frame = style;
                refresh();
                host.layersChanged();
            });
            chips.add(chip);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.rightMargin = Ui.dp(context, 8);
            row.addView(chip, params);
        }
        scroll.addView(row);
        panel.addView(scroll);
        TextView hint = Ui.text(context, "フレームは効果の上、文字とスタンプの下に重なります", 12, Ui.TEXT_SECONDARY, false);
        hint.setPadding(0, Ui.dp(context, 12), 0, 0);
        panel.addView(hint);
        refresh();
        return panel;
    }

    private void refresh() {
        for (TextView chip : chips) {
            Ui.setChipSelected(context, chip, chip.getTag() == host.spec().frame);
        }
    }
}
