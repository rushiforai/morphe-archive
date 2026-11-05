package app.southstar21.extension.instagram.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

/**
 * Full-screen southstar21 Patches menu.
 * <p>
 * The first page lists every included patch; tapping one slides in that patch's own page
 * with its on/off switch and settings. Built from plain views so it needs no resources or
 * manifest entries.
 */
@SuppressWarnings("deprecation")
public final class SettingsMenu {
    private static final int ACCENT = 0xFF0095F6; // Instagram blue
    private static final int GREEN = 0xFF34C759;
    private static final int RED = 0xFFFF3B30;
    private static final long PUSH_MS = 320;

    private final Activity activity;
    private final float density;
    private final boolean dark;
    private final int background, card, textPrimary, textSecondary, textTertiary, divider, pressed;

    private Dialog dialog;
    private FrameLayout pages;
    private View restartBanner;
    private boolean restartNeeded;
    /** Open pages, the list at the bottom. */
    private final ArrayDeque<Page> stack = new ArrayDeque<>();
    /** Set while a page slides, so a quick second tap or back press can't mix up the pages. */
    private boolean animating;

    /** A page and how to rebuild it, so the list can refresh when you come back to it. */
    private interface Page {
        View build();
    }

    public static void show(Activity activity) {
        Settings.init(activity);
        new SettingsMenu(activity).open();
    }

    private SettingsMenu(Activity activity) {
        this.activity = activity;
        this.density = activity.getResources().getDisplayMetrics().density;
        int mode = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        this.dark = mode == Configuration.UI_MODE_NIGHT_YES;
        background = dark ? Color.BLACK : 0xFFF2F2F7;
        card = dark ? 0xFF1C1C1E : Color.WHITE;
        textPrimary = dark ? 0xFFF5F5F5 : Color.BLACK;
        textSecondary = dark ? 0xFF98989F : 0xFF6C6C70;
        textTertiary = dark ? 0xFF636366 : 0xFFAEAEB2;
        divider = dark ? 0xFF38383A : 0xFFE5E5EA;
        pressed = dark ? 0x33FFFFFF : 0x1A000000;
    }

