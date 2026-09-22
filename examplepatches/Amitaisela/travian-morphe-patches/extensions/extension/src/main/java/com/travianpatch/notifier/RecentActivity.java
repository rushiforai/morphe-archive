package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;

/** The Recent notifications screen: the latest notifications, newest first, muted ones marked. */
public class RecentActivity extends Activity {

    private static final long REFRESH_MS = 2000L;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private LinearLayout list;
    /** The stored history last drawn, so the list is only rebuilt when it changed. */
    private String drawn = "not drawn yet";

    private final Runnable refresh = new Runnable() {
        @Override
        public void run() {
            SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
            String history = state.getString(NotifierWorker.KEY_HISTORY, null);
            String current = "history:" + history;
            if (!current.equals(drawn)) {
                drawn = current;
                draw(NotificationHistory.read(history));
            }
            handler.postDelayed(this, REFRESH_MS);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(buildContent());
    }

    @Override
    protected void onResume() {
        super.onResume();
        refresh.run();
    }

    @Override
    protected void onPause() {
        super.onPause();
        handler.removeCallbacks(refresh);
    }

    private View buildContent() {
        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Recent notifications"));
        column.addView(UiKit.muted(this, "Newest first. Muted means the switch for that type was off, "
                + "so nothing was shown."));
        column.addView(UiKit.section(this, "History"));
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        column.addView(list, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        return UiKit.page(this, column);
    }

    private void draw(List<NotificationHistory.Entry> entries) {
        list.removeAllViews();
        if (entries.isEmpty()) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.muted(this, "Nothing yet. Notifications you get will be listed here."));
            list.addView(empty, UiKit.cardParams(this));
            return;
        }
        for (NotificationHistory.Entry entry : entries) {
            list.addView(entryCard(entry), UiKit.cardParams(this));
        }
    }

    private View entryCard(NotificationHistory.Entry entry) {
        LinearLayout card = UiKit.card(this);
        NotificationKind kind = NotificationKind.fromId(entry.kindId);
        String label = (kind != null ? kind.label : entry.title) + "  \u00B7  " + NotificationHistory.time(entry.timeMs)
                + (entry.muted ? "  \u00B7  muted" : "");
        card.addView(UiKit.text(this, label, 12, true, entry.muted ? UiKit.mutedColor(this) : UiKit.accentText(this)));
        TextView text = UiKit.body(this, entry.text);
        text.setPadding(0, UiKit.dp(this, 4), 0, 0);
        if (entry.muted) {
            text.setTextColor(UiKit.mutedColor(this));
        }
        card.addView(text);
        return card;
    }
}
