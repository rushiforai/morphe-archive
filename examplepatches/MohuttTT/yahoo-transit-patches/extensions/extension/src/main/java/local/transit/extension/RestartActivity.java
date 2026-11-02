package local.transit.extension;

import android.app.Activity;
import android.app.Application;
import android.app.LocaleManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.LocaleList;
import android.os.Process;
import android.widget.TextView;
import java.io.File;

/** Foreground coordinator survives the main process and waits for its complete exit. */
public final class RestartActivity extends Activity {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean started;
    private int parent;
    private int attempts;
    public static boolean isRestartProcess() {
        return Application.getProcessName().endsWith(":transit_restart");
    }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        TextView status = new TextView(this);
        String tag = getIntent().getStringExtra("transit_language");
        status.setText("en".equals(tag) ? "Restarting…" : "再起動しています…");
        status.setGravity(android.view.Gravity.CENTER);
        status.setTextSize(18);
        setContentView(status);
    }
    @Override public void onWindowFocusChanged(boolean focused) {
        super.onWindowFocusChanged(focused);
        if (!focused || started) return;
        started = true;
        parent = getIntent().getIntExtra("transit_parent_pid", -1);
        if (!isRestartProcess() || parent <= 0 || parent == Process.myPid()) { finish(); return; }
        // Locale recreation is confined to the old UI; this helper handles locale changes.
        String tag = getIntent().getStringExtra("transit_language");
        getSystemService(LocaleManager.class).setApplicationLocales(LocaleList.forLanguageTags(tag == null ? "" : tag));
        handler.postDelayed(() -> {
            Process.killProcess(parent);
            handler.postDelayed(this::waitForExit, 100);
        }, 150);
    }
    private void waitForExit() {
        if (isFinishing() || isDestroyed()) return;
        if (new File("/proc/" + parent).exists() && attempts++ < 100) {
            handler.postDelayed(this::waitForExit, 100);
            return;
        }
        // Start only after the old process is gone, so all static image caches are new.
        if (new File("/proc/" + parent).exists()) { finish(); return; }
        Intent launch = Intent.makeRestartActivityTask(new ComponentName(
            getPackageName(), "jp.co.yahoo.android.apps.transit.Transit"));
        startActivity(launch);
        finishAndRemoveTask();
        handler.postDelayed(() -> Process.killProcess(Process.myPid()), 500);
    }
}
