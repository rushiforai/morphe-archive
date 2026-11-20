/*
 * Meta Patches — crash viewer activity.
 *
 * Forked from InstaFL activity/crash_manager/ifl_a_crash_viewer.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.os.Bundle;
import android.widget.LinearLayout;

import org.json.JSONArray;
import org.json.JSONObject;

import app.hemk651.meta.extension.ModsCrashManager;
import app.hemk651.meta.extension.ModsUi;

/**
 * Shows one saved crash report.
 */
public class ModsCrashViewerActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        int index = getIntent().getIntExtra("index", -1);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Crash report"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        JSONArray logs = ModsCrashManager.getLogs(this);
        if (logs != null && index >= 0 && index < logs.length()) {
            try {
                JSONObject log = logs.getJSONObject(index);

                JSONObject appData = log.optJSONObject("appData");
                if (appData != null) {
                    content.addView(ui.tile("⎇", "Patch version",
                            appData.optString("patch_ver", "unknown"), null, null));
                    content.addView(ui.tile("⑂", "Instagram",
                            appData.optString("ig_ver", "unknown") + " ("
                                    + appData.optString("ig_ver_code", "unknown") + ")",
                            null, null));
                    content.addView(ui.tile("▢", "Installation type",
                            appData.optString("itype", "unknown"), null, null));
                }

                JSONObject deviceData = log.optJSONObject("deviceData");
                if (deviceData != null) {
                    content.addView(ui.tile("▯", "Device",
                            deviceData.optString("brand", "unknown") + " "
                                    + deviceData.optString("model", "unknown")
                                    + " (Android " + deviceData.optString("aver", "?")
                                    + ", SDK " + deviceData.optString("sdk", "?") + ")",
                            null, null));
                }

                JSONObject crashData = log.optJSONObject("crashData");
                if (crashData != null) {
                    content.addView(ui.tile("↯", crashData.optString("class", "Unknown"),
                            crashData.optString("msg", ""), null, null));
                    content.addView(ui.paragraph(crashData.optString("trace", "")));
                }

                content.addView(ui.paragraph("Date: " + log.optString("date", "unknown")));
            } catch (Exception e) {
                content.addView(ui.paragraph("Failed to read the report."));
            }
        } else {
            content.addView(ui.paragraph("Report not found."));
        }

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }
}