    private void open() {
        dialog = new Dialog(activity, dark
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar) {
            @Override
            public void onBackPressed() {
                if (!pop()) super.onBackPressed();
            }
        };
        dialog.setContentView(buildRoot());
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setStatusBarColor(background);
            window.setNavigationBarColor(background);
            window.setBackgroundDrawable(new ColorDrawable(background));
        }
        push(this::buildPatchList, false);
        dialog.show();
    }

    private View buildRoot() {
        FrameLayout root = new FrameLayout(activity);
        root.setBackgroundColor(background);

        pages = new FrameLayout(activity);
        root.addView(pages, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        restartBanner = buildRestartBanner();
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        lp.setMargins(dp(12), 0, dp(12), dp(12));
        root.addView(restartBanner, lp);
        restartBanner.setVisibility(View.GONE);

        // The window is drawn edge to edge: keep the content clear of the status and nav bars.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        return root;
    }

    // region Navigation

    private void push(Page page, boolean animate) {
        if (animating) return;
        View previous = pages.getChildCount() > 0 ? pages.getChildAt(pages.getChildCount() - 1) : null;
        View view = page.build();
        stack.push(page);
        pages.addView(view);
        if (!animate || previous == null) return;

        float width = pages.getWidth() > 0 ? pages.getWidth() : activity.getResources().getDisplayMetrics().widthPixels;
        view.setTranslationX(width);
        view.setElevation(dp(2));
        animating = true;
        view.animate().translationX(0f).setDuration(PUSH_MS).setInterpolator(ease())
                .withEndAction(() -> animating = false).start();
        previous.animate().translationX(-width * 0.3f).alpha(0.6f).setDuration(PUSH_MS).setInterpolator(ease())
                .withEndAction(() -> previous.setVisibility(View.INVISIBLE)).start();
    }

    /** @return false if already on the first page. */
    private boolean pop() {
        if (animating) return true;
        if (stack.size() <= 1 || pages.getChildCount() < 2) return false;
        stack.pop();
        animating = true;
        View top = pages.getChildAt(pages.getChildCount() - 1);
        View below = pages.getChildAt(pages.getChildCount() - 2);

        // Rebuild the page underneath so it shows what changed (e.g. a patch's On/Off).
        int index = pages.indexOfChild(below);
        View fresh = stack.peek().build();
        fresh.setTranslationX(below.getTranslationX());
        fresh.setAlpha(below.getAlpha());
        pages.removeView(below);
        pages.addView(fresh, index);
        restoreScroll(below, fresh);

        float width = pages.getWidth();
        fresh.animate().translationX(0f).alpha(1f).setDuration(PUSH_MS).setInterpolator(ease()).start();
        top.animate().translationX(width).setDuration(PUSH_MS).setInterpolator(ease())
                .withEndAction(() -> {
                    pages.removeView(top);
                    animating = false;
                }).start();
        return true;
    }

    private static void restoreScroll(View from, View to) {
        if (from instanceof ViewGroup && to instanceof ViewGroup) {
            ScrollView a = findScroll((ViewGroup) from), b = findScroll((ViewGroup) to);
            if (a != null && b != null) {
                int y = a.getScrollY();
                b.post(() -> b.scrollTo(0, y));
            }
        }
    }

    private static ScrollView findScroll(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ScrollView) return (ScrollView) child;
        }
        return null;
    }

    private static PathInterpolator ease() {
        return new PathInterpolator(0.2f, 0.9f, 0.3f, 1f);
    }

    // endregion

    // region Pages

    private View buildPatchList() {
        LinearLayout list = pageList();

        // southstar21.dev logo, centered, in the brand kit's colours for this theme.
        ImageView logo = new ImageView(activity);
        logo.setImageDrawable(new Logo(dark));
        logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
        logo.setContentDescription("southstar21.dev");
        LinearLayout.LayoutParams logoParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(26));
        logoParams.setMargins(dp(12), dp(8), dp(12), 0);
        list.addView(logo, logoParams);
        TextView subtitle = text("southstar21 Patches for Instagram", 15, textSecondary, false);
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setPadding(dp(4), dp(10), dp(4), dp(8));
        list.addView(subtitle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        List<PatchSettings> patches = Settings.includedPatches();
        if (patches.isEmpty()) {
            list.addView(sectionHeader(null));
            LinearLayout empty = cardView();
            TextView message = text("No patches with settings are included in this build.", 15, textSecondary, false);
            message.setPadding(dp(16), dp(16), dp(16), dp(16));
            empty.addView(message);
            list.addView(empty);
        } else {
            int on = 0;
            for (PatchSettings p : patches) if (p.enabled.get()) on++;
            list.addView(sectionHeader("Installed patches"));
            LinearLayout patchCard = cardView();
            for (int i = 0; i < patches.size(); i++) {
                PatchSettings patch = patches.get(i);
                if (i > 0) patchCard.addView(dividerView(true));
                patchCard.addView(navigationRow(patch.glyph, patch.color, patch.title, shortDescription(patch),
                        patch.enabled.get() ? "On" : "Off", () -> push(() -> buildPatchPage(patch), true)));
            }
            list.addView(patchCard);
            list.addView(sectionFooter(on + " of " + patches.size() + (patches.size() == 1 ? " patch" : " patches")
                    + " on. Patches not selected in Morphe Manager aren't listed."));
        }

        list.addView(sectionHeader("App"));
        LinearLayout app = cardView();
        app.addView(actionRow(Icons.Glyph.RESTART, GREEN, "Restart Instagram", textPrimary,
                () -> restartApp(activity)));
        if (!patches.isEmpty()) {
            app.addView(dividerView(true));
            app.addView(actionRow(Icons.Glyph.RESET, RED, "Reset all settings", RED, () -> confirm(
                    "Reset all settings?",
                    "Every patch goes back to its defaults and is switched on.",
                    "Reset", () -> {
                        for (PatchSettings p : patches) p.reset();
                        markRestartNeeded();
                        replaceTop();
                    })));
        }
        list.addView(app);

        return page(null, list);
    }

    private View buildPatchPage(PatchSettings patch) {
        LinearLayout list = pageList();

        // Header: big icon, name and what the patch does.
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setGravity(Gravity.CENTER_HORIZONTAL);
        header.setPadding(dp(16), dp(8), dp(16), dp(8));
        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(Icons.tile(patch.glyph, patch.color, density));
        header.addView(icon, new LinearLayout.LayoutParams(dp(64), dp(64)));
        TextView name = text(patch.title, 24, textPrimary, true);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(12), 0, 0);
        header.addView(name);
        if (!TextUtils.isEmpty(patch.description)) {
            TextView description = text(patch.description, 15, textSecondary, false);
            description.setGravity(Gravity.CENTER);
            description.setPadding(dp(8), dp(4), dp(8), 0);
            header.addView(description);
        }
        list.addView(header);

        List<View> dependent = new ArrayList<>();

        list.addView(sectionHeader(null));
        LinearLayout main = cardView();
        main.addView(switchRow(patch.enabled, "Enabled", null,
                enabled -> setEnabled(dependent, enabled)));
        list.addView(main);

        for (SettingsGroup group : patch.groups) {
            View headerView = sectionHeader(group.title);
            list.addView(headerView);
            LinearLayout groupCard = cardView();
            for (int i = 0; i < group.settings.size(); i++) {
                Setting setting = group.settings.get(i);
                if (i > 0) groupCard.addView(dividerView(false));
                groupCard.addView(setting instanceof IntSetting
                        ? sliderRow((IntSetting) setting)
                        : switchRow((BooleanSetting) setting, setting.title, setting.summary, null));
            }
            list.addView(groupCard);
            dependent.add(headerView);
            dependent.add(groupCard);
            if (!TextUtils.isEmpty(group.footer)) {
                View footer = sectionFooter(group.footer);
                list.addView(footer);
                dependent.add(footer);
            }
        }
        setEnabled(dependent, patch.enabled.get());

        list.addView(sectionHeader(null));
        LinearLayout reset = cardView();
        TextView resetText = text("Reset to defaults", 16, ACCENT, false);
        resetText.setGravity(Gravity.CENTER);
        resetText.setMinHeight(dp(50));
        resetText.setBackground(ripple());
        resetText.setOnClickListener(v -> confirm("Reset " + patch.title + "?",
                "Its settings go back to the defaults chosen in Morphe Manager.", "Reset", () -> {
                    patch.reset();
                    markRestartNeeded();
                    replaceTop();
                }));
        reset.addView(resetText, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        list.addView(reset);

        return page("Patches", list);
    }

    /** Rebuilds the visible page in place, e.g. after a reset. */
    private void replaceTop() {
        Page page = stack.peek();
        if (page == null) return;
        View old = pages.getChildAt(pages.getChildCount() - 1);
        View fresh = page.build();
        pages.removeView(old);
        pages.addView(fresh);
        restoreScroll(old, fresh);
    }

    /**
     * A page: a top bar with a back button, and the scrolling content. On the first page
     * the back button closes the menu.
     */
    private View page(String backLabel, LinearLayout content) {
        LinearLayout page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(background);
        page.setClickable(true); // Don't let touches fall through to the page underneath.

        FrameLayout bar = new FrameLayout(activity);
        LinearLayout back = new LinearLayout(activity);
        back.setGravity(Gravity.CENTER_VERTICAL);
        back.setPadding(dp(8), 0, dp(12), 0);
        ImageView chevron = new ImageView(activity);
        chevron.setImageDrawable(Icons.chevron(backLabel == null ? textPrimary : ACCENT, density, true));
        back.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
        if (backLabel != null) {
            back.addView(text(backLabel, 17, ACCENT, false));
            back.setContentDescription("Back to " + backLabel);
        } else {
            back.setContentDescription("Close");
        }
        back.setBackground(ripple());
        back.setOnClickListener(v -> {
            if (!pop()) dialog.dismiss();
        });
        bar.addView(back, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(48),
                Gravity.START | Gravity.CENTER_VERTICAL));
        page.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(52)));

        ScrollView scroll = new ScrollView(activity);
        scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        scroll.addView(content);
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        return page;
    }

    private LinearLayout pageList() {
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        // Room at the bottom for the restart banner.
        list.setPadding(dp(16), 0, dp(16), dp(104));
        return list;
    }

    // endregion

    // region Rows

    private interface BooleanListener {
        void onChanged(boolean value);
    }

    /** A patch in the list: icon, name, short description, status and a chevron. */
    private View navigationRow(Icons.Glyph glyph, int color, String title, String summary, String status,
                               Runnable onClick) {
        LinearLayout row = rowContainer(dp(60));
        row.addView(iconView(glyph, color, 32));

        LinearLayout labels = labels(title, summary, true);
        LinearLayout.LayoutParams labelsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelsLp.leftMargin = dp(12);
        row.addView(labels, labelsLp);

        TextView value = text(status, 16, textSecondary, false);
        value.setPadding(dp(8), 0, dp(2), 0);
        row.addView(value);
        ImageView chevron = new ImageView(activity);
        chevron.setImageDrawable(Icons.chevron(textTertiary, density, false));
        row.addView(chevron, new LinearLayout.LayoutParams(dp(18), dp(18)));

        row.setBackground(ripple());
        row.setOnClickListener(v -> onClick.run());
        return row;
    }

    private View actionRow(Icons.Glyph glyph, int color, String title, int titleColor, Runnable onClick) {
        LinearLayout row = rowContainer(dp(52));
        row.addView(iconView(glyph, color, 30));
        TextView label = text(title, 16, titleColor, false);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.leftMargin = dp(12);
        row.addView(label, lp);
        row.setBackground(ripple());
        row.setOnClickListener(v -> onClick.run());
        return row;
    }

    private View switchRow(BooleanSetting setting, String title, String summary, BooleanListener listener) {
        LinearLayout row = rowContainer(dp(52));
        row.addView(labels(title, summary, false), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = new Switch(activity);
        toggle.setChecked(setting.get());
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{Color.WHITE, dark ? 0xFFCCCCCC : Color.WHITE}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{GREEN, dark ? 0xFF39393D : 0xFFE9E9EA}));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            setting.set(checked);
            if (setting.requiresRestart) markRestartNeeded();
            if (listener != null) listener.onChanged(checked);
        });
        row.addView(toggle);
        row.setBackground(ripple());
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private View sliderRow(IntSetting setting) {
        LinearLayout row = rowContainer(dp(52));
        row.setOrientation(LinearLayout.VERTICAL);
        row.setGravity(Gravity.NO_GRAVITY);
        row.setPadding(dp(16), dp(12), dp(16), dp(8));

        LinearLayout top = new LinearLayout(activity);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.addView(labels(setting.title, setting.summary, false),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView value = text(format(setting, setting.get()), 14, ACCENT, true);
        value.setPadding(dp(10), dp(4), dp(10), dp(4));
        GradientDrawable chip = new GradientDrawable();
        chip.setColor((ACCENT & 0x00FFFFFF) | (dark ? 0x33000000 : 0x1F000000));
        chip.setCornerRadius(dp(12));
        value.setBackground(chip);
        LinearLayout.LayoutParams valueLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        valueLp.leftMargin = dp(8);
        top.addView(value, valueLp);
        row.addView(top);

        LinearLayout track = new LinearLayout(activity);
        track.setGravity(Gravity.CENTER_VERTICAL);
        track.addView(text(format(setting, setting.min), 12, textTertiary, false));
        SeekBar slider = new SeekBar(activity);
        slider.setMax(setting.max - setting.min);
        slider.setProgress(setting.get() - setting.min);
        slider.setProgressTintList(ColorStateList.valueOf(ACCENT));
        slider.setProgressBackgroundTintList(ColorStateList.valueOf(dark ? 0xFF48484A : 0xFFD1D1D6));
        slider.setThumbTintList(ColorStateList.valueOf(ACCENT));
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                value.setText(format(setting, setting.min + progress));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                setting.set(setting.min + seekBar.getProgress());
                if (setting.requiresRestart) markRestartNeeded();
            }
        });
        track.addView(slider, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        track.addView(text(format(setting, setting.max), 12, textTertiary, false));
        LinearLayout.LayoutParams trackLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        trackLp.topMargin = dp(6);
        row.addView(track, trackLp);
        return row;
    }

    // endregion

    // region Restart

    private View buildRestartBanner() {
        LinearLayout bar = new LinearLayout(activity);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(16), dp(12), dp(12), dp(12));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(dark ? 0xFF2C2C2E : Color.WHITE);
        shape.setCornerRadius(dp(18));
        bar.setBackground(shape);
        bar.setElevation(dp(8));
        bar.setClickable(true);

        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text("Restart required", 15, textPrimary, true));
        labels.addView(text("Some changes apply after Instagram restarts.", 13, textSecondary, false));
        bar.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView restart = text("Restart", 15, Color.WHITE, true);
        restart.setGravity(Gravity.CENTER);
        restart.setPadding(dp(18), dp(9), dp(18), dp(9));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(ACCENT);
        pill.setCornerRadius(dp(20));
        restart.setBackground(new RippleDrawable(ColorStateList.valueOf(0x40FFFFFF), pill, null));
        restart.setOnClickListener(v -> restartApp(activity));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(12);
        bar.addView(restart, lp);
        return bar;
    }

    private void markRestartNeeded() {
        if (restartNeeded) return;
        restartNeeded = true;
        restartBanner.setVisibility(View.VISIBLE);
        restartBanner.setAlpha(0f);
        restartBanner.setTranslationY(dp(40));
        restartBanner.animate().alpha(1f).translationY(0f).setDuration(260)
                .setInterpolator(new DecelerateInterpolator()).start();
    }

    /** Relaunches Instagram: schedules the launcher intent, then ends the process. */
    static void restartApp(Context context) {
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null) return;
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        PendingIntent pending = PendingIntent.getActivity(context, 0, launch,
                PendingIntent.FLAG_CANCEL_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        AlarmManager alarms = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        alarms.set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime() + 300, pending);
        if (context instanceof Activity) ((Activity) context).finishAffinity();
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    // endregion

    // region Building blocks

    private void confirm(String title, String message, String action, Runnable onConfirm) {
        new AlertDialog.Builder(activity, dark
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setTitle(title)
                .setMessage(message)
                .setNegativeButton("Cancel", null)
                .setPositiveButton(action, (d, w) -> onConfirm.run())
                .show();
    }

    private LinearLayout cardView() {
        LinearLayout cardView = new LinearLayout(activity);
        cardView.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(card);
        shape.setCornerRadius(dp(14));
        cardView.setBackground(shape);
        cardView.setClipToOutline(true);
        return cardView;
    }

    private View sectionHeader(String title) {
        if (TextUtils.isEmpty(title)) {
            View space = new View(activity);
            space.setLayoutParams(new LinearLayout.LayoutParams(1, dp(20)));
            return space;
        }
        TextView header = text(title.toUpperCase(), 13, textSecondary, false);
        header.setLetterSpacing(0.03f);
        header.setPadding(dp(16), dp(24), dp(16), dp(7));
        return header;
    }

    private View sectionFooter(String value) {
        TextView footer = text(value, 13, textSecondary, false);
        footer.setPadding(dp(16), dp(7), dp(16), 0);
        return footer;
    }

    private LinearLayout rowContainer(int minHeight) {
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(minHeight);
        row.setPadding(dp(16), dp(10), dp(14), dp(10));
        return row;
    }

    private View iconView(Icons.Glyph glyph, int color, int sizeDp) {
        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(Icons.tile(glyph, color, density));
        icon.setLayoutParams(new LinearLayout.LayoutParams(dp(sizeDp), dp(sizeDp)));
        return icon;
    }

    private LinearLayout labels(String title, String summary, boolean singleLineSummary) {
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text(title, 16, textPrimary, false));
        if (!TextUtils.isEmpty(summary)) {
            TextView s = text(summary, 13, textSecondary, false);
            s.setPadding(0, dp(2), dp(8), 0);
            if (singleLineSummary) {
                s.setSingleLine(true);
                s.setEllipsize(TextUtils.TruncateAt.END);
            }
            labels.addView(s);
        }
        return labels;
    }

    /** Hairline between rows, indented past the icon when the rows have one. */
    private View dividerView(boolean pastIcon) {
        View line = new View(activity);
        line.setBackgroundColor(divider);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, Math.round(0.5f * density)));
        lp.leftMargin = pastIcon ? dp(16 + 32 + 12) : dp(16);
        line.setLayoutParams(lp);
        return line;
    }

    private RippleDrawable ripple() {
        return new RippleDrawable(ColorStateList.valueOf(pressed), null, new ColorDrawable(Color.WHITE));
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        return view;
    }

    private void setEnabled(List<View> views, boolean enabled) {
        for (View view : views) {
            view.animate().alpha(enabled ? 1f : 0.4f).setDuration(150).start();
            setEnabledRecursive(view, enabled);
        }
    }

    private static void setEnabledRecursive(View view, boolean enabled) {
        view.setEnabled(enabled);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) setEnabledRecursive(group.getChildAt(i), enabled);
        }
    }

    /** The first sentence of the description, for the list. */
    private static String shortDescription(PatchSettings patch) {
        String d = patch.description;
        if (TextUtils.isEmpty(d)) return null;
        int end = d.indexOf(". ");
        return end > 0 ? d.substring(0, end + 1) : d;
    }

    private static String format(IntSetting setting, int value) {
        if (setting.unit == null) return String.valueOf(value);
        return "%".equals(setting.unit) ? value + "%" : value + " " + setting.unit;
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    // endregion
}
