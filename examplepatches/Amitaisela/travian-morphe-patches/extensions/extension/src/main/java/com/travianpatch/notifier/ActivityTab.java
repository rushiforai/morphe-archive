package com.travianpatch.notifier;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/** The Activity tab: what the app did in the game (the action log) and the notifications it showed. */
final class ActivityTab implements HubActivity.Tab {

    private static final String KEY_VIEW = "activity_view";

    private final HubActivity a;

    ActivityTab(HubActivity a) {
        this.a = a;
    }

    @Override
    public View build() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        final android.content.SharedPreferences ui = a.getSharedPreferences(BuildOrderStore.PREFS, Context.MODE_PRIVATE);
        int view = ui.getInt(KEY_VIEW, 0);
        LinearLayout seg = UiKit.segments(a, new String[]{"Actions", "Notifications"}, view, new UiKit.OnPick() {
            @Override
            public void picked(int index) {
                ui.edit().putInt(KEY_VIEW, index).apply();
                a.redraw();
            }
        });
        LinearLayout.LayoutParams p = UiKit.cardParams(a);
        p.topMargin = UiKit.dp(a, 12);
        col.addView(seg, p);
        LinearLayout card = UiKit.card(a);
        if (view == 0) {
            fillActions(card);
        } else {
            fillNotifications(card);
        }
        col.addView(card, UiKit.cardParams(a));
        return col;
    }

    private void fillActions(LinearLayout card) {
        List<ActionLog.Entry> entries = ActionLog.read(
                a.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE).getString(ActionLog.KEY, null));
        if (entries.isEmpty()) {
            card.addView(UiKit.muted(a, "Nothing sent yet. Builds you start with ▶ or the queue show up here."));
            return;
        }
        DateFormat fmt = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
        for (int i = 0; i < entries.size(); i++) {
            ActionLog.Entry e = entries.get(i);
            if (i > 0) {
                card.addView(UiKit.divider(a));
            }
            LinearLayout item = new LinearLayout(a);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setPadding(0, UiKit.dp(a, 8), 0, UiKit.dp(a, 8));
            item.addView(UiKit.text(a, word(e.outcome) + "  ·  " + fmt.format(new Date(e.atMs)), 12, true,
                    "SENT".equals(e.outcome) ? UiKit.accentText(a) : UiKit.mutedColor(a)));
            item.addView(UiKit.body(a, e.label));
            if (e.detail != null && e.detail.length() > 0 && !"sent".equals(e.detail)) {
                item.addView(UiKit.muted(a, e.detail));
            }
            card.addView(item);
        }
    }

    private void fillNotifications(LinearLayout card) {
        List<NotificationHistory.Entry> entries = NotificationHistory.read(
                a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                        .getString(NotifierWorker.KEY_HISTORY, null));
        if (entries.isEmpty()) {
            card.addView(UiKit.muted(a, "No notifications yet."));
            return;
        }
        for (int i = 0; i < entries.size(); i++) {
            NotificationHistory.Entry e = entries.get(i);
            if (i > 0) {
                card.addView(UiKit.divider(a));
            }
            LinearLayout item = new LinearLayout(a);
            item.setOrientation(LinearLayout.VERTICAL);
            item.setPadding(0, UiKit.dp(a, 8), 0, UiKit.dp(a, 8));
            NotificationKind kind = NotificationKind.fromId(e.kindId);
            item.addView(UiKit.text(a, (kind != null ? kind.label : e.title) + "  ·  "
                            + NotificationHistory.time(e.timeMs) + (e.muted ? "  ·  muted" : ""), 12, true,
                    e.muted ? UiKit.mutedColor(a) : UiKit.accentText(a)));
            TextView text = UiKit.body(a, e.text);
            if (e.muted) {
                text.setTextColor(UiKit.mutedColor(a));
            }
            item.addView(text);
            card.addView(item);
        }
    }

    private static String word(String outcome) {
        if ("SENT".equals(outcome)) {
            return "Sent";
        }
        if ("DRY_RUN".equals(outcome)) {
            return "Practice (not sent)";
        }
        if ("REFUSED".equals(outcome)) {
            return "Not sent";
        }
        if ("CHECKED".equals(outcome)) {
            return "Test step (asked the game only)";
        }
        return "Failed";
    }

    @Override
    public void tick() {
    }
}
