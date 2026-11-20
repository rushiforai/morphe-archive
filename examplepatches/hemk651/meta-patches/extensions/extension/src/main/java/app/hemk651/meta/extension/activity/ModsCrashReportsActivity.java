/*
 * Meta Patches — crash reports activity.
 *
 * Forked from InstaFL activity/crash_manager/ifl_a_crash_reports.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import app.hemk651.meta.extension.ModsCrashManager;
import app.hemk651.meta.extension.ModsInit;
import app.hemk651.meta.extension.ModsUi;

/**
 * Lists the saved crash reports.
 */
public class ModsCrashReportsActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Crash logs"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        JSONArray logs = ModsCrashManager.getLogs(this);
        if (logs != null && logs.length() > 0) {
            for (int i = logs.length() - 1; i >= 0; i--) {
                try {
                    JSONObject log = logs.getJSONObject(i);
                    String crashClass = log.getJSONObject("crashData").optString("class", "Unknown");
                    String date = log.optString("date", "");
                    int index = i;
                    content.addView(ui.tile("↯", crashClass, date, "›", v ->
                            openViewer(index)));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            content.addView(ui.tile("✕", "Delete all reports", null, null,
                    v -> {
                        ModsCrashManager.removeReports(this);
                        ModsInit.showToast(this, "Reports deleted");
                        recreate();
                    }));
        } else {
            content.addView(ui.paragraph("No crash reports saved."));
        }

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }

    private void openViewer(int index) {
        Intent intent = new Intent(this, ModsCrashViewerActivity.class);
        intent.putExtra("index", index);
        startActivity(intent);
    }
}
