package app.hushmessenger.extension;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Reopen the real launcher in a fresh process after pending settings writes finish. */
public class RestartActivity extends Activity {
    @Override @SuppressWarnings("deprecation") public void onCreate(Bundle state) {
        // On a Root Mount install this screen can be the first thing in the process, before any hook.
        HostScreens.start(this);
        Settings.initialize(this);
        boolean light = Settings.preferences.getBoolean("light", false);
        setTheme(light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        SettingsUi ui = new SettingsUi(this, light);
        getWindow().setStatusBarColor(ui.background);
        getWindow().setNavigationBarColor(ui.background);
        getWindow().getDecorView().setSystemUiVisibility(light ? android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        setContentView(content(ui));
        launch = launcherIntent(this);
        if (launch == null) {
            fail("restart_unavailable");
            return;
        }
        // Only a restart asked for from settings carries a page to come back to.
        String page = getIntent().getStringExtra(SettingsReopen.EXTRA);
        new Thread(() -> {
            boolean saved = saveBeforeRestart(Settings.preferences, page);
            runOnUiThread(() -> saved(saved));
        }, "HushMessenger-save-restart").start();
    }

    /** How long a saved restart waits for Android to say this screen is in before it relaunches anyway. */
    static final long SHOWN_WAIT_MS = 1_500;
    private final Handler main = new Handler(Looper.getMainLooper());
    Intent launch;
    private boolean savedOk, shown, relaunched;
    private final Runnable shownAnyway = () -> { shown = true; relaunchWhenReady(); };

    /** The save finished. A failed one reports at once, a good one relaunches when this screen is in. */
    void saved(boolean ok) {
        if (!ok) {
            completeRestart(launch, false);
            return;
        }
        savedOk = true;
        if (!shown) main.postDelayed(shownAnyway, SHOWN_WAIT_MS);
        relaunchWhenReady();
    }

    /**
     * The relaunch waits for this. Sent while this screen was still coming in, the process exited before Android had
     * shown it, and Android, which brings back the screen in front only when a shown one dies, left Messenger's start
     * screen without a process: a black screen on the S25 in 2 of 3 restarts.
     */
    @Override public void onEnterAnimationComplete() {
        super.onEnterAnimationComplete();
        shown = true;
        relaunchWhenReady();
    }

    private void relaunchWhenReady() {
        if (!shown || !savedOk || relaunched) return;
        relaunched = true;
        main.removeCallbacks(shownAnyway);
        completeRestart(launch, true);
    }

    /** A scrollable status pane also fits large text and a short split-screen window. */
    static View content(SettingsUi ui) {
        SettingsText text = new SettingsText(ui.context);
        LinearLayout root = ui.column();
        root.setTag("restart_page");
        root.setBackgroundColor(ui.background);
        root.setPadding(ui.dp(24), ui.dp(24), ui.dp(24), ui.dp(24));
        root.setLayoutDirection(text.layoutDirection());
        if (text.layoutDirection() == View.LAYOUT_DIRECTION_RTL) root.setTextDirection(View.TEXT_DIRECTION_RTL);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            DisplayCutout cutout = insets.getDisplayCutout();
            int left = insets.getSystemWindowInsetLeft(), top = insets.getSystemWindowInsetTop();
            int right = insets.getSystemWindowInsetRight(), bottom = insets.getSystemWindowInsetBottom();
            if (cutout != null) {
                left = Math.max(left, cutout.getSafeInsetLeft());
                top = Math.max(top, cutout.getSafeInsetTop());
                right = Math.max(right, cutout.getSafeInsetRight());
                bottom = Math.max(bottom, cutout.getSafeInsetBottom());
            }
            root.setPadding(ui.dp(24) + left, ui.dp(24) + top, ui.dp(24) + right, ui.dp(24) + bottom);
            return insets.consumeSystemWindowInsets().consumeDisplayCutout();
        });
        ScrollView scroll = new ScrollView(ui.context);
        scroll.setFillViewport(true);
        FrameLayout center = new FrameLayout(ui.context);
        LinearLayout message = ui.column();
        message.setGravity(Gravity.CENTER);
        message.setPadding(ui.dp(24), ui.dp(32), ui.dp(24), ui.dp(32));
        message.setBackground(ui.shape(ui.surface, ui.line, 12));
        TextView brand = ui.heading("HushMessenger");
        brand.setGravity(Gravity.CENTER);
        brand.setTextSize(11);
        brand.setLetterSpacing(0.12f);
        brand.setTag("restart_brand");
        ShimmerTitle.wear(brand, ui.light);
        message.addView(brand);
        View accent = new View(ui.context);
        accent.setBackground(ui.shape(ui.accent, 0, 2));
        accent.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams accentParams = new LinearLayout.LayoutParams(ui.dp(56), ui.dp(4));
        accentParams.topMargin = ui.dp(20);
        message.addView(accent, accentParams);
        TextView status = ui.title(text.get("restarting"), 24);
        status.setTag("restart_status");
        status.setGravity(Gravity.CENTER);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(message, status, 24);
        TextView detail = ui.text(text.get("restart_saving"), 14, ui.muted, false);
        detail.setTag("restart_detail");
        detail.setGravity(Gravity.CENTER);
        detail.setMaxWidth(ui.dp(220));
        LinearLayout.LayoutParams detailParams = new LinearLayout.LayoutParams(-2, -2);
        detailParams.topMargin = ui.dp(16);
        message.addView(detail, detailParams);
        ProgressBar progress = new ProgressBar(ui.context, null, android.R.attr.progressBarStyleHorizontal);
        progress.setTag("restart_progress");
        progress.setIndeterminate(true);
        progress.setBackground(ui.shape(ui.line, 0, 2));
        progress.setIndeterminateTintList(ColorStateList.valueOf(ui.accent));
        progress.setProgressBackgroundTintList(ColorStateList.valueOf(ui.line));
        progress.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams progressParams = new LinearLayout.LayoutParams(-1, ui.dp(4));
        progressParams.setMarginStart(ui.dp(12));
        progressParams.setMarginEnd(ui.dp(12));
        progressParams.topMargin = ui.dp(32);
        message.addView(progress, progressParams);
        center.addView(message, new FrameLayout.LayoutParams(-1, -2, Gravity.CENTER));
        scroll.addView(center);
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        TextView account = ui.text(text.get("restart_account"), 12, ui.muted, false);
        account.setGravity(Gravity.CENTER);
        ui.add(root, account, 24);
        return root;
    }

