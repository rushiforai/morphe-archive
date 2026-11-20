/*
 * Meta Patches — applied patches activity.
 *
 * Forked from InstaFL activity/about/ifl_a_patches_info.java
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
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import app.hemk651.meta.extension.ModsEnv;
import app.hemk651.meta.extension.ModsUi;

/**
 * Shows the patches that were compiled into this build. The patch bundle
 * stores the list in a static field of this class at patch time.
 */
public class ModsPatchesInfoActivity extends Activity {

    /**
     * A JSON array of {"name": ..., "description": ...} objects. The
     * "Add Mods menu" patch fills it when the APK is built, so the list always
     * reflects the applied package patches.
     */
    public static String appliedPatchesJson = "[]";

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Applied package patches"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        try {
            JSONArray patches = new JSONArray(appliedPatchesJson);
            if (patches.length() == 0) {
                content.addView(ui.paragraph("No patch information available."));
            }
            for (int i = 0; i < patches.length(); i++) {
                JSONObject patch = patches.getJSONObject(i);
                String name = patch.optString("name", "Unknown patch");
                String description = patch.optString("description", "");
                content.addView(ui.tile("✔", name, description, null, null));
            }
        } catch (Exception e) {
            content.addView(ui.paragraph("Failed to read the applied patches."));
        }

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }
}
