/*
 * Meta Patches — quick menu sheet shown on home long press.
 *
 * Forked from InstaFL utils/InstafelHomeSheet.java
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded to Meta Patches with the following changes:
 *   - the version subtitle line was removed
 *   - the Join Community item was removed
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Bottom sheet with the quick actions of the menu.
 */
public class ModsHomeSheet {

    private final Activity act;
    private final ModsUi ui;
    private Dialog sheetDialog;

    public ModsHomeSheet(Activity act) {
        this.act = act;
        this.ui = new ModsUi(act);
    }

    public void buildAndShowDialog() {
        try {
            sheetDialog = buildSheet();
            sheetDialog.show();
        } catch (Throwable t) {
            // A broken sheet degrades to a crash report + toast instead of
            // crashing the app.
            ModsInit.reportError(act, t);
            ModsInit.showToast(act, "Menu error: " + t.getClass().getSimpleName());
        }
    }

    private Dialog buildSheet() {
        Dialog dialog = new Dialog(act);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCancelable(true);
        // Tapping the dimmed background closes the sheet and returns to the
        // feed, like a back gesture.
        dialog.setCanceledOnTouchOutside(true);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ui.background());
        bg.setCornerRadii(new float[]{
                ui.dp(28), ui.dp(28),
                ui.dp(28), ui.dp(28),
                ui.dp(28), ui.dp(28),
                ui.dp(28), ui.dp(28)
        });

        LinearLayout root = new LinearLayout(act);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        root.setBackground(bg);
        root.addView(buildSheetContent());

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            window.setGravity(Gravity.BOTTOM);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setWindowAnimations(android.R.style.Animation_Dialog);
        }
        return dialog;
    }

    private LinearLayout buildSheetContent() {
        LinearLayout root = new LinearLayout(act);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        // Tapping an empty spot of the sheet itself (padding, gaps, header)
        // also closes it, like a back gesture.
        root.setOnClickListener(v -> dismissSheetDialog());

        // Header. InstaFL shows the IFL version and the IG version in a
        // subtitle here; the subtitle is intentionally not ported.
        LinearLayout header = new LinearLayout(act);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(ui.dp(15), ui.dp(15), ui.dp(15), ui.dp(15));
        header.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        TextView glyph = new TextView(act);
        glyph.setText("⚙");
        glyph.setTextColor(ui.textColor());
        glyph.setTextSize(28);
        glyph.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams glyphLp = new LinearLayout.LayoutParams(
                ui.dp(49), ui.dp(49));
        glyphLp.rightMargin = ui.dp(15);
        glyph.setLayoutParams(glyphLp);

        TextView title = new TextView(act);
        title.setText(ModsEnv.APP_NAME);
        title.setTextColor(ui.textColor());
        title.setTextSize(20);
        title.setTypeface(Typeface.DEFAULT_BOLD);

        header.addView(glyph);
        header.addView(title);
        root.addView(header);

        root.addView(sheetItem(
                "≡",
                "Open " + ModsEnv.APP_NAME + " menu",
                v -> {
                    dismissSheetDialog();
                    ModsInit.startModsMenu(act);
                }));

        root.addView(sheetItem(
                "⌥",
                "Developer options",
                v -> openDeveloperOptions()));

        root.addView(sheetItem(
                "↻",
                "Restart app",
                v -> ModsInit.restartApp(act)));

        return root;
    }

    /**
     * Opens the employee options (developer options).
     *
     * This method is replaced by the "Add Mods menu" patch at patch time with
     * the code that navigates to
     * com.instagram.debug.quickexperiment.QuickExperimentCategoriesFragment
     * through the FragmentNavigator of the app, exactly like the InstaFL
     * ChangeHomeLongClick patch fills InstafelHomeSheet.openDeveloperOptions.
     */
    public void openDeveloperOptions() {
        ModsInit.showToast(act, "Developer options are not unlocked");
    }

    public void dismissSheetDialog() {
        if (sheetDialog != null && sheetDialog.isShowing()) {
            sheetDialog.dismiss();
        }
    }

    private LinearLayout sheetItem(String glyph, String text,
                                   View.OnClickListener onClickListener) {
        LinearLayout item = new LinearLayout(act);
        item.setOrientation(LinearLayout.HORIZONTAL);
        item.setGravity(Gravity.CENTER_VERTICAL);
        item.setPadding(ui.dp(15), ui.dp(12), ui.dp(15), ui.dp(12));
        item.setClickable(true);
        item.setFocusable(true);
        // Every sheet action degrades gracefully: a failure is reported into
        // the crash reports and toasted instead of crashing the app.
        item.setOnClickListener(v ->
                ModsInit.safeRun(act, () -> onClickListener.onClick(v)));

        TextView icon = new TextView(act);
        icon.setText(glyph);
        icon.setTextColor(ui.textColor());
        icon.setTextSize(16);
        icon.setGravity(Gravity.CENTER);
        icon.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(24), ui.dp(24)));

        TextView tv = new TextView(act);
        tv.setText(text);
        tv.setTextSize(16);
        tv.setTextColor(ui.textColor());
        tv.setMaxLines(1);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams tvLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tvLp.leftMargin = ui.dp(14);
        tv.setLayoutParams(tvLp);

        item.addView(icon);
        item.addView(tv);

        return item;
    }
}
