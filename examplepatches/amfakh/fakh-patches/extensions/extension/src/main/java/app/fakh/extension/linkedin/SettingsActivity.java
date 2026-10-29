package app.fakh.extension.linkedin;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
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
import java.util.List;
import java.util.Locale;

/**
 * Fakh Patches settings screen, laid out like LinkedIn's own settings pages (Account preferences and the like):
 * one page with a titled section per category, plus search across all settings.
 * Declared in the manifest by the settings patch; built in code so it needs no resources.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {
    static final String BRAND = "Fakh Patches";
    private static final String MICHII_URL = "https://github.com/heyymichii/michii-patches";
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

        Item(String key, boolean def, String title, String summary, Runnable onChange, ValueRow value,
                boolean checkbox) {
            this.key = key;
            this.def = def;
            this.title = title;
            this.summary = summary;
            this.onChange = onChange;
            this.value = value;
            this.checkbox = checkbox;
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

        Category toggle(String key, boolean def, String title, String summary) {
            return toggle(key, def, title, summary, null);
        }

        Category toggle(String key, boolean def, String title, String summary, Runnable onChange) {
            items.add(new Item(key, def, title, summary, onChange, null, false));
            return this;
        }

        Category check(String key, boolean def, String title) {
            items.add(new Item(key, def, title, null, null, null, true));
            return this;
        }

        Category value(String title, ValueRow value) {
            items.add(new Item(null, false, title, null, null, value, false));
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

    private List<Category> buildCategories() {
        List<Category> categories = new ArrayList<>();

        if (Settings.isHideAdsIncluded() || Settings.isHidePromotedJobsIncluded()
                || Settings.isHideSuggestedIncluded() || Settings.isHidePremiumIncluded()) {
            Category ads = new Category("Ads & promotions");
            if (Settings.isHideAdsIncluded()) {
                ads.toggle(Settings.HIDE_ADS, true, "Hide ads", "Promoted posts in your feed.");
            }
            if (Settings.isHidePromotedJobsIncluded()) {
                ads.toggle(Settings.HIDE_PROMOTED_JOBS, true, "Hide promoted jobs",
                        "Promoted jobs in Jobs and search.");
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

        if (Settings.isFeedFiltersIncluded() || Settings.isDisableDoubleTapLikeIncluded()) {
            Category feed = new Category("Feed");
            if (Settings.isDisableDoubleTapLikeIncluded()) {
                feed.toggle(Settings.DISABLE_DOUBLE_TAP_LIKE, true, "Turn off double-tap to like",
                        "Double-tapping a post or photo won't like it.");
            }
            if (Settings.isFeedFiltersIncluded()) {
                feed.toggle(Settings.FOCUS_MODE, false, "Focus mode", "Hide like, comment, and repost counts.")
                        .toggle(Settings.HIDE_CELEBRATIONS, false, "Hide celebration posts",
                                "Work anniversaries and new jobs.")
                        .toggle(Settings.HIDE_FEED_JOBS, false, "Hide job posts",
                                "Job cards in your feed.")
                        .toggle(Settings.HIDE_REPOSTS, false, "Hide network activity",
                                "Posts shown because someone you know liked, commented on, or reposted them.")
                        .toggle(Settings.HIDE_VIDEO_POSTS, false, "Hide video posts", "Posts with a video.")
                        .toggle(Settings.HIDE_RECOMMENDATIONS, false, "Hide \"Recommended for you\"",
                                "Lists of people and pages to follow.")
                        .toggle(Settings.HIDE_GAMES, false, "Hide puzzle games", "Game cards in search.")
                        .toggle(Settings.HIDE_NEW_POSTS_PILL, false, "Hide the \"New posts\" button",
                                "The button at the top of the feed.")
                        .toggle(Settings.HIDE_TRANSLATION, false, "Hide \"Show translation\"",
                                "Shown below posts in other languages.");
            }
            categories.add(feed);
        }

        if (Settings.isMoreMenuIncluded()) {
            Category more = new Category("More tab")
                    .toggle(Settings.HIDE_MORE_TAB, true, "Move to the profile menu",
                            "Hide the More tab and list its items in the profile menu.")
                    .toggle(Settings.GAMES_SHORTCUT, true, "Puzzle games shortcut",
                            "Add it to the menu of the LinkedIn app icon.", () -> GamesShortcut.update(this));
            for (MoreMenu.Item item : MoreMenu.items()) more.check(item.key(), true, item.label);
            categories.add(more);
        }

        if (Settings.isRemoveGapsAndDividersIncluded() || Settings.isMaterialYouIncluded()) {
            Category appearance = new Category("Appearance");
            if (Settings.isRemoveGapsAndDividersIncluded()) {
                appearance.toggle(Settings.REMOVE_GAPS_AND_DIVIDERS, true, "Remove gaps and dividers",
                        "Flat lists with no gaps or dividers.");
            }
            if (Settings.isMaterialYouIncluded()) {
                appearance.toggle(Settings.MATERIAL_YOU, true, "Material You",
                        "Colors from your wallpaper across the app.");
            }
            categories.add(appearance);
        }

        if (Settings.isDownloadMediaIncluded()) {
            categories.add(new Category("Download")
                    .toggle(Settings.DOWNLOAD_MEDIA, true, "Download button",
                            "On photos, videos, profile photos, and banners.")
                    .value("Save location", new ValueRow() {
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

        if (Settings.isMessagingIncluded()) {
            categories.add(new Category("Chat")
                    .toggle(Settings.HIDE_SPONSORED_MESSAGES, true, "Hide sponsored messages",
                            "Sponsored InMail and ads in your inbox.")
                    .toggle(Settings.GHOST_MODE, false, "Ghost mode",
                            "Don't send typing or seen status. Mark chats as read from the chat list."));
        }

        if (Settings.isOpenLinksDirectlyIncluded() || Settings.isBlockTrackingIncluded()
                || Settings.isSanitizeShareLinksIncluded()) {
            Category privacy = new Category("Privacy");
            if (Settings.isOpenLinksDirectlyIncluded()) {
                privacy.toggle(Settings.OPEN_LINKS_DIRECTLY, true, "Open links directly",
                        "Skip LinkedIn's warning page in posts and chats.");
                privacy.toggle(Settings.RESOLVE_SHORT_LINKS, true, "Expand lnkd.in links",
                        "Open the real address instead of the redirect.");
            }
            if (Settings.isSanitizeShareLinksIncluded()) {
                privacy.toggle(Settings.SANITIZE_SHARE_LINKS, true, "Clean share links",
                        "Strip tracking from LinkedIn links you copy or share.");
            }
            if (Settings.isBlockTrackingIncluded()) {
                privacy.toggle(Settings.BLOCK_TRACKING, false, "Block tracking",
                        "Stop most analytics events. Turn off if something breaks.");
            }
            categories.add(privacy);
        }

        categories.add(new Category("Other")
                .value("Language", new ValueRow() {
                    public String currentValue() {
                        return languageNames()[languageIndex()];
                    }

                    public Runnable onClick() {
                        return SettingsActivity.this::chooseLanguage;
                    }

                    public boolean enabled() {
                        return true;
                    }
                })
                .action("Export settings", "Copy a backup to the clipboard.", this::exportSettings)
                .action("Import settings", "Restore a backup from the clipboard.", this::importSettings)
                .action("Reset to defaults", "Reset all Fakh Patches settings.", this::resetSettings)
                .toggle(Settings.DEBUG_LOGGING, false, "Diagnostic logging",
                        "Log more detail for bug reports.")
                .action("Copy diagnostic report", "App, device, and log details for a bug report. Links and IDs are removed.", this::copyDiagnosticReport)
                .action("Clear diagnostic log", "Delete the saved log.", this::clearDiagnosticLog));
        return categories;
    }

    // endregion

    private boolean dark;
    private int background;
    /** Shows between sections, like the gaps between LinkedIn's settings groups. */
    private int canvas;
    private int textPrimary;
    private int textSecondary;
    private int accent;

    private List<Category> categories;
    private boolean searching;
    private String query = "";

    private TextView titleView;
    private EditText searchField;
    private ImageButton searchButton;
    private LinearLayout content;
    private ScrollView scroll;
    private View restartBanner;

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
        canvas = dark ? 0xFF000000 : 0xFFF4F2EE;
        textPrimary = dark ? 0xFFFFFFFF : 0xFF141414;
        textSecondary = dark ? 0xFFA6A6A6 : 0xFF5F6368;
        accent = dark ? ACCENT_DARK : ACCENT_LIGHT;
        int[] materialYou = MaterialYou.settingsColors(dark);
        if (materialYou != null) {
            background = materialYou[0];
            canvas = materialYou[1];
            accent = materialYou[3];
        }

        Window window = getWindow();
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        if (!dark) {
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        }

        categories = buildCategories();

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
        setContentView(root);

        render();
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        if (searching) {
            setSearching(false);
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
            renderMain();
        }
        scroll.scrollTo(0, 0);
    }

    /** Re-render in place, keeping the scroll position (after a value changes). */
    private void refresh() {
        int y = scroll.getScrollY();
        content.removeAllViews();
        if (searching) renderSearch();
        else renderMain();
        scroll.post(() -> scroll.scrollTo(0, y));
    }

    /** Every category as a titled section on one page, with a gap between sections unless gaps are removed. */
    private void renderMain() {
        for (int i = 0; i < categories.size(); i++) {
            if (i > 0 && !Settings.removeGapsAndDividers()) {
                View gap = new View(this);
                gap.setBackgroundColor(canvas);
                content.addView(gap, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(8)));
            }
            content.addView(sectionHeader(categories.get(i).title));
            renderItems(categories.get(i).items, null);
        }
        content.addView(credit());
    }

    /** Small footer crediting the project these patches are based on; opens its GitHub page. */
    private View credit() {
        TextView view = text("Based on Michii Patches by heyymichii", 13, textSecondary, false);
        view.setPadding(dp(24), dp(24), dp(24), dp(16));
        view.setBackground(ripple(false));
        view.setOnClickListener(v -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(MICHII_URL)));
            } catch (Exception e) {
                Downloads.toast(this, "Can't open the link");
            }
        });
        return view;
    }

    private void renderItems(List<Item> items, List<String> categoryNames) {
        for (int i = 0; i < items.size(); i++) {
            Item item = items.get(i);
            String prefix = categoryNames == null ? null : categoryNames.get(i);
            content.addView(item.value == null ? toggleRow(item, prefix) : valueRow(item, prefix));
        }
    }

    private void renderSearch() {
        String q = query.trim().toLowerCase(Locale.ROOT);
        List<Item> found = new ArrayList<>();
        List<String> names = new ArrayList<>();
        for (Category category : categories) {
            for (Item item : category.items) {
                String haystack = (I18n.tr(item.title) + " " + (item.summary == null ? "" : I18n.tr(item.summary)) + " "
                        + I18n.tr(category.title)).toLowerCase(Locale.ROOT);
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

    /** Section title, like the bold group titles of LinkedIn's settings pages. */
    private TextView sectionHeader(String title) {
        TextView view = text(title, 20, textPrimary, true);
        view.setPadding(dp(24), dp(24), dp(24), dp(4));
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
                {"Download media", Settings.isDownloadMediaIncluded()},
                {"Messaging", Settings.isMessagingIncluded()},
                {"Open links directly", Settings.isOpenLinksDirectlyIncluded()},
                {"Sanitize share links", Settings.isSanitizeShareLinksIncluded()},
                {"Block tracking", Settings.isBlockTrackingIncluded()},
                {"Remove gaps and dividers", Settings.isRemoveGapsAndDividersIncluded()},
                {"Material You", Settings.isMaterialYouIncluded()},
                {"More tab", Settings.isMoreMenuIncluded()},
                {"GmsCore support", Settings.isGmsCoreSupportIncluded()},
        };
    }

    // endregion

    // region Language

    /** "auto" followed by every language that has a translation file. */
    private static String[] languageCodes() {
        List<String> codes = new ArrayList<>();
        codes.add(I18n.LANGUAGE_AUTO);
        codes.addAll(Translations.LANGUAGES.keySet());
        return codes.toArray(new String[0]);
    }

    /** Language names are shown in their own language; only the automatic entry is translated. */
    private static String[] languageNames() {
        String[] codes = languageCodes();
        String[] names = new String[codes.length];
        names[0] = I18n.tr("Automatic (device language)");
        for (int i = 1; i < codes.length; i++) names[i] = Translations.LANGUAGES.get(codes[i]);
        return names;
    }

    private int languageIndex() {
        String current = Settings.language();
        String[] codes = languageCodes();
        for (int i = 0; i < codes.length; i++) if (codes[i].equals(current)) return i;
        return 0;
    }

    private void chooseLanguage() {
        String[] codes = languageCodes();
        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr("Language"))
                .setSingleChoiceItems(languageNames(), languageIndex(), (dialog, which) -> {
                    Settings.setString(Settings.LANGUAGE, codes[which]);
                    dialog.dismiss();
                    // Rebuild the screen so every text uses the new language.
                    recreate();
                })
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
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

    private void exportSettings() {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(BRAND, Settings.exportJson()));
            Downloads.toast(this, "Settings copied to the clipboard");
        } catch (Exception e) {
            Downloads.toast(this, I18n.f("Export failed: %1$s", e.getMessage()));
        }
    }

    private void importSettings() {
        EditText input = new EditText(this);
        input.setHint(I18n.tr("Paste a settings backup here"));
        input.setMinLines(4);
        input.setGravity(Gravity.TOP);
        ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        if (clip != null && clip.getItemCount() > 0 && clip.getItemAt(0).getText() != null) {
            input.setText(clip.getItemAt(0).getText());
        }
        LinearLayout box = new LinearLayout(this);
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input, matchWidth());

        new AlertDialog.Builder(this, dialogTheme())
                .setTitle(I18n.tr("Import settings"))
                .setView(box)
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
                .setNegativeButton(I18n.tr("Cancel"), null)
                .show();
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

    // region Helpers

    private View restartBanner() {
        LinearLayout banner = new LinearLayout(this);
        banner.setOrientation(LinearLayout.HORIZONTAL);
        banner.setGravity(Gravity.CENTER_VERTICAL);
        banner.setPadding(dp(18), dp(10), dp(10), dp(10));
        banner.setBackground(rounded(dark ? 0xFF262626 : 0xFF202124, 16));
        banner.setElevation(dp(8));

        TextView message = text("Restart LinkedIn to apply all changes.", 14, 0xFFFFFFFF, false);
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
