package com.travianpatch.notifier;

import android.content.Context;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** The Alerts tab: one switch per notification type, with how many happened in the last 24 hours. */
final class AlertsTab implements HubActivity.Tab {

    private final HubActivity a;

    AlertsTab(HubActivity a) {
        this.a = a;
    }

    @Override
    public View build() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        col.addView(UiKit.section(a, "Alerts"));
        TextView intro = UiKit.muted(a, "Changes apply right away. A switched-off type is still counted.");
        intro.setPadding(UiKit.dp(a, 4), 0, 0, UiKit.dp(a, 8));
        col.addView(intro);
        String history = a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                .getString(NotifierWorker.KEY_HISTORY, null);
        long now = System.currentTimeMillis();
        LinearLayout card = UiKit.card(a);
        boolean first = true;
        for (final NotificationKind kind : NotificationKind.values()) {
            if (!first) {
                card.addView(UiKit.divider(a));
            }
            first = false;
            LinearLayout item = new LinearLayout(a);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setPadding(0, UiKit.dp(a, 8), 0, UiKit.dp(a, 8));
            Switch toggle = UiKit.accentSwitch(a, kind.label, NotifierSettings.isEnabled(a, kind));
            toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton b, boolean checked) {
                    NotifierSettings.setEnabled(a, kind, checked);
                }
            });
            item.addView(toggle, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            int count = NotificationHistory.countLast24h(history, kind.id, now);
            item.addView(UiKit.muted(a, kind.description + "  ·  " + NotificationHistory.countLabel(count)));
            card.addView(item);
        }
        col.addView(card, UiKit.cardParams(a));
        return col;
    }

    @Override
    public void tick() {
    }
}
