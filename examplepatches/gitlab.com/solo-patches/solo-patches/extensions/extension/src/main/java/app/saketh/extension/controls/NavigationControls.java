package app.saketh.extension.controls;

import android.app.AlertDialog;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import app.saketh.extension.navigation.NavigationHooks;
import app.saketh.extension.navigation.NavigationPolicy;
import java.util.List;
import java.util.Set;

final class NavigationControls {
    private final ControlsUi ui;
    private final List<String> stock = NavigationPolicy.order(null);
    private final Switch[] visibility = new Switch[stock.size()];
    private TextView order;
    private boolean refreshing;

    private NavigationControls(ControlsUi ui) { this.ui = ui; }

    static void add(LinearLayout parent, ControlsUi ui) {
        PatchSettings.initialize(ui.context);
        new NavigationControls(ui).build(parent);
    }

    private void build(LinearLayout parent) {
        LinearLayout card = ui.card(parent);
        LinearLayout header = ui.column();
        header.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        header.addView(ui.text("Main bottom tabs", 17, ui.text, true));
        TextView detail = ui.text("Arrange bottom tabs. Changes apply when you return to the main screen.", 13, ui.muted, false);
        detail.setPadding(0, ui.dp(8), 0, ui.dp(12));
        header.addView(detail);
        order = ui.text("", 14, ui.text, false);
        header.addView(order);
        LinearLayout actions = new LinearLayout(ui.context);
        actions.setPadding(0, ui.dp(12), 0, 0);
        Button reorder = ui.button("Reorder tabs", true);
        reorder.setContentDescription("Reorder main bottom tabs");
        reorder.setOnClickListener(view -> chooseTab());
        actions.addView(reorder, new LinearLayout.LayoutParams(0, -2, 1));
        Button reset = ui.button("Reset to stock", false);
        reset.setContentDescription("Reset main tab order and visibility to stock");
        reset.setOnClickListener(view -> {
            PatchSettings.preferences().edit().remove(NavigationPolicy.ORDER).remove(NavigationPolicy.HIDDEN).apply();
            refresh();
        });
        LinearLayout.LayoutParams resetParams = new LinearLayout.LayoutParams(0, -2, 1);
        resetParams.setMarginStart(ui.dp(8));
        actions.addView(reset, resetParams);
        header.addView(actions);
        card.addView(header);
        for (int i = 0; i < stock.size(); i++) {
            ui.divider(card);
            String tab = stock.get(i);
            boolean optional = NavigationPolicy.canHide(tab);
            String summary;
            if ("tabLibrary".equals(tab)) summary = "Always shown for quick access to your books.";
            else if ("tabProfile".equals(tab)) summary = "Always shown so Settings stays accessible.";
            else if ("tabWrite".equals(tab)) summary = "Available when WebNovel supports Writing.";
            else summary = "Show this tab in the bottom bar.";
            visibility[i] = ui.switchRow(card, "Show " + NavigationPolicy.label(tab), summary, true, optional);
            if (optional) visibility[i].setOnCheckedChangeListener((button, checked) -> {
                if (refreshing) return;
                Set<String> hidden = NavigationHooks.hidden();
                if (checked) hidden.remove(tab); else hidden.add(tab);
                // apply() updates in-process choices immediately; never mutate getStringSet()'s owned set.
                // https://developer.android.com/reference/android/content/SharedPreferences.Editor#apply()
                PatchSettings.preferences().edit().putStringSet(NavigationPolicy.HIDDEN, hidden).apply();
                refresh();
            });
        }
        refresh();
    }

    private void chooseTab() {
        List<String> tabs = NavigationHooks.order();
        String[] labels = new String[tabs.size()];
        for (int i = 0; i < labels.length; i++) labels[i] = (i + 1) + ". " + NavigationPolicy.label(tabs.get(i));
        new AlertDialog.Builder(ui.context).setTitle("Choose a tab to move")
                .setItems(labels, (dialog, from) -> choosePosition(tabs, from)).setNegativeButton("Cancel", null).show();
    }

    private void choosePosition(List<String> tabs, int from) {
        String tab = tabs.get(from);
        String[] positions = new String[tabs.size()];
        for (int i = 0; i < positions.length; i++) {
            positions[i] = "Position " + (i + 1) + (i == 0 ? " (start edge)" : i == positions.length - 1 ? " (end edge)" : "");
        }
        new AlertDialog.Builder(ui.context).setTitle("Move " + NavigationPolicy.label(tab) + " to")
                .setSingleChoiceItems(positions, from, (dialog, to) -> {
                    tabs.remove(from);
                    tabs.add(to, tab);
                    PatchSettings.preferences().edit().putString(NavigationPolicy.ORDER, String.join(",", tabs)).apply();
                    refresh();
                    dialog.dismiss();
                }).setNegativeButton("Cancel", null).show();
    }

    private void refresh() {
        Set<String> hidden = NavigationHooks.hidden();
        StringBuilder text = new StringBuilder();
        List<String> tabs = NavigationHooks.order();
        for (int i = 0; i < tabs.size(); i++) {
            if (i != 0) text.append('\n');
            String tab = tabs.get(i);
            text.append(i + 1).append(". ").append(NavigationPolicy.label(tab));
            if (hidden.contains(tab)) text.append(" (hidden by choice)");
            else if ("tabWrite".equals(tab)) text.append(" (when available)");
        }
        order.setText(text);
        refreshing = true;
        for (int i = 0; i < visibility.length; i++) visibility[i].setChecked(!hidden.contains(stock.get(i)));
        refreshing = false;
    }
}
