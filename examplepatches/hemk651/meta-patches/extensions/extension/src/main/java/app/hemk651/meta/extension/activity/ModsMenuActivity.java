/*
 * Meta Patches — main menu activity.
 *
 * Forked from InstaFL activity/ifl_a_menu.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches with the following changes:
 *   - the Updates (OTA) menu was removed
 *   - the Library section was removed
 *   - the admin dashboard was removed
 *   - the Join Community, guide and social icons were removed;
 *     only the language and information icons remain
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension.activity;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.LinearLayout;

import app.hemk651.meta.extension.ModsDevHolder;
import app.hemk651.meta.extension.ModsEnv;
import app.hemk651.meta.extension.ModsHomeSheet;
import app.hemk651.meta.extension.ModsInit;
import app.hemk651.meta.extension.ModsUi;

/**
 * The main Mods menu.
 */
public class ModsMenuActivity extends Activity {

    private ModsUi ui;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            ui = new ModsUi(this);

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(ui.background());

            root.addView(ui.pageTitle(ModsEnv.APP_NAME));

            LinearLayout content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            int side = ui.dp(16);
            content.setPadding(side, 0, side, side);

            content.addView(ui.tile(
                    "⌥", "Developer options", "Open the employee options menu", "›",
                    v -> openDeveloperOptions()));

            content.addView(ui.tile(
                    "↯", "Crash logs", "View and manage crash reports", "›",
                    v -> openActivity(ModsCrashReportsActivity.class)));

            content.addView(ui.tile(
                    "☰", "Misc", "Patch states and other settings", "›",
                    v -> openActivity(ModsMiscActivity.class)));

            // ── Bottom icons ────────────────────────────────────────────────
            // InstaFL shows language, chat, guide and GitHub icons here; only
            // the language and information icons are kept.
            content.addView(ui.sectionTitle("General"));

            content.addView(ui.tile(
                    "🌐", "Language", "Menu language", "›",
                    v -> openActivity(ModsLanguageActivity.class)));

            content.addView(ui.tile(
                    "ⓘ", "About " + ModsEnv.PROJECT_NAME, "Build information and credits", "›",
                    v -> openActivity(ModsAboutActivity.class)));

            root.addView(ui.pageContent(content));
            ModsUi.applySystemBarInsets(root);
            setContentView(root);

            // Tapping the background or any empty space closes the menu again,
            // like a back gesture. Taps on the non-clickable title bubble up to
            // the root; taps below the last tile land on the content column,
            // which fills the viewport.
            root.setOnClickListener(v -> finish());
            content.setOnClickListener(v -> finish());
        } catch (Throwable t) {
            // A broken menu degrades to a crash report + toast instead of
            // crashing the app.
            ModsInit.reportError(this, t);
            ModsInit.showToast(this, "Menu error: " + t.getClass().getSimpleName());
            finish();
        }
    }

    /**
     * Opens the Instagram developer options the same way the home sheet does.
     * The navigation code is injected into ModsHomeSheet.openDeveloperOptions
     * by the patch; it needs the main activity and session that are captured
     * when the home long press fires.
     *
     * The menu activity sits in front of the feed, which is stopped with its
     * fragment state saved — committing a navigation there throws
     * {@code IllegalStateException: Can not perform this action after
     * onSaveInstanceState} (reported on device, v1.1.0-dev.11). The menu is
     * finished first, and the feed is navigated once it has window focus
     * again.
     */
    private void openDeveloperOptions() {
        ModsInit.safeRun(this, () -> {
            Activity feed = ModsDevHolder.getActivity();
            if (feed == null || feed.isFinishing() || feed.isDestroyed()) {
                ModsInit.showToast(this,
                        "Open the home feed, then try Developer options again");
                return;
            }

            finish();

            Handler handler = new Handler(Looper.getMainLooper());
            int[] attempts = {0};
            Runnable[] retry = new Runnable[1];
            retry[0] = () -> {
                if (feed.isFinishing() || feed.isDestroyed()) {
                    return;
                }
                if (feed.hasWindowFocus()) {
                    ModsInit.safeRun(feed,
                            () -> new ModsHomeSheet(feed).openDeveloperOptions());
                } else if (++attempts[0] < 6) {
                    handler.postDelayed(retry[0], 200);
                } else {
                    ModsInit.showToast(feed, "Could not open developer options");
                }
            };
            handler.postDelayed(retry[0], 250);
        });
    }

    private void openActivity(Class<? extends Activity> activityClass) {
        ModsInit.safeRun(this, () -> startActivity(new Intent(this, activityClass)));
    }

    /** Opens a web page in the browser, used by the about screens. */
    public static void openUrl(Activity activity, String url) {
        activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
    }
}
