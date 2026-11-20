/*
 * Meta Patches — build information activity.
 *
 * Forked from InstaFL activity/about/ifl_a_build_info.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches. Only the patch version and the installation
 * type are kept; the generation ID and the code commit were removed.
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
 * Build information of this patched build.
 */
public class ModsBuildInfoActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ui = new ModsUi(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background());

        root.addView(ui.pageTitle("Build Information"));

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int side = ui.dp(16);
        content.setPadding(side, 0, side, side);

        content.addView(ui.tile("⎇", "Patch Version", ModsEnv.PATCH_VERSION, null, null));
        content.addView(ui.tile("▢", "Installation Type", ModsEnv.INSTALL_TYPE, null, null));
        content.addView(ui.tile("⑂", "Instagram", ModsEnv.getIgVersion(this)
                + " (" + ModsEnv.getIgVersionCode(this) + ")", null, null));

        root.addView(ui.pageContent(content));
        ModsUi.applySystemBarInsets(root);
        setContentView(root);
    }
}
