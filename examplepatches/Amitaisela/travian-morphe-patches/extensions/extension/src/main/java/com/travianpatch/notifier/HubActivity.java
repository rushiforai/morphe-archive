package com.travianpatch.notifier;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * "Travian Tools" (the second launcher icon): one screen with six tabs at the bottom - Village (what is
 * building, auto-build, the queue and what can be built), Alerts, Activity (what the app did, recent
 * notifications), Oases (hero raid targets, empty oases), Silver (auction house) and Settings. A one-line status sits at the top.
 * Opening it runs a check when the last one is old. Plain programmatic views, so it needs no layout resources added to the game's APK.
 */
public class HubActivity extends Activity {

    /** Intent extra: which tab to open (0 Village, 1 Alerts, 2 Activity, 3 Oases, 4 Silver, 5 Settings). */
    static final String EXTRA_TAB = "tab";
    static final int TAB_VILLAGE = 0;
    static final int TAB_ALERTS = 1;
    static final int TAB_ACTIVITY = 2;
    static final int TAB_OASES = 3;
    static final int TAB_SILVER = 4;
    static final int TAB_SETTINGS = 5;

    private static final long REFRESH_MS = 1000L;
    private static final long FRESH_MS = 15_000L;
    private static final long CHECKING_MS = 30_000L;

    /** One tab's content. build() makes the views; tick() runs every second while it is shown. */
    interface Tab {
        View build();

        void tick();
    }

    private final Handler handler = new Handler(Looper.getMainLooper());
    private TextView statusView;
    private FrameLayout content;
    private FrameLayout tabBarHolder;
    private ScrollView scroll;
    private int current = TAB_VILLAGE;
    private Tab[] tabs;
    private long checkRequestedMs = 0;
    private boolean gameNeverOpened = false;

    private final Runnable refresh = new Runnable() {
        @Override
        public void run() {
            refreshStatus();
            if (tabs != null) {
                tabs[current].tick();
            }
            handler.postDelayed(this, REFRESH_MS);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        NotifierBootstrap.ensureChannels(this); // this screen can be opened before the game ever was
        tabs = new Tab[]{new VillageTab(this), new AlertsTab(this), new ActivityTab(this), new OasisTab(this),
                new SilverTab(this), new SettingsTab(this)};
        current = getIntent().getIntExtra(EXTRA_TAB, TAB_VILLAGE);
        setContentView(buildFrame());
        showTab(current);
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        showTab(intent.getIntExtra(EXTRA_TAB, current));
    }

    @Override
    protected void onResume() {
        super.onResume();
        checkIfStale();
        showTab(current);
        refresh.run();
    }

    @Override
    protected void onPause() {
        super.onPause();
        handler.removeCallbacks(refresh);
    }

    private View buildFrame() {
        final LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(UiKit.background(this));

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.VERTICAL);
        final int pad = UiKit.dp(this, 16);
        header.setPadding(pad, UiKit.dp(this, 10), pad, UiKit.dp(this, 6));
        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        titleRow.addView(UiKit.text(this, "Travian Tools", 22, true, UiKit.textColor(this)),
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        titleRow.addView(UiKit.pill(this, "Open game", true, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openGame();
            }
        }));
        header.addView(titleRow);
        statusView = UiKit.muted(this, "");
        statusView.setPadding(0, UiKit.dp(this, 4), 0, 0);
        header.addView(statusView);
        root.addView(header);

        content = new FrameLayout(this);
        root.addView(content, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
        tabBarHolder = new FrameLayout(this);
        root.addView(tabBarHolder);

        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                root.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
                return insets;
            }
        });
        UiKit.styleBarsLater(this, root);
        return root;
    }

    /** Shows a tab (rebuilding its views from the latest saved data). */
    void showTab(int index) {
        if (index < 0 || index >= tabs.length) {
            index = TAB_VILLAGE;
        }
        boolean same = index == current && scroll != null;
        int keepY = same ? scroll.getScrollY() : 0;
        current = index;
        content.removeAllViews();
        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        int pad = UiKit.dp(this, 16);
        column.setPadding(pad, UiKit.dp(this, 4), pad, pad);
        column.addView(tabs[index].build());
        scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(column);
        content.addView(scroll);
        final int y = keepY;
        scroll.post(new Runnable() {
            @Override
            public void run() {
                scroll.scrollTo(0, y);
            }
        });
        tabBarHolder.removeAllViews();
        tabBarHolder.addView(UiKit.tabBar(this, new String[]{"🏠", "🔔", "📜", "🌴", "💰", "⚙"},
                new String[]{"Village", "Alerts", "Activity", "Oases", "Silver", "Settings"}, current, new UiKit.OnPick() {
                    @Override
                    public void picked(int i) {
                        showTab(i);
                    }
                }));
    }

    /** Redraws the current tab (after a change that alters what it shows). */
    void redraw() {
        showTab(current);
    }

    private AlertStatus loadStatus() {
        SharedPreferences state = getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE);
        return AlertStatus.fromJson(state.getString(NotifierWorker.KEY_STATUS, null));
    }

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

    /** The one status line at the top: last check, attacks, and anything that needs attention. */
    private void refreshStatus() {
        long now = System.currentTimeMillis();
        AlertStatus status = loadStatus();
        StringBuilder sb = new StringBuilder();
        NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        if (nm != null && !nm.areNotificationsEnabled()) {
            sb.append("⚠ Notifications are blocked for this app in Android settings. ");
        }
        if (gameNeverOpened && status.lastCheckMs == 0) {
            sb.append("Open the game once to start the checks.");
        } else if (checkRequestedMs > status.lastCheckMs && now - checkRequestedMs < CHECKING_MS) {
            sb.append("● checking now…");
        } else if (status.lastCheckMs > 0) {
            sb.append("● checked ").append(AlertStatus.duration(now - status.lastCheckMs)).append(" ago");
            if (status.attacks > 0) {
                sb.append("  ·  ⚔ ").append(status.attacks).append(status.attacks == 1 ? " attack" : " attacks")
                        .append(" incoming");
            }
            if (status.note != null && !status.note.startsWith("OK") && status.note.length() > 0) {
                sb.append("  ·  ").append(status.note);
            }
        } else {
            sb.append("Not checked yet.");
        }
        statusView.setText(sb.toString());
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
