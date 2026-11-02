package app.morphe.extension.facebook.about;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * The "About" page opened by the About row in the Marketplace account menu (see
 * {@code marketplace.AboutMenu}).
 *
 * It is a full-screen {@link Dialog} with a programmatic layout rather than a real Activity: a new
 * Activity would have to be declared in the APK's manifest, which an extension can't do, and layout
 * resources can't be added from here either. Back closes it, so it behaves like a page.
 *
 * Design: near-black surface to match the app's forced dark mode, flat sections separated by hairlines,
 * small-caps section labels, left-aligned type. The blue-to-purple gradient is used sparingly (a thin
 * accent line under the title and the GitHub button).
 *
 * Lives outside the {@code marketplace} package on purpose: that package is compiled on a plain JVM
 * for the unit tests and must not depend on Android.
 */
public final class AboutDialog {

    private static final String TAG = "MarketplaceOnly";

    static final String REPO_URL = "https://github.com/MegaTheLEGEND/Facebook-Marketplace";
    static final String DEVELOPER = "MegaTheLEGEND";
    static final String TARGET_VERSION = "582.0.0.50.54";

    private static final String ABOUT_TEXT =
            "Marketplace is a stripped-down build of the Facebook app that opens straight to Facebook "
            + "Marketplace and stays there. The feed, Reels, groups and the other Facebook tabs are removed or "
            + "disabled, links open in your own browser, and the app is built to always run in dark mode.\n\n"
            + "It isn't a new app written from scratch: it is the official Facebook app, modified at the "
            + "bytecode level with a Morphe patch (\"Marketplace only\"). Nothing about your account or "
            + "Facebook's servers is changed.";

    // Surface and type colours (dark theme).
    private static final int BG = 0xFF0E1014;
    private static final int DIVIDER = 0xFF23262E;
    private static final int TEXT_PRIMARY = 0xFFF1F3F8;
    private static final int TEXT_BODY = 0xFFC3C8D4;
    private static final int TEXT_MUTED = 0xFF8A91A3;
    private static final int LABEL = 0xFF7C86A2;

    // Accent: blue -> purple.
    private static final int ACCENT_START = 0xFF3B82F6;
    private static final int ACCENT_END = 0xFF8B5CF6;

    private AboutDialog() {
    }

    /** Called reflectively from AboutMenu with whatever Context the menu was built for. */
    public static void show(Object context) {
        try {
            final Activity activity = findActivity(context);
            if (activity == null || activity.isFinishing()) {
                Log.w(TAG, "About: no live activity to show the page on");
                return;
            }
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    try {
                        showOn(activity);
                    } catch (Throwable t) {
                        Log.w(TAG, "About: could not show page", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "About: failed", t);
        }
    }

    private static void showOn(final Activity activity) {
        final Dialog page = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar_Fullscreen);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BG);
        root.setFitsSystemWindows(true);

