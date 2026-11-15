/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ComponentName;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
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

import app.loki.extension.LokiLog;
import app.loki.extension.LokiPrefs;
import app.loki.extension.MenuInfo;
import app.loki.extension.SplitwiseFeatures;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Loki Patches' own settings screen, the same in every app: LinkedIn opens it as SettingsActivity, every other
 * app as app.loki.extension.MenuActivity (a subclass with nothing of its own). The app's own pages are chosen
 * from the package the screen runs in; the standard pages (patch status, backup, diagnostics, general, about)
 * are shared.
 *
 * Three things live here: the page list (what the user sees), the palette used to draw it, and a small set of
 * view helpers at the bottom that every screen part is made of. The screen is built in code because extensions
 * cannot ship Android resources; the manifest entry is added by the settings patch.
 */
@SuppressWarnings("unused")
public class SettingsActivity extends Activity {
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
    interface Live {
        String text();
    }

    /** A condition that can change between draws, such as whether a row may be tapped right now. */
    interface Check {
        boolean ok();
    }

    static final Check YES = () -> true;

    /** A switch whose value is not a LinkedIn preference (Loki's own settings in other apps, the drawer icon). */
    interface Toggle {
        boolean get();

        void set(boolean on);
    }

    static final class Row {
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
        /** Reads and writes a switch that is not a LinkedIn preference; {@code null} for preference rows. */
        Toggle toggle;
        /** Whether flipping this switch needs an app restart (LinkedIn's feature switches do). */
        boolean restart = true;

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

    static final class Page {
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

        /** A read-only line: title and its current value. */
        Page info(String title, Live live) {
            return shown(title, live, null, YES);
        }

        /** A switch backed by {@code toggle} that takes effect at once. */
        Page toggle(String title, String note, Toggle toggle) {
            return toggle(title, note, toggle, false);
        }

        /** A switch backed by {@code toggle}; with {@code restart} the screen offers to restart the app after it. */
        Page toggle(String title, String note, Toggle toggle, boolean restart) {
            Row row = new Row("", false, title, note, null, null, null, null);
            row.toggle = toggle;
            row.restart = restart;
            rows.add(row);
            return this;
        }
    }

    private List<Page> pages() {
        List<Page> all = new ArrayList<>();
        if (linkedIn) {
            all.add(ads());
            all.add(feed());
            all.add(appearance());
            all.add(downloads());
            all.add(chat());
            all.add(privacy());
        } else {
            HostPages.add(this, all);
        }
        firstStandardPage = all.size();
        all.add(patchStatus());
        all.add(backup());
        all.add(diagnostics());
        all.add(general());
        // A page with no rows means none of its patches are in this install.
        List<Page> listed = new ArrayList<>();
        for (int i = 0; i < all.size(); i++) {
            if (i == firstStandardPage) firstStandardPage = listed.size();
            if (!all.get(i).rows.isEmpty()) listed.add(all.get(i));
        }
        return listed;
    }

    /** Index in {@link #pages} where the standard pages start; a gap is drawn above it on the home list. */
    private int firstStandardPage;

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
                ? f("Photos: %1$s\nVideos: %2$s", Downloads.location(false), Downloads.location(true))
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

    // The standard pages, identical in every app.

    private Page patchStatus() {
        Page page = new Page("Patch status", IconDrawable.CHECKLIST);
        if (linkedIn) {
            for (Object[] patch : patches()) {
                boolean applied = (Boolean) patch[1];
                page.info((String) patch[0], () -> applied ? "Applied" : "Not applied");
            }
        } else {
            for (String[] patch : MenuInfo.patches(this)) {
                boolean applied = "true".equals(patch[1]);
                page.info(patch[0], () -> applied ? "Applied" : "Not applied");
            }
        }
        return page;
    }

    private Page backup() {
        Page page = new Page("Backup & restore", IconDrawable.CLOUD);
        page.act("Export to file", "Save every " + BRAND + " setting as a file you choose, e.g. in Downloads " +
                "or Google Drive. It survives uninstalling the app.", this::exportToFile);
        page.act("Import from file", "Restore settings from a backup file.", this::importFromFile);
        page.act("Reset to defaults", "Reset all " + BRAND + " settings.", this::resetSettings);
        return page;
    }

