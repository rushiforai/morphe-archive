package app.morphe.extension.mapsautomotive.patches;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

/**
 * The problem report's own screen: "Report" and the app's name in the launcher, also opened from the row in
 * Maps' Settings and from the crash and safe-mode notifications. It runs in its own process
 * (":morphe_report"), where the patch skips Maps' start, so it opens even when Maps crashes while
 * starting or in Settings. It shows {@link ReportPatch}'s GitHub link, update status, report list and feature
 * switches, with the patch and Google Maps versions under its title; the update notification opens it with
 * {@link UpdateCheck}'s dialog.
 */
@SuppressWarnings("unused")
public final class ReportActivity extends Activity {
    private Runnable refresh;

    static void open(Context context) {
        try {
            context.startActivity(new Intent(context, ReportActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (RuntimeException error) {
            ReportLog.w(ReportPatch.TAG, "report screen not opened", error);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // The manifest gives no theme, so the window would take Maps' application theme.
        setTheme(android.R.style.Theme_DeviceDefault);
        super.onCreate(savedInstanceState);
        boolean thai = UiDensityPatch.isThai(this);
        String name = ReportPatch.reportName(this);
        setTitle(thai || name == null ? ReportPatch.getSettingsTitle(this) : name);
        ActionBar bar = getActionBar();
        if (bar != null) {
            bar.setDisplayHomeAsUpEnabled(true);
            // The versions an issue asks for, always in view.
            bar.setSubtitle(ReportPatch.versions(this, thai));
        }
        ReportUploader.start(getApplicationContext());
        refresh = ReportPatch.attachScreen(this);
        // The update notification opens this screen with the update dialog over it; Recents replays that intent, so not then.
        Intent intent = getIntent();
        if (savedInstanceState == null && UpdateCheck.ACTION_SHOW.equals(intent.getAction())
                && (intent.getFlags() & Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY) == 0) {
            UpdateCheck.show(this, null);
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        // The screen is single-task: the notification reaches an open one here.
        setIntent(intent);
        if (UpdateCheck.ACTION_SHOW.equals(intent.getAction())) UpdateCheck.show(this, null);
    }

    @Override
    protected void onResume() {
        super.onResume();
        // The screen and a report ID dialog over it, which missed the changes while paused.
        Runnable listener = ReportPatch.onUploadChange(refresh);
        listener.run();
        ReportUploader.setListener(listener);
    }

    @Override
    protected void onPause() {
        ReportUploader.setListener(null);
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        ReportPatch.detachScreen(this);
        super.onDestroy();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
