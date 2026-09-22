package com.travianpatch.notifier;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * "Travian Tools": the home screen (the second launcher icon). Shows how the background checks are
 * doing and links to the tool screens. Every time it is opened it runs a check, so the status is
 * fresh. Plain programmatic views, so it needs no layout resources added to the game's APK.
 */
public class HubActivity extends Activity {

    private static final long REFRESH_MS = 1000L;
    /** A check newer than this is fresh enough; opening the screen again doesn't start another. */
    private static final long FRESH_MS = 15_000L;
    /** Show "checking now" for at most this long after asking for a check. */
    private static final long CHECKING_MS = 30_000L;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private TextView notificationsView;
    private TextView lastCheckView;
    private TextView watchingView;
    private long checkRequestedMs = 0;
    /** True when a check couldn't be started because the game has never been opened on this install. */
    private boolean gameNeverOpened = false;

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
        NotifierBootstrap.ensureChannels(this); // this screen can be opened before the game ever was
        setContentView(buildContent());
    }

    @Override
    protected void onResume() {
        super.onResume();
        checkIfStale();
        refresh.run();
    }

    @Override
    protected void onPause() {
        super.onPause();
        handler.removeCallbacks(refresh);
    }

    private View buildContent() {
        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Travian Tools"));
        column.addView(UiKit.muted(this, "Helpers for your Travian game"));

        column.addView(UiKit.section(this, "Status"));
        LinearLayout status = UiKit.card(this);
        notificationsView = UiKit.body(this, "");
        lastCheckView = UiKit.body(this, "");
        watchingView = UiKit.body(this, "");
        lastCheckView.setPadding(0, UiKit.dp(this, 6), 0, 0);
        watchingView.setPadding(0, UiKit.dp(this, 6), 0, 0);
        status.addView(notificationsView);
        status.addView(lastCheckView);
        status.addView(watchingView);
        column.addView(status, UiKit.cardParams(this));
        column.addView(UiKit.primaryButton(this, "Open Travian", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openGame();
            }
        }));

        column.addView(UiKit.section(this, "Tools"));
        column.addView(UiKit.menuRow(this, "Notifications", "Choose which alerts you get", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HubActivity.this, NotificationSettingsActivity.class));
            }
        }), UiKit.cardParams(this));
        column.addView(UiKit.menuRow(this, "Queues", "What is building and training", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HubActivity.this, QueuesActivity.class));
            }
        }), UiKit.cardParams(this));
        column.addView(UiKit.menuRow(this, "Recent notifications", "What was sent lately", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HubActivity.this, RecentActivity.class));
            }
        }), UiKit.cardParams(this));
        return UiKit.page(this, column);
    }

    private AlertStatus loadStatus() {
        SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        return AlertStatus.fromJson(state.getString(NotifierWorker.KEY_STATUS, null));
    }

    /** Runs a check when the last one is old, unless one was just asked for. */
    private void checkIfStale() {
        long now = System.currentTimeMillis();
        if (now - loadStatus().lastCheckMs > FRESH_MS && now - checkRequestedMs > FRESH_MS) {
            boolean started = NotifierWorker.requestCheckNow(this);
            gameNeverOpened = !started;
            if (started) {
                checkRequestedMs = now;
            }
        }
    }

    /** Updates the status lines; called every second while the screen is open. */
    private void refreshLive() {
        long now = System.currentTimeMillis();
        AlertStatus status = loadStatus();
        boolean checking = checkRequestedMs > status.lastCheckMs && now - checkRequestedMs < CHECKING_MS;
        notificationsView.setText(notificationsLine());
        if (gameNeverOpened && status.lastCheckMs == 0) {
            lastCheckView.setText("Open the game once to start the background checks.");
        } else {
            lastCheckView.setText(checking ? "Last check: checking now…" : status.lastCheckLine(now));
        }
        watchingView.setText(status.watchingLine());
    }

    private String notificationsLine() {
        NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        boolean allowed = nm != null && nm.areNotificationsEnabled();
        return allowed ? "Android notifications: allowed"
                : "Android notifications: BLOCKED for this app. Turn them on in Android settings or nothing will show.";
    }

    private void openGame() {
        Intent intent = GameLauncher.launchIntent(this);
        if (intent != null) {
            startActivity(intent);
        } else {
            Toast.makeText(this, "Couldn't find the Travian game to open", Toast.LENGTH_SHORT).show();
        }
    }
}
