/*
 * Meta Patches — misc activity.
 *
 * Forked from InstaFL activity/ifl_a_misc.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches. Shows the state of the functional patches
 * compiled into this build.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import app.hemk651.meta.extension.ModsEnv;
import app.hemk651.meta.extension.ModsInit;
import app.hemk651.meta.extension.ModsUi;

/**
 * Miscellaneous settings and patch states.
 */
public class ModsMiscActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Misc"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        // Functional patches are compiled into the APK and cannot be toggled
        // at runtime; their state is shown read-only, like InstaFL does for
        // applied patches.
        for (String[] state : patchStates()) {
            content.addView(ui.tile("✔", state[0], state[1], null, v ->
                    ModsInit.showToast(this, "This patch is compiled into the app")));
        }

        content.addView(ui.sectionTitle("Backup"));
        content.addView(ui.tile("⤓", "Import backup",
                "Restore overrides from a JSON backup file", "›",
                v -> openActivity(ModsImportBackupActivity.class)));

        content.addView(ui.sectionTitle("Build"));
        content.addView(ui.tile("⎇", "Patch Version", ModsEnv.PATCH_VERSION, "›",
                v -> openActivity(ModsBuildInfoActivity.class)));

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }

    /**
     * State lines of the functional patches, from the applied patches JSON
     * the patch bundle injected into this build.
     */
    private String[][] patchStates() {
        try {
            JSONArray patches = new JSONArray(ModsPatchesInfoActivity.appliedPatchesJson);
            String[][] states = new String[patches.length()][];
            for (int i = 0; i < patches.length(); i++) {
                JSONObject patch = patches.getJSONObject(i);
                states[i] = new String[]{
                        patch.optString("name", "Unknown patch"),
                        patch.optString("description", "")
                };
            }
            return states;
        } catch (Exception e) {
            return new String[0][];
        }
    }

    private void openActivity(Class<? extends Activity> activityClass) {
        startActivity(new android.content.Intent(this, activityClass));
    }
}
