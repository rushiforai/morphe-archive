package com.gdjztech.ringconn.ui;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.gdjztech.ringconn.engine.IntervalsSyncEngine;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class HookHelper {

    public static final String TAG_CARD = "RINGCONN_SYNC_DISCOVER_CARD";
    public static final String TAG_OLD_FAB = "INTERVALS_SYNC_FAB";
    private static volatile boolean sInDiscoverTab = false;
    private static volatile boolean sInSubmenu = false;

    public static void attachFloatingButton(final Activity activity) {
        if (activity == null) return;
        try {
            Intent testIntent = new Intent(activity, IntervalsActivity.class);
            if (activity.getPackageManager().resolveActivity(testIntent, 0) == null) {
                return;
            }
        } catch (Exception ignored) {
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    View decorView = activity.getWindow().getDecorView();
                    if (!(decorView instanceof ViewGroup)) return;
                    ViewGroup root = (ViewGroup) decorView;

                    // 1. Remove legacy floating FAB completely if present
                    View oldFab = root.findViewWithTag(TAG_OLD_FAB);
                    if (oldFab != null) {
                        root.removeView(oldFab);
                    }

                    // 2. Check if card already attached
                    View existingCard = root.findViewWithTag(TAG_CARD);
                    final View activeCard;
                    if (existingCard != null) {
                        activeCard = existingCard;
                        activeCard.setVisibility(sInDiscoverTab && !sInSubmenu ? View.VISIBLE : View.GONE);
                        if (sInDiscoverTab && !sInSubmenu) {
                            updateCard(activeCard, activity);
                        }
                    } else {
                        // 3. Build native Discover Intervals Sync Card
                        final LinearLayout card = buildSyncCard(activity);
                        card.setTag(TAG_CARD);
                        card.setVisibility(sInDiscoverTab && !sInSubmenu ? View.VISIBLE : View.GONE);
                        if (sInDiscoverTab && !sInSubmenu) {
                            updateCard(card, activity);
                        }

                        int marginPx = dpToPx(activity, 16);
                        int topMarginPx = dpToPx(activity, 404); // positioned cleanly below original Sort button
                        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        );
                        params.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
                        params.setMargins(marginPx, topMarginPx, marginPx, 0);

                        root.addView(card, params);
                        activeCard = card;
                    }

                    // 4. Hook Window Callback for touch and navigation detection
                    Window window = activity.getWindow();
                    Window.Callback currentCallback = window.getCallback();
                    if (!(currentCallback instanceof WindowCallbackWrapper)) {
                        window.setCallback(new WindowCallbackWrapper(currentCallback, activity, activeCard));
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    private static LinearLayout buildSyncCard(final Activity activity) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);

        // Native RingConn card background: #1B1B1C with 16dp rounded corners
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(0xFF1B1B1C);
        cardBg.setCornerRadius(dpToPx(activity, 16));
        card.setBackground(cardBg);
        card.setElevation(dpToPx(activity, 3));
        card.setPadding(dpToPx(activity, 16), dpToPx(activity, 16), dpToPx(activity, 16), dpToPx(activity, 16));

        // ROW 1: Header (Icon Badge + Title / Sync Status + Options Action)
        LinearLayout headerRow = new LinearLayout(activity);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);

        // Subtle circular icon badge
        TextView iconBadge = new TextView(activity);
        iconBadge.setText("⚡");
        iconBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        iconBadge.setTextColor(Color.WHITE);
        iconBadge.setGravity(Gravity.CENTER);
        int iconSize = dpToPx(activity, 32);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(iconSize, iconSize);
        GradientDrawable iconBg = new GradientDrawable();
        iconBg.setShape(GradientDrawable.OVAL);
        iconBg.setColor(0xFF2C2C2E);
        iconBadge.setBackground(iconBg);
        headerRow.addView(iconBadge, iconParams);

        // Title and Subtitle column
        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        titleParams.setMargins(dpToPx(activity, 12), 0, dpToPx(activity, 8), 0);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Intervals.icu");
        tvTitle.setTextColor(0xFFFFFFFF);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvTitle.setTypeface(Typeface.DEFAULT_BOLD);
        titleCol.addView(tvTitle);

        TextView tvSub = new TextView(activity);
        tvSub.setTag("TAG_SYNC_SUBTITLE");
        tvSub.setText("Cloud Sync • Auto-Sync");
        tvSub.setTextColor(0xFF8E8E93);
        tvSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        titleCol.addView(tvSub);

        headerRow.addView(titleCol, titleParams);

        // Status Pill badge
        TextView tvBadge = new TextView(activity);
        tvBadge.setTag("TAG_SYNC_BADGE");
        tvBadge.setText("● Active");
        tvBadge.setTextColor(0xFF34C759);
        tvBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        tvBadge.setTypeface(Typeface.DEFAULT_BOLD);
        tvBadge.setPadding(dpToPx(activity, 8), dpToPx(activity, 4), dpToPx(activity, 8), dpToPx(activity, 4));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(0x2034C759);
        pill.setCornerRadius(dpToPx(activity, 8));
        tvBadge.setBackground(pill);
        headerRow.addView(tvBadge);

        // Tapping header opens detailed IntervalsActivity
        headerRow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(activity, IntervalsActivity.class);
                activity.startActivity(intent);
            }
        });

        card.addView(headerRow);

        // ROW 2: Native RingConn White Pill Button ("⚡ Sync Now")
        final TextView btnSync = new TextView(activity);
        btnSync.setText("⚡ Sync Now");
        btnSync.setTextColor(0xFF000000);
        btnSync.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        btnSync.setTypeface(Typeface.DEFAULT_BOLD);
        btnSync.setGravity(Gravity.CENTER);
        btnSync.setPadding(0, dpToPx(activity, 12), 0, dpToPx(activity, 12));

        GradientDrawable syncBg = new GradientDrawable();
        syncBg.setCornerRadius(dpToPx(activity, 24));
        syncBg.setColor(0xFFFFFFFF); // Pure white button in RingConn style
        btnSync.setBackground(syncBg);

        LinearLayout.LayoutParams syncParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT
        );
        syncParams.setMargins(0, dpToPx(activity, 14), 0, 0);
        btnSync.setLayoutParams(syncParams);

        btnSync.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(activity, "⚡ Syncing RingConn data to Intervals.icu...", Toast.LENGTH_SHORT).show();
                btnSync.setEnabled(false);
                btnSync.setText("⏳ Syncing data...");
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
                        JSONObject res = IntervalsSyncEngine.syncDate(activity, today);
                        final boolean ok = res != null && res.optBoolean("success", false);
                        final String msg = res != null ? res.optString("message", "") : "No response";
                        activity.runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                btnSync.setEnabled(true);
                                btnSync.setText("⚡ Sync Now");
                                if (ok) {
                                    Toast.makeText(activity, "✅ Intervals.icu synced successfully!", Toast.LENGTH_LONG).show();
                                    updateCard(card, activity);
                                } else {
                                    Toast.makeText(activity, "Sync status: " + msg, Toast.LENGTH_LONG).show();
                                }
                            }
                        });
                    }
                }).start();
            }
        });

        card.addView(btnSync);

        // Tapping card background opens detailed IntervalsActivity
        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(activity, IntervalsActivity.class);
                activity.startActivity(intent);
            }
        });

        return card;
    }

    public static void updateCard(final View card, final Activity activity) {
        if (card == null || activity == null) return;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    android.content.SharedPreferences prefs = IntervalsSyncEngine.getPrefs(activity);
                    final long lastSyncTime = prefs.getLong(IntervalsSyncEngine.KEY_LAST_SYNC_TIME, 0);

                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                TextView tvSub = card.findViewWithTag("TAG_SYNC_SUBTITLE");
                                TextView tvBadge = card.findViewWithTag("TAG_SYNC_BADGE");

                                if (tvSub != null) {
                                    if (lastSyncTime > 0) {
                                        String timeStr = new SimpleDateFormat("MMM dd, HH:mm", Locale.US).format(new Date(lastSyncTime));
                                        tvSub.setText("Last sync: " + timeStr);
                                    } else {
                                        tvSub.setText("Ready to sync");
                                    }
                                }

                                if (tvBadge != null) {
                                    if (lastSyncTime > 0) {
                                        tvBadge.setText("● Synced");
                                        tvBadge.setTextColor(0xFF34C759);
                                    } else {
                                        tvBadge.setText("● Ready");
                                        tvBadge.setTextColor(0xFF38BDF8);
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    private static int dpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()
        );
    }

    private static class WindowCallbackWrapper implements Window.Callback {
        private final Window.Callback wrapped;
        private final Activity activity;
        private final View card;
        private float downX = 0f;
        private float downY = 0f;

        public WindowCallbackWrapper(Window.Callback wrapped, Activity activity, View card) {
            this.wrapped = wrapped;
            this.activity = activity;
            this.card = card;
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                downX = event.getRawX();
                downY = event.getRawY();
            } else if (action == MotionEvent.ACTION_UP) {
                float upX = event.getRawX();
                float upY = event.getRawY();
                int h = activity.getResources().getDisplayMetrics().heightPixels;
                int w = activity.getResources().getDisplayMetrics().widthPixels;
                int bottomNavThreshold = dpToPx(activity, 95);

                // 1. Check Bottom Navigation Bar taps
                if (upY > (h - bottomNavThreshold)) {
                    // Discover tab is the 2nd tab from left (roughly 18% to 42% screen width)
                    boolean isDiscoverTab = (upX >= 0.18f * w && upX <= 0.42f * w);
                    if (isDiscoverTab) {
                        sInDiscoverTab = true;
                        sInSubmenu = false;
                        card.setVisibility(View.VISIBLE);
                        updateCard(card, activity);
                    } else {
                        // Tapped another bottom tab (Insights, Health, Plan, Me)
                        sInDiscoverTab = false;
                        sInSubmenu = false;
                        card.setVisibility(View.GONE);
                    }
                } else if (sInDiscoverTab) {
                    // 2. User is on Discover tab
                    Rect cardRect = new Rect();
                    card.getGlobalVisibleRect(cardRect);

                    // If tap is inside card, card click listeners handle it
                    if (!cardRect.contains((int) upX, (int) upY)) {
                        float dx = Math.abs(upX - downX);
                        float dy = Math.abs(upY - downY);
                        float slop = dpToPx(activity, 15);

                        // If it's a tap/click (not a scroll gesture)
                        if (dx < slop && dy < slop) {
                            if (sInSubmenu) {
                                // In submenu: top-left back button tap exits submenu
                                if (upX < 0.22f * w && upY < dpToPx(activity, 90)) {
                                    sInSubmenu = false;
                                    card.setVisibility(View.VISIBLE);
                                    updateCard(card, activity);
                                }
                            } else {
                                // On Discover root: tapping content above or below the card (Exercise cards, Sort, etc.) opens submenu
                                if (upY > dpToPx(activity, 75) && (upY < cardRect.top || upY > (cardRect.bottom + dpToPx(activity, 15)))) {
                                    sInSubmenu = true;
                                    card.setVisibility(View.GONE);
                                }
                            }
                        }
                    }
                }
            }
            return wrapped != null ? wrapped.dispatchTouchEvent(event) : false;
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            if (event.getKeyCode() == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
                if (sInDiscoverTab && sInSubmenu) {
                    sInSubmenu = false;
                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            card.setVisibility(View.VISIBLE);
                            updateCard(card, activity);
                        }
                    });
                }
            }
            return wrapped != null ? wrapped.dispatchKeyEvent(event) : false;
        }

        @Override public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) { return wrapped != null ? wrapped.dispatchPopulateAccessibilityEvent(event) : false; }
        @Override public boolean dispatchKeyShortcutEvent(KeyEvent event) { return wrapped != null ? wrapped.dispatchKeyShortcutEvent(event) : false; }
        @Override public boolean dispatchTrackballEvent(MotionEvent event) { return wrapped != null ? wrapped.dispatchTrackballEvent(event) : false; }
        @Override public boolean dispatchGenericMotionEvent(MotionEvent event) { return wrapped != null ? wrapped.dispatchGenericMotionEvent(event) : false; }
        @Override public View onCreatePanelView(int featureId) { return wrapped != null ? wrapped.onCreatePanelView(featureId) : null; }
        @Override public boolean onCreatePanelMenu(int featureId, Menu menu) { return wrapped != null ? wrapped.onCreatePanelMenu(featureId, menu) : false; }
        @Override public boolean onPreparePanel(int featureId, View view, Menu menu) { return wrapped != null ? wrapped.onPreparePanel(featureId, view, menu) : false; }
        @Override public boolean onMenuOpened(int featureId, Menu menu) { return wrapped != null ? wrapped.onMenuOpened(featureId, menu) : false; }
        @Override public boolean onMenuItemSelected(int featureId, MenuItem item) { return wrapped != null ? wrapped.onMenuItemSelected(featureId, item) : false; }
        @Override public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) { if (wrapped != null) wrapped.onWindowAttributesChanged(attrs); }
        @Override public void onContentChanged() { if (wrapped != null) wrapped.onContentChanged(); }
        @Override public void onWindowFocusChanged(boolean hasFocus) { if (wrapped != null) wrapped.onWindowFocusChanged(hasFocus); }
        @Override public void onAttachedToWindow() { if (wrapped != null) wrapped.onAttachedToWindow(); }
        @Override public void onDetachedFromWindow() { if (wrapped != null) wrapped.onDetachedFromWindow(); }
        @Override public void onPanelClosed(int featureId, Menu menu) { if (wrapped != null) wrapped.onPanelClosed(featureId, menu); }
        @Override public boolean onSearchRequested() { return wrapped != null ? wrapped.onSearchRequested() : false; }
        @Override public boolean onSearchRequested(SearchEvent searchEvent) { return wrapped != null ? wrapped.onSearchRequested(searchEvent) : false; }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) { return wrapped != null ? wrapped.onWindowStartingActionMode(callback) : null; }
        @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) { return wrapped != null ? wrapped.onWindowStartingActionMode(callback, type) : null; }
        @Override public void onActionModeStarted(ActionMode mode) { if (wrapped != null) wrapped.onActionModeStarted(mode); }
        @Override public void onActionModeFinished(ActionMode mode) { if (wrapped != null) wrapped.onActionModeFinished(mode); }
    }
}

