package app.southstar21.extension.youtubemusic.settings;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayDeque;

import app.southstar21.extension.youtubemusic.YouTubeMusicHooks;
import app.southstar21.extension.youtubemusic.askmusic.HideAskMusicPatch;
import app.southstar21.extension.youtubemusic.liquidglass.LiquidGlassNavBarPatch;
import app.southstar21.extension.youtubemusic.playercolor.PlayerColorPatch;

/**
 * Full-screen southstar21 Patches menu, laid out like the Instagram patches' menu: the first
 * page lists the included patches, and tapping one slides in its own page. Always in the dark
 * palette, as YouTube Music is always dark. Built from plain views so it needs no resources.
 */
@SuppressWarnings("deprecation")
public final class SettingsMenu {
    private static final int ACCENT = 0xFF0095F6;
    private static final int GREEN = 0xFF34C759;
    private static final int RED = 0xFFFF3B30;
    private static final int PURPLE = 0xFF5E5CE6;
    private static final int ORANGE = 0xFFFF9500;
    /** Neutral, so the red line through the Ask Music sparkle stands out. */
    private static final int GRAPHITE = 0xFF48484A;
    private static final long PUSH_MS = 320;

    private static final int BACKGROUND = Color.BLACK;
    private static final int CARD = 0xFF1C1C1E;
    private static final int TEXT_PRIMARY = 0xFFF5F5F5;
    private static final int TEXT_SECONDARY = 0xFF98989F;
    private static final int TEXT_TERTIARY = 0xFF636366;
    private static final int DIVIDER = 0xFF38383A;
    private static final int PRESSED = 0x33FFFFFF;

    private static final String GLASS_TITLE = "Liquid Glass";
    private static final String COLOR_TITLE = "Neutral player color";
    private static final String COLOR_DESCRIPTION = "The full player's background stays one neutral color "
            + "instead of changing with each song's album art.";
    private static final String ASK_TITLE = "Hide Ask Music";
    private static final String ASK_DESCRIPTION = "Removes the Ask Music AI button from the top bar, the player "
            + "and the search bar.";
    private static final String ASK_WHAT = "Ask Music is YouTube Music's AI assistant, the sparkle button next to "
            + "the notifications bell, in the full player and in the search bar. With this on, those buttons "
            + "and the Ask Music banner are gone, and the rest of the bar closes the gap.";
    private static final String ASK_WHY = "Fewer buttons, and no AI assistant one tap away if you don't use it.";
    private static final String ASK_ENABLED_HELP = "On, the Ask Music buttons are hidden everywhere. Off, they "
            + "come back. Changes apply right away.";
    private static final String GLASS_WHAT = "Turns YouTube Music's tab bar into a floating pill of glass, docks "
            + "the mini player beside it as round album art with a progress ring and a glass playback bar above, "
            + "and puts glass on the full player's buttons. Lightweight glass draws it all with one blur and "
            + "simple shading, so it runs smoothly on older or slower phones. Full Liquid Glass adds refraction "
            + "along every edge, a blurred band along the bottom of the screen and liquid buttons in the player "
            + "that swell and melt together under your finger.";
    private static final String GLASS_WHY = "It's a look. It brings the iOS 26 Liquid Glass design to YouTube "
            + "Music on Android, and doesn't change how anything works.";
    private static final String COLOR_WHAT = "YouTube Music colors the full player's background from each song's "
            + "album art, so it changes with every song. With this on, it stays one neutral color instead: "
            + "YouTube Music's own dark grey, black or dark grey.";
    private static final String COLOR_WHY = "A calmer player that looks the same for every song, without bright "
            + "or clashing colors behind the cover.";
    private static final String ENABLED_HELP = "On, the full player keeps one neutral color for every song. Off, "
            + "it takes on each song's album colors, as YouTube Music normally does. Changes apply right away, "
            + "even with the player open.";
    private static final String BACKGROUND_HELP = "The color the full player keeps. YouTube Music is the dark grey "
            + "it shows between songs. Black is pure black, which looks best on OLED screens. Dark grey is a "
            + "little lighter.";
    private static final String GLASS_DESCRIPTION = "iOS 26 style glass tab bar, mini player and player. "
            + "The mini player docks beside the tabs as round album art.";