    static Intent launcherIntent(Context context) {
        String packageName = context.getPackageName();
        PackageManager packages = context.getPackageManager();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(packageName);
        for (ResolveInfo match : packages.queryIntentActivities(query, 0)) {
            var activity = match.activityInfo;
            if (activity == null || !packageName.equals(activity.packageName) || activity.name == null ||
                activity.name.startsWith("app.hushmessenger.extension.") ||
                (activity.targetActivity != null && activity.targetActivity.startsWith("app.hushmessenger.extension.")) ||
                !enabledNow(packages, packageName, activity)) continue;
            return Intent.makeRestartActivityTask(new ComponentName(packageName, activity.name)).setPackage(packageName);
        }
        return null;
    }

    /**
     * ActivityInfo.enabled is the manifest value. Alternate app icons are manifest-disabled aliases
     * that Messenger enables at runtime, so the runtime state decides and the manifest only backs DEFAULT.
     */
    static boolean enabledNow(PackageManager packages, String packageName, ActivityInfo activity) {
        int state;
        try { state = packages.getComponentEnabledSetting(new ComponentName(packageName, activity.name)); }
        // queryIntentActivities without MATCH_DISABLED_COMPONENTS has already left out disabled components.
        catch (IllegalArgumentException | SecurityException unknown) { return true; }
        if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) return true;
        if (state != PackageManager.COMPONENT_ENABLED_STATE_DEFAULT) return false;
        return activity.applicationInfo != null ? activity.isEnabled() : activity.enabled;
    }

    static boolean saveBeforeRestart(SharedPreferences preferences) { return saveBeforeRestart(preferences, null); }

    /** Saves the choices, and with a [page] the marker that brings settings back on it after the relaunch. */
    static boolean saveBeforeRestart(SharedPreferences preferences, String page) {
        try {
            // A changed value forces a disk write of the latest choices, including pending apply() calls.
            return preferences != null && SettingsReopen.remember(preferences.edit().putLong("restart_requested_at", System.nanoTime()),
                page, android.os.SystemClock.elapsedRealtime()).commit();
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Couldn't save settings before restart", error);
            return false;
        }
    }

    void completeRestart(Intent launch, boolean saved) {
        // Every way out but the relaunch leaves this process running, so the next start mustn't open settings. A screen
        // rebuilt for a theme, language or window change saves its own marker, which this one mustn't remove.
        if (isFinishing() || isDestroyed()) {
            if (!isChangingConfigurations()) SettingsReopen.forget(Settings.preferences);
            return;
        }
        if (!saved) {
            SettingsReopen.forget(Settings.preferences);
            fail("restart_save_failed");
            return;
        }
        try {
            startActivity(launch);
            // Settings come back after a restart asked for from them, so their task goes now, while this process can
            // still close every screen in it. One left in a dead process outlived the reopen's FLAG_ACTIVITY_CLEAR_TASK
            // on One UI and showed on Back. A Root Mount install's settings live inside the stock host and stay.
            if (getIntent().getStringExtra(SettingsReopen.EXTRA) != null && !HostScreens.hosted(this)) removeTask();
            else finish();
            exitProcess();
        } catch (android.content.ActivityNotFoundException | SecurityException error) {
            Log.e("HushMessenger", "Couldn't restart Messenger", error);
            SettingsReopen.forget(Settings.preferences);
            fail("restart_unavailable");
        }
    }

    void exitProcess() { System.exit(0); }

    /**
     * Closes this screen's whole task. Activity.finishAndRemoveTask only does that from the task's first screen, and
     * this one sits on top of settings, so the task is found by its id. Without it, this screen alone finishes.
     */
    void removeTask() {
        try {
            ActivityManager activities = getSystemService(ActivityManager.class);
            if (activities != null) for (ActivityManager.AppTask task : activities.getAppTasks()) {
                ActivityManager.RecentTaskInfo info = task.getTaskInfo();
                @SuppressWarnings("deprecation") int id = Build.VERSION.SDK_INT >= 29 ? info.taskId : info.persistentId;
                if (id == getTaskId()) {
                    task.finishAndRemoveTask();
                    return;
                }
            }
        } catch (RuntimeException gone) {
            Log.w("HushMessenger", "Couldn't close the settings task before the restart", gone);
        }
        finish();
    }

    private void fail(String message) {
        Log.e("HushMessenger", message);
        Toast.makeText(this, new SettingsText(this).get(message), Toast.LENGTH_LONG).show();
        finish();
    }
}
