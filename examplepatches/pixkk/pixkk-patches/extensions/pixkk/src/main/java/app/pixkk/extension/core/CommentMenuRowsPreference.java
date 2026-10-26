package app.pixkk.extension.core;

import android.app.AlertDialog;
import android.content.Context;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import app.pixkk.extension.comment.CommentMenuRows;

/**
 * Picks the rows to leave out of the menu a long press on a comment opens, from the rows that
 * menu has shown on this phone. A pick the list no longer holds is kept.
 */
final class CommentMenuRowsPreference {
    private CommentMenuRowsPreference() {
    }

    static void show(Context context) {
        Map<String, String> catalog = new LinkedHashMap<>(CommentMenuRows.catalog());
        Set<String> original = new LinkedHashSet<>(CommentMenuRows.hiddenKeys());
        Set<String> selected = new LinkedHashSet<>(original);

        LinearLayout rows = new LinearLayout(context);
        rows.setOrientation(LinearLayout.VERTICAL);
        int pad = Dim.dp(16);
        rows.setPadding(pad, pad / 2, pad, pad / 2);
        if (catalog.isEmpty()) {
            TextView empty = new TextView(context);
            empty.setText("No rows have been seen yet. Open the menu on a comment once to fill the list.");
            rows.addView(empty);
        }
        for (Map.Entry<String, String> entry : catalog.entrySet()) {
            String key = entry.getKey();
            CheckBox check = new CheckBox(context);
            check.setText(entry.getValue());
            check.setChecked(selected.contains(key));
            check.setOnCheckedChangeListener((button, checked) -> {
                if (checked) selected.add(key);
                else selected.remove(key);
            });
            rows.addView(check, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        ScrollView scroll = new ScrollView(context);
        scroll.addView(rows);

        new AlertDialog.Builder(context)
                .setTitle("Rows to hide in the comment menu")
                .setView(scroll)
                .setPositiveButton("Save", (dialog, which) -> {
                    // Picks for rows the list no longer holds stay as they were.
                    Set<String> result = new LinkedHashSet<>();
                    for (String key : original) if (!catalog.containsKey(key)) result.add(key);
                    for (String key : catalog.keySet()) if (selected.contains(key)) result.add(key);
                    if (!Settings.COMMENT_MENU_HIDDEN_ROWS.save(String.join(", ", result))) {
                        Utils.showToastShort("Couldn't save these choices. Try again.");
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }
}
