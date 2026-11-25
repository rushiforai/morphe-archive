package dev.rikunode.settings;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.graphics.Color;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Editing is restricted to existing drawer items and their original groups. */
public final class HoshioriDrawerSettingsActivity extends Activity {
    private SharedPreferences prefs;
    private LinearLayout content;
    private final List<HoshioriDrawerBridge.Item> items = new ArrayList<>();

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("ドロワーの設定");
        prefs = getSharedPreferences(HoshioriSettingsActivity.STORE, MODE_PRIVATE);
        int menuId = getResources().getIdentifier(
                "activity_main_drawer", "menu", getPackageName());
        if (menuId == 0) { finish(); return; }
        PopupMenu popup = new PopupMenu(this, new View(this));
        getMenuInflater().inflate(menuId, popup.getMenu());
        Menu menu = popup.getMenu();
        for (int i = 0; i < menu.size(); i++)
            items.add(new HoshioriDrawerBridge.Item(menu.getItem(i), i));
        if (items.isEmpty()) { finish(); return; }
        HoshioriDrawerBridge.sort(items, prefs);
        ScrollView scroll = new ScrollView(this);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(12), dp(12), dp(12), dp(28));
        scroll.addView(content);
        setContentView(scroll);
        draw();
    }

    private void draw() {
        content.removeAllViews();
        TextView detail = text("既存項目のみ編集できます。矢印で各グループ内の順番を変更します。「設定」は常に表示されます。", 13);
        detail.setPadding(dp(6), 0, dp(6), dp(14));
        content.addView(detail);
        Set<String> hidden = prefs.getStringSet(
                HoshioriDrawerBridge.HIDDEN, Collections.emptySet());
        int config = HoshioriDrawerBridge.configId(this);
        int currentGroup = Integer.MIN_VALUE;
        int groupIndex = 0;
        for (int index = 0; index < items.size(); index++) {
            final int position = index;
            HoshioriDrawerBridge.Item entry = items.get(index);
            if (entry.group != currentGroup) {
                currentGroup = entry.group;
                groupIndex++;
                TextView label = text(groupLabel(groupIndex), 17);
                label.setTextColor(Color.rgb(35, 96, 162));
                label.setPadding(dp(6), dp(15), dp(6), dp(7));
                content.addView(label);
            }
            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(android.view.Gravity.CENTER_VERTICAL);
            Switch toggle = new Switch(this);
            toggle.setText(entry.title);
            toggle.setTextSize(14);
            toggle.setChecked(entry.id == config ||
                    !hidden.contains(Integer.toString(entry.id)));
            toggle.setEnabled(entry.id != config);
            toggle.setOnCheckedChangeListener((v, checked) -> {
                Set<String> newHidden = new HashSet<>(prefs.getStringSet(
                        HoshioriDrawerBridge.HIDDEN, Collections.emptySet()));
                if (checked) newHidden.remove(Integer.toString(entry.id));
                else newHidden.add(Integer.toString(entry.id));
                prefs.edit().putStringSet(HoshioriDrawerBridge.HIDDEN, newHidden).apply();
            });
            row.addView(toggle, new LinearLayout.LayoutParams(0, -2, 1f));
            Button up = new Button(this);
            up.setText("↑");
            up.setContentDescription(entry.title + " を上へ");
            up.setEnabled(position > 0 && items.get(position - 1).group == entry.group);
            up.setOnClickListener(v -> move(position, -1));
            row.addView(up, new LinearLayout.LayoutParams(dp(48), dp(46)));
            Button down = new Button(this);
            down.setText("↓");
            down.setContentDescription(entry.title + " を下へ");
            down.setEnabled(position + 1 < items.size() &&
                    items.get(position + 1).group == entry.group);
            down.setOnClickListener(v -> move(position, 1));
            row.addView(down, new LinearLayout.LayoutParams(dp(48), dp(46)));
            content.addView(row);
        }
        Button reset = new Button(this);
        reset.setText("初期の並び順と表示に戻す");
        reset.setOnClickListener(v -> {
            prefs.edit().remove(HoshioriDrawerBridge.ORDER)
                    .remove(HoshioriDrawerBridge.HIDDEN).apply();
            items.sort((a, b) -> Integer.compare(a.initial, b.initial));
            draw();
        });
        content.addView(reset);
    }

    private void move(int pos, int offset) {
        int destination = pos + offset;
        if (destination < 0 || destination >= items.size() ||
                items.get(pos).group != items.get(destination).group) return;
        Collections.swap(items, pos, destination);
        StringBuilder value = new StringBuilder();
        for (HoshioriDrawerBridge.Item item : items) {
            if (value.length() != 0) value.append(',');
            value.append(item.id);
        }
        prefs.edit().putString(HoshioriDrawerBridge.ORDER, value.toString()).apply();
        draw();
    }

    private String groupLabel(int index) {
        if (index == 1) return "ホーム・個人メニュー";
        if (index == 2) return "カテゴリ";
        return "通知・設定";
    }

    private TextView text(CharSequence label, int size) {
        TextView view = new TextView(this);
        view.setText(label);
        view.setTextSize(size);
        return view;
    }
    private int dp(int n) {
        return (int) (getResources().getDisplayMetrics().density * n + .5f);
    }
}
