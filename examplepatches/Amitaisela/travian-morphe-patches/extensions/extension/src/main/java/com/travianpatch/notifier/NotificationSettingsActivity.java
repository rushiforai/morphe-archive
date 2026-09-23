package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

/**
 * The Notifications screen: one switch per notification type (built from NotificationKind, applied
 * at once), each with how many of that type happened in the last 24 hours, muted ones included.
 * Also where a notification's "Alert settings" button leads.
 */
public class NotificationSettingsActivity extends Activity {

    private static final long REFRESH_MS = 1000L;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Map<NotificationKind, TextView> countViews = new HashMap<NotificationKind, TextView>();
    private TextView idleVillagesView;
    /** The idle-villages text last drawn, so the view is only touched when it changed. */
    private String idleDrawn = "not drawn yet";

    private final Runnable refresh = new Runnable() {
        @Override
        public void run() {
            refreshCounts();
            handler.postDelayed(this, REFRESH_MS);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        NotifierBootstrap.ensureChannels(this);
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
        column.addView(UiKit.title(this, "Notifications"));
        column.addView(UiKit.muted(this, "Choose which notifications you want. Changes apply right away. "
                + "A switched-off type is still counted."));
        column.addView(UiKit.section(this, "Queues"));
        LinearLayout idleCard = UiKit.card(this);
        idleVillagesView = UiKit.body(this, "Checking...");
        idleCard.addView(idleVillagesView);
        column.addView(idleCard, UiKit.cardParams(this));
        column.addView(UiKit.section(this, "Alerts"));
        for (NotificationKind kind : NotificationKind.values()) {
            column.addView(switchCard(kind), UiKit.cardParams(this));
        }
        return UiKit.page(this, column);
    }

    private View switchCard(final NotificationKind kind) {
        LinearLayout card = UiKit.card(this);
        Switch toggle = UiKit.accentSwitch(this, kind.label, NotifierSettings.isEnabled(this, kind));
        toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton button, boolean checked) {
                NotifierSettings.setEnabled(NotificationSettingsActivity.this, kind, checked);
            }
        });
        card.addView(toggle, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        TextView description = UiKit.muted(this, kind.description);
        description.setPadding(0, UiKit.dp(this, 4), 0, 0);
        card.addView(description);
        TextView count = UiKit.text(this, "", 13, true, UiKit.accentText(this));
        count.setPadding(0, UiKit.dp(this, 6), 0, 0);
        countViews.put(kind, count);
        card.addView(count);
        return card;
    }

    /** Updates the counts and the idle-villages line only (never the switches, so a tap in progress isn't fought). */
    private void refreshCounts() {
        long now = System.currentTimeMillis();
        SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        String history = state.getString(NotifierWorker.KEY_HISTORY, null);
        for (Map.Entry<NotificationKind, TextView> entry : countViews.entrySet()) {
            int count = NotificationHistory.countLast24h(history, entry.getKey().id, now);
            entry.getValue().setText(NotificationHistory.countLabel(count));
        }
        String idleJson = state.getString(NotifierWorker.KEY_IDLE_VILLAGES, null);
        if (!String.valueOf(idleJson).equals(idleDrawn)) {
            idleDrawn = String.valueOf(idleJson);
            idleVillagesView.setText(IdleVillages.summary(IdleVillages.fromJson(idleJson)));
        }
    }
}
