/*
 * Portions based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
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
import android.widget.CheckBox;
import android.widget.CompoundButton;
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

import app.fakh.extension.shared.RowDrag;
import app.fakh.extension.shared.TabSheet;

/**
 * Fakh Patches settings screen, laid out like LinkedIn's own settings pages (Account preferences and the like):
 * a list of categories, each opening a page of its own with titled groups, plus search across all settings.
 * Declared in the manifest by the settings patch; built in code so it needs no resources.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {
    static final String BRAND = "Fakh Patches";
    static final int ACCENT_DARK = 0xFF2DBCB1;
    static final int ACCENT_LIGHT = 0xFF00897B;

    // region Settings model

    private static final class Item {
        final String key;
        final boolean def;
        final String title;
        final String summary;
        final Runnable onChange;
        /** Non-null for rows that open a picker instead of a switch. */
        final ValueRow value;
        /** A checkbox instead of a switch, for one choice of a list. */
        final boolean checkbox;
        /** For a row that opens a bottom sheet: the choices in the sheet. */
        final List<Item> choices;

        Item(String key, boolean def, String title, String summary, Runnable onChange, ValueRow value,
                boolean checkbox, List<Item> choices) {
            this.key = key;
            this.def = def;
            this.title = title;
            this.summary = summary;
            this.onChange = onChange;
            this.value = value;
            this.checkbox = checkbox;
            this.choices = choices;
        }

        /** Whether the row only titles the rows below it. */
        boolean isHeader() {
            return key == null && value == null && !checkbox;
        }
    }

    private interface ValueRow {
        String currentValue();

        /** Null for a read only row. */
        Runnable onClick();

        boolean enabled();
    }

    private static final class Category {
        final String title;
        final List<Item> items = new ArrayList<>();
        Category(String title) {
            this.title = title;
        }

        /** Titles the rows added after it; dropped when none follow. */
        Category header(String title) {
            items.add(new Item(null, false, title, null, null, null, false, null));
            return this;
        }

        Category toggle(String key, boolean def, String title, String summary) {
            return toggle(key, def, title, summary, null);
        }

        Category toggle(String key, boolean def, String title, String summary, Runnable onChange) {
            items.add(new Item(key, def, title, summary, onChange, null, false, null));
            return this;
        }

        Category check(String key, boolean def, String title) {
            items.add(new Item(key, def, title, null, null, null, true, null));
            return this;
        }

        Category value(String title, ValueRow value) {
            items.add(new Item(null, false, title, null, null, value, false, null));
            return this;
        }

        /** A row that opens a bottom sheet with one check row per choice, and says how many are on. */
        Category sheet(String title, List<Item> choices, Runnable open) {
            items.add(new Item(null, false, title, null, null, new ValueRow() {
                public String currentValue() {
                    int shown = 0;
                    for (Item choice : choices) {
                        if (choice.key == null || Settings.get(choice.key, choice.def)) shown++;
                    }
                    return I18n.f("%1$s of %2$s shown", shown, choices.size());
                }

                public Runnable onClick() {
                    return open;
                }

                public boolean enabled() {
                    return true;
                }
            }, false, choices));
            return this;
        }

        /** A row that runs an action when tapped, with a fixed description. */
        Category action(String title, String summary, Runnable onClick) {
            return value(title, new ValueRow() {
                public String currentValue() {
                    return summary;
                }

                public Runnable onClick() {
                    return onClick;
                }

                public boolean enabled() {
                    return true;
                }
            });
        }
    }

    /** A check row of a bottom sheet that is always on and cannot be changed. */
    private static Item fixed(String title) {
        return new Item(null, true, title, null, null, null, true, null);
    }

    /** One check row of a bottom sheet. */
    private static Item choice(String key, boolean def, String title) {
        return new Item(key, def, title, null, null, null, true, null);
    }

    private List<Category> buildCategories() {
        List<Category> categories = new ArrayList<>();

        if (Settings.isHideAdsIncluded() || Settings.isHidePromotedJobsIncluded()
                || Settings.isHideSuggestedIncluded() || Settings.isHidePremiumIncluded()) {
            Category ads = new Category("Ads & promotions");
            if (Settings.isHideAdsIncluded()) {
                ads.toggle(Settings.HIDE_ADS, true, "Hide ads", null);
            }
            if (Settings.isHidePromotedJobsIncluded()) {
                ads.toggle(Settings.HIDE_PROMOTED_JOBS, true, "Hide promoted jobs", null);
            }
            if (Settings.isHideSuggestedIncluded()) {
                ads.toggle(Settings.HIDE_SUGGESTED, true, "Hide suggested posts",
                        "Posts from people outside your network.");
            }
            if (Settings.isHidePremiumIncluded()) {
                ads.toggle(Settings.HIDE_PREMIUM, true, "Hide Premium upsells",
                        "Premium and AI cards across the app.");
            }
            categories.add(ads);
        }

        Category feed = new Category("Feed");
        if (Settings.isFeedFiltersIncluded()) {
            feed.header("Muted")
                    .value("Muted words", mutedRow(Settings.MUTED_WORDS, "Muted words",
                            "Hide posts with these words.",
                            "One word or phrase per line, in any letter case. A post is hidden when its text, or "
                                    + "the text of the post it reposts, matches."))
                    .value("Muted authors", mutedRow(Settings.MUTED_AUTHORS, "Muted authors",
                            "Hide posts from these people and pages.",
                            "One name per line, in any letter case. A post is hidden when its author, or the "
                                    + "author of the post it reposts, matches."))
                    .header("Hide posts")
                    .toggle(Settings.HIDE_CELEBRATIONS, false, "Hide celebration posts",
                            "Work anniversaries and new jobs.")
                    .toggle(Settings.HIDE_FEED_JOBS, false, "Hide job posts", null)
                    .toggle(Settings.HIDE_REPOSTS, false, "Hide network activity",
                            "Likes, comments and reposts of people you know.")
                    .toggle(Settings.HIDE_VIDEO_POSTS, false, "Hide video posts", null)
                    .header("Hide extras")
                    .toggle(Settings.HIDE_RECOMMENDATIONS, false, "Hide \"Recommended for you\"",
                            "Lists of people and pages to follow.")
                    .toggle(Settings.HIDE_GAMES, false, "Hide puzzle games", null)
                    .toggle(Settings.HIDE_NEW_POSTS_PILL, false, "Hide the \"New posts\" button", null);
        }
        feed.header("Position");
        if (Settings.isKeepFeedIncluded()) {
            feed.toggle(Settings.KEEP_FEED, true, "Keep feed position on reopen", null);
        }
        categories.add(feed);

        Category posts = new Category("Posts");
        posts.header("Text");
        if (Settings.isExpandPostsIncluded()) {
            posts.toggle(Settings.EXPAND_POSTS, false, "Expand posts by default", "Tap the text to collapse.");
        }
        if (Settings.isCopyTextIncluded()) {
            posts.toggle(Settings.COPY_TEXT, true, "Copy text", "Adds Copy text to the ⋯ menu of posts and comments.");
        }
        if (Settings.isFeedFiltersIncluded()) {
            posts.toggle(Settings.HIDE_TRANSLATION, false, "Hide \"Show translation\"", null)
                    .header("Details")
                    .toggle(Settings.FOCUS_MODE, false, "Hide engagement counts", "Hide like, comment, and repost counts.")
                    .toggle(Settings.HIDE_POST_FOLLOW, false, "Hide Follow and Connect", null)
                    .toggle(Settings.HIDE_DEGREE, false, "Hide connection degree",
                            "The 1st, 2nd and 3rd next to names.")
                    .toggle(Settings.EXACT_POST_TIME, false, "Show exact post time",
                            "Instead of 3d or 5h.");
        }
        posts.header("Actions");
        if (Settings.isDisableDoubleTapLikeIncluded()) {
            posts.toggle(Settings.DISABLE_DOUBLE_TAP_LIKE, true, "Turn off double-tap to like", null);
        }
        if (Settings.isScreenshotShareIncluded()) {
            posts.toggle(Settings.NO_SCREENSHOT_SHARE, true, "Turn off screenshot share sheet", null);
        }
        if (Settings.isFeedFiltersIncluded()) {
            posts.header("Comments")
                    .toggle(Settings.NEWEST_COMMENTS, false, "Most recent comments first", null);
        }
        categories.add(posts);

        Category video = new Category("Video & viewers");
        if (Settings.isViewerTapToHideIncluded()) {
            video.toggle(Settings.VIEWER_TAP_TO_HIDE, true, "Tap to hide controls in viewers", null);
        }
        if (Settings.isVideoTabIncluded()) {
            video.toggle(Settings.VIDEO_TAB_TIME, true, "Show video time", null)
                    .header("Video tab")
                    .toggle(Settings.VIDEO_TAB_AUTO_SCROLL, false, "Auto-scroll videos", null);
        }
        categories.add(video);

        Category navigation = new Category("Navigation bar");
        navigation.header("Style");
        if (Settings.isSwipeTabsIncluded()) {
            navigation.toggle(Settings.SWIPE_TABS, true, "Swipe between tabs", null);
        }
        if (Settings.isNavigationBarIncluded() || Settings.isGlassNavigationBarIncluded()
                || Settings.isAlwaysShowNavigationBarIncluded() || Settings.isMaterialTabIconsIncluded()) {
            List<String[]> tabSpecs = orderedTabs();
            List<Item> tabs = new ArrayList<>();
            for (String[] tab : tabSpecs) tabs.add(tab[1] == null ? fixed(tab[2]) : choice(tab[1], tabDefault(tab[0]), tab[2]));
            if (Settings.isGlassNavigationBarIncluded()) {
                navigation.toggle(Settings.GLASS_NAVIGATION_BAR, true, "Liquid Glass navigation bar",
                        "A floating, translucent navigation bar.");
                navigation.toggle(Settings.LIQUID_GLASS, false, "Background blur",
                        "Blurs what's behind the glass. Uses more battery and might stutter.");
            }
            if (Settings.isMaterialTabIconsIncluded()) {
                navigation.toggle(Settings.MATERIAL_TAB_ICONS, false, "Material icons", null);
            }
            if (Settings.isAlwaysShowNavigationBarIncluded()) {
                navigation.toggle(Settings.ALWAYS_SHOW_NAVIGATION_BAR, false, "Always show navigation bar", null);
            }
            if (Settings.isNavigationBarIncluded()) {
                navigation.toggle(Settings.HIDE_TAB_LABELS, false, "Hide tab labels", null)
                        .toggle(Settings.HIDE_TAB_BADGES, false, "Hide notification badges", null)
                        .header("Buttons")
                        .sheet("Navigation bar tabs", tabs, () -> showTabsSheet(tabSpecs, tabs));
            }
        }
        // Titled here too for when the tabs sheet is left out.
        if (!Settings.isNavigationBarIncluded()) navigation.header("Buttons");
        if (Settings.isTopBarButtonsIncluded()) {
            List<Item> topBar = new ArrayList<>();
            topBar.add(choice(Settings.SHOW_TOP_BAR_POST, true, "Post"));
            topBar.add(choice(Settings.SHOW_TOP_BAR_MESSAGING, true, "Messaging"));
            topBar.add(choice(Settings.FEED_SORT_BUTTON, Settings.get(Settings.FEED_SORT_STOCK, false), "Feed sort"));
            navigation.sheet("Top bar buttons", topBar,
                    () -> showSheet("Top bar buttons", "Choose which buttons the top bar shows.", topBar, Arrays.asList(
                            stockIcon("POST", IconDrawable.POST_TAB_OUTLINE),
                            stockIcon("MESSAGING", IconDrawable.CHAT_TAB_OUTLINE),
                            feedSortIcon())));
        }
        if (Settings.isMoreMenuIncluded()) {
            List<Item> moreItems = new ArrayList<>();
            for (MoreMenu.Item item : MoreMenu.items()) moreItems.add(choice(item.key(), true, item.label));
            navigation.sheet("Items in the More tab", moreItems, () -> {
                List<Drawable> icons = new ArrayList<>();
                for (MoreMenu.Item item : MoreMenu.items()) icons.add(moreIcon(item.id));
                showSheet("Items in the More tab", "Choose which items the More tab lists.", moreItems, icons);
            });
            navigation.toggle(Settings.MOVE_MORE_ITEMS, Settings.moveMoreItems(),
                    "Show More tab items in profile menu", null);
            navigation.toggle(Settings.GAMES_SHORTCUT, true, "Puzzle games shortcut", null,
                    () -> GamesShortcut.update(this));
        }
        categories.add(navigation);

        if (Settings.isRemoveGapsAndDividersIncluded() || Settings.isMaterialYouIncluded()
                || Settings.isAmoledBlackIncluded() || Settings.isDarkAppIconIncluded()) {
            Category appearance = new Category("Appearance");
            if (Settings.isRemoveGapsAndDividersIncluded()) {
                appearance.toggle(Settings.REMOVE_GAPS_AND_DIVIDERS, true, "Hide gaps and dividers", null);
            }
            if (Settings.isMaterialYouIncluded()) {
                appearance.toggle(Settings.MATERIAL_YOU, true, "Material You", null);
            }
            if (Settings.isAmoledBlackIncluded()) {
                appearance.toggle(Settings.PITCH_BLACK, false, "Pitch black", null);
            }
            if (Settings.isDarkAppIconIncluded()) {
                appearance.toggle(Settings.DARK_APP_ICON, false, "Dark app icon", null, this::applyAppIcon);
            }
            categories.add(appearance);
        }

        if (Settings.isDownloadMediaIncluded()) {
            categories.add(new Category("Download")
                    .toggle(Settings.DOWNLOAD_MEDIA, true, "Download media",
                            "On profile photos and banners, and in the ⋯ menu of posts.")
                    .header("Location")
                    .value("Download location", new ValueRow() {
                        public String currentValue() {
                            return Settings.downloadSplitByType()
                                    ? I18n.f("Photos: %1$s\nVideos: %2$s", Downloads.location(false),
                                            Downloads.location(true))
                                    : Downloads.location(false);
                        }

                        public Runnable onClick() {
                            return null;
                        }

                        public boolean enabled() {
                            return true;
                        }
                    })
                    .value("Main folder", new ValueRow() {
                        public String currentValue() {
                            return Settings.downloadSplitByType()
                                    ? "Automatic (photos and videos are split)" : Settings.downloadBaseDir();
                        }

                        public Runnable onClick() {
                            return SettingsActivity.this::chooseBaseDir;
                        }

                        public boolean enabled() {
                            return !Settings.downloadSplitByType();
                        }
                    })
                    .value("Subfolder name", new ValueRow() {
                        public String currentValue() {
                            String folder = Settings.downloadFolder();
                            return folder.isEmpty() ? "None (saved in the main folder)" : folder;
                        }

                        public Runnable onClick() {
                            return SettingsActivity.this::editFolder;
                        }

                        public boolean enabled() {
                            return true;
                        }
                    })
                    .toggle(Settings.DOWNLOAD_SPLIT_BY_TYPE, false, "Split photos & videos",
                            "Photos go to Pictures, videos to Movies.", this::refresh));
        }

        Category chat = new Category("Chat & privacy");
        chat.header("Messaging");
        if (Settings.isMessagingIncluded()) {
            chat.toggle(Settings.HIDE_SPONSORED_MESSAGES, true, "Hide sponsored messages", null)
                    .toggle(Settings.GHOST_MODE, false, "Ghost mode",
                            "Don't send typing or seen status. Mark chats as read from the chat list.")
                    .toggle(Settings.MARK_READ_AFTER_REPLY, true, "Mark as read when you reply",
                            "With ghost mode on, a chat you reply to is marked as read.");
        }
        chat.header("Links");
        if (Settings.isOpenLinksDirectlyIncluded()) {
            chat.toggle(Settings.OPEN_LINKS_DIRECTLY, true, "Open links directly",
                    "Skip LinkedIn's warning page in posts and chats.");
            chat.toggle(Settings.RESOLVE_SHORT_LINKS, true, "Expand lnkd.in links",
                    "Open the real address instead of the redirect.");
        }
        if (Settings.isSanitizeShareLinksIncluded()) {
            chat.toggle(Settings.SANITIZE_SHARE_LINKS, true, "Clean share links",
                    "Strip tracking from LinkedIn links you copy or share.");
        }
        chat.header("Privacy");
        if (Settings.isBlockTrackingIncluded()) {
            chat.toggle(Settings.BLOCK_TRACKING, true, "Disable analytics",
                    "Stop most analytics events. Turn off if something breaks.");
        }
        if (Settings.isAnonymousProfileViewingIncluded()) {
            chat.toggle(Settings.ANONYMOUS_PROFILE_VIEWING, true, "Anonymous profile viewing",
                    "Visit profiles without being listed in Who viewed your profile.");
        }
        categories.add(chat);

        categories.add(new Category("Backup & diagnostics")
                .header("Backup")
                .action("Export settings", null, this::exportSettings)
                .action("Import settings", null, this::importSettings)
                .action("Reset to defaults", null, this::resetSettings)
                .header("Diagnostics")
                .toggle(Settings.DEBUG_LOGGING, false, "Diagnostic logging", null)
                .action("Copy diagnostic report", null, this::copyDiagnosticReport)
                .action("Clear diagnostic log", null, this::clearDiagnosticLog));
        for (Category category : categories) {
            List<Item> items = category.items;
            // From the end, so a header left last by an earlier removal goes too.
            for (int i = items.size() - 1; i >= 0; i--) {
                if (items.get(i).isHeader() && (i == items.size() - 1 || items.get(i + 1).isHeader())) items.remove(i);
            }
        }
        // A category whose patches were all left out has nothing to show.
        categories.removeIf(category -> category.items.isEmpty());
        return categories;
    }

    // endregion

    private boolean dark;
    private int background;
    private int textPrimary;
    private int textSecondary;
    private int accent;

    private List<Category> categories;
    private boolean searching;
    /** Title of the category on screen, or null for the list of them; kept while the screen is rebuilt, such as on folding the phone. */
    private String page;
    private static final String PAGE = "page";
    /** Where the list of categories was scrolled to when a page was opened. */
    private int listScroll;
    private String query = "";

    private TextView titleView;
    private EditText searchField;
    private ImageButton searchButton;
    private LinearLayout content;
    private ScrollView scroll;
    private View restartBanner;
    private FrameLayout rootView;
    /** The bottom sheet on screen, or null. */
    private TabSheet sheet;

    /**
     * Colors the buttons of a dialog shown over LinkedIn's own screens, whose theme makes button text transparent.
     */
    static void tintButtons(AlertDialog dialog, Context context) {
        boolean dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int color = MaterialYou.settingsAccent(dark, dark ? ACCENT_DARK : ACCENT_LIGHT);
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            if (dialog.getButton(which) != null) dialog.getButton(which).setTextColor(color);
        }
    }

    static void open(Context context) {
        Intent intent = new Intent(context, SettingsActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActionBar actionBar = getActionBar();
        if (actionBar != null) actionBar.hide();

        dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        background = dark ? 0xFF1B1F23 : 0xFFFFFFFF;
        textPrimary = dark ? 0xFFFFFFFF : 0xFF141414;
        textSecondary = dark ? 0xFFA6A6A6 : 0xFF5F6368;
        accent = dark ? ACCENT_DARK : ACCENT_LIGHT;
        int[] materialYou = MaterialYou.settingsColors(dark);
        if (materialYou != null) {
            background = materialYou[0];
            accent = materialYou[3];
        }
        if (dark && Settings.pitchBlack()) {
            background = 0xFF0D0D0D;
        }

        Window window = getWindow();
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        if (!dark) {
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        }

        categories = buildCategories();
        if (savedInstanceState != null) page = savedInstanceState.getString(PAGE);

        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, 0, 0, dp(96));
        scroll = new ScrollView(this);
        scroll.addView(content);

        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(topBar());
        column.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(background);
        root.setFitsSystemWindows(true);
        root.addView(column);
        restartBanner = restartBanner();
        root.addView(restartBanner);
        rootView = root;
        setContentView(root);

        render();
    }

    @Override
    protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putString(PAGE, page);
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        if (sheet != null) {
            sheet.close();
        } else if (searching) {
            setSearching(false);
        } else if (page != null) {
            page = null;
            render();
            scroll.post(() -> scroll.scrollTo(0, listScroll));
        } else {
            super.onBackPressed();
        }
    }

    // region Screens

    private void render() {
        content.removeAllViews();
        if (searching) {
            titleView.setVisibility(View.GONE);
            searchField.setVisibility(View.VISIBLE);
            renderSearch();
        } else {
            titleView.setVisibility(View.VISIBLE);
            searchField.setVisibility(View.GONE);
            titleView.setText(I18n.tr(page == null ? BRAND : page));
            renderBrowsing();
        }
        scroll.scrollTo(0, 0);
    }

    /** Re-render in place, keeping the scroll position (after a value changes). */
    private void refresh() {
        int y = scroll.getScrollY();
        content.removeAllViews();
        if (searching) renderSearch();
        else renderBrowsing();
        scroll.post(() -> scroll.scrollTo(0, y));
    }

    /** The rows of the open category, or a row for each category. */
    private void renderBrowsing() {
        for (Category category : categories) {
            if (page == null) content.addView(categoryRow(category.title));
            else if (category.title.equals(page)) renderItems(category.items, null);
        }
    }

    private void renderItems(List<Item> items, List<String> categoryNames) {
        for (int i = 0; i < items.size(); i++) {
            Item item = items.get(i);
            String prefix = categoryNames == null ? null : categoryNames.get(i);
            if (item.isHeader()) content.addView(header(item.title));
            else content.addView(item.value == null ? toggleRow(item, prefix) : valueRow(item, prefix));
        }
    }

    private void renderSearch() {
        String q = query.trim().toLowerCase(Locale.ROOT);
        List<Item> found = new ArrayList<>();
        List<String> names = new ArrayList<>();
        for (Category category : categories) {
            for (Item item : category.items) {
                if (item.isHeader()) continue;
                StringBuilder choices = new StringBuilder();
                if (item.choices != null) {
                    for (Item choice : item.choices) choices.append(' ').append(I18n.tr(choice.title));
                }
                String haystack = (I18n.tr(item.title) + " " + (item.summary == null ? "" : I18n.tr(item.summary)) + " "
                        + I18n.tr(category.title) + choices).toLowerCase(Locale.ROOT);
                if (q.isEmpty() || haystack.contains(q)) {
                    found.add(item);
                    names.add(category.title);
                }
            }
        }
        if (found.isEmpty()) {
            TextView empty = text("No matching settings.", 15, textSecondary, false);
            empty.setGravity(Gravity.CENTER);
            empty.setPadding(dp(24), dp(48), dp(24), 0);
            content.addView(empty);
        } else {
            renderItems(found, names);
        }
    }

    // endregion

    // region Rows

    private View topBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(4), dp(6), dp(4), dp(6));

        ImageButton back = iconButton(IconDrawable.ARROW_BACK, "Back");
        back.setOnClickListener(v -> onBackPressed());
        bar.addView(back);

        titleView = text(BRAND, 22, textPrimary, true);
        titleView.setPadding(dp(12), 0, 0, 0);
        bar.addView(titleView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        searchField = new EditText(this);
        searchField.setHint(I18n.tr("Search settings"));
        searchField.setSingleLine(true);
        searchField.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        searchField.setTextColor(textPrimary);
        searchField.setHintTextColor(textSecondary);
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
                if (searching) {
                    content.removeAllViews();
                    renderSearch();
                }
            }
        });
        bar.addView(searchField, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        ImageButton restart = iconButton(IconDrawable.RESTART, "Restart LinkedIn");
        restart.setOnClickListener(v -> restartApp());
        bar.addView(restart);

        searchButton = iconButton(IconDrawable.SEARCH, "Search");
        searchButton.setOnClickListener(v -> setSearching(!searching));
        bar.addView(searchButton);
        return bar;
    }

    private void setSearching(boolean on) {
        searching = on;
        searchButton.setImageDrawable(new IconDrawable(on ? IconDrawable.CLOSE : IconDrawable.SEARCH, textPrimary));
        InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (on) {
            query = "";
            searchField.setText("");
            render();
            searchField.requestFocus();
            imm.showSoftInput(searchField, InputMethodManager.SHOW_IMPLICIT);
        } else {
            imm.hideSoftInputFromWindow(searchField.getWindowToken(), 0);
            render();
        }
    }

    /** A row of the list of categories, which opens the category's page. */
    private View categoryRow(String title) {
        LinearLayout row = settingRow();
        row.addView(text(title, 18, textPrimary, false),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        ImageView chevron = new ImageView(this);
        chevron.setImageDrawable(new IconDrawable(IconDrawable.CHEVRON_RIGHT, textSecondary));
        row.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
        row.setOnClickListener(v -> {
            listScroll = scroll.getScrollY();
            page = title;
            render();
        });
        return row;
    }

    /** The title of a group of rows on a category's page. */
    private View header(String title) {
        TextView view = text(title, 14, accent, true);
        view.setPadding(dp(24), dp(20), dp(24), dp(4));
        return view;
    }

    private View toggleRow(Item item, String categoryName) {
        LinearLayout row = settingRow();
        row.addView(texts(item.title, item.summary, categoryName),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        int[][] states = {{android.R.attr.state_checked}, {}};
        CompoundButton toggle;
        if (item.checkbox) {
            toggle = new CheckBox(this);
            toggle.setButtonTintList(new ColorStateList(states, new int[]{accent, textSecondary}));
        } else {
            Switch track = new Switch(this);
            track.setThumbTintList(new ColorStateList(states, new int[]{accent, dark ? 0xFFB0B0B0 : 0xFFFFFFFF}));
            track.setTrackTintList(new ColorStateList(states, new int[]{(accent & 0x00FFFFFF) | 0x80000000,
                    dark ? 0xFF474747 : 0xFFBDBDBD}));
            toggle = track;
        }
        if (item.key == null) {
            // Always on: shown, but not something to change.
            toggle.setChecked(true);
            toggle.setEnabled(false);
            row.setEnabled(false);
            row.setAlpha(0.45f);
            row.addView(toggle);
            return row;
        }
        toggle.setChecked(Settings.get(item.key, item.def));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            Settings.set(item.key, checked);
            showRestartBanner();
            if (item.onChange != null) item.onChange.run();
        });
        row.addView(toggle);
        row.setOnClickListener(v -> toggle.toggle());
        return row;
    }

    private View valueRow(Item item, String categoryName) {
        LinearLayout row = settingRow();
        LinearLayout texts = texts(item.title, item.value.currentValue(), categoryName);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Runnable onClick = item.value.onClick();
        if (onClick == null) {
            ((TextView) texts.getChildAt(texts.getChildCount() - 1)).setTextColor(accent);
            row.setBackground(null);
        } else {
            ImageView chevron = new ImageView(this);
            chevron.setImageDrawable(new IconDrawable(IconDrawable.CHEVRON_RIGHT, textSecondary));
            row.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
            boolean enabled = item.value.enabled();
            row.setEnabled(enabled);
            row.setAlpha(enabled ? 1f : 0.45f);
            row.setOnClickListener(v -> onClick.run());
        }
        return row;
    }

    private LinearLayout settingRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(24), dp(16), dp(20), dp(16));
        row.setBackground(ripple(false));
        return row;
    }

    private LinearLayout texts(String title, String summary, String categoryName) {
        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        if (categoryName != null) {
            TextView category = text(I18n.tr(categoryName).toUpperCase(Locale.ROOT), 11, accent, true);
            category.setLetterSpacing(0.06f);
            texts.addView(category);
        }
        texts.addView(text(title, 17, textPrimary, false));
        if (summary != null) {
            TextView summaryView = text(summary, 14, textSecondary, false);
            summaryView.setPadding(0, dp(3), dp(12), 0);
            texts.addView(summaryView);
        }
        return texts;
    }

    // endregion

    // region Patch status

    /** {patch name, applied} for every patch, as named in Morphe Manager. */
    static Object[][] patches() {
        return new Object[][]{
                {"Hide ads", Settings.isHideAdsIncluded()},
                {"Hide promoted jobs", Settings.isHidePromotedJobsIncluded()},
                {"Hide suggested posts", Settings.isHideSuggestedIncluded()},
                {"Hide Premium upsells", Settings.isHidePremiumIncluded()},
                {"Feed filters", Settings.isFeedFiltersIncluded()},
                {"Disable double-tap like", Settings.isDisableDoubleTapLikeIncluded()},
                {"Expand posts", Settings.isExpandPostsIncluded()},
                {"Swipe between tabs", Settings.isSwipeTabsIncluded()},
                {"Keep feed on reopen", Settings.isKeepFeedIncluded()},
                {"Copy text", Settings.isCopyTextIncluded()},
                {"Disable screenshot share sheet", Settings.isScreenshotShareIncluded()},
                {"Hide top bar buttons", Settings.isTopBarButtonsIncluded()},
                {"Tap to hide controls in viewers", Settings.isViewerTapToHideIncluded()},
                {"Video tab", Settings.isVideoTabIncluded()},
                {"Download media", Settings.isDownloadMediaIncluded()},
                {"Messaging", Settings.isMessagingIncluded()},
                {"Open links directly", Settings.isOpenLinksDirectlyIncluded()},
                {"Sanitize share links", Settings.isSanitizeShareLinksIncluded()},
                {"Disable analytics", Settings.isBlockTrackingIncluded()},
                {"Anonymous profile viewing", Settings.isAnonymousProfileViewingIncluded()},
                {"Hide gaps and dividers", Settings.isRemoveGapsAndDividersIncluded()},
                {"Material You", Settings.isMaterialYouIncluded()},
                {"Pitch black", Settings.isAmoledBlackIncluded()},
                {"Dark app icon", Settings.isDarkAppIconIncluded()},
                {"Glass navigation bar", Settings.isGlassNavigationBarIncluded()},
                {"Material icons in the navigation bar", Settings.isMaterialTabIconsIncluded()},
                {"Navigation bar", Settings.isNavigationBarIncluded()},
                {"Always show navigation bar", Settings.isAlwaysShowNavigationBarIncluded()},
                {"More tab", Settings.isMoreMenuIncluded()},
                {"GmsCore support", Settings.isGmsCoreSupportIncluded()},
        };
    }

    // endregion

    // region Backup

    private void copyDiagnosticReport() {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(BRAND, Diagnostics.report(this)));
            Downloads.toast(this, "Diagnostic report copied. Paste it into your bug report.");
        } catch (Exception e) {
            Downloads.toast(this, I18n.f("Export failed: %1$s", e.getMessage()));
        }
    }

    private void clearDiagnosticLog() {
        Diagnostics.clear();
        Downloads.toast(this, "Diagnostic log cleared");
    }

    private static final int REQUEST_EXPORT = 7101;
    private static final int REQUEST_IMPORT = 7102;

    private void exportSettings() {
        startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("application/json")
                .putExtra(Intent.EXTRA_TITLE, "fakh-linkedin-patches.json"), REQUEST_EXPORT);
    }

    private void importSettings() {
        startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*"), REQUEST_IMPORT);
    }

    @Override
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (result != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        if (request == REQUEST_EXPORT) {
            try (java.io.OutputStream out = getContentResolver().openOutputStream(uri)) {
                out.write(Settings.exportJson().getBytes(java.nio.charset.StandardCharsets.UTF_8));
                Downloads.toast(this, "Settings saved");
            } catch (Exception e) {
                Downloads.toast(this, I18n.f("Export failed: %1$s", e.getMessage()));
            }
        } else if (request == REQUEST_IMPORT) {
            try (java.io.InputStream in = getContentResolver().openInputStream(uri)) {
                java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                for (int n; (n = in.read(buffer)) > 0; ) bytes.write(buffer, 0, n);
                String text = bytes.toString("UTF-8");
                Downloads.toast(this, I18n.f("%1$s settings imported", Settings.importJson(text)));
                refresh();
                showRestartBanner();
            } catch (Exception e) {
                Downloads.toast(this, "Invalid backup");
            }
        }
    }

    private void resetSettings() {
        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr("Reset to defaults?"))
                .setMessage(I18n.f("All %1$s settings will be reset, including the download location.", BRAND))
                .setPositiveButton(I18n.tr("Reset"), (dialog, which) -> {
                    Settings.resetAll();
                    Downloads.toast(this, "Settings reset to defaults");
                    refresh();
                    showRestartBanner();
                })
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
    }

    // endregion

    // region Download location

    private void chooseBaseDir() {
        String[] dirs = Settings.DOWNLOAD_BASE_DIRS;
        String current = Settings.downloadBaseDir();
        int checked = 0;
        for (int i = 0; i < dirs.length; i++) if (dirs[i].equals(current)) checked = i;

        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr("Main folder"))
                .setSingleChoiceItems(dirs, checked, (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_BASE_DIR, dirs[which]);
                    refresh();
                    dialog.dismiss();
                })
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
    }

    private void editFolder() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setText(Settings.downloadFolder());
        input.setHint(Settings.DEFAULT_DOWNLOAD_FOLDER);
        input.setSelection(input.getText().length());

        TextView help = text("Use \"/\" for nested folders, for example LinkedIn/Media. "
                + "Leave empty to save directly in the main folder.", 13, textSecondary, false);
        help.setPadding(0, dp(8), 0, 0);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input);
        box.addView(help);

        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr("Subfolder name"))
                .setView(box)
                .setPositiveButton(I18n.tr("Save"), (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.sanitizeFolder(input.getText().toString()));
                    refresh();
                })
                .setNeutralButton(I18n.tr("Default"), (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.DEFAULT_DOWNLOAD_FOLDER);
                    refresh();
                })
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
    }

    // endregion

    // region Muted lists

    /** The row of a muted list: its entries, or what it hides while it is empty; a tap edits it. */
    private ValueRow mutedRow(String key, String title, String summary, String help) {
        return new ValueRow() {
            public String currentValue() {
                String list = Settings.muted(key).trim().replaceAll("\\s*\\n\\s*", ", ");
                return list.isEmpty() ? summary : list;
            }

            public Runnable onClick() {
                return () -> editList(key, title, help);
            }

            public boolean enabled() {
                return true;
            }
        };
    }

    private void editList(String key, String title, String help) {
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setMinLines(4);
        input.setGravity(Gravity.TOP | Gravity.START);
        input.setText(Settings.muted(key));
        input.setSelection(input.getText().length());

        TextView helpView = text(help, 13, textSecondary, false);
        helpView.setPadding(0, dp(8), 0, 0);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input);
        box.addView(helpView);

        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr(title))
                .setView(box)
                .setPositiveButton(I18n.tr("Save"), (dialog, which) -> {
                    Settings.setString(key, input.getText().toString().trim());
                    refresh();
                    showRestartBanner();
                })
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
    }

    // endregion

    // region Bottom sheet

    /** A bottom sheet with one check row per choice. Tapping the dimmed area or going back closes it. */
    /**
     * The tabs of the navigation bar: HomeTabInfo constant, the switch that shows it (null for Home, which is always
     * shown), its name, and its icon in the sheet.
     */
    private static final String[][] TABS = {
            {"FEED", null, "Home", IconDrawable.HOME_OUTLINE},
            {"JOBS", Settings.SHOW_TAB_JOBS, "Jobs", IconDrawable.WORK_OUTLINE},
            {"RELATIONSHIPS", Settings.SHOW_TAB_NETWORK, "Network", IconDrawable.PEOPLE_OUTLINE},
            {"NOTIFICATIONS", Settings.SHOW_TAB_NOTIFICATIONS, "Notifications", IconDrawable.BELL_OUTLINE},
            {"POST", Settings.SHOW_TAB_POST, "Post", IconDrawable.POST_TAB_OUTLINE},
            {"VIDEO", Settings.SHOW_TAB_VIDEO, "Video", IconDrawable.PLAY_OUTLINE},
            {"NEWS", Settings.SHOW_TAB_NEWS, "News", IconDrawable.ARTICLE_TAB_OUTLINE},
            {"MESSAGING", Settings.SHOW_TAB_MESSAGING, "Messaging", IconDrawable.CHAT_TAB_OUTLINE},
            {"MORE", Settings.SHOW_TAB_MORE, "More", IconDrawable.APPS_TAB},
    };

    private static boolean tabDefault(String tab) {
        switch (tab) {
            case "POST":
            case "VIDEO":
            case "NEWS":
            case "MESSAGING":
                return Settings.tabOffered(tab);
            case "MORE":
                return Settings.showMoreTab();
            default:
                return true;
        }
    }

    /** {@link #TABS} in the order the user sorted them, Home first. */
    private static List<String[]> orderedTabs() {
        List<String> order = Settings.tabOrder();
        List<String[]> tabs = new ArrayList<>(Arrays.asList(TABS));
        tabs.sort((a, b) -> Integer.compare(rank(order, a[0]), rank(order, b[0])));
        return tabs;
    }

    private static int rank(List<String> order, String tab) {
        if (tab.equals("FEED")) return -1;
        int index = order.indexOf(tab);
        return index < 0 ? order.size() : index;
    }

    /**
     * The sheet of navigation bar tabs: a row per tab with its icon and check box, and a handle to drag it to another
     * place. Home stays first. The order is saved when a row is dropped.
     */
    private void showTabsSheet(List<String[]> specs, List<Item> choices) {
        if (sheet != null) return;
        LinearLayout rows = new LinearLayout(this);
        rows.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < specs.size(); i++) {
            String[] spec = specs.get(i);
            LinearLayout row = (LinearLayout) toggleRow(choices.get(i), null);
            row.setTag(spec[0]);
            ImageView icon = new ImageView(this);
            icon.setImageDrawable(tabIcon(spec));
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(24), dp(24));
            iconParams.setMarginEnd(dp(16));
            row.addView(icon, 0, iconParams);
            ImageView handle = new ImageView(this);
            LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(dp(24), dp(24));
            handleParams.setMarginEnd(dp(12));
            if (spec[1] != null) {
                handle.setImageDrawable(new IconDrawable(IconDrawable.DRAG_HANDLE, textSecondary));
                handle.setOnTouchListener(new RowDrag(rows, row, background, () -> {
                    StringBuilder order = new StringBuilder();
                    for (int r = 1; r < rows.getChildCount(); r++) {
                        if (order.length() > 0) order.append(',');
                        order.append(rows.getChildAt(r).getTag());
                    }
                    Settings.setString(Settings.TAB_ORDER, order.toString());
                    showRestartBanner();
                }));
            }
            row.addView(handle, 0, handleParams);
            rows.addView(row);
        }
        sheet = TabSheet.show(this, rootView, "Navigation bar tabs", "Home is always shown first. Drag ≡ to sort.",
                background, textPrimary, textSecondary, rows, () -> {
                    sheet = null;
                    refresh();
                });
    }

    /** The icon of a More tab item: LinkedIn's own, as the app draws it. */
    private Drawable moreIcon(String id) {
        String name = "voyagerIcNav" + Character.toUpperCase(id.charAt(0)) + id.substring(1) + "Selector24dp";
        return themedIcon(name, MoreMenu.icon(id));
    }

    /** LinkedIn's icon of a top bar button, which the Material icons switch does not change. */
    private Drawable stockIcon(String tab, String material) {
        int resource = NavigationBar.stockIcon(this, tab);
        return resource == 0 ? new IconDrawable(material, textPrimary) : tinted(resource);
    }

    /** The icon a theme attribute of the app points to, or the Material one when the theme has none. */
    private Drawable themedIcon(String attrName, String material) {
        int attr = getResources().getIdentifier(attrName, "attr", getPackageName());
        TypedValue value = new TypedValue();
        if (attr != 0 && NavigationBar.appTheme(this).resolveAttribute(attr, value, true) && value.resourceId != 0) {
            return tinted(value.resourceId);
        }
        return new IconDrawable(material, textPrimary);
    }

    private Drawable tinted(int resource) {
        Drawable drawable = getResources().getDrawable(resource, getTheme()).mutate();
        drawable.setTint(textPrimary);
        return drawable;
    }

    /** LinkedIn's own icon of the feed sort button, or none when the app no longer has it. */
    private Drawable feedSortIcon() {
        int resource = getResources().getIdentifier("feed_sort_order_icon", "drawable", getPackageName());
        return resource == 0 ? null : tinted(resource);
    }

    /** The tab's icon as the navigation bar draws it: Material, or LinkedIn's own once the bar has drawn that. */
    private Drawable tabIcon(String[] spec) {
        int stock = NavigationBar.stockIcon(this, spec[0]);
        if (!Settings.materialTabIcons() && stock != 0) {
            try {
                Drawable drawable = getResources().getDrawable(stock, null).mutate();
                drawable.setTint(textPrimary);
                return drawable;
            } catch (Throwable t) {
                Diagnostics.error("tab icon failed", t);
            }
        }
        return new IconDrawable(spec[3], textPrimary);
    }

    /** A sheet of check rows, each with the icon of the same position in {@code icons}. */
    private void showSheet(String title, String hint, List<Item> choices, List<Drawable> icons) {
        if (sheet != null) return;
        LinearLayout rows = new LinearLayout(this);
        rows.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < choices.size(); i++) {
            LinearLayout row = (LinearLayout) toggleRow(choices.get(i), null);
            ImageView icon = new ImageView(this);
            icon.setImageDrawable(icons.get(i));
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(24), dp(24));
            iconParams.setMarginEnd(dp(16));
            row.addView(icon, 0, iconParams);
            rows.addView(row);
        }
        // The row that opened the sheet shows how many choices are on, so it is refreshed when the sheet is gone.
        sheet = TabSheet.show(this, rootView, title, hint, background, textPrimary, textSecondary, rows, () -> {
            sheet = null;
            refresh();
        });
    }

    // endregion

    // region Helpers

    private View restartBanner() {
        LinearLayout banner = new LinearLayout(this);
        banner.setOrientation(LinearLayout.HORIZONTAL);
        banner.setGravity(Gravity.CENTER_VERTICAL);
        banner.setPadding(dp(18), dp(10), dp(10), dp(10));
        banner.setBackground(rounded(dark ? 0xFF262626 : 0xFF202124, 16));
        banner.setElevation(dp(8));

        TextView message = text(I18n.f("Restart %1$s to apply the change", "LinkedIn"), 14, 0xFFFFFFFF, false);
        banner.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView action = text("RESTART", 14, MaterialYou.settingsAccent(true, 0xFF2DBCB1), true);
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

    private void showRestartBanner() {
        if (restartBanner.getVisibility() == View.VISIBLE) return;
        restartBanner.setVisibility(View.VISIBLE);
        restartBanner.setAlpha(0f);
        restartBanner.setTranslationY(dp(24));
        restartBanner.animate().alpha(1f).translationY(0f).setDuration(200).start();
    }

    private ImageButton iconButton(String icon, String description) {
        ImageButton button = new ImageButton(this);
        button.setImageDrawable(new IconDrawable(icon, textPrimary));
        button.setBackground(ripple(true));
        button.setContentDescription(I18n.tr(description));
        int pad = dp(13);
        button.setPadding(pad, pad, pad, pad);
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(50), dp(50)));
        return button;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(I18n.tr(value));
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        return view;
    }

    private GradientDrawable rounded(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    private LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
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

    /**
     * Shows the dark or the stock launcher icon. The dark one is LinkedIn's own unused test icon alias, recolored by
     * the patch. The new entry is turned on before the old one is turned off, so the launcher never has none.
     */
    private void applyAppIcon() {
        boolean dark = Settings.darkAppIcon();
        PackageManager manager = getPackageManager();
        ComponentName darkIcon = new ComponentName(this, "com.linkedin.android.authenticator.AATestDefaultActivityAlias");
        ComponentName stockIcon = new ComponentName(this, "com.linkedin.android.authenticator.LaunchActivityDefault");
        manager.setComponentEnabledSetting(dark ? darkIcon : stockIcon, PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);
        manager.setComponentEnabledSetting(dark ? stockIcon : darkIcon, PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }

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
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }

    // endregion
}
