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

import java.util.ArrayList;
import java.util.List;

/**
 * The Queues screen: what is being built and trained in each village and how long is left, from what the
 * last background check saw. It makes no request of its own; the countdowns tick here, and the entries
 * refresh whenever the background check stores new ones.
 */
public class QueuesActivity extends Activity {

    private static final long REFRESH_MS = 1000L;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private LinearLayout list;
    private TextView lastCheckView;
    /** The stored queue state last drawn, so the list is only rebuilt when it changed. */
    private String drawn = "not drawn yet";
    private final List<TextView> whenViews = new ArrayList<TextView>();
    private final List<QueueView.Item> whenItems = new ArrayList<QueueView.Item>();

    private final Runnable refresh = new Runnable() {
        @Override
        public void run() {
            refreshLive();
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
        column.addView(UiKit.title(this, "Queues"));
        column.addView(UiKit.muted(this, "What is being built and trained, as of the last check."));
        lastCheckView = UiKit.muted(this, "");
        lastCheckView.setPadding(0, UiKit.dp(this, 4), 0, 0);
        column.addView(lastCheckView);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        column.addView(list, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        return UiKit.page(this, column);
    }

    private void refreshLive() {
        long now = System.currentTimeMillis();
        SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        lastCheckView.setText(AlertStatus.fromJson(state.getString(NotifierWorker.KEY_STATUS, null)).lastCheckLine(now));
        String json = state.getString(NotifierWorker.STATE_KEY, null);
        String current = "queues:" + json;
        if (!current.equals(drawn)) {
            drawn = current;
            draw(QueueView.parse(json));
        }
        for (int i = 0; i < whenViews.size(); i++) {
            whenViews.get(i).setText(QueueView.when(whenItems.get(i), now));
        }
    }

    private void draw(List<QueueView.Group> groups) {
        list.removeAllViews();
        whenViews.clear();
        whenItems.clear();
        if (groups.isEmpty()) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "Nothing is being built or trained right now."));
            LinearLayout.LayoutParams params = UiKit.cardParams(this);
            params.topMargin = UiKit.dp(this, 16);
            list.addView(empty, params);
            return;
        }
        for (QueueView.Group group : groups) {
            TextView header = UiKit.text(this, group.title, 15, true, UiKit.accentText(this));
            header.setPadding(UiKit.dp(this, 4), UiKit.dp(this, 20), 0, UiKit.dp(this, 8));
            list.addView(header);
            LinearLayout card = UiKit.card(this);
            for (int i = 0; i < group.items.size(); i++) {
                QueueView.Item item = group.items.get(i);
                LinearLayout row = new LinearLayout(this);
                row.setOrientation(LinearLayout.VERTICAL);
                if (i > 0) {
                    row.setPadding(0, UiKit.dp(this, 12), 0, 0);
                }
                row.addView(UiKit.text(this, item.label, 16, true, UiKit.textColor(this)));
                TextView when = UiKit.muted(this, "");
                row.addView(when);
                whenViews.add(when);
                whenItems.add(item);
                card.addView(row);
            }
            list.addView(card, UiKit.cardParams(this));
        }
    }
}
