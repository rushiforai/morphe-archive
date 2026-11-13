package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.function.IntConsumer;

/** 編集画面の最下段。アイコンと名前を横に並べ、選んだツールのパネルを開く。 */
final class ToolBar extends HorizontalScrollView {
    private final LinearLayout row;
    private final IntConsumer onSelected;
    private final List<LinearLayout> items = new ArrayList<>();
    private int selected = -1;

    ToolBar(Context context, IntConsumer onSelected) {
        super(context);
        this.onSelected = onSelected;
        setHorizontalScrollBarEnabled(false);
        setFillViewport(true);
        row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        // 収まるときは中央に寄せ、収まらないときは横にスクロールする。
        row.setGravity(Gravity.CENTER);
        addView(row, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** @return ツールの番号（追加した順に 0 から） */
    int add(String icon, String label) {
        Context context = getContext();
        int index = items.size();
        LinearLayout item = new LinearLayout(context);
        item.setOrientation(LinearLayout.VERTICAL);
        item.setGravity(Gravity.CENTER);
        int padding = Ui.dp(context, 6);
        item.setPadding(padding, padding, padding, padding);
        item.setMinimumWidth(Ui.dp(context, 64));
        item.setContentDescription(label);
        TextView iconView = Ui.text(context, icon, 20, Ui.TEXT_SECONDARY, true);
        iconView.setGravity(Gravity.CENTER);
        item.addView(iconView);
        TextView labelView = Ui.text(context, label, 11, Ui.TEXT_SECONDARY, false);
        labelView.setGravity(Gravity.CENTER);
        labelView.setSingleLine(true);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        labelParams.topMargin = Ui.dp(context, 4);
        item.addView(labelView, labelParams);
        item.setClickable(true);
        item.setOnClickListener(v -> select(index));
        items.add(item);
        row.addView(item, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return index;
    }

    int selected() {
        return selected;
    }

    void select(int index) {
        if (index == selected) {
            return;
        }
        selected = index;
        for (int i = 0; i < items.size(); i++) {
            int color = i == index ? Ui.ACCENT : Ui.TEXT_SECONDARY;
            LinearLayout item = items.get(i);
            ((TextView) item.getChildAt(0)).setTextColor(color);
            ((TextView) item.getChildAt(1)).setTextColor(i == index ? Ui.TEXT_PRIMARY : Ui.TEXT_SECONDARY);
            item.setSelected(i == index);
        }
        onSelected.accept(index);
    }
}
