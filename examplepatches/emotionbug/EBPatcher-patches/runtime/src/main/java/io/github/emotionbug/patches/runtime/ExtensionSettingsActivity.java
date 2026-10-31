package io.github.emotionbug.patches.runtime;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import rikka.shizuku.Shizuku;

/** Private, in-app settings. No launcher, recording consent gate, audio capture or network requests. */
public final class ExtensionSettingsActivity extends Activity {
    private static final int REQUEST_PERMISSION = 29044;
    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "EBPatcher-settings");
        thread.setDaemon(true);
        return thread;
    });
    private volatile boolean resumed;
    private volatile int revision;
    private final Shizuku.OnRequestPermissionResultListener permissionResult = (request, result) -> {
        if (request == REQUEST_PERMISSION) runOnUiThread(() -> { if (resumed) refresh(false); });
    };
    private boolean listenerRegistered;
    private LinearLayout content;
    private TextView status;
    private Button authorize;
    private Button refresh;
    private ExtensionSettingsEntry.NativeRow summarySettings;

    public static void open(Activity host) {
        try {
            host.startActivity(new Intent(host, ExtensionSettingsActivity.class));
        } catch (RuntimeException unavailable) {
            android.util.Log.w("EBPatcherSettings", "Unable to open settings", unavailable);
            try { Toast.makeText(host, "Unable to open EBPatcher settings", Toast.LENGTH_LONG).show(); }
            catch (RuntimeException displayUnavailable) {
                android.util.Log.w("EBPatcherSettings", "Unable to display settings error", displayUnavailable);
            }
        }
    }

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        if (getActionBar() != null) getActionBar().hide();
        setTitle("EBPatcher settings");
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(24), dp(12), dp(24), dp(24));
        scroll.addView(content, new ScrollView.LayoutParams(-1, -2));
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        setContentView(scroll);
        addButton("Back", this::finish);
        addText("EBPatcher settings", 26, true);
        addText("Recording stays controlled by ACall's existing recording settings and call screen.", 15, false);

        addText("Recording", 20, true);
        addToggle("Show recording failure messages", ExtensionSettings.FAILURE_TOASTS, true);
        addText("Show the failure reason in a Toast. Turning this off does not hide errors from ACall or change recording results.", 14, false);
        addButton("Open recording settings", () -> openSettings(new Intent().setClassName(getPackageName(),
                "com.skt.prod.dialer.activities.setting.tservice.callrecord.CallRecordSettingActivity")));
        addToggle("Keep call channels separate", ExtensionSettings.SEPARATE_CHANNELS, false);
        addText("Requests stereo VOICE_CALL for the next recording. Device support is required. Local transcripts keep Channel 1 and Channel 2 separate; caller/recipient mapping is not verified. Unsupported capture reports an error without affecting the phone call. Off keeps compatible mono recording.", 14, false);

        addText("Shizuku", 20, true);
        addToggle("Ask for Shizuku on app launch", ExtensionSettings.AUTO_PERMISSION, true);
        addText("Applies on the next app launch. Requests access only when the main screen is open and the phone is idle. Denial never enables recording.", 14, false);
        status = addText("Checking authorization...", 15, false);
        authorize = addButton("Authorize Shizuku", () -> refresh(true));
        refresh = addButton("Refresh status", () -> refresh(false));
        addText("Authorization does not verify audio capture or two-party audibility. No recording is started from this screen.", 14, false);

        addText("Notifications", 20, true);
        addButton("Open notification settings", () -> openSettings(new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(Settings.EXTRA_APP_PACKAGE, getPackageName())));
        addText("Recording status must remain visible. This menu does not upload audio or change ACall's summary settings.", 14, false);
        try {
            summarySettings = ExtensionSettingsEntry.nativeRow(this, content, "On-device summaries",
                    () -> openSettings(new Intent(this, SummarySettingsActivity.class)));
            summarySettings.view.setVisibility(android.view.View.GONE);
            content.addView(summarySettings.view);
            summarySettings.watchBadge();
        } catch (RuntimeException | LinkageError unsupported) {
            android.util.Log.w("EBPatcherSettings", "Original summary settings row is unavailable", unsupported);
        }
        try {
            Shizuku.addRequestPermissionResultListener(permissionResult);
            listenerRegistered = true;
        } catch (RuntimeException | LinkageError unavailable) {
            // Status refresh still reports missing or unsupported Shizuku without blocking settings.
        }
    }

    private void addToggle(String label, String key, boolean defaultValue) {
        Switch toggle = new Switch(this);
        toggle.setText(label);
        toggle.setTextSize(16);
        toggle.setPadding(0, dp(12), 0, dp(12));
        toggle.setChecked(ExtensionSettings.local(this).getBoolean(key, defaultValue));
        toggle.setOnCheckedChangeListener((button, checked) ->
                ExtensionSettings.local(this).edit().putBoolean(key, checked).apply());
        content.addView(toggle, new LinearLayout.LayoutParams(-1, -2));
    }

    private TextView addText(String text, int size, boolean heading) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(size);
        view.setPadding(0, dp(heading ? 20 : 8), 0, dp(8));
        view.setAccessibilityHeading(heading);
        content.addView(view, new LinearLayout.LayoutParams(-1, -2));
        return view;
    }

    private Button addButton(String label, Runnable action) {
        Button button = new Button(this);
        button.setText(label);
        button.setAllCaps(false);
        button.setOnClickListener(view -> action.run());
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
        layout.topMargin = dp(8);
        content.addView(button, layout);
        return button;
    }

    private void openSettings(Intent intent) {
        try {
            startActivity(intent);
        } catch (RuntimeException unavailable) {
            Toast.makeText(this, "Unable to open these settings", Toast.LENGTH_LONG).show();
        }
    }

    private void refresh(boolean requestPermission) {
        if (!resumed || isDestroyed()) return;
        final int token = ++revision;
        authorize.setEnabled(false);
        refresh.setEnabled(false);
        status.setText("Checking authorization...");
        try {
            worker.execute(() -> {
                if (!resumed || token != revision) return;
                String message;
                try {
                    message = authorizationStatus(requestPermission, token);
                    NotificationManager notifications = getSystemService(NotificationManager.class);
                    message += "\nNotifications: " + (notifications != null && notifications.areNotificationsEnabled() ? "Enabled" : "Disabled");
                } catch (RuntimeException | LinkageError unavailable) {
                    message = "Unable to check Shizuku: " + (unavailable.getMessage() == null
                            ? unavailable.getClass().getSimpleName() : unavailable.getMessage());
                }
                final String observed = message;
                final ModelUpdateBadge.State models = ModelUpdateBadge.observe(getApplicationContext());
                runOnUiThread(() -> {
                    if (!resumed || isDestroyed() || token != revision) return;
                    status.setText(observed);
                    authorize.setEnabled(true);
                    refresh.setEnabled(true);
                    if (summarySettings != null) {
                        summarySettings.view.setVisibility(models.available() ? android.view.View.VISIBLE : android.view.View.GONE);
                        summarySettings.refreshBadge();
                    }
                });
            });
        } catch (RuntimeException unavailable) {
            status.setText("Unable to check authorization. Reopen settings to try again.");
            authorize.setEnabled(true);
            refresh.setEnabled(true);
        }
    }

    private String authorizationStatus(boolean requestPermission, int token) {
        if (!Shizuku.pingBinder()) return "Shizuku is not running. Start it using wireless debugging or ADB.";
        if (Shizuku.isPreV11() || Shizuku.getVersion() < 13) return "Shizuku version 13 or later is required.";
        if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
            return Shizuku.getUid() == 2000 ? "Shizuku is authorized in shell mode."
                    : "Unsupported Shizuku mode. Start Shizuku as shell UID 2000, not root.";
        }
        if (!requestPermission) return "Shizuku authorization is required for embedded recording.";
        if (RecorderBootstrap.readCallState(this) != StartupPermissionPolicy.CallState.IDLE)
            return "Access was not requested. Finish any current call and allow Phone permission before authorizing Shizuku.";
        if (!resumed || token != revision) return "Authorization request cancelled because settings is no longer active.";
        Shizuku.requestPermission(REQUEST_PERMISSION);
        return "Authorization requested. Choose whether to allow access in Shizuku.";
    }

    @Override public void onResume() {
        super.onResume();
        resumed = true;
        refresh(false);
    }

    @Override public void onPause() {
        resumed = false;
        revision++;
        super.onPause();
    }

    @Override public void onDestroy() {
        resumed = false;
        revision++;
        if (listenerRegistered) {
            try { Shizuku.removeRequestPermissionResultListener(permissionResult); }
            catch (RuntimeException | LinkageError unavailable) { /* Optional SDK cleanup only. */ }
        }
        worker.shutdownNow();
        super.onDestroy();
    }

    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