        // Top bar: back arrow + "About", hairline below.
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = text(activity, "\u2190", 22, TEXT_PRIMARY, false);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription("Back");
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                page.dismiss();
            }
        });
        bar.addView(back, new LinearLayout.LayoutParams(dp(activity, 56), dp(activity, 56)));
        bar.addView(text(activity, "About", 18, TEXT_PRIMARY, true), wrap());
        root.addView(bar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 56)));
        root.addView(divider(activity), topMargin(0));

        ScrollView scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        int side = dp(activity, 24);
        column.setPadding(side, dp(activity, 28), side, dp(activity, 32));
        scroll.addView(column, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Header: name, one-line description, version, short gradient rule.
        column.addView(text(activity, "Marketplace", 30, TEXT_PRIMARY, true), wrap());
        LinearLayout.LayoutParams subLp = wrap();
        subLp.topMargin = dp(activity, 4);
        column.addView(text(activity, "Facebook Marketplace, and nothing else", 15, TEXT_MUTED, false), subLp);
        LinearLayout.LayoutParams verLp = wrap();
        verLp.topMargin = dp(activity, 12);
        column.addView(text(activity, "Version " + versionName(activity), 13, TEXT_MUTED, false), verLp);

        View rule = new View(activity);
        rule.setBackground(accent(activity, 2));
        LinearLayout.LayoutParams ruleLp = new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 3));
        ruleLp.topMargin = dp(activity, 20);
        column.addView(rule, ruleLp);

        // About.
        column.addView(sectionLabel(activity, "ABOUT"), sectionLp(activity));
        TextView body = text(activity, ABOUT_TEXT, 15, TEXT_BODY, false);
        body.setLineSpacing(0f, 1.3f);
        column.addView(body, wrap());

        // Developer info.
        column.addView(sectionLabel(activity, "DEVELOPER"), sectionLp(activity));
        column.addView(divider(activity), topMargin(0));
        row(activity, column, "Developer", DEVELOPER);
        row(activity, column, "Patch", "Marketplace only (Morphe)");
        row(activity, column, "Build", BuildInfo.VERSION);
        row(activity, column, "Based on", "Facebook " + TARGET_VERSION);
        row(activity, column, "Package", activity.getPackageName());
        row(activity, column, "Android", "API " + Build.VERSION.SDK_INT);

        // Source.
        column.addView(sectionLabel(activity, "SOURCE"), sectionLp(activity));
        TextView sourceText = text(activity,
                "The patch, build scripts and notes on how it works are on GitHub.", 15, TEXT_BODY, false);
        sourceText.setLineSpacing(0f, 1.3f);
        column.addView(sourceText, wrap());

        TextView button = text(activity, "View on GitHub  \u2197", 15, Color.WHITE, true);
        button.setGravity(Gravity.CENTER);
        button.setBackground(accent(activity, 8));
        button.setPadding(dp(activity, 16), dp(activity, 14), dp(activity, 16), dp(activity, 14));
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openUrl(activity, REPO_URL);
            }
        });
        LinearLayout.LayoutParams buttonLp = matchWidth(0);
        buttonLp.topMargin = dp(activity, 16);
        column.addView(button, buttonLp);

        TextView url = text(activity, REPO_URL.replace("https://", ""), 12, TEXT_MUTED, false);
        url.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openUrl(activity, REPO_URL);
            }
        });
        LinearLayout.LayoutParams urlLp = wrap();
        urlLp.topMargin = dp(activity, 10);
        column.addView(url, urlLp);

        // Footer.
        column.addView(divider(activity), topMargin(dp(activity, 32)));
        TextView footer = text(activity,
                "Not affiliated with, endorsed by or supported by Meta. Facebook is a trademark of "
                        + "Meta Platforms, Inc.", 12, TEXT_MUTED, false);
        footer.setLineSpacing(0f, 1.2f);
        LinearLayout.LayoutParams footerLp = wrap();
        footerLp.topMargin = dp(activity, 16);
        column.addView(footer, footerLp);

        page.setContentView(root);
        Window window = page.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new ColorDrawable(BG));
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(BG);
            window.setNavigationBarColor(BG);
        }
        page.show();
    }

    // ---- small view helpers -------------------------------------------------------------------

    private static TextView sectionLabel(Context context, String label) {
        TextView view = text(context, label, 12, LABEL, true);
        view.setLetterSpacing(0.12f);
        return view;
    }

    private static LinearLayout.LayoutParams sectionLp(Context context) {
        LinearLayout.LayoutParams lp = wrap();
        lp.topMargin = dp(context, 32);
        lp.bottomMargin = dp(context, 12);
        return lp;
    }

    /** One "label  value" line followed by a hairline. */
    private static void row(Context context, LinearLayout parent, String label, String value) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(context, 12), 0, dp(context, 12));
        row.addView(text(context, label, 14, TEXT_MUTED, false),
                new LinearLayout.LayoutParams(dp(context, 96), ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView right = text(context, value, 14, TEXT_PRIMARY, false);
        right.setTextIsSelectable(true);
        row.addView(right, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        parent.addView(row, matchWidth(0));
        parent.addView(divider(context), topMargin(0));
    }

    private static View divider(Context context) {
        View line = new View(context);
        line.setBackgroundColor(DIVIDER);
        return line;
    }

    /** Full-width, wrap-content-height params (rows, buttons). */
    private static LinearLayout.LayoutParams matchWidth(int unused) {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** Params for a 1 px hairline with the given top margin. */
    private static LinearLayout.LayoutParams topMargin(int px) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 1);
        lp.topMargin = px;
        return lp;
    }

    private static GradientDrawable accent(Context context, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable(
                GradientDrawable.Orientation.LEFT_RIGHT, new int[]{ACCENT_START, ACCENT_END});
        drawable.setCornerRadius(dp(context, radiusDp));
        return drawable;
    }

    private static TextView text(Context context, String value, float sp, int color, boolean medium) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        view.setTypeface(Typeface.create(medium ? "sans-serif-medium" : "sans-serif", Typeface.NORMAL));
        return view;
    }

    private static LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    // ---- data helpers -------------------------------------------------------------------------

    private static String versionName(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (info.versionName != null) return info.versionName;
        } catch (Throwable ignored) {
        }
        return TARGET_VERSION;
    }

    private static void openUrl(Context context, String url) {
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Throwable t) {
            Log.w(TAG, "About: could not open " + url, t);
        }
    }

    private static Activity findActivity(Object context) {
        Context current = context instanceof Context ? (Context) context : null;
        // Unwrap ContextThemeWrapper / ContextWrapper chains until an Activity shows up.
        for (int depth = 0; current != null && depth < 10; depth++) {
            if (current instanceof Activity) return (Activity) current;
            if (!(current instanceof ContextWrapper)) return null;
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }
}
