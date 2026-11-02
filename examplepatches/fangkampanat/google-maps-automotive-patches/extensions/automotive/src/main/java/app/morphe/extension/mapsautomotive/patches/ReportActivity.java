package app.morphe.extension.mapsautomotive.patches;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

/**
 * The problem report's own screen: "Report Maps Car" in the launcher, also opened from the row in
 * Maps' Settings and from the crash and safe-mode notifications. It runs in its own process
 * (":morphe_report"), where the patch skips Maps' start, so it opens even when Maps crashes while
 * starting or in Settings. It shows {@link ReportPatch}'s report list and the feature switches.
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
        setTitle(UiDensityPatch.isThai(this) ? "รายงานปัญหา Maps Car" : "Report Maps Car");
        ActionBar bar = getActionBar();
        if (bar != null) bar.setDisplayHomeAsUpEnabled(true);
        ReportUploader.start(getApplicationContext());
        refresh = ReportPatch.attachScreen(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        refresh.run();
        ReportUploader.setListener(refresh);
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