    private Page diagnostics() {
        Page page = new Page("Diagnostics", IconDrawable.BUG);
        String logging = "Records extra detail for the diagnostic report. Switch it on, reproduce the issue, " +
                "then copy or share the report.";
        if (linkedIn) {
            page.sw(Settings.DEBUG_LOGGING, false, "Diagnostic logging", logging);
            page.rows.get(page.rows.size() - 1).restart = false;
        } else {
            page.toggle("Diagnostic logging", logging, new Toggle() {
                public boolean get() {
                    return LokiPrefs.debug(SettingsActivity.this);
                }

                public void set(boolean on) {
                    LokiPrefs.setDebug(SettingsActivity.this, on);
                }
            });
        }
        page.act("Copy report", "Puts the report on the clipboard, to paste into a GitHub issue or a chat. " +
                "Links and IDs are stripped.", this::copyDiagnosticReport);
        page.act("Share report", "Sends the report to WhatsApp, Gmail, Telegram or any other app.",
                this::shareDiagnosticReport);
        page.act("Clear log", "Deletes the saved log.", this::clearDiagnosticLog);
        return page;
    }

    private Page general() {
        Page page = new Page("General", IconDrawable.GEAR);
        if (launcherAlias() != null) {
            page.toggle("Show in the app drawer", "Adds a " + BRAND + " icon to your app list. Off by default; " +
                    "the menu is always inside the app and on a long press of its icon.", new Toggle() {
                public boolean get() {
                    return drawerIconOn();
                }

                public void set(boolean on) {
                    setDrawerIcon(on);
                }
            });
        }
        if (linkedIn) {
            page.shown("Language", () -> languageNames()[languageIndex()], this::chooseLanguage, YES);
        }
        return page;
    }

    // endregion

    // Palette, fixed once per screen.

    private boolean dark;
    private int background, surface, divider, ink, inkMuted, accent;

