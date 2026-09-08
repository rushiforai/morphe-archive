package com.gdjztech.ringconn.ui;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
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

    public static final String TAG_CARD = "CYCLING_COACH_DISCOVER_CARD";
    public static final String TAG_OLD_FAB = "INTERVALS_SYNC_FAB";
    private static volatile boolean sIsDiscoverTab = false;

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

                    // 1. Remove legacy floating FAB completely
                    View oldFab = root.findViewWithTag(TAG_OLD_FAB);
                    if (oldFab != null) {
                        root.removeView(oldFab);
                    }

                    // 2. Check if card already attached
                    View existingCard = root.findViewWithTag(TAG_CARD);
                    if (existingCard != null) {
                        if (sIsDiscoverTab) {
                            existingCard.setVisibility(View.VISIBLE);
                            updateCard(existingCard, activity);
                        } else {
                            existingCard.setVisibility(View.GONE);
                        }
                        return;
                    }

                    // 3. Build native Discover Coach Card
                    // 3. Build native Discover Intervals Sync Card
                    final LinearLayout card = buildSyncCard(activity);
                    card.setTag(TAG_CARD);
                    card.setVisibility(sIsDiscoverTab ? View.VISIBLE : View.GONE);
                    if (sIsDiscoverTab) {
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

                    // 4. Hook Window Callback for instantaneous tab switching on bottom nav touch
                    Window window = activity.getWindow();
                    Window.Callback currentCallback = window.getCallback();
                    if (!(currentCallback instanceof WindowCallbackWrapper)) {
                        window.setCallback(new WindowCallbackWrapper(currentCallback, activity, card));
                    }

                    // 5. Periodic Accessibility Check to confirm Discover state
                    final Handler handler = new Handler(Looper.getMainLooper());
                    Runnable checkRunnable = new Runnable() {
                        @Override
                        public void run() {
                            if (activity.isFinishing() || activity.isDestroyed()) return;
                            try {
                                View decor = activity.getWindow().getDecorView();
                                AccessibilityNodeInfo rootNode = decor.createAccessibilityNodeInfo();
                                if (rootNode != null) {
                                    boolean hasSelectExercise = findNodeWithText(rootNode, "Select Exercise");
                                    rootNode.recycle();
                                    if (hasSelectExercise) {
                                        sIsDiscoverTab = true;
                                    }
                                }
                                if (sIsDiscoverTab && card.getVisibility() != View.VISIBLE) {
                                    card.setVisibility(View.VISIBLE);
                                    updateCard(card, activity);
                                }
                            } catch (Exception ignored) {}
                            handler.postDelayed(this, 400);
                        }
                    };
                    handler.postDelayed(checkRunnable, 400);

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
        tvSub.setText("Cloud-Synchronisation • Auto-Sync");
        tvSub.setTextColor(0xFF8E8E93);
        tvSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        titleCol.addView(tvSub);

        headerRow.addView(titleCol, titleParams);

        // Status Pill badge
        TextView tvBadge = new TextView(activity);
        tvBadge.setTag("TAG_SYNC_BADGE");
        tvBadge.setText("● Aktiv");
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

        // ROW 2: Native RingConn White Pill Button ("⚡ Jetzt synchronisieren")
        final TextView btnSync = new TextView(activity);
        btnSync.setText("⚡ Jetzt synchronisieren");
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
                Toast.makeText(activity, "⚡ Übertrage RingConn-Daten zu Intervals.icu...", Toast.LENGTH_SHORT).show();
                btnSync.setEnabled(false);
                btnSync.setText("⏳ Übertrage Daten...");
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
                        JSONObject res = IntervalsSyncEngine.syncDate(activity, today);
                        final boolean ok = res != null && res.optBoolean("success", false);
                        final String msg = res != null ? res.optString("message", "") : "Keine Antwort";
                        activity.runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                btnSync.setEnabled(true);
                                btnSync.setText("⚡ Jetzt synchronisieren");
                                if (ok) {
                                    Toast.makeText(activity, "✅ Intervals.icu erfolgreich synchronisiert!", Toast.LENGTH_LONG).show();
                                    updateCard(card, activity);
                                } else {
                                    Toast.makeText(activity, "Sync-Status: " + msg, Toast.LENGTH_LONG).show();
                                }
                            }
                        });
                    }
                }).start();
            }
        });

        card.addView(btnSync);

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
                                        String timeStr = new SimpleDateFormat("dd.MM. HH:mm", Locale.GERMANY).format(new Date(lastSyncTime));
                                        tvSub.setText("Letzter Sync: " + timeStr);
                                    } else {
                                        tvSub.setText("Bereit für Synchronisation");
                                    }
                                }

                                if (tvBadge != null) {
                                    if (lastSyncTime > 0) {
                                        tvBadge.setText("● Synced");
                                        tvBadge.setTextColor(0xFF34C759);
                                    } else {
                                        tvBadge.setText("● Bereit");
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

    private static boolean findNodeWithText(AccessibilityNodeInfo node, String text) {
        if (node == null) return false;
        CharSequence cd = node.getContentDescription();
        if (cd != null && cd.toString().contains(text)) return true;
        CharSequence t = node.getText();
        if (t != null && t.toString().contains(text)) return true;
        int count = node.getChildCount();
        for (int i = 0; i < count; i++) {
            AccessibilityNodeInfo child = node.getChild(i);
            if (child != null) {
                boolean found = findNodeWithText(child, text);
                child.recycle();
                if (found) return true;
            }
        }
        return false;
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

        public WindowCallbackWrapper(Window.Callback wrapped, Activity activity, View card) {
            this.wrapped = wrapped;
            this.activity = activity;
            this.card = card;
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            if (event.getAction() == MotionEvent.ACTION_UP) {
                float y = event.getRawY();
                float x = event.getRawX();
                int h = activity.getResources().getDisplayMetrics().heightPixels;
                int w = activity.getResources().getDisplayMetrics().widthPixels;
                int threshold = dpToPx(activity, 85);
                if (y > (h - threshold)) {
                    boolean isDiscover = (x >= 0.20f * w && x <= 0.40f * w);
                    sIsDiscoverTab = isDiscover;
                    card.setVisibility(isDiscover ? View.VISIBLE : View.GONE);
                    if (isDiscover) {
                        updateCard(card, activity);
                    }
                }
            }
            return wrapped != null ? wrapped.dispatchTouchEvent(event) : false;
        }

        @Override public boolean dispatchKeyEvent(KeyEvent event) { return wrapped != null ? wrapped.dispatchKeyEvent(event) : false; }
        @Override public boolean dispatchKeyShortcutEvent(KeyEvent event) { return wrapped != null ? wrapped.dispatchKeyShortcutEvent(event) : false; }
        @Override public boolean dispatchTrackballEvent(MotionEvent event) { return wrapped != null ? wrapped.dispatchTrackballEvent(event) : false; }
        @Override public boolean dispatchGenericMotionEvent(MotionEvent event) { return wrapped != null ? wrapped.dispatchGenericMotionEvent(event) : false; }
        @Override public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) { return wrapped != null ? wrapped.dispatchPopulateAccessibilityEvent(event) : false; }
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

