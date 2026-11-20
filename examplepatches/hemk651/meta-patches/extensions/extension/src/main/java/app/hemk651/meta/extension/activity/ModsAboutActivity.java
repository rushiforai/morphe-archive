/*
 * Meta Patches — about activity.
 *
 * Forked from InstaFL activity/about/ifl_a_about.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches with the following changes:
 *   - only "About Developer" remains of the project section; it links to the
 *     repository owner's GitHub page
 *   - the InstaFL Community section was removed
 *   - a "Inspired By and Credits" section was added, crediting InstaFL
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.os.Bundle;
import android.widget.LinearLayout;

import app.hemk651.meta.extension.ModsEnv;
import app.hemk651.meta.extension.ModsUi;

/**
 * About screen: developer, build information, applied patches and credits.
 */
public class ModsAboutActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("About " + ModsEnv.PROJECT_NAME));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        // ── About Developer ─────────────────────────────────────────────────
        content.addView(ui.sectionTitle("About Developer"));
        content.addView(ui.tile(
                "ⓘ", ModsEnv.REPO_OWNER,
                "Developer of " + ModsEnv.PROJECT_NAME, "›",
                v -> ModsMenuActivity.openUrl(this, ModsEnv.DEVELOPER_URL)));

        // ── Build information ───────────────────────────────────────────────
        content.addView(ui.sectionTitle("Build Information"));
        // InstaFL also lists the generation ID and the code commit here;
        // both were removed.
        content.addView(ui.tile(
                "⎇", "Patch Version", ModsEnv.PATCH_VERSION, null, null));
        content.addView(ui.tile(
                "▢", "Installation Type", ModsEnv.INSTALL_TYPE, null, null));
        content.addView(ui.tile(
                "ⓘ", "Applied package patches", "Patches compiled into this build", "›",
                v -> openActivity(ModsPatchesInfoActivity.class)));

        // ── Inspired By and Credits ─────────────────────────────────────────
        content.addView(ui.sectionTitle(ModsEnv.CREDITS_TITLE));
        content.addView(ui.paragraph(ModsEnv.CREDITS_TEXT));
        content.addView(ui.tile(
                "↗", "InstaFL by mamiiblt", ModsEnv.CREDITS_URL, "›",
                v -> ModsMenuActivity.openUrl(this, ModsEnv.CREDITS_URL)));

        // ── Repository information ──────────────────────────────────────────
        content.addView(ui.sectionTitle("Repository"));
        content.addView(ui.tile(
                "⑂", ModsEnv.REPO_OWNER + "/" + ModsEnv.REPO_NAME,
                ModsEnv.REPO_URL, "›",
                v -> ModsMenuActivity.openUrl(this, ModsEnv.REPO_URL)));

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }

    private void openActivity(Class<? extends Activity> activityClass) {
        startActivity(new android.content.Intent(this, activityClass));
    }
}
