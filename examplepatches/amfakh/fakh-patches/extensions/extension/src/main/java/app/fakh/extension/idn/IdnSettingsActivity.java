package app.fakh.extension.idn;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Process;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.function.Predicate;

/** The "Fakh Patches" page: one switch per feature that was patched in. Opened from the app's Settings screen. */
public final class IdnSettingsActivity extends Activity {
    private View restartBanner;

    /** Follows the app's own light/dark setting, which can differ from the system's. */
    @Override
    protected void attachBaseContext(Context base) {
        if (IdnSettings.uiMode != -1) {
            Configuration config = new Configuration(base.getResources().getConfiguration());
            config.uiMode = IdnSettings.uiMode;
            base = base.createConfigurationContext(config);
        }
        super.attachBaseContext(base);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Fakh Patches");

        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(dp(24), dp(16), dp(24), dp(16));

        if (IdnSettings.isHideTabsIncluded()) {
            list.addView(header("Tab Home"));
            for (int i = 0; i < IdnSettings.TABS.length; i++) {
                list.addView(tabSwitch(IdnSettings.TABS[i], IdnSettings.TAB_LABELS[i]));
            }
        }
        if (IdnSettings.isHideCreateButtonIncluded()) {
            list.addView(header("Bilah bawah"));
            list.addView(flagSwitch("Tombol Create (+)", IdnSettings.SHOW_CREATE_BUTTON));
        }
        if (IdnSettings.isStopAutoplayIncluded()) {
            list.addView(header("Pemutaran"));
            list.addView(toggle("Autoplay", null,
                !IdnSettings.isStopAutoplay(), on -> {
                    IdnSettings.setStopAutoplay(!on);
                    showRestartBanner();
                    return true;
                }));
        }
        if (IdnSettings.isHideAdsIncluded() || IdnSettings.isHidePackageBannerIncluded()) {
            list.addView(header("Promo"));
            if (IdnSettings.isHideAdsIncluded()) list.addView(flagSwitch("Iklan", IdnSettings.SHOW_ADS));
            if (IdnSettings.isHidePackageBannerIncluded()) {
                list.addView(flagSwitch("Banner \"Beli Paket\"", IdnSettings.SHOW_PACKAGE_BANNER));
            }
        }

        ScrollView scroll = new ScrollView(this);
        scroll.addView(list);

        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(color("common_background", Color.WHITE));
        root.addView(scroll);
        restartBanner = restartBanner();
        root.addView(restartBanner);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            return WindowInsets.CONSUMED;
        });
        setContentView(root);
    }

    /** A row that shows (on) or hides (off) one home tab; it refuses to hide the last visible one. */
    private View tabSwitch(String tab, String label) {
        return toggle(label, null, !IdnSettings.isTabHidden(tab), on -> {
            if (!on && IdnSettings.hiddenTabCount() >= IdnSettings.TABS.length - 1) {
                Toast.makeText(this, "Minimal satu tab harus tetap ada.", Toast.LENGTH_SHORT).show();
                return false;
            }
            IdnSettings.setTabHidden(tab, !on);
            showRestartBanner();
            return true;
        });
    }

    /** A row that shows (on) or removes (off) something the patches removed by default. */
    private View flagSwitch(String label, String key) {
        return toggle(label, null, IdnSettings.flag(key), on -> {
            IdnSettings.setFlag(key, on);
            showRestartBanner();
            return true;
        });
    }

    /**
     * A row like the app's own Settings rows: the title on the left and an Off/On chip pair on the right. The
     * listener returns false to refuse the change, and the row then keeps its old state.
     */
    private View toggle(String title, String summary, boolean initial, Predicate<Boolean> onChange) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(40));
        row.setPadding(0, dp(4), 0, dp(4));

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView label = text(title, 14, "common_on_primary");
        label.setTypeface(Typeface.DEFAULT_BOLD);
        texts.addView(label);
        if (summary != null) texts.addView(text(summary, 11, "common_on_primary"));
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView off = chip("Off");
        TextView on = chip("On");
        boolean[] state = {initial};
        Runnable paint = () -> {
            paintChip(off, !state[0]);
            paintChip(on, state[0]);
        };
        paint.run();
        View.OnClickListener click = v -> {
            boolean wanted = v == on;
            if (wanted == state[0] || !onChange.test(wanted)) return;
            state[0] = wanted;
            paint.run();
        };
        off.setOnClickListener(click);
        on.setOnClickListener(click);
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gap.setMarginEnd(dp(8));
        row.addView(off, gap);
        row.addView(on);
        return row;
    }

    /** A chip as in the app's Settings: 12sp text, 12dp by 4dp padding, 8dp corners. */
    private TextView chip(String label) {
        TextView chip = text(label, 12, "common_on_primary");
        chip.setPadding(dp(12), dp(4), dp(12), dp(4));
        chip.setMinHeight(dp(28));
        chip.setGravity(Gravity.CENTER);
        return chip;
    }

    /** The selected chip is light red with red text, the other one grey; the same colors the app uses. */
    private void paintChip(TextView chip, boolean selected) {
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(dp(8));
        background.setColor(selected ? color("mary_rose", 0xFFFBD2D4) : color("common_alternative", 0xFFEEEEEE));
        chip.setBackground(background);
        chip.setTextColor(selected ? color("common_secondary", 0xFFD0021B) : color("common_on_primary", Color.BLACK));
    }

    private TextView header(String text) {
        TextView header = text(text, 11, "common_on_primary");
        header.setPadding(0, dp(16), 0, dp(8));
        return header;
    }

    private TextView text(String text, int sp, String colorName) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(sp);
        view.setTextColor(color(colorName, Color.BLACK));
        return view;
    }

    /** A color of the app by its resource name, so it follows the app's light and dark theme; the fallback is used if it is gone. */
    private int color(String name, int fallback) {
        int id = getResources().getIdentifier(name, "color", getPackageName());
        return id == 0 ? fallback : getColor(id);
    }

    /** The snackbar at the bottom: changes apply on the next start, so it offers to restart now. */
    private View restartBanner() {
        LinearLayout banner = new LinearLayout(this);
        banner.setOrientation(LinearLayout.HORIZONTAL);
        banner.setGravity(Gravity.CENTER_VERTICAL);
        banner.setPadding(dp(18), dp(10), dp(10), dp(10));
        GradientDrawable background = new GradientDrawable();
        background.setColor(0xFF202124);
        background.setCornerRadius(dp(16));
        banner.setBackground(background);
        banner.setElevation(dp(8));

        TextView message = new TextView(this);
        message.setText("Restart IDN untuk menerapkan perubahan.");
        message.setTextSize(14);
        message.setTextColor(Color.WHITE);
        banner.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView action = new TextView(this);
        action.setText("RESTART");
        action.setTextSize(14);
        action.setTextColor(0xFF8AB4F8);
        action.setPadding(dp(12), dp(10), dp(12), dp(10));
        action.setOnClickListener(v -> restartApp());
        banner.addView(action);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        params.setMargins(dp(16), 0, dp(16), dp(16));
        banner.setLayoutParams(params);
        banner.setVisibility(View.GONE);
        return banner;
    }

    private void showRestartBanner() {
        if (restartBanner.getVisibility() == View.VISIBLE) return;
        restartBanner.setVisibility(View.VISIBLE);
        restartBanner.setAlpha(0f);
        restartBanner.setTranslationY(dp(24));
        restartBanner.animate().alpha(1f).translationY(0f).setDuration(200).start();
    }

    /** Starts the app again from its launcher activity in a clean task, then ends this process. */
    private void restartApp() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(launch);
        }
        finishAffinity();
        Process.killProcess(Process.myPid());
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