    private List<Page> pages;
    /** True inside LinkedIn; every other app gets the same screen with its own pages. */
    boolean linkedIn;
    /** Page on screen, or {@code null} for the page list. */
    private Page openPage;
    /** "About" or "Credits" while that page fills the screen, otherwise null. */
    private String cardPage;
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
        linkedIn = getPackageName().startsWith("com.linkedin.android");
        // The top bar below carries the title; the window's own title bar would only repeat it.
        requestWindowFeature(Window.FEATURE_NO_TITLE);
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
        } else if ("Credits".equals(cardPage)) {
            cardPage = "About";
            render();
        } else if (cardPage != null) {
            cardPage = null;
            render();
        } else if (openPage != null) {
            openPage = null;
            render();
        } else {
            super.onBackPressed();
        }
    }

    /**
     * Apps targeting Android 16 never get onBackPressed(): the back gesture goes to the OnBackInvokedDispatcher
     * and, with nothing registered, closes the screen. While a page, About or search is open a callback is
     * registered that steps back one level; on the page list it is removed so back leaves as usual.
     */
    private Object backCallback;

    private void updateBackCallback() {
        if (Build.VERSION.SDK_INT < 33) return;
        boolean nested = searching || openPage != null || cardPage != null;
        android.window.OnBackInvokedDispatcher dispatcher = getOnBackInvokedDispatcher();
        if (nested && backCallback == null) {
            android.window.OnBackInvokedCallback callback = this::onBackPressed;
            dispatcher.registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            backCallback = callback;
        } else if (!nested && backCallback != null) {
            dispatcher.unregisterOnBackInvokedCallback((android.window.OnBackInvokedCallback) backCallback);
            backCallback = null;
        }
    }

    // region Drawing

    private void render() {
        updateBackCallback();
        titleView.setVisibility(searching ? View.GONE : View.VISIBLE);
        searchField.setVisibility(searching ? View.VISIBLE : View.GONE);
        if (!searching) {
            titleView.setText(cardPage != null ? tr(cardPage)
                    : openPage == null ? BRAND : tr(openPage.title));
        }
        // Search covers the settings rows; About and Credits have none, so the button goes.
        searchButton.setVisibility(cardPage != null ? View.GONE : View.VISIBLE);
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
        } else if ("About".equals(cardPage)) {
            drawAbout();
        } else if ("Credits".equals(cardPage)) {
            drawCredits();
        } else if (openPage == null) {
            drawPageList();
        } else {
            drawRows(openPage.rows, null);
        }
    }

    private void drawPageList() {
        content.addView(homeHeader());
        for (int i = 0; i < pages.size(); i++) {
            Page page = pages.get(i);
            if (i == firstStandardPage && i > 0) content.addView(sectionGap());
            content.addView(navRow(page.icon, page.title, v -> {
                openPage = page;
                render();
            }));
        }
        content.addView(navRow(IconDrawable.INFO, "About", v -> showAbout()));
    }

    /** Brand card at the top of the page list: app icon, name, author, version and the update state. */
    private View homeHeader() {
        LinearLayout card = column();
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(20), dp(18), dp(20), dp(18));
        card.setBackground(bordered());

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(getApplicationInfo().loadIcon(getPackageManager()));
        card.addView(icon, square(64));
        card.addView(placed(label(BRAND, 24, ink, true), Gravity.CENTER, 10, 0));
        card.addView(placed(label(f("Made by %1$s", AUTHOR), 15, accent, false), Gravity.CENTER, 2, 0));
        card.addView(placed(label(BRAND + " " + version() + "  •  " + appName() + " " + appVersion(), 13,
                inkMuted, false), Gravity.CENTER, 4, 0));
        TextView state = placed(label("Checking for updates…", 14, accent, true), Gravity.CENTER, 10, 0);
        card.addView(state);
        UpdateChecker.check((status, latest) -> {
            switch (status) {
                case UPDATE_AVAILABLE:
                    state.setText(f("Update available: %1$s", latest));
                    break;
                case UP_TO_DATE:
                    state.setText(tr("Up to date"));
                    break;
                case NO_RELEASE:
                    state.setText(tr("No stable release yet"));
                    break;
                default:
                    state.setText(tr("Can't check for updates"));
                    break;
            }
        });
        card.setOnClickListener(v -> showAbout());
        card.setForeground(ripple(false));

        LinearLayout.LayoutParams params = wide();
        params.setMargins(dp(16), dp(8), dp(16), dp(12));
        card.setLayoutParams(params);
        return card;
    }

    /** Space between the app's own pages and the standard ones. */
    private View sectionGap() {
        View line = hairline();
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) line.getLayoutParams();
        params.setMargins(dp(24), dp(8), dp(24), dp(8));
        return line;
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
                String haystack = (tr(row.title) + " "
                        + (row.note == null ? "" : tr(row.note)) + " "
                        + tr(page.title)).toLowerCase(Locale.ROOT);
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
        searchField.setHint(tr("Search settings"));
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
        toggle.setChecked(row.toggle != null ? row.toggle.get() : Settings.get(row.pref, row.fallback));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{accent, dark ? 0xFFB0B0B0 : 0xFFFFFFFF}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{
                (accent & 0x00FFFFFF) | 0x80000000, dark ? 0xFF474747 : 0xFFBDBDBD}));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            if (row.toggle != null) {
                row.toggle.set(checked);
            } else {
                Settings.set(row.pref, checked);
            }
            if (row.restart) showRestartBanner();
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
            TextView page = label(tr(pageName).toUpperCase(Locale.ROOT), 11, accent, true);
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
        cardPage = "About";
        render();
    }

    private void drawAbout() {
        LinearLayout card = cardShell(28, 24, true);

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(getApplicationInfo().loadIcon(getPackageManager()));
        card.addView(icon, square(88));

        card.addView(placed(label(BRAND, 26, ink, true), Gravity.CENTER, 16, 4));
        card.addView(placed(label("Loki Patches  •  built for Morphe", 14, inkMuted, false),
                Gravity.CENTER, 0, 20));

        // Update box: shows this build until the GitHub check answers, then the answer.
        LinearLayout update = column();
        update.setGravity(Gravity.CENTER_HORIZONTAL);
        update.setPadding(dp(20), dp(16), dp(20), dp(16));
        update.setBackground(bordered());
        TextView updateTitle = placed(label("Checking for updates…", 17, accent, true), Gravity.CENTER, 0, 0);
        update.addView(updateTitle);
        TextView updateBody = placed(label(f("Installed: %1$s %2$s", BRAND,
                version()), 15, inkMuted, false), Gravity.CENTER, 6, 0);
        update.addView(updateBody);
        card.addView(update, wide());
        String thisBuild = BRAND + " " + version() + "  •  " + appName() + " " + appVersion()
                + "\n" + f("Made by %1$s", AUTHOR);
        UpdateChecker.check((status, latest) -> {
            switch (status) {
                case UPDATE_AVAILABLE:
                    updateTitle.setText(tr("Update available"));
                    updateBody.setText(f("Installed version: %1$s.\n\nNewer version: %2$s\n\nPatch %3$s again in Morphe " +
                                              "Manager to update.",
                            version(), latest, appName()));
                    break;
                case UP_TO_DATE:
                    updateTitle.setText(tr("Up to date"));
                    updateBody.setText(thisBuild);
                    break;
                case NO_RELEASE:
                    updateTitle.setText(tr("No stable release yet"));
                    updateBody.setText(thisBuild + "\n\n"
                            + tr("GitHub has no stable release to compare against yet."));
                    break;
                default:
                    updateTitle.setText(tr("Can't connect"));
                    updateBody.setText(thisBuild + "\n\n"
                            + tr("Couldn't reach GitHub. Check your connection and reopen this page."));
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
        link(links, IconDrawable.PEOPLE, "Credits", () -> {
            cardPage = "Credits";
            render();
        });
        card.addView(links, wide());

        card.addView(placed(label(f("%1$s is not made by %2$s and is not part of the Morphe project.",
                BRAND, appName()), 12, inkMuted, false), Gravity.CENTER, 16, 0));

        showCard(card);
    }

    private void drawCredits() {
        LinearLayout card = titledCard(null, f("Who made %1$s possible.", BRAND));
        card.addView(credit(IconDrawable.PEOPLE, AUTHOR, f("Creator of %1$s", BRAND),
                "github.com/lokesh-sparrow", "https://github.com/lokesh-sparrow"));
        card.addView(credit(IconDrawable.CODE, "Morphe", "The patcher engine, Morphe Manager and the patch template",
                "morphe.software", MORPHE_WEBSITE));
        card.addView(credit(IconDrawable.INFO, appName(),
                f("The app being patched. %1$s has no connection to %2$s.", BRAND, appName()), null, null));
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

    /** Page with an optional centred title and a subtitle under it; the frame the About pages share. */
    private LinearLayout titledCard(String title, String subtitle) {
        LinearLayout card = cardShell(24, 24, false);
        if (title != null) card.addView(placed(label(title, 24, ink, true), Gravity.CENTER, 0, 0), wide());
        card.addView(placed(label(subtitle, 14, inkMuted, false), Gravity.CENTER, 4, 16), wide());
        return card;
    }

    /**
     * Puts an About page into the screen itself, edge to edge like every settings page. It used to open as a
     * dialog, which Android sizes to a fraction of the screen width.
     */
    private void showCard(LinearLayout card) {
        card.setBackground(null);
        content.addView(card, wide());
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
            toast("Can't open the link");
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

    private String diagnosticReport() {
        return linkedIn ? Diagnostics.report(this) : LokiLog.report(this);
    }

    private void copyDiagnosticReport() {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(BRAND, diagnosticReport()));
            toast("Report copied — paste it into your bug report.");
        } catch (Exception e) {
            toast("Couldn't copy the report");
        }
    }

    private void shareDiagnosticReport() {
        try {
            Intent send = new Intent(Intent.ACTION_SEND);
            send.setType("text/plain");
            send.putExtra(Intent.EXTRA_SUBJECT, BRAND + " diagnostic report");
            send.putExtra(Intent.EXTRA_TEXT, diagnosticReport());
            startActivity(Intent.createChooser(send, tr("Share report")));
        } catch (Exception e) {
            toast("Couldn't share the report");
        }
    }

    private void clearDiagnosticLog() {
        if (linkedIn) {
            Diagnostics.clear();
        } else {
            LokiLog.clear(this);
        }
        toast("Diagnostic log cleared");
    }

    private static final int REQUEST_EXPORT = 0x4C01;
    private static final int REQUEST_IMPORT = 0x4C02;
    /** Marks a backup file as ours; anything else is refused on import. */
    private static final String BACKUP_FORMAT = "loki-patches-settings";

    /** Opens Android's "Save to" picker with a dated file name; the file is written in onActivityResult. */
    private void exportToFile() {
        String app = appName().toLowerCase(Locale.ROOT).replaceAll("[^a-z0-9]+", "-");
        String day = new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT).format(new Date());
        Intent save = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        save.addCategory(Intent.CATEGORY_OPENABLE);
        save.setType("application/json");
        save.putExtra(Intent.EXTRA_TITLE, "loki-" + app + "-settings-" + day + ".json");
        try {
            startActivityForResult(save, REQUEST_EXPORT);
        } catch (Exception e) {
            toast("No app can save files on this phone");
        }
    }

    private void importFromFile() {
        Intent open = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        open.addCategory(Intent.CATEGORY_OPENABLE);
        open.setType("*/*");
        open.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/json", "text/plain", "application/octet-stream"});
        try {
            startActivityForResult(open, REQUEST_IMPORT);
        } catch (Exception e) {
            toast("No app can open files on this phone");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri file = data.getData();
        if (requestCode == REQUEST_EXPORT) {
            writeBackup(file);
        } else if (requestCode == REQUEST_IMPORT) {
            readBackup(file);
        }
    }

    /** The backup: which app and versions it came from, when, and the settings themselves. */
    private JSONObject backupJson() throws Exception {
        JSONObject out = new JSONObject();
        out.put("format", BACKUP_FORMAT);
        out.put("formatVersion", 1);
        out.put("app", getPackageName());
        out.put("appName", appName());
        out.put("appVersion", appVersion());
        out.put("patches", version());
        out.put("created", new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.ROOT).format(new Date()));
        out.put("settings", linkedIn ? new JSONObject(Settings.exportJson()) : LokiPrefs.toJson(this));
        if (launcherAlias() != null) out.put("drawerIcon", drawerIconOn());
        return out;
    }

    private void writeBackup(Uri file) {
        try (OutputStream stream = getContentResolver().openOutputStream(file, "wt")) {
            if (stream == null) throw new IllegalStateException("no stream");
            stream.write(backupJson().toString(2).getBytes(StandardCharsets.UTF_8));
            toast("Settings saved");
        } catch (Exception e) {
            toast(f("Export failed: %1$s", String.valueOf(e.getMessage())));
        }
    }

    private void readBackup(Uri file) {
        String text;
        try (InputStream stream = getContentResolver().openInputStream(file)) {
            if (stream == null) throw new IllegalStateException("no stream");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            for (int read; (read = stream.read(chunk)) > 0; ) bytes.write(chunk, 0, read);
            text = bytes.toString("UTF-8");
        } catch (Exception e) {
            toast("Couldn't read the file");
            return;
        }
        final JSONObject backup;
        final JSONObject settings;
        try {
            JSONObject parsed = new JSONObject(text.trim());
            if (BACKUP_FORMAT.equals(parsed.optString("format"))) {
                backup = parsed;
                settings = parsed.getJSONObject("settings");
            } else if (linkedIn) {
                // A backup from before the file format: LinkedIn's settings as a bare JSON object.
                backup = null;
                settings = parsed;
            } else {
                toast("This is not a " + BRAND + " backup");
                return;
            }
        } catch (Exception e) {
            toast("This is not a " + BRAND + " backup");
            return;
        }
        if (backup != null && !sameApp(backup.optString("app"))) {
            toast(f("This backup is for %1$s, not %2$s", backup.optString("appName", backup.optString("app")),
                    appName()));
            return;
        }
        String from = backup == null ? tr("an older backup")
                : f("%1$s %2$s, saved %3$s", backup.optString("appName"), backup.optString("appVersion"),
                        backup.optString("created").replace('T', ' ').replaceAll("[+-]\\d{4}$", ""));
        tinted(ask("Import settings?")
                .setMessage(f("Restore %1$s settings from %2$s? Your current settings are replaced.",
                        String.valueOf(settings.length()), from))
                .setPositiveButton(tr("Import"), (dialog, which) -> {
                    try {
                        int count = linkedIn ? Settings.importJson(settings.toString())
                                : LokiPrefs.fromJson(this, settings);
                        if (backup != null && backup.has("drawerIcon") && launcherAlias() != null) {
                            setDrawerIcon(backup.getBoolean("drawerIcon"));
                        }
                        toast(f("%1$s settings imported", count));
                        refresh();
                        if (linkedIn) showRestartBanner();
                    } catch (Exception e) {
                        toast("Import failed");
                    }
                })
                .show());
    }

    /** A clone (Change package name) and the original share settings: compare without the suffix. */
    private boolean sameApp(String backupPackage) {
        String here = getPackageName();
        return !backupPackage.isEmpty() && (here.startsWith(backupPackage) || backupPackage.startsWith(here));
    }

    private void editMutedWords() {
        EditText input = multiline("One word or phrase per line, for example:\nthrilled to announce\nhiring");
        input.setText(Settings.mutedWords());
        tinted(ask("Muted words")
                .setMessage(tr("Posts containing any of these, as whole words, are hidden from your feed. "
                        + "Upper and lower case don't matter."))
                .setView(fieldBox(input))
                .setPositiveButton(tr("Save"), (dialog, which) -> {
                    Settings.setMutedWords(input.getText().toString().trim());
                    refresh();
                })
                .show());
    }

    private void resetSettings() {
        tinted(ask("Reset to defaults?")
                .setMessage(linkedIn
                        ? f("This resets every %1$s setting, including where downloads are saved.", BRAND)
                        : f("This resets every %1$s setting.", BRAND))
                .setPositiveButton(tr("Reset"), (dialog, which) -> {
                    if (linkedIn) {
                        Settings.resetAll();
                    } else {
                        LokiPrefs.reset(this);
                    }
                    toast("Settings reset to defaults");
                    refresh();
                    if (linkedIn) showRestartBanner();
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
                .setPositiveButton(tr("Save"), (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.sanitizeFolder(input.getText().toString()));
                    refresh();
                })
                .setNeutralButton(tr("Default"), (dialog, which) -> {
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

        TextView message = label(f("Restart %1$s for the changes to take effect.", appName()), 14, 0xFFFFFFFF, false);
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
        // Apps targeting Android 15+ are drawn edge to edge: keep the screen clear of the status and nav bars.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top, bottom, left, right;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(android.view.WindowInsets.Type.systemBars()
                        | android.view.WindowInsets.Type.ime());
                top = bars.top;
                bottom = bars.bottom;
                left = bars.left;
                right = bars.right;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
                left = insets.getSystemWindowInsetLeft();
                right = insets.getSystemWindowInsetRight();
            }
            view.setPadding(left, top, right, bottom);
            return insets;
        });
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
                .setTitle(tr(title))
                .setNegativeButton(tr("Cancel"), null);
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

    /** Dialog or About page: the column the page content sits in. */
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
        button.setContentDescription(tr(description));
        button.setPadding(dp(13), dp(13), dp(13), dp(13));
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(50), dp(50)));
        return button;
    }

    private TextView label(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(tr(value));
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return view;
    }

    private EditText multiline(String hint) {
        EditText input = new EditText(this);
        input.setHint(tr(hint));
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

    /** LinkedIn's screen is translated; the other apps are English only. */
    private String tr(String text) {
        return linkedIn ? I18n.tr(text) : text;
    }

    private String f(String template, Object... values) {
        return String.format(tr(template), values);
    }

    private void toast(String text) {
        android.widget.Toast.makeText(this, tr(text), android.widget.Toast.LENGTH_SHORT).show();
    }

    String appName() {
        if (linkedIn) return "LinkedIn";
        return LokiLog.appLabel(this);
    }

    /** Version of the bundle that patched this app, stamped at patch time. */
    private String version() {
        return linkedIn ? Settings.patchesVersion() : MenuInfo.patchesVersion();
    }

    /** The disabled launcher entry the patches declare, or {@code null} when this install has none. */
    private ComponentName launcherAlias() {
        ComponentName alias = new ComponentName(this, linkedIn
                ? "app.linkedin.extension.SettingsLauncher" : "app.loki.extension.MenuLauncher");
        try {
            getPackageManager().getActivityInfo(alias, PackageManager.MATCH_DISABLED_COMPONENTS);
            return alias;
        } catch (Exception e) {
            return null;
        }
    }

    private boolean drawerIconOn() {
        ComponentName alias = launcherAlias();
        return alias != null && getPackageManager().getComponentEnabledSetting(alias)
                == PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
    }

    private void setDrawerIcon(boolean on) {
        ComponentName alias = launcherAlias();
        if (alias == null) return;
        getPackageManager().setComponentEnabledSetting(alias, on
                        ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
    }

    // endregion
}