    private final Activity activity;
    private final float density;

    private Dialog dialog;
    private FrameLayout pages;
    /** Open pages, the list at the bottom. */
    private final ArrayDeque<Page> stack = new ArrayDeque<>();
    /** Set while a page slides, so a quick second tap or back press can't mix up the pages. */
    private boolean animating;

    /** A page and how to rebuild it, so the list can refresh when you come back to it. */
    private interface Page {
        View build();
    }

    public static void show(Activity activity) {
        try {
            Settings.init(activity);
            new SettingsMenu(activity).open();
        } catch (Throwable t) {
            Log.e(YouTubeMusicHooks.TAG, "Settings menu failed", t);
        }
    }





    private SettingsMenu(Activity activity) {
        this.activity = activity;
        this.density = activity.getResources().getDisplayMetrics().density;
    }

    private void open() {
        dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar) {
            @Override
            public void onBackPressed() {
                if (!pop()) super.onBackPressed();
            }
        };
        dialog.setContentView(buildRoot());
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setStatusBarColor(BACKGROUND);
            window.setNavigationBarColor(BACKGROUND);
            window.setBackgroundDrawable(new ColorDrawable(BACKGROUND));
        }
        push(this::buildPatchList, false);
        dialog.show();
    }

    private View buildRoot() {
        FrameLayout root = new FrameLayout(activity);
        root.setBackgroundColor(BACKGROUND);
        pages = new FrameLayout(activity);
        root.addView(pages, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
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

        // Rebuild the page underneath so it shows what changed (the glass's style).
        int index = pages.indexOfChild(below);
        View fresh = stack.peek().build();
        fresh.setTranslationX(below.getTranslationX());
        fresh.setAlpha(below.getAlpha());
        pages.removeView(below);
        pages.addView(fresh, index);

        float width = pages.getWidth();
        fresh.animate().translationX(0f).alpha(1f).setDuration(PUSH_MS).setInterpolator(ease()).start();
        top.animate().translationX(width).setDuration(PUSH_MS).setInterpolator(ease())
                .withEndAction(() -> {
                    pages.removeView(top);
                    animating = false;
                }).start();
        return true;
    }

    /** Rebuilds the visible page in place, e.g. after a change or a reset. */
    private void replaceTop() {
        Page page = stack.peek();
        if (page == null) return;
        View old = pages.getChildAt(pages.getChildCount() - 1);
        View fresh = page.build();
        pages.removeView(old);
        pages.addView(fresh);
        ScrollView a = findScroll(old), b = findScroll(fresh);
        if (a != null && b != null) {
            int y = a.getScrollY();
            b.post(() -> b.scrollTo(0, y));
        }
    }

    private static ScrollView findScroll(View view) {
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (group.getChildAt(i) instanceof ScrollView) return (ScrollView) group.getChildAt(i);
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

        // southstar21.dev logo, centered, in the brand kit's cream for dark backgrounds.
        ImageView logo = new ImageView(activity);
        logo.setImageDrawable(new Logo(true));
        logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
        logo.setContentDescription("southstar21.dev");
        LinearLayout.LayoutParams logoParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(26));
        logoParams.setMargins(dp(12), dp(8), dp(12), 0);
        list.addView(logo, logoParams);
        TextView subtitle = text("southstar21 Patches for YouTube Music", 15, TEXT_SECONDARY, false);
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setPadding(dp(4), dp(10), dp(4), dp(8));
        list.addView(subtitle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        list.addView(sectionHeader("Installed patches"));
        LinearLayout patchCard = cardView();
        if (LiquidGlassNavBarPatch.isIncluded()) {
            patchCard.addView(navigationRow(Icons.Glyph.GLASS, PURPLE, GLASS_TITLE, shortDescription(GLASS_DESCRIPTION),
                    Settings.lightweightGlass() ? "Lightweight" : "Full", () -> push(this::buildGlassPage, true)));
        }
        if (HideAskMusicPatch.isIncluded()) {
            if (patchCard.getChildCount() > 0) patchCard.addView(dividerView(true));
            patchCard.addView(navigationRow(Icons.Glyph.NO_ASK_MUSIC, GRAPHITE, ASK_TITLE, shortDescription(ASK_DESCRIPTION),
                    Settings.hideAskMusic() ? "On" : "Off", () -> push(this::buildAskMusicPage, true)));
        }
        if (PlayerColorPatch.isIncluded()) {
            if (patchCard.getChildCount() > 0) patchCard.addView(dividerView(true));
            patchCard.addView(navigationRow(Icons.Glyph.DROP, ORANGE, COLOR_TITLE, shortDescription(COLOR_DESCRIPTION),
                    Settings.playerColorEnabled() ? "On" : "Off", () -> push(this::buildPlayerColorPage, true)));
        }
        list.addView(patchCard);
        list.addView(sectionFooter("Patches not selected in Morphe Manager aren't listed."));

        list.addView(sectionHeader("App"));
        LinearLayout app = cardView();
        app.addView(actionRow(Icons.Glyph.RESTART, GREEN, "Restart YouTube Music", TEXT_PRIMARY,
                () -> restartApp(activity)));
        app.addView(dividerView(true));
        app.addView(actionRow(Icons.Glyph.RESET, RED, "Reset all settings", RED, () -> confirm(
                "Reset all settings?",
                "Every patch goes back to its defaults.",
                "Reset", () -> {
                    setLightweight(true);
                    resetPlayerColor();
                    resetAskMusic();
                    replaceTop();
                })));
        list.addView(app);

        return page(null, list);
    }

    private View buildGlassPage() {
        LinearLayout list = pageList();

        list.addView(patchHeader(Icons.Glyph.GLASS, PURPLE, GLASS_TITLE, GLASS_DESCRIPTION,
                () -> push(() -> buildAboutPage(Icons.Glyph.GLASS, PURPLE, GLASS_TITLE, GLASS_WHAT, GLASS_WHY), true)));

        LinearLayout.LayoutParams cardsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardsLp.topMargin = dp(18);
        list.addView(styleCards(), cardsLp);

        list.addView(sectionHeader(null));
        LinearLayout reset = cardView();
        TextView resetText = text("Reset to defaults", 16, ACCENT, false);
        resetText.setGravity(Gravity.CENTER);
        resetText.setMinHeight(dp(50));
        resetText.setBackground(ripple());
        resetText.setOnClickListener(v -> confirm("Reset " + GLASS_TITLE + "?",
                "It goes back to lightweight glass.", "Reset", () -> {
                    setLightweight(true);
                    replaceTop();
                }));
        reset.addView(resetText, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        list.addView(reset);

        return page("Patches", list);
    }

    /**
     * The choice of glass: two big cards, each a small bar drawn in its style, the chosen one
     * ringed. Tapping the other switches to it.
     */
    private View styleCards() {
        boolean lightweight = Settings.lightweightGlass();
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row = new LinearLayout(activity);
        String[] names = {"Lightweight", "Full Liquid Glass"};
        for (int i = 0; i < names.length; i++) {
            boolean isLightweight = i == 0;
            boolean chosen = isLightweight == lightweight;
            String badge = isLightweight ? "Smooth on any phone" : "For newer, faster phones";
            View card = styleCard(names[i], badge, isLightweight ? GREEN : PURPLE, !isLightweight, chosen);
            card.setContentDescription(names[i] + ", " + badge + (chosen ? ", chosen" : ""));
            card.setOnClickListener(v -> {
                if (Settings.lightweightGlass() == isLightweight) return;
                setLightweight(isLightweight);
                replaceTop();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(140), 1f);
            if (i > 0) lp.leftMargin = dp(12);
            row.addView(card, lp);
        }
        column.addView(row);
        return column;
    }

    /** A style card: a small bar in that style on a colorful backdrop, its name and a badge. */
    private View styleCard(String title, String badge, int badgeColor, boolean full, boolean chosen) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(10), dp(10), dp(10), dp(10));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(CARD);
        shape.setCornerRadius(dp(16));
        shape.setStroke(chosen ? dp(2) : dp(1), chosen ? ACCENT : DIVIDER);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(Color.WHITE);
        mask.setCornerRadius(dp(16));
        card.setBackground(new RippleDrawable(ColorStateList.valueOf(PRESSED), shape, mask));
        card.setClickable(true);

        View preview = new BarPreview(activity, full);
        card.addView(preview, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        TextView name = text(title, 15, TEXT_PRIMARY, true);
        name.setPadding(dp(2), dp(8), 0, 0);
        card.addView(name);
        TextView tag = text(badge, 12, badgeColor, false);
        tag.setPadding(dp(2), dp(1), 0, 0);
        tag.setSingleLine(true);
        tag.setEllipsize(TextUtils.TruncateAt.END);
        card.addView(tag);
        return card;
    }

    /**
     * Neutral player color (the Disable dynamic player color patch): on/off and the neutral color, both applied to the player right
     * away.
     */
    private View buildPlayerColorPage() {
        LinearLayout list = pageList();
        list.addView(patchHeader(Icons.Glyph.DROP, ORANGE, COLOR_TITLE, COLOR_DESCRIPTION,
                () -> push(() -> buildAboutPage(Icons.Glyph.DROP, ORANGE, COLOR_TITLE, COLOR_WHAT, COLOR_WHY), true)));

        list.addView(sectionHeader(null));
        LinearLayout main = cardView();
        main.addView(switchRow("Enabled", null, ENABLED_HELP,
                Settings.playerColorEnabled(), on -> {
                    Settings.setPlayerColorEnabled(on);
                    PlayerColorPatch.reapply();
                    replaceTop();
                }));
        list.addView(main);

        View colorHeader = sectionHeader("Color");
        list.addView(colorHeader);
        LinearLayout colors = cardView();
        colors.addView(swatchRow());
        list.addView(colors);
        View footer = sectionFooter("YouTube Music is the dark grey it shows between songs.");
        list.addView(footer);
        if (!Settings.playerColorEnabled()) {
            for (View v : new View[]{colorHeader, colors, footer}) {
                v.setAlpha(0.4f);
                setEnabledRecursive(v, false);
            }
        }

        list.addView(sectionHeader(null));
        LinearLayout reset = cardView();
        TextView resetText = text("Reset to defaults", 16, ACCENT, false);
        resetText.setGravity(Gravity.CENTER);
        resetText.setMinHeight(dp(50));
        resetText.setBackground(ripple());
        resetText.setOnClickListener(v -> confirm("Reset " + COLOR_TITLE + "?",
                "It goes back to off, with YouTube Music's own dark grey chosen.", "Reset", () -> {
                    resetPlayerColor();
                    replaceTop();
                }));
        reset.addView(resetText, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        list.addView(reset);
        return page("Patches", list);
    }

    /** Hide Ask Music: an on/off switch, applied right away. */
    private View buildAskMusicPage() {
        LinearLayout list = pageList();
        list.addView(patchHeader(Icons.Glyph.NO_ASK_MUSIC, GRAPHITE, ASK_TITLE, ASK_DESCRIPTION,
                () -> push(() -> buildAboutPage(Icons.Glyph.NO_ASK_MUSIC, GRAPHITE, ASK_TITLE, ASK_WHAT, ASK_WHY), true)));
        list.addView(sectionHeader(null));
        LinearLayout main = cardView();
        main.addView(switchRow("Enabled", null, ASK_ENABLED_HELP, Settings.hideAskMusic(), on -> {
            Settings.setHideAskMusic(on);
            HideAskMusicPatch.refresh();
        }));
        list.addView(main);

        list.addView(sectionHeader(null));
        LinearLayout reset = cardView();
        TextView resetText = text("Reset to defaults", 16, ACCENT, false);
        resetText.setGravity(Gravity.CENTER);
        resetText.setMinHeight(dp(50));
        resetText.setBackground(ripple());
        resetText.setOnClickListener(v -> confirm("Reset " + ASK_TITLE + "?",
                "It goes back to on, with the Ask Music buttons hidden.", "Reset", () -> {
                    resetAskMusic();
                    replaceTop();
                }));
        reset.addView(resetText, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        list.addView(reset);
        return page("Patches", list);
    }

    private void resetAskMusic() {
        Settings.setHideAskMusic(true);
        if (HideAskMusicPatch.isIncluded()) HideAskMusicPatch.refresh();
    }

    private void resetPlayerColor() {
        Settings.setPlayerColorEnabled(false);
        Settings.setPlayerColorChoice(0);
        if (PlayerColorPatch.isIncluded()) PlayerColorPatch.reapply();
    }

    /**
     * The color choices as chips, each a dot of its color and its name, the chosen one filled.
     * The colors are all near black, so the names do the telling apart.
     */
    private View swatchRow() {
        LinearLayout row = rowContainer(dp(52));
        row.setOrientation(LinearLayout.VERTICAL);
        row.setGravity(Gravity.NO_GRAVITY);
        row.setPadding(dp(16), dp(12), dp(16), dp(14));
        row.addView(titleWithHelp("Background", BACKGROUND_HELP));

        LinearLayout options = new LinearLayout(activity);
        options.setGravity(Gravity.CENTER_VERTICAL);
        int chosen = Settings.playerColorChoice();
        int[] colors = {PlayerColorPatch.youTubeMusicDefault(), Color.BLACK, 0xFF1C1C1E};
        for (int i = 0; i < colors.length; i++) {
            final int index = i;
            boolean on = i == chosen;
            LinearLayout chip = new LinearLayout(activity);
            chip.setGravity(Gravity.CENTER_VERTICAL);
            chip.setPadding(dp(8), dp(6), dp(12), dp(6));
            GradientDrawable pill = new GradientDrawable();
            pill.setCornerRadius(dp(16));
            pill.setColor(on ? ACCENT : 0xFF2C2C2E);
            GradientDrawable mask = new GradientDrawable();
            mask.setColor(Color.WHITE);
            mask.setCornerRadius(dp(16));
            chip.setBackground(new RippleDrawable(ColorStateList.valueOf(PRESSED), pill, mask));

            View dot = new View(activity);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(colors[i]);
            circle.setStroke(Math.max(1, dp(1)), on ? 0xCCFFFFFF : 0x66FFFFFF);
            dot.setBackground(circle);
            chip.addView(dot, new LinearLayout.LayoutParams(dp(16), dp(16)));
            TextView label = text(PlayerColorPatch.COLOR_NAMES[i], 14, on ? Color.WHITE : TEXT_PRIMARY, on);
            LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            labelLp.leftMargin = dp(6);
            chip.addView(label, labelLp);

            chip.setContentDescription(PlayerColorPatch.COLOR_NAMES[i] + (on ? ", chosen" : ""));
            chip.setOnClickListener(v -> {
                if (Settings.playerColorChoice() == index) return;
                Settings.setPlayerColorChoice(index);
                PlayerColorPatch.reapply();
                replaceTop();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(8);
            options.addView(chip, lp);
        }
        android.widget.HorizontalScrollView scroller = new android.widget.HorizontalScrollView(activity);
        scroller.setHorizontalScrollBarEnabled(false);
        scroller.addView(options);
        LinearLayout.LayoutParams scrollerLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scrollerLp.topMargin = dp(12);
        row.addView(scroller, scrollerLp);
        return row;
    }

    private interface BooleanListener {
        void onChanged(boolean value);
    }

    /** A title, a summary and an iOS style switch, toggled by tapping anywhere on the row. */
    private View switchRow(String title, String summary, String help, boolean checked, BooleanListener listener) {
        LinearLayout row = rowContainer(dp(52));
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(titleWithHelp(title, help));
        if (!TextUtils.isEmpty(summary)) {
            TextView s = text(summary, 13, TEXT_SECONDARY, false);
            s.setPadding(0, dp(2), dp(8), 0);
            labels.addView(s);
        }
        row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        android.widget.Switch toggle = new android.widget.Switch(activity);
        toggle.setChecked(checked);
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{Color.WHITE, 0xFFCCCCCC}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{GREEN, 0xFF39393D}));
        toggle.setOnCheckedChangeListener((button, on) -> listener.onChanged(on));
        row.addView(toggle);
        row.setBackground(ripple());
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private static void setEnabledRecursive(View view, boolean enabled) {
        view.setEnabled(enabled);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) setEnabledRecursive(group.getChildAt(i), enabled);
        }
    }

    /** A patch page's header: big icon, name, what the patch does and a "What is this?" link. */
    private View patchHeader(Icons.Glyph glyph, int color, String title, String description, Runnable onAbout) {
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setGravity(Gravity.CENTER_HORIZONTAL);
        header.setPadding(dp(16), dp(8), dp(16), dp(8));
        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(Icons.tile(glyph, color, density));
        header.addView(icon, new LinearLayout.LayoutParams(dp(64), dp(64)));
        TextView name = text(title, 24, TEXT_PRIMARY, true);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(12), 0, 0);
        header.addView(name);
        TextView text = text(description, 15, TEXT_SECONDARY, false);
        text.setGravity(Gravity.CENTER);
        text.setPadding(dp(8), dp(4), dp(8), 0);
        header.addView(text);
        if (onAbout != null) {
            TextView about = text("What is this?", 15, ACCENT, false);
            about.setGravity(Gravity.CENTER);
            about.setPadding(dp(12), dp(6), dp(12), dp(6));
            about.setBackground(ripple());
            about.setOnClickListener(v -> onAbout.run());
            LinearLayout.LayoutParams aboutLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            aboutLp.topMargin = dp(4);
            header.addView(about, aboutLp);
        }
        return header;
    }

    /** "What is this?": what a patch does and what it's for, in plain words. */
    private View buildAboutPage(Icons.Glyph glyph, int color, String title, String what, String why) {
        LinearLayout list = pageList();
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setGravity(Gravity.CENTER_HORIZONTAL);
        header.setPadding(dp(16), dp(8), dp(16), dp(8));
        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(Icons.tile(glyph, color, density));
        header.addView(icon, new LinearLayout.LayoutParams(dp(64), dp(64)));
        TextView name = text(title, 24, TEXT_PRIMARY, true);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(12), 0, 0);
        header.addView(name);
        list.addView(header);
        addAboutSection(list, "What it does", what);
        addAboutSection(list, "What it's for", why);
        return page(title, list);
    }

    private void addAboutSection(LinearLayout list, String title, String body) {
        if (TextUtils.isEmpty(body)) return;
        list.addView(sectionHeader(title));
        LinearLayout section = cardView();
        TextView text = text(body, 16, TEXT_PRIMARY, false);
        text.setLineSpacing(0, 1.2f);
        text.setPadding(dp(16), dp(14), dp(16), dp(14));
        section.addView(text);
        list.addView(section);
    }

    /** A setting's title, with a "?" after it that explains the setting when {@code help} is set. */
    private View titleWithHelp(String title, String help) {
        if (TextUtils.isEmpty(help)) return text(title, 16, TEXT_PRIMARY, false);
        LinearLayout titleRow = new LinearLayout(activity);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        titleRow.addView(text(title, 16, TEXT_PRIMARY, false));
        TextView button = text("?", 13, ACCENT, true);
        button.setGravity(Gravity.CENTER);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor((ACCENT & 0x00FFFFFF) | 0x40000000);
        button.setBackground(circle);
        button.setContentDescription("What " + title + " does");
        button.setOnClickListener(v -> showHelp(title, help));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(22), dp(22));
        lp.leftMargin = dp(8);
        titleRow.addView(button, lp);
        return titleRow;
    }

    /** Slides up a sheet explaining a setting: its name, the explanation and a "Got it" button. */
    private void showHelp(String title, String help) {
        Dialog sheet = new Dialog(activity, android.R.style.Theme_DeviceDefault_Dialog_NoActionBar);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), dp(10), dp(20), dp(20));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(CARD);
        float r = dp(24);
        shape.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        content.setBackground(shape);

        View handle = new View(activity);
        GradientDrawable handleShape = new GradientDrawable();
        handleShape.setColor(TEXT_TERTIARY);
        handleShape.setCornerRadius(dp(3));
        handle.setBackground(handleShape);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(36), dp(5));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = dp(14);
        content.addView(handle, handleLp);

        content.addView(text(title, 22, TEXT_PRIMARY, true));
        TextView body = text(help, 16, TEXT_PRIMARY, false);
        body.setLineSpacing(0, 1.2f);
        body.setPadding(0, dp(14), 0, dp(18));
        content.addView(body);

        TextView done = text("Got it", 16, Color.WHITE, true);
        done.setGravity(Gravity.CENTER);
        done.setMinHeight(dp(48));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(ACCENT);
        pill.setCornerRadius(dp(24));
        done.setBackground(new RippleDrawable(ColorStateList.valueOf(0x40FFFFFF), pill, null));
        done.setOnClickListener(v -> sheet.dismiss());
        content.addView(done, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        sheet.setContentView(content);
        Window window = sheet.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            window.setGravity(Gravity.BOTTOM);
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setWindowAnimations(android.R.style.Animation_InputMethod);
            window.setDimAmount(0.4f);
        }
        sheet.setCanceledOnTouchOutside(true);
        sheet.show();
    }

    private void setLightweight(boolean lightweight) {
        Settings.setLightweightGlass(lightweight);
        LiquidGlassNavBarPatch.onGlassModeChanged(activity);
    }

    /**
     * A page: a top bar with a back button, and the scrolling content. On the first page
     * the back button closes the menu.
     */
    private View page(String backLabel, LinearLayout content) {
        LinearLayout page = new LinearLayout(activity);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(BACKGROUND);
        page.setClickable(true); // Don't let touches fall through to the page underneath.

        FrameLayout bar = new FrameLayout(activity);
        LinearLayout back = new LinearLayout(activity);
        back.setGravity(Gravity.CENTER_VERTICAL);
        back.setPadding(dp(8), 0, dp(12), 0);
        ImageView chevron = new ImageView(activity);
        chevron.setImageDrawable(Icons.chevron(backLabel == null ? TEXT_PRIMARY : ACCENT, density, true));
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
        list.setPadding(dp(16), 0, dp(16), dp(32));
        return list;
    }

    // endregion

    // region Rows

    /** A patch in the list: icon, name, short description, status and a chevron. */
    private View navigationRow(Icons.Glyph glyph, int color, String title, String summary, String status,
                               Runnable onClick) {
        LinearLayout row = rowContainer(dp(60));
        row.addView(iconView(glyph, color, 32));

        LinearLayout labels = labels(title, summary);
        LinearLayout.LayoutParams labelsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelsLp.leftMargin = dp(12);
        row.addView(labels, labelsLp);

        TextView value = text(status, 16, TEXT_SECONDARY, false);
        value.setPadding(dp(8), 0, dp(2), 0);
        row.addView(value);
        ImageView chevron = new ImageView(activity);
        chevron.setImageDrawable(Icons.chevron(TEXT_TERTIARY, density, false));
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

    // endregion

    // region Restart

    /** Relaunches YouTube Music: schedules the launcher intent, then ends the process. */
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
        new AlertDialog.Builder(activity, android.R.style.Theme_DeviceDefault_Dialog_Alert)
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
        shape.setColor(CARD);
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
        TextView header = text(title.toUpperCase(), 13, TEXT_SECONDARY, false);
        header.setLetterSpacing(0.03f);
        header.setPadding(dp(16), dp(24), dp(16), dp(7));
        return header;
    }

    private View sectionFooter(String value) {
        TextView footer = text(value, 13, TEXT_SECONDARY, false);
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

    /** Title and a one-line summary. */
    private LinearLayout labels(String title, String summary) {
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(text(title, 16, TEXT_PRIMARY, false));
        if (!TextUtils.isEmpty(summary)) {
            TextView s = text(summary, 13, TEXT_SECONDARY, false);
            s.setPadding(0, dp(2), dp(8), 0);
            s.setSingleLine(true);
            s.setEllipsize(TextUtils.TruncateAt.END);
            labels.addView(s);
        }
        return labels;
    }

    /** Hairline between rows, indented past the icon when the rows have one. */
    private View dividerView(boolean pastIcon) {
        View line = new View(activity);
        line.setBackgroundColor(DIVIDER);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, Math.round(0.5f * density)));
        lp.leftMargin = pastIcon ? dp(16 + 32 + 12) : dp(16);
        line.setLayoutParams(lp);
        return line;
    }

    private RippleDrawable ripple() {
        return new RippleDrawable(ColorStateList.valueOf(PRESSED), null, new ColorDrawable(Color.WHITE));
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        return view;
    }

    /** The first sentence of a description, for the list. */
    private static String shortDescription(String d) {
        if (TextUtils.isEmpty(d)) return null;
        int end = d.indexOf(". ");
        return end > 0 ? d.substring(0, end + 1) : d;
    }

    private int dp(int value) {
        return Math.round(value * density);
    }

    // endregion

    /**
     * A small tab bar over a colorful page, in one of the two styles: lightweight is a frosted
     * pill with a soft sheen, full glass adds a bright, bent rim with colored fringes.
     */
    private static final class BarPreview extends View {
        private final boolean full;
        private final float density;
        private final Paint page = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint blob = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint sheen = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fringe = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        BarPreview(Context context, boolean full) {
            super(context);
            this.full = full;
            this.density = context.getResources().getDisplayMetrics().density;
            rim.setStyle(Paint.Style.STROKE);
            fringe.setStyle(Paint.Style.STROKE);
            dot.setColor(0xCCFFFFFF);
            setClipToOutline(true);
            setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View view, android.graphics.Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 10 * density);
                }
            });
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            if (w <= 0 || h <= 0) return;
            // The page: album art colors.
            page.setShader(new LinearGradient(0, 0, w, h, 0xFF3A1C71, 0xFF0B0B0F, Shader.TileMode.CLAMP));
            canvas.drawRect(0, 0, w, h, page);
            blob.setColor(0xFFD76D77);
            canvas.drawCircle(w * 0.28f, h * 0.42f, h * 0.26f, blob);
            blob.setColor(0xFFFFAF7B);
            canvas.drawCircle(w * 0.74f, h * 0.50f, h * 0.22f, blob);

            float margin = 8 * density;
            float barH = Math.min(h * 0.42f, 30 * density);
            rect.set(margin, h - margin - barH, w - margin, h - margin);
            float r = barH / 2f;
            // Frosted: the page shows through as a soft wash of its colors.
            fill.setShader(new LinearGradient(rect.left, 0, rect.right, 0,
                    new int[]{0xFF4A2A55, 0xFF2A2030, 0xFF4F3A3A}, null, Shader.TileMode.CLAMP));
            fill.setAlpha(full ? 0xC8 : 0xE6);
            canvas.drawRoundRect(rect, r, r, fill);
            fill.setShader(null);
            fill.setAlpha(0xFF);
            sheen.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, 0x1FFFFFFF, 0x00FFFFFF,
                    Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, sheen);
            if (full) {
                // Colored fringes just inside the rim, then a bright lit edge.
                fringe.setStrokeWidth(2.5f * density);
                fringe.setShader(new LinearGradient(rect.left, 0, rect.right, 0,
                        new int[]{0x99FF4D6D, 0x4D5EB0FF, 0x4D7CFFB2, 0x99FFC94D},
                        null, Shader.TileMode.CLAMP));
                RectF inner = new RectF(rect);
                inner.inset(2.5f * density, 2.5f * density);
                canvas.drawRoundRect(inner, r - 2.5f * density, r - 2.5f * density, fringe);
                rim.setStrokeWidth(1.2f * density);
                rim.setShader(new LinearGradient(0, rect.top, 0, rect.bottom, 0xCCFFFFFF, 0x33FFFFFF,
                        Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, r, r, rim);
            }
            // Three tabs, the first one selected.
            float cy = rect.centerY();
            float step = rect.width() / 3f;
            fill.setColor(0x33FFFFFF);
            RectF sel = new RectF(rect.left + 3 * density, rect.top + 3 * density,
                    rect.left + step, rect.bottom - 3 * density);
            float sr = sel.height() / 2f;
            canvas.drawRoundRect(sel, sr, sr, fill);
            for (int i = 0; i < 3; i++) {
                canvas.drawCircle(rect.left + step * (i + 0.5f), cy, 3.5f * density, dot);
            }
        }
    }
}
