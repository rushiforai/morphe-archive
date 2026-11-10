/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Loki Patches' own settings screen.
 *
 * Three things live here: the page list (what the user sees), the palette used to draw it, and a small set of
 * view helpers at the bottom that every screen part is made of. The screen is built in code because extensions
 * cannot ship Android resources; the manifest entry is added by the settings patch.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {
    static final String AUTHOR = "Lokesh Sparrow";
    static final String BRAND = "Loki Patches";

    /** Fallback accent when the wallpaper has no usable colour: teal, lifted on dark, deeper on light. */
    static final int ACCENT_DARK = 0xFF2DBCB1;
    static final int ACCENT_LIGHT = 0xFF00897B;

    private static final String MORPHE_WEBSITE = "https://morphe.software";

    // region The page model
    //
    // Everything the screen lists is data: pages of rows. A row is a switch bound to a stored preference, or a
    // line that reports a value and may open something. Drawing then never needs to know which row it is on,
    // which keeps the page definitions below readable as a plain list.

    /** Text worked out at draw time, e.g. the folder downloads currently go to. */
    private interface Live {
        String text();
    }

    /** A condition that can change between draws, such as whether a row may be tapped right now. */
    private interface Check {
        boolean ok();
    }

    private static final Check YES = () -> true;

    private static final class Row {
        /** Stored preference for a switch row; {@code null} means the row is not a switch. */
        final String pref;
        final boolean fallback;
        final String title;
        /** Fixed second line, or {@code null} when {@link #live} fills it in. */
        final String note;
        final Live live;
        /** {@code null} for a row that only reports something. */
        final Runnable open;
        /** Runs after this switch flips, for rows that change what another row shows. */
        final Runnable afterwards;
        final Check usable;

        Row(String pref, boolean fallback, String title, String note, Live live, Runnable open,
            Runnable afterwards, Check usable) {
            this.pref = pref;
            this.fallback = fallback;
            this.title = title;
            this.note = note;
            this.live = live;
            this.open = open;
            this.afterwards = afterwards;
            this.usable = usable;
        }
    }

    private static final class Page {
        final String title;
        final String icon;
        final List<Row> rows = new ArrayList<>();

        Page(String title, String icon) {
            this.title = title;
            this.icon = icon;
        }

        Page sw(String pref, boolean fallback, String title, String note) {
            return sw(pref, fallback, title, note, null);
        }

        Page sw(String pref, boolean fallback, String title, String note, Runnable afterwards) {
            rows.add(new Row(pref, fallback, title, note, null, null, afterwards, null));
            return this;
        }

        /** A line that shows current state; {@code open} may be null, and then the row only reads. */
        Page shown(String title, Live live, Runnable open, Check usable) {
            rows.add(new Row(null, false, title, null, live, open, null, usable));
            return this;
        }

        /** A line with a fixed description that runs {@code run} when tapped. */
        Page act(String title, String note, Runnable run) {
            return shown(title, () -> note, run, YES);
        }
    }

    private List<Page> pages() {
        List<Page> all = new ArrayList<>();
        all.add(ads());
        all.add(feed());
        all.add(appearance());
        all.add(downloads());
        all.add(chat());
        all.add(privacy());
        all.add(other());
        // A page with no rows means none of its patches are in this install.
        List<Page> listed = new ArrayList<>();
        for (Page page : all) {
            if (!page.rows.isEmpty()) listed.add(page);
        }
        return listed;
    }

    private Page ads() {
        Page page = new Page("Ads & promotions", IconDrawable.BLOCK);
        if (Settings.isHideAdsIncluded()) {
            page.sw(Settings.HIDE_ADS, true, "Hide ads", "Ads disguised as posts in your feed (marked \"Promoted\").");
        }
        if (Settings.isHidePromotedJobsIncluded()) {
            page.sw(Settings.HIDE_PROMOTED_JOBS, true, "Hide promoted jobs",
                    "Paid job listings marked \"Promoted\", in the Jobs tab and in search.");
        }
        if (Settings.isHideSuggestedIncluded()) {
            page.sw(Settings.HIDE_SUGGESTED, true, "Hide suggested posts",
                    "Posts LinkedIn pushes from people you don't follow (\"Suggested\").");
        }
        if (Settings.isHidePremiumIncluded()) {
            page.sw(Settings.HIDE_PREMIUM, true, "Hide Premium promotions",
                    "Premium and AI upsell cards on the feed, profiles, Jobs and the Me panel.");
        }
        return page;
    }

    private Page feed() {
        Page page = new Page("Feed", IconDrawable.FEED);
        if (Settings.isDisableDoubleTapLikeIncluded()) {
            page.sw(Settings.DISABLE_DOUBLE_TAP_LIKE, true, "Disable double-tap like",
                    "A double tap on a post or photo won't add a like.");
        }
        if (Settings.isCopyTextIncluded()) {
            page.sw(Settings.COPY_TEXT, true, "Copy text",
                    "Long press a post, comment, or any text to select and copy it, like on Reddit.");
            page.sw(Settings.COPY_TEXT_LONG_SHEET, true, "Long posts in a sheet",
                    "Long posts open in a scrollable sheet with the whole text. Off: selected in place like short text.");
        }
        if (Settings.isPostMenuIncluded()) {
            page.sw(Settings.POST_MENU, true, "Post menu items",
                    "Copy text, Download photos and videos, and Save document as PDF in the ⋯ menu of posts.");
        }
        if (Settings.isSwipeFeedsIncluded()) {
            page.sw(Settings.SWIPE_FEEDS, true, "Swipe between feeds",
                    "Swipe left for Network and right for For you, when the tabs are on screen.");
        }
        if (Settings.isHideTabsIncluded()) {
            page.sw(Settings.HIDE_TAB_NETWORK, false, "Hide the My Network tab",
                    "Takes My Network out of the bottom bar. Restart LinkedIn after changing it.");
            page.sw(Settings.HIDE_TAB_JOBS, false, "Hide the Jobs tab",
                    "Takes Jobs out of the bottom bar. Restart LinkedIn after changing it.");
        }
        if (Settings.isViewerTapToHideIncluded()) {
            page.sw(Settings.VIEWER_TAP_TO_HIDE, true, "Tap to hide in viewers",
                    "Tap a video or document in full screen to hide the caption and buttons, like photos.");
        }
        if (Settings.isKeepFeedIncluded()) {
            page.sw(Settings.KEEP_FEED, true, "Keep feed on reopen",
                    "Stay where you were when you come back. Pull down or tap \"New posts\" for new posts.");
        }
        if (Settings.isFeedFiltersIncluded()) {
            feedFilters(page);
        }
        return page;
    }

    /** The filter switches, which all start off: each one takes ordinary content out of the feed. */
    private void feedFilters(Page page) {
        page.sw(Settings.FOCUS_MODE, false, "Focus mode", "Hide the number of likes, comments and reposts.")
                .sw(Settings.HIDE_CELEBRATIONS, false, "Hide celebration posts",
                        "Updates such as work anniversaries and job changes.")
                .sw(Settings.HIDE_FEED_JOBS, false, "Hide job cards in the feed", "Job suggestions mixed into your home feed.")
                .sw(Settings.HIDE_REPOSTS, false, "Hide reposts", "Reshares of someone else's post.")
                .sw(Settings.HIDE_ACTIVITY_POSTS, false, "Hide \"liked / commented by\" posts",
                        "Posts that appear only because a connection liked, commented or reacted.")
                .sw(Settings.HIDE_RECOMMENDATIONS, false, "Hide \"Recommended for you\"",
                        "\"People and pages to follow\" suggestions in the feed.")
                .sw(Settings.HIDE_VIDEO_POSTS, false, "Hide video posts", "Any post with a video in it.")
                .sw(Settings.HIDE_GAMES, false, "Hide games",
                        "LinkedIn's daily puzzle games in the Me panel, search and feed.")
                .sw(Settings.HIDE_NEW_POSTS_PILL, false, "Hide the \"New posts\" pill",
                        "The button that pops up at the top of the feed when new posts arrive.")
                .sw(Settings.HIDE_TRANSLATION, false, "Hide \"See translation\"",
                        "The translate option under posts written in another language.")
                .sw(Settings.HIDE_AI, false, "Hide AI suggestions",
                        "AI prompts, suggestions, and assistant cards. Experimental.")
                .shown("Muted words", SettingsActivity::mutedWordsLine, this::editMutedWords, YES);
    }

    private static String mutedWordsLine() {
        String words = Settings.mutedWords().trim();
        if (words.isEmpty()) return I18n.tr("Posts with these words or phrases are hidden.");
        return words.replace("\n", ", ");
    }

    private Page appearance() {
        Page page = new Page("Appearance", IconDrawable.PALETTE);
        if (Settings.isRemoveGapsAndDividersIncluded()) {
            page.sw(Settings.REMOVE_GAPS_AND_DIVIDERS, true, "Remove gaps and dividers",
                    "Removes the spacing between posts and the lines between list items. Restart " +
                    "LinkedIn to apply.");
        }
        if (Settings.isMaterialYouIncluded()) {
            page.sw(Settings.MATERIAL_YOU, true, "Material You",
                    "Uses your wallpaper colors for accents, backgrounds, cards and borders. Restart " +
                    "LinkedIn to apply. Older screens keep the colors picked at patch time.");
            page.sw(Settings.AMOLED_BLACK, false, "AMOLED black",
                    "Real black instead of dark grey in dark mode. AMOLED screens switch black " +
                    "pixels off, which saves battery. Restart LinkedIn to apply.");
        }
        return page;
    }

    private Page downloads() {
        Page page = new Page("Download", IconDrawable.DOWNLOAD);
        if (!Settings.isDownloadMediaIncluded()) return page;
        page.sw(Settings.DOWNLOAD_MEDIA, true, "Download button",
                "Shown on photos, videos, profile photos and banners. Long press it to come back " +
                "to this page.");
        // Read-only summary of the two rows under it; follows them without being tapped.
        page.shown("Save location", () -> Settings.downloadSplitByType()
                ? I18n.f("Photos: %1$s\nVideos: %2$s", Downloads.location(false), Downloads.location(true))
                : Downloads.location(false), null, YES);
        page.shown("Main folder", () -> Settings.downloadSplitByType()
                ? "Chosen for you (Split photos & videos is on)" : Settings.downloadBaseDir(),
                this::chooseBaseDir, () -> !Settings.downloadSplitByType());
        page.shown("Subfolder name", () -> {
            String folder = Settings.downloadFolder();
            return folder.isEmpty() ? "(main folder, no subfolder)" : folder;
        }, this::editFolder, YES);
        page.sw(Settings.DOWNLOAD_SPLIT_BY_TYPE, false, "Split photos & videos",
                "Photos are saved to Pictures, videos to Movies.", this::refresh);
        return page;
    }

    private Page chat() {
        Page page = new Page("Chat", IconDrawable.CHAT);
        if (!Settings.isMessagingIncluded()) return page;
        page.sw(Settings.HIDE_SPONSORED_MESSAGES, true, "Hide sponsored messages",
                "Sponsored InMail and ad messages in your inbox list.");
        page.sw(Settings.GHOST_MODE, false, "Ghost mode",
                "Others won't see you typing or that you've read their message. Mark a chat as " +
                "read yourself from the chat list.");
        return page;
    }

    private Page privacy() {
        Page page = new Page("Privacy", IconDrawable.SHIELD);
        if (Settings.isOpenLinksDirectlyIncluded()) {
            page.sw(Settings.OPEN_LINKS_DIRECTLY, true, "Open links directly",
                    "Opens links in posts and chats without LinkedIn's \"leaving LinkedIn\" warning " +
                    "page.");
            page.sw(Settings.RESOLVE_SHORT_LINKS, true, "Skip lnkd.in redirects",
                    "lnkd.in links in the feed are resolved quietly in the background, so a tap goes " +
                    "straight to the real site.");
        }
        if (Settings.isSanitizeShareLinksIncluded()) {
            page.sw(Settings.SANITIZE_SHARE_LINKS, true, "Clean share links",
                    "Strips tracking tags (utm, trk, rcm, …) from LinkedIn links you copy or share.");
        }
        if (Settings.isAnonymousProfileViewingIncluded()) {
            page.sw(Settings.ANONYMOUS_PROFILE_VIEWING, false, "Anonymous profile viewing",
                    "Doesn't send the analytics events of profile pages, so your visits aren't listed in other people's viewers. Experimental.");
        }
        if (Settings.isBlockTrackingIncluded()) {
            page.sw(Settings.BLOCK_TRACKING, false, "Block tracking",
                    "Stops most analytics from being sent. If something misbehaves, switch this off.");
        }
        return page;
    }

    private Page other() {
        Page page = new Page("Other", IconDrawable.MORE);
        page.shown("Language", () -> languageNames()[languageIndex()], this::chooseLanguage, YES);
        page.act("Export settings", "Back up every setting to the clipboard.", this::exportSettings);
        page.act("Import settings", "Restore settings from a backup in the clipboard.", this::importSettings);
        page.act("Reset to defaults", "Reset all Loki Patches settings.", this::resetSettings);
        page.sw(Settings.DEBUG_LOGGING, false, "Diagnostic logging",
                "Records extra detail for the diagnostic report. Switch it on, reproduce the " +
                "issue, then copy the report.");
        page.act("Copy diagnostic report", "A bug-report bundle: app, device and patch info plus the recent log, with links " +
                                           "and IDs stripped.", this::copyDiagnosticReport);
        page.act("Clear diagnostic log", "Deletes the saved log.", this::clearDiagnosticLog);
        return page;
    }

    // endregion

    // Palette, fixed once per screen.

    private boolean dark;
    private int background, surface, divider, ink, inkMuted, accent;

    private List<Page> pages;
    /** Page on screen, or {@code null} for the page list. */
    private Page openPage;
    private boolean searching;
    private String query = "";

    private TextView titleView;
    private EditText searchField;
    private ImageButton searchButton;
    private LinearLayout content;
    private ScrollView scroll;
    private View restartBanner;

    // region Called from other classes

    /**
     * Recolours the buttons of a dialog that opens over one of LinkedIn's own screens, where the inherited theme
     * can leave button text invisible. The dialog gets a panel and plain text buttons in the accent colour, so
     * it reads the same under every phone maker's theme.
     */
    static void tintButtons(AlertDialog dialog, Context context) {
        Configuration config = context.getResources().getConfiguration();
        boolean phoneInNightMode = (config.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        boolean lightOnDark = showsLightText(dialog.getContext(), phoneInNightMode);
        int tint = MaterialYou.settingsAccent(lightOnDark, lightOnDark ? ACCENT_DARK : ACCENT_LIGHT);
        Window window = dialog.getWindow();
        if (window != null) {
            GradientDrawable panel = new GradientDrawable();
            panel.setColor(lightOnDark ? 0xFF1E1F22 : 0xFFFFFFFF);
            panel.setCornerRadius(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 24,
                    context.getResources().getDisplayMetrics()));
            window.setBackgroundDrawable(panel);
        }
        int[] buttons = {AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL};
        for (int which : buttons) {
            android.widget.Button button = dialog.getButton(which);
            if (button == null) continue;
            button.setBackgroundColor(0x00000000);
            button.setTextColor(tint);
            button.setAllCaps(false);
            button.setTypeface(Typeface.DEFAULT_BOLD);
        }
    }

    /**
     * Whether that theme paints light text, and so needs a dark panel behind it. LinkedIn's own screens may be
     * light while the phone is in dark mode, so the answer comes from the resolved text colour, not the device.
     */
    private static boolean showsLightText(Context context, boolean fallback) {
        TypedValue resolved = new TypedValue();
        if (!context.getTheme().resolveAttribute(android.R.attr.textColorPrimary, resolved, true)) return fallback;
        int color;
        if (resolved.resourceId != 0) {
            color = context.getColorStateList(resolved.resourceId).getDefaultColor();
        } else if (resolved.type >= TypedValue.TYPE_FIRST_COLOR_INT
                && resolved.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            color = resolved.data;
        } else {
            return fallback;
        }
        double brightness = (0.299 * ((color >> 16) & 0xFF) + 0.587 * ((color >> 8) & 0xFF)
                + 0.114 * (color & 0xFF)) / 255;
        return brightness > 0.5;
    }

    private AlertDialog tinted(AlertDialog dialog) {
        tintButtons(dialog, this);
        return dialog;
    }

    static void open(Context context) {
        Intent intent = new Intent(context, SettingsActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    /** {patch name, applied}, in the order Morphe Manager lists the patches. */
    static Object[][] patches() {
        return new Object[][]{
                entry("Hide ads", Settings.isHideAdsIncluded()),
                entry("Hide promoted jobs", Settings.isHidePromotedJobsIncluded()),
                entry("Hide suggested posts", Settings.isHideSuggestedIncluded()),
                entry("Hide Premium upsells", Settings.isHidePremiumIncluded()),
                entry("Feed filters", Settings.isFeedFiltersIncluded()),
                entry("Disable double-tap like", Settings.isDisableDoubleTapLikeIncluded()),
                entry("Copy text", Settings.isCopyTextIncluded()),
                entry("Keep feed on reopen", Settings.isKeepFeedIncluded()),
                entry("Post menu items", Settings.isPostMenuIncluded()),
                entry("Tap to hide in viewers", Settings.isViewerTapToHideIncluded()),
                entry("Swipe between feeds", Settings.isSwipeFeedsIncluded()),
                entry("Hide the My Network tab", Settings.isHideTabsIncluded()),
                entry("Hide the Jobs tab", Settings.isHideTabsIncluded()),
                entry("Anonymous profile viewing", Settings.isAnonymousProfileViewingIncluded()),
                entry("Download media", Settings.isDownloadMediaIncluded()),
                entry("Messaging", Settings.isMessagingIncluded()),
                entry("Open links directly", Settings.isOpenLinksDirectlyIncluded()),
                entry("Sanitize share links", Settings.isSanitizeShareLinksIncluded()),
                entry("Block tracking", Settings.isBlockTrackingIncluded()),
                entry("Remove gaps and dividers", Settings.isRemoveGapsAndDividersIncluded()),
                entry("Material You", Settings.isMaterialYouIncluded()),
                entry("GmsCore support", Settings.isGmsCoreSupportIncluded()),
        };
    }

    private static Object[] entry(String name, boolean applied) {
        return new Object[]{name, applied};
    }

    // endregion

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActionBar bar = getActionBar();
        if (bar != null) bar.hide();

        boolean nightMode = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        dark = nightMode;
        background = nightMode ? 0xFF000000 : 0xFFFFFFFF;
        surface = nightMode ? 0xFF161616 : 0xFFF2F4F5;
        divider = nightMode ? 0xFF2A2A2A : 0xFFE3E5E8;
        ink = nightMode ? 0xFFFFFFFF : 0xFF141414;
        inkMuted = nightMode ? 0xFFA6A6A6 : 0xFF5F6368;
        accent = nightMode ? ACCENT_DARK : ACCENT_LIGHT;
        int[] wallpaper = MaterialYou.settingsColors(nightMode);
        if (wallpaper != null) {
            background = wallpaper[0];
            surface = wallpaper[1];
            divider = wallpaper[2];
            accent = wallpaper[3];
        }
        if (nightMode && Settings.amoledBlack()) {
            // Pure black wins over the tinted dark surface Material You would paint.
            background = 0xFF000000;
            surface = 0xFF161616;
        }

        Window window = getWindow();
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        if (!nightMode) {
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        }

        pages = pages();
        setContentView(buildLayout());
        render();
    }

    private View buildLayout() {
        content = column();
        // Room at the bottom so the last row can scroll clear of the restart banner.
        content.setPadding(0, 0, 0, dp(96));
        scroll = scrolling(content);

        LinearLayout top = column();
        top.addView(buildTopBar());
        top.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        FrameLayout root = pageFrame();
        root.addView(top);
        restartBanner = buildRestartBanner();
        root.addView(restartBanner);
        return root;
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        if (searching) {
            setSearching(false);
        } else if (openPage != null) {
            openPage = null;
            render();
        } else {
            super.onBackPressed();
        }
    }

    // region Drawing

    private void render() {
        titleView.setVisibility(searching ? View.GONE : View.VISIBLE);
        searchField.setVisibility(searching ? View.VISIBLE : View.GONE);
        if (!searching) titleView.setText(openPage == null ? BRAND : I18n.tr(openPage.title));
        fill();
        scroll.scrollTo(0, 0);
    }

    /** Redraw in place and stay at the same scroll offset, after a change made on this page. */
    private void refresh() {
        int offset = scroll.getScrollY();
        fill();
        scroll.post(() -> scroll.scrollTo(0, offset));
    }

    private void fill() {
        content.removeAllViews();
        if (searching) {
            drawResults();
        } else if (openPage == null) {
            drawPageList();
        } else {
            drawRows(openPage.rows, null);
        }
    }

    private void drawPageList() {
        content.addView(navRow(IconDrawable.INFO, "About", v -> showAbout()));
        for (Page page : pages) {
            content.addView(navRow(page.icon, page.title, v -> {
                openPage = page;
                render();
            }));
        }
    }

    /** Rows in order; with {@code fromPages}, each row carries the name of the page it came from. */
    private void drawRows(List<Row> rows, List<String> fromPages) {
        for (int i = 0; i < rows.size(); i++) {
            Row row = rows.get(i);
            String pageName = fromPages == null ? null : fromPages.get(i);
            boolean isSwitch = row.pref != null;
            content.addView(isSwitch ? switchRow(row, pageName) : infoRow(row, pageName));
        }
    }

    private void drawResults() {
        String needle = query.trim().toLowerCase(Locale.ROOT);
        List<Row> hits = new ArrayList<>();
        List<String> origins = new ArrayList<>();
        for (Page page : pages) {
            for (Row row : page.rows) {
                String haystack = (I18n.tr(row.title) + " "
                        + (row.note == null ? "" : I18n.tr(row.note)) + " "
                        + I18n.tr(page.title)).toLowerCase(Locale.ROOT);
                if (needle.isEmpty() || haystack.contains(needle)) {
                    hits.add(row);
                    origins.add(page.title);
                }
            }
        }
        if (hits.isEmpty()) {
            TextView empty = label("No matching settings.", 15, inkMuted, false);
            empty.setGravity(Gravity.CENTER);
            empty.setPadding(dp(24), dp(48), dp(24), 0);
            content.addView(empty);
            return;
        }
        drawRows(hits, origins);
    }

    // endregion

    // region Header and rows

    private View buildTopBar() {
        LinearLayout bar = strip(4, 6, 4, 6);

        ImageButton back = iconButton(IconDrawable.ARROW_BACK, "Back");
        back.setOnClickListener(v -> onBackPressed());
        bar.addView(back);

        titleView = label(BRAND, 22, ink, true);
        titleView.setPadding(dp(12), 0, 0, 0);
        bar.addView(titleView, weightOne());

        searchField = new EditText(this);
        searchField.setHint(I18n.tr("Search settings"));
        searchField.setSingleLine(true);
        searchField.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        searchField.setTextColor(ink);
        searchField.setHintTextColor(inkMuted);
        searchField.setBackground(null);
        searchField.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        searchField.setVisibility(View.GONE);
        searchField.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            public void afterTextChanged(Editable s) {
                query = s.toString();
                if (searching) fill();
            }
        });
        bar.addView(searchField, weightOne());

        searchButton = iconButton(IconDrawable.SEARCH, "Search");
        searchButton.setOnClickListener(v -> setSearching(!searching));
        bar.addView(searchButton);
        return bar;
    }

    private void setSearching(boolean on) {
        searching = on;
        searchButton.setImageDrawable(new IconDrawable(on ? IconDrawable.CLOSE : IconDrawable.SEARCH, ink));
        InputMethodManager keyboard = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (!on) {
            keyboard.hideSoftInputFromWindow(searchField.getWindowToken(), 0);
            render();
            return;
        }
        query = "";
        searchField.setText("");
        render();
        searchField.requestFocus();
        keyboard.showSoftInput(searchField, InputMethodManager.SHOW_IMPLICIT);
    }

    /** Main-list entry: page icon, then its name. */
    private View navRow(String icon, String title, View.OnClickListener tap) {
        LinearLayout row = strip(24, 20, 24, 20);
        row.setOnClickListener(tap);
        row.addView(glyph(icon, ink, 26));
        TextView name = label(title, 18, ink, false);
        name.setPadding(dp(28), 0, 0, 0);
        row.addView(name);
        return row;
    }

    private View switchRow(Row row, String pageName) {
        LinearLayout line = strip(24, 16, 20, 16);
        line.addView(texts(row.title, row.note, pageName, null), weightOne());

        Switch toggle = new Switch(this);
        toggle.setChecked(Settings.get(row.pref, row.fallback));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{accent, dark ? 0xFFB0B0B0 : 0xFFFFFFFF}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{
                (accent & 0x00FFFFFF) | 0x80000000, dark ? 0xFF474747 : 0xFFBDBDBD}));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            Settings.set(row.pref, checked);
            showRestartBanner();
            if (row.afterwards != null) row.afterwards.run();
        });
        line.addView(toggle);
        // The whole row toggles; the switch itself keeps its own listener.
        line.setOnClickListener(v -> toggle.toggle());
        return line;
    }

    private View infoRow(Row row, String pageName) {
        LinearLayout line = strip(24, 16, 20, 16);
        String current = row.live.text();
        if (row.open == null) {
            // Nothing to open, so the current value is the whole message and is painted as such.
            line.addView(texts(row.title, current, pageName, accent), weightOne());
            line.setBackground(null);
            return line;
        }
        line.addView(texts(row.title, current, pageName, null), weightOne());
        ImageView chevron = glyph(IconDrawable.CHEVRON_RIGHT, inkMuted, 24);
        line.addView(chevron);
        boolean usable = row.usable == null || row.usable.ok();
        line.setEnabled(usable);
        line.setAlpha(usable ? 1f : 0.45f);
        line.setOnClickListener(v -> row.open.run());
        return line;
    }

    /**
     * Text block of a row: optional page label, title, optional second line.
     *
     * @param secondLineColor accent for a read-only value, {@code null} for the muted colour.
     */
    private LinearLayout texts(String title, String secondLine, String pageName, Integer secondLineColor) {
        LinearLayout block = column();
        if (pageName != null) {
            TextView page = label(I18n.tr(pageName).toUpperCase(Locale.ROOT), 11, accent, true);
            page.setLetterSpacing(0.06f);
            block.addView(page);
        }
        block.addView(label(title, 17, ink, false));
        if (secondLine != null) {
            TextView text = label(secondLine, 14, secondLineColor == null ? inkMuted : secondLineColor, false);
            text.setPadding(0, dp(3), dp(12), 0);
            block.addView(text);
        }
        return block;
    }

    // endregion

    // region About and its dialogs

    private void showAbout() {
        LinearLayout card = cardShell(28, 24, true);

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(getApplicationInfo().loadIcon(getPackageManager()));
        card.addView(icon, square(88));

        card.addView(placed(label(BRAND, 26, ink, true), Gravity.CENTER, 16, 4));
        card.addView(placed(label("LinkedIn patches  •  built for Morphe", 14, inkMuted, false),
                Gravity.CENTER, 0, 20));

        // Update box: shows this build until the GitHub check answers, then the answer.
        LinearLayout update = column();
        update.setGravity(Gravity.CENTER_HORIZONTAL);
        update.setPadding(dp(20), dp(16), dp(20), dp(16));
        update.setBackground(bordered());
        TextView updateTitle = placed(label("Checking for updates…", 17, accent, true), Gravity.CENTER, 0, 0);
        update.addView(updateTitle);
        TextView updateBody = placed(label(I18n.f("Installed: %1$s %2$s", BRAND,
                Settings.patchesVersion()), 15, inkMuted, false), Gravity.CENTER, 6, 0);
        update.addView(updateBody);
        card.addView(update, wide());
        String thisBuild = BRAND + " " + Settings.patchesVersion() + "  •  LinkedIn " + appVersion()
                + "\n" + I18n.f("Made by %1$s", AUTHOR);
        UpdateChecker.check((status, latest) -> {
            switch (status) {
                case UPDATE_AVAILABLE:
                    updateTitle.setText(I18n.tr("Update available"));
                    updateBody.setText(I18n.f("Installed version: %1$s.\n\nNewer version: %2$s\n\nPatch LinkedIn again in Morphe " +
                                              "Manager to update.",
                            Settings.patchesVersion(), latest));
                    break;
                case UP_TO_DATE:
                    updateTitle.setText(I18n.tr("Up to date"));
                    updateBody.setText(thisBuild);
                    break;
                case NO_RELEASE:
                    updateTitle.setText(I18n.tr("No stable release yet"));
                    updateBody.setText(thisBuild + "\n\n"
                            + I18n.tr("GitHub has no stable release to compare against yet."));
                    break;
                default:
                    updateTitle.setText(I18n.tr("Can't connect"));
                    updateBody.setText(thisBuild + "\n\n"
                            + I18n.tr("Couldn't reach GitHub. Check your connection and reopen this page."));
                    break;
            }
        });

        card.addView(sectionTitle("Official links"));
        LinearLayout links = column();
        links.setBackground(bordered());
        String repo = "https://github.com/" + UpdateChecker.REPO;
        link(links, IconDrawable.CODE, "GitHub", () -> openUrl(repo));
        link(links, IconDrawable.HISTORY, "Changelog", () -> openUrl(repo + "/releases"));
        link(links, IconDrawable.BUG, "Report a bug", () -> openUrl(repo + "/issues/new/choose"));
        link(links, IconDrawable.CHECKLIST, "Patch status", this::showPatchStatus);
        link(links, IconDrawable.PEOPLE, "Credits", this::showCredits);
        card.addView(links, wide());

        card.addView(placed(label(I18n.f("%1$s is not made by LinkedIn and is not part of the Morphe project.",
                BRAND), 12, inkMuted, false), Gravity.CENTER, 16, 0));

        showCard(card);
    }

    private void showPatchStatus() {
        LinearLayout card = titledCard("Patch status", "The patches included in this LinkedIn install.");
        LinearLayout list = column();
        list.setBackground(bordered());

        Object[][] all = patches();
        for (int i = 0; i < all.length; i++) {
            if (i > 0) list.addView(hairline());
            boolean applied = (Boolean) all[i][1];
            LinearLayout row = stripPlain(18, 14, 18, 14);
            row.addView(label((String) all[i][0], 16, ink, false), weightOne());
            row.addView(label(applied ? "Applied" : "Not applied", 14, applied ? accent : inkMuted, true));
            list.addView(row);
        }
        card.addView(list, wide());
        showCard(card);
    }

    private void showCredits() {
        LinearLayout card = titledCard("Credits", I18n.f("Who made %1$s possible.", BRAND));
        card.addView(credit(IconDrawable.PEOPLE, AUTHOR, I18n.f("Creator of %1$s", BRAND),
                "github.com/lokesh-sparrow", "https://github.com/lokesh-sparrow"));
        card.addView(credit(IconDrawable.CODE, "Morphe", "The patcher engine, Morphe Manager and the patch template",
                "morphe.software", MORPHE_WEBSITE));
        card.addView(credit(IconDrawable.INFO, "LinkedIn",
                I18n.f("The app being patched. %1$s has no connection to LinkedIn.", BRAND), null, null));
        showCard(card);
    }

    private View credit(String icon, String title, String role, String linkLabel, String url) {
        LinearLayout card = stripPlain(18, 16, 14, 16);
        card.setBackground(bordered());
        card.addView(glyph(icon, accent, 28));

        LinearLayout words = column();
        words.setPadding(dp(18), 0, dp(8), 0);
        words.addView(label(title, 17, ink, true));
        TextView roleView = label(role, 14, inkMuted, false);
        roleView.setPadding(0, dp(2), 0, 0);
        words.addView(roleView);
        if (linkLabel != null) {
            TextView address = label(linkLabel, 13, accent, false);
            address.setPadding(0, dp(4), 0, 0);
            words.addView(address);
        }
        card.addView(words, weightOne());

        if (url != null) {
            card.addView(glyph(IconDrawable.CHEVRON_RIGHT, accent, 24));
            card.setOnClickListener(v -> openUrl(url));
            card.setForeground(ripple(false));
        }
        LinearLayout.LayoutParams params = wide();
        params.topMargin = dp(10);
        card.setLayoutParams(params);
        return card;
    }

    /** Card with a centred title and a subtitle under it; the frame the About dialogs share. */
    private LinearLayout titledCard(String title, String subtitle) {
        LinearLayout card = cardShell(24, 24, false);
        card.addView(placed(label(title, 24, ink, true), Gravity.CENTER, 0, 0), wide());
        card.addView(placed(label(subtitle, 14, inkMuted, false), Gravity.CENTER, 4, 16), wide());
        return card;
    }

    private void showCard(LinearLayout card) {
        ScrollView wrapper = new ScrollView(this);
        wrapper.addView(card);
        AlertDialog dialog = new AlertDialog.Builder(this, dialogTheme()).setView(wrapper).create();
        dialog.show();
        if (dialog.getWindow() != null) dialog.getWindow().setBackgroundDrawable(new ColorDrawable(0));
    }

    private TextView sectionTitle(String title) {
        return placed(label(title, 18, ink, true), Gravity.CENTER, 24, 12);
    }

    private void link(LinearLayout links, String icon, String title, Runnable tap) {
        if (links.getChildCount() > 0) links.addView(hairline());
        LinearLayout row = strip(18, 18, 14, 18);
        row.setOnClickListener(v -> tap.run());
        row.addView(glyph(icon, accent, 26));
        TextView caption = label(title, 18, ink, true);
        caption.setPadding(dp(20), 0, 0, 0);
        row.addView(caption, weightOne());
        row.addView(glyph(IconDrawable.CHEVRON_RIGHT, accent, 24));
        links.addView(row);
    }

    /** One pixel rule between two rows of a card. */
    private View hairline() {
        View line = new View(this);
        line.setBackgroundColor(divider);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1);
        params.setMargins(dp(18), 0, dp(18), 0);
        line.setLayoutParams(params);
        return line;
    }

    private void openUrl(String url) {
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Exception e) {
            Downloads.toast(this, "Can't open the link");
        }
    }

    // endregion

    // region Language

    /** "auto" first, then every language with a translation file, in languages.json order. */
    private static String[] languageCodes() {
        List<String> codes = new ArrayList<>();
        codes.add(I18n.LANGUAGE_AUTO);
        codes.addAll(Translations.LANGUAGES.keySet());
        return codes.toArray(new String[0]);
    }

    /** Names stay in their own language; only the automatic entry is translated. */
    private static String[] languageNames() {
        String[] codes = languageCodes();
        String[] names = new String[codes.length];
        names[0] = I18n.tr("Automatic (device language)");
        for (int i = 1; i < codes.length; i++) names[i] = Translations.LANGUAGES.get(codes[i]);
        return names;
    }

    private int languageIndex() {
        int index = Arrays.asList(languageCodes()).indexOf(Settings.language());
        return Math.max(index, 0);
    }

    private void chooseLanguage() {
        String[] codes = languageCodes();
        tinted(ask("Language")
                .setSingleChoiceItems(languageNames(), languageIndex(), (dialog, which) -> {
                    Settings.setString(Settings.LANGUAGE, codes[which]);
                    dialog.dismiss();
                    // Every label is read again from the translations, so the pick applies at once.
                    recreate();
                })
                .show());
    }

    // endregion

    // region Backup and diagnostics

    private void copyDiagnosticReport() {
        copyToClipboard(Diagnostics.report(this), "Report copied — paste it into your bug report.");
    }

    private void clearDiagnosticLog() {
        Diagnostics.clear();
        Downloads.toast(this, "Diagnostic log cleared");
    }

    private void exportSettings() {
        try {
            copyToClipboard(Settings.exportJson(), "Settings backup copied");
        } catch (Exception e) {
            Downloads.toast(this, I18n.f("Export failed: %1$s", e.getMessage()));
        }
    }

    /** Puts text on the clipboard under the app name, with the toast that says so. */
    private void copyToClipboard(String text, String toast) {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(BRAND, text));
            Downloads.toast(this, toast);
        } catch (Exception e) {
            Downloads.toast(this, I18n.f("Export failed: %1$s", e.getMessage()));
        }
    }

    private void importSettings() {
        EditText input = multiline("Paste your settings backup below");
        ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        if (clip != null && clip.getItemCount() > 0 && clip.getItemAt(0).getText() != null) {
            input.setText(clip.getItemAt(0).getText());
        }
        tinted(ask("Import settings")
                .setView(fieldBox(input))
                .setPositiveButton(I18n.tr("Import"), (dialog, which) -> {
                    try {
                        int count = Settings.importJson(input.getText().toString());
                        Downloads.toast(this, I18n.f("%1$s settings imported", count));
                        refresh();
                        showRestartBanner();
                    } catch (Exception e) {
                        Downloads.toast(this, "Invalid backup");
                    }
                })
                .show());
    }

    private void editMutedWords() {
        EditText input = multiline("One word or phrase per line, for example:\nthrilled to announce\nhiring");
        input.setText(Settings.mutedWords());
        tinted(ask("Muted words")
                .setMessage(I18n.tr("Posts containing any of these, as whole words, are hidden from your feed. "
                        + "Upper and lower case don't matter."))
                .setView(fieldBox(input))
                .setPositiveButton(I18n.tr("Save"), (dialog, which) -> {
                    Settings.setMutedWords(input.getText().toString().trim());
                    refresh();
                })
                .show());
    }

    private void resetSettings() {
        tinted(ask("Reset to defaults?")
                .setMessage(I18n.f("This resets every %1$s setting, including where downloads are saved.", BRAND))
                .setPositiveButton(I18n.tr("Reset"), (dialog, which) -> {
                    Settings.resetAll();
                    Downloads.toast(this, "Settings reset to defaults");
                    refresh();
                    showRestartBanner();
                })
                .show());
    }

    // endregion

    // region Download location

    private void chooseBaseDir() {
        String[] baseDirs = Settings.DOWNLOAD_BASE_DIRS;
        int checked = Math.max(Arrays.asList(baseDirs).indexOf(Settings.downloadBaseDir()), 0);
        tinted(ask("Main folder")
                .setSingleChoiceItems(baseDirs, checked, (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_BASE_DIR, baseDirs[which]);
                    refresh();
                    dialog.dismiss();
                })
                .show());
    }

    private void editFolder() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setText(Settings.downloadFolder());
        input.setHint(Settings.DEFAULT_DOWNLOAD_FOLDER);
        input.setSelection(input.getText().length());

        TextView help = label("Separate folder levels with \"/\", e.g. LinkedIn/Media. Leave blank to use the " +
                              "main folder.", 13, inkMuted, false);
        help.setPadding(0, dp(8), 0, 0);

        LinearLayout box = column();
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input);
        box.addView(help);

        tinted(ask("Subfolder name")
                .setView(box)
                .setPositiveButton(I18n.tr("Save"), (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.sanitizeFolder(input.getText().toString()));
                    refresh();
                })
                .setNeutralButton(I18n.tr("Default"), (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.DEFAULT_DOWNLOAD_FOLDER);
                    refresh();
                })
                .show());
    }

    // endregion

    // region Restart banner

    private View buildRestartBanner() {
        LinearLayout banner = strip(18, 10, 10, 10);
        banner.setBackground(rounded(dark ? 0xFF262626 : 0xFF202124, 16));
        banner.setElevation(dp(8));

        TextView message = label("Restart LinkedIn for the changes to take effect.", 14, 0xFFFFFFFF, false);
        banner.addView(message, weightOne());

        TextView action = label("RESTART", 14, MaterialYou.settingsAccent(true, 0xFF2DBCB1), true);
        action.setPadding(dp(12), dp(10), dp(12), dp(10));
        action.setBackground(ripple(false));
        action.setOnClickListener(v -> restartApp());
        banner.addView(action);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        params.setMargins(dp(16), 0, dp(16), dp(16));
        banner.setLayoutParams(params);
        banner.setVisibility(View.GONE);
        return banner;
    }

    /** Shown once after the first change, and stays until LinkedIn is restarted. */
    private void showRestartBanner() {
        if (restartBanner.getVisibility() == View.VISIBLE) return;
        restartBanner.setVisibility(View.VISIBLE);
        restartBanner.setTranslationY(dp(24));
        restartBanner.setAlpha(0f);
        restartBanner.animate().alpha(1f).translationY(0f).setDuration(200).start();
    }

    // endregion

    // region View helpers
    //
    // Every screen part above is assembled from these, so paddings and shapes are stated once.

    /** Container that scrolls whatever is put in it. */
    private ScrollView scrolling(View body) {
        ScrollView view = new ScrollView(this);
        view.addView(body);
        return view;
    }

    /** Root frame behind everything, inset for the system bars. */
    private FrameLayout pageFrame() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(background);
        root.setFitsSystemWindows(true);
        return root;
    }

    /** Text positioned in its parent: gravity plus the space above and below it. */
    private TextView placed(TextView view, int gravity, int above, int below) {
        view.setGravity(gravity);
        view.setPadding(0, dp(above), 0, dp(below));
        return view;
    }

    /** Dialog builder that already carries the screen's theme, a title and a Cancel button. */
    private AlertDialog.Builder ask(String title) {
        return new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr(title))
                .setNegativeButton(I18n.tr("Cancel"), null);
    }

    /** Plain vertical container. */
    private LinearLayout column() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        return box;
    }

    /** Tappable row: horizontal, vertically centred, padded, with the standard ripple. */
    private LinearLayout strip(int left, int top, int right, int bottom) {
        LinearLayout row = stripPlain(left, top, right, bottom);
        row.setBackground(ripple(false));
        return row;
    }

    private LinearLayout stripPlain(int left, int top, int right, int bottom) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(left), dp(top), dp(right), dp(bottom));
        return row;
    }

    /** Icon of a fixed size, tinted. */
    private ImageView glyph(String path, int color, int sizeDp) {
        ImageView icon = new ImageView(this);
        icon.setImageDrawable(new IconDrawable(path, color));
        icon.setLayoutParams(square(sizeDp));
        return icon;
    }

    /** Dialog or About card: rounded, opaque, and dark when the wallpaper has no colours. */
    private LinearLayout cardShell(int padTop, int padBottom, boolean centered) {
        LinearLayout card = column();
        if (centered) card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(24), dp(padTop), dp(24), dp(padBottom));
        boolean wallpaperColors = MaterialYou.settingsColors(dark) != null;
        card.setBackground(rounded(wallpaperColors ? background : dark ? 0xFF0B0B0B : 0xFFFFFFFF, 28));
        return card;
    }

    private ImageButton iconButton(String path, String description) {
        ImageButton button = new ImageButton(this);
        button.setImageDrawable(new IconDrawable(path, ink));
        button.setBackground(ripple(true));
        button.setContentDescription(I18n.tr(description));
        button.setPadding(dp(13), dp(13), dp(13), dp(13));
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(50), dp(50)));
        return button;
    }

    private TextView label(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(I18n.tr(value));
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return view;
    }

    private EditText multiline(String hint) {
        EditText input = new EditText(this);
        input.setHint(I18n.tr(hint));
        input.setMinLines(4);
        input.setGravity(Gravity.TOP);
        return input;
    }

    private LinearLayout fieldBox(EditText input) {
        LinearLayout box = new LinearLayout(this);
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input, wide());
        return box;
    }

    private GradientDrawable rounded(int color, int radiusDp) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(radiusDp));
        return shape;
    }

    /** Card surface with a hairline border. */
    private GradientDrawable bordered() {
        GradientDrawable shape = rounded(surface, 20);
        shape.setStroke(dp(1), divider);
        return shape;
    }

    private LinearLayout.LayoutParams wide() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams weightOne() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
    }

    private LinearLayout.LayoutParams square(int sizeDp) {
        return new LinearLayout.LayoutParams(dp(sizeDp), dp(sizeDp));
    }

    private Drawable ripple(boolean borderless) {
        TypedValue value = new TypedValue();
        getTheme().resolveAttribute(borderless
                ? android.R.attr.selectableItemBackgroundBorderless
                : android.R.attr.selectableItemBackground, value, true);
        return getDrawable(value.resourceId);
    }

    private int dialogTheme() {
        return dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
    }

    private String appVersion() {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), 0);
            return info.versionName;
        } catch (Exception e) {
            return "?";
        }
    }

    /** Relaunches LinkedIn from its launcher entry and ends this process, so the patches start again. */
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
        return (int) (value * getResources().getDisplayMetrics().density);
    }

    // endregion
}
