package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** フィルターのプリセットを選ぶ。 */
final class FilterPanel extends ToolPanel {
    private final Context context;
    private final List<TextView> chips = new ArrayList<>();

    FilterPanel(Context context, EditorHost host) {
        super(host);
        this.context = context;
    }

    @Override
    protected View build() {
        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.HORIZONTAL);
        list.setGravity(Gravity.CENTER_VERTICAL);
        list.setPadding(0, Ui.dp(context, 16), 0, 0);
        for (FilterPreset preset : FilterPreset.values()) {
            TextView chip = Ui.pillButton(context, preset.label);
            chip.setTag(preset);
            chip.setOnClickListener(v -> {
                host.spec().filter = preset;
                refresh();
                host.videoEffectsChanged();
            });
            chips.add(chip);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.rightMargin = Ui.dp(context, 8);
            list.addView(chip, params);
        }
        refresh();
        scroll.addView(list);
        return scroll;
    }

    private void refresh() {
        for (TextView chip : chips) {
            Ui.setChipSelected(context, chip, chip.getTag() == host.spec().filter);
        }
    }
}
