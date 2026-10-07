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
import java.util.List;
import java.util.Locale;

/**
 * Michii Patches settings screen, styled like the settings of other Morphe patches: a list of categories with icons,
 * one sub screen per category, search across all settings, and an "About" card.
 * Declared in the manifest by the settings patch; built in code so it needs no resources.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {
    static final String AUTHOR = "heyymichii";
    static final String BRAND = "Michii Patches";
    private static final String MORPHE_WEBSITE = "https://morphe.software";
    /** Donation links; a row is only shown when its link is set. */
    private static final String TRAKTEER_URL = "https://trakteer.id/heyymichii";
    private static final String KOFI_URL = "";

    // region Settings model

    private static final class Item {
        final String key;
        final boolean def;
        final String title;
        final String summary;
        final Runnable onChange;
        /** Non-null for rows that open a picker instead of a switch. */
        final ValueRow value;

        Item(String key, boolean def, String title, String summary, Runnable onChange, ValueRow value) {
            this.key = key;
            this.def = def;
            this.title = title;
            this.summary = summary;
            this.onChange = onChange;
            this.value = value;
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
        final String icon;
        final List<Item> items = new ArrayList<>();

        Category(String title, String icon) {
            this.title = title;
            this.icon = icon;
        }

        Category toggle(String key, boolean def, String title, String summary) {
            return toggle(key, def, title, summary, null);
        }

        Category toggle(String key, boolean def, String title, String summary, Runnable onChange) {
            items.add(new Item(key, def, title, summary, onChange, null));
            return this;
        }

        Category value(String title, ValueRow value) {
            items.add(new Item(null, false, title, null, null, value));
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
            Category ads = new Category("Iklan & Promosi", IconDrawable.BLOCK);
            if (Settings.isHideAdsIncluded()) {
                ads.toggle(Settings.HIDE_ADS, true, "Sembunyikan iklan", "Post \"Dipromosikan\" di feed.");
            }
            if (Settings.isHidePromotedJobsIncluded()) {
                ads.toggle(Settings.HIDE_PROMOTED_JOBS, true, "Sembunyikan lowongan promosi",
                        "Lowongan \"Dipromosikan\" di tab Jobs dan pencarian.");
            }
            if (Settings.isHideSuggestedIncluded()) {
                ads.toggle(Settings.HIDE_SUGGESTED, true, "Sembunyikan post disarankan",
                        "Post \"Disarankan\" dari luar jaringan.");
            }
            if (Settings.isHidePremiumIncluded()) {
                ads.toggle(Settings.HIDE_PREMIUM, true, "Sembunyikan promosi Premium",
                        "Kartu Premium dan AI di feed, profil, Jobs, dan panel Me.");
            }
            categories.add(ads);
        }

        if (Settings.isFeedFiltersIncluded() || Settings.isDisableDoubleTapLikeIncluded()) {
            Category feed = new Category("Feed", IconDrawable.FEED);
            if (Settings.isDisableDoubleTapLikeIncluded()) {
                feed.toggle(Settings.DISABLE_DOUBLE_TAP_LIKE, true, "Matikan double-tap like",
                        "Ketuk dua kali tidak lagi memberi like pada post atau foto.");
            }
            if (Settings.isFeedFiltersIncluded()) {
                feed.toggle(Settings.FOCUS_MODE, false, "Mode fokus", "Sembunyikan jumlah like, komentar, dan repost.")
                        .toggle(Settings.HIDE_CELEBRATIONS, false, "Sembunyikan post perayaan",
                                "Ulang tahun kerja, posisi baru, dan sejenisnya.")
                        .toggle(Settings.HIDE_FEED_JOBS, false, "Sembunyikan lowongan di feed",
                                "Kartu lowongan kerja di home feed.")
                        .toggle(Settings.HIDE_REPOSTS, false, "Sembunyikan repost",
                                "Post yang membagikan ulang post orang lain.")
                        .toggle(Settings.HIDE_VIDEO_POSTS, false, "Sembunyikan post video", "Post yang berisi video.")
                        .toggle(Settings.HIDE_NEW_POSTS_PILL, false, "Sembunyikan tombol \"Post baru\"",
                                "Pil yang muncul di atas feed.")
                        .toggle(Settings.HIDE_TRANSLATION, false, "Sembunyikan \"Lihat terjemahan\"",
                                "Tombol terjemahan di bawah post berbahasa lain.");
            }
            categories.add(feed);
        }

        if (Settings.isDownloadMediaIncluded()) {
            categories.add(new Category("Download", IconDrawable.DOWNLOAD)
                    .toggle(Settings.DOWNLOAD_MEDIA, true, "Tombol download",
                            "Di layar foto, video, foto profil, dan banner. Tekan lama tombolnya untuk "
                                    + "membuka halaman ini.")
                    .value("Lokasi simpan", new ValueRow() {
                        public String currentValue() {
                            return Settings.downloadSplitByType()
                                    ? "Foto: " + Downloads.location(false) + "\nVideo: " + Downloads.location(true)
                                    : Downloads.location(false);
                        }

                        public Runnable onClick() {
                            return null;
                        }

                        public boolean enabled() {
                            return true;
                        }
                    })
                    .value("Folder utama", new ValueRow() {
                        public String currentValue() {
                            return Settings.downloadSplitByType()
                                    ? "Diatur otomatis (Pisah foto & video aktif)" : Settings.downloadBaseDir();
                        }

                        public Runnable onClick() {
                            return SettingsActivity.this::chooseBaseDir;
                        }

                        public boolean enabled() {
                            return !Settings.downloadSplitByType();
                        }
                    })
                    .value("Nama subfolder", new ValueRow() {
                        public String currentValue() {
                            String folder = Settings.downloadFolder();
                            return folder.isEmpty() ? "(langsung di folder utama)" : folder;
                        }

                        public Runnable onClick() {
                            return SettingsActivity.this::editFolder;
                        }

                        public boolean enabled() {
                            return true;
                        }
                    })
                    .toggle(Settings.DOWNLOAD_SPLIT_BY_TYPE, false, "Pisah foto & video",
                            "Foto ke Pictures, video ke Movies.", this::refresh));
        }

        if (Settings.isMessagingIncluded()) {
            categories.add(new Category("Chat", IconDrawable.CHAT)
                    .toggle(Settings.HIDE_SPONSORED_MESSAGES, true, "Sembunyikan pesan bersponsor",
                            "Sponsored InMail dan pesan iklan di daftar chat.")
                    .toggle(Settings.GHOST_MODE, false, "Mode hantu",
                            "Tidak mengirim status \"sedang mengetik\" dan \"dibaca\" otomatis. Tandai chat sebagai "
                                    + "dibaca secara manual dari daftar chat kalau perlu."));
        }

        if (Settings.isOpenLinksDirectlyIncluded() || Settings.isBlockTrackingIncluded()
                || Settings.isSanitizeShareLinksIncluded()) {
            Category privacy = new Category("Privasi", IconDrawable.SHIELD);
            if (Settings.isOpenLinksDirectlyIncluded()) {
                privacy.toggle(Settings.OPEN_LINKS_DIRECTLY, true, "Buka link langsung",
                        "Lewati halaman peringatan LinkedIn di post dan chat.");
                privacy.toggle(Settings.RESOLVE_SHORT_LINKS, true, "Buka link pendek lnkd.in langsung",
                        "Alamat asli link lnkd.in di feed dicari di latar belakang, lalu dibuka langsung.");
            }
            if (Settings.isSanitizeShareLinksIncluded()) {
                privacy.toggle(Settings.SANITIZE_SHARE_LINKS, true, "Bersihkan link share",
                        "Buang parameter pelacak (utm, trk, rcm, ...) saat menyalin atau membagikan link LinkedIn.");
            }
            if (Settings.isBlockTrackingIncluded()) {
                privacy.toggle(Settings.BLOCK_TRACKING, false, "Blokir tracking",
                        "Tidak mengirim sebagian besar event analytics. Matikan kalau ada fitur yang aneh.");
            }
            categories.add(privacy);
        }

        categories.add(new Category("Lain-lain", IconDrawable.MORE)
                .action("Ekspor pengaturan", "Salin semua pengaturan ke clipboard sebagai cadangan.", this::exportSettings)
                .action("Impor pengaturan", "Tempel cadangan pengaturan dari clipboard.", this::importSettings)
                .action("Kembalikan ke default", "Atur ulang semua pengaturan Michii Patches.", this::resetSettings)
                .toggle(Settings.DEBUG_LOGGING, false, "Log diagnostik",
                        "Tulis log (tag LinkedInPatches) untuk membantu memperbaiki patch."));
        return categories;
    }

    // endregion

    private boolean dark;
    private int background;
    private int surface;
    private int divider;
    private int textPrimary;
    private int textSecondary;
    private int accent;

    private List<Category> categories;
    /** Null on the main list. */
    private Category openCategory;
    private boolean searching;
    private String query = "";

    private TextView titleView;
    private EditText searchField;
    private ImageButton searchButton;
    private LinearLayout content;
    private ScrollView scroll;
    private View restartBanner;

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
        background = dark ? 0xFF000000 : 0xFFFFFFFF;
        surface = dark ? 0xFF161616 : 0xFFF2F4F5;
        divider = dark ? 0xFF2A2A2A : 0xFFE3E5E8;
        textPrimary = dark ? 0xFFFFFFFF : 0xFF141414;
        textSecondary = dark ? 0xFFA6A6A6 : 0xFF5F6368;
        accent = dark ? 0xFF2DBCB1 : 0xFF00897B;

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
        } else if (openCategory != null) {
            openCategory = null;
            render();
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
            titleView.setText(openCategory == null ? "Michii Patches" : openCategory.title);
            if (openCategory == null) renderMain();
            else renderItems(openCategory.items, null);
        }
        scroll.scrollTo(0, 0);
    }

    /** Re-render in place, keeping the scroll position (after a value changes). */
    private void refresh() {
        int y = scroll.getScrollY();
        content.removeAllViews();
        if (searching) renderSearch();
        else if (openCategory == null) renderMain();
        else renderItems(openCategory.items, null);
        scroll.post(() -> scroll.scrollTo(0, y));
    }

    private void renderMain() {
        content.addView(navRow(IconDrawable.INFO, "Tentang", v -> showAbout()));
        for (Category category : categories) {
            content.addView(navRow(category.icon, category.title, v -> {
                openCategory = category;
                render();
            }));
        }
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
                String haystack = (item.title + " " + (item.summary == null ? "" : item.summary) + " "
                        + category.title).toLowerCase(Locale.ROOT);
                if (q.isEmpty() || haystack.contains(q)) {
                    found.add(item);
                    names.add(category.title);
                }
            }
        }
        if (found.isEmpty()) {
            TextView empty = text("Tidak ada pengaturan yang cocok.", 15, textSecondary, false);
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

        ImageButton back = iconButton(IconDrawable.ARROW_BACK, "Kembali");
        back.setOnClickListener(v -> onBackPressed());
        bar.addView(back);

        titleView = text("Michii Patches", 22, textPrimary, true);
        titleView.setPadding(dp(12), 0, 0, 0);
        bar.addView(titleView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        searchField = new EditText(this);
        searchField.setHint("Cari pengaturan");
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

        searchButton = iconButton(IconDrawable.SEARCH, "Cari");
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

    /** Main list entry: icon + title, like the category list of other Morphe patches. */
    private View navRow(String icon, String title, View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(24), dp(20), dp(24), dp(20));
        row.setBackground(ripple(false));
        row.setOnClickListener(onClick);

        ImageView iconView = new ImageView(this);
        iconView.setImageDrawable(new IconDrawable(icon, textPrimary));
        row.addView(iconView, new LinearLayout.LayoutParams(dp(26), dp(26)));

        TextView titleText = text(title, 18, textPrimary, false);
        titleText.setPadding(dp(28), 0, 0, 0);
        row.addView(titleText);
        return row;
    }

    private View toggleRow(Item item, String categoryName) {
        LinearLayout row = settingRow();
        row.addView(texts(item.title, item.summary, categoryName),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = new Switch(this);
        toggle.setChecked(Settings.get(item.key, item.def));
        int[][] states = {{android.R.attr.state_checked}, {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[]{accent, dark ? 0xFFB0B0B0 : 0xFFFFFFFF}));
        toggle.setTrackTintList(new ColorStateList(states, new int[]{(accent & 0x00FFFFFF) | 0x80000000,
                dark ? 0xFF474747 : 0xFFBDBDBD}));
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
            TextView category = text(categoryName.toUpperCase(Locale.ROOT), 11, accent, true);
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

    // region About

    private void showAbout() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER_HORIZONTAL);
        box.setPadding(dp(24), dp(28), dp(24), dp(24));
        box.setBackground(rounded(dark ? 0xFF0B0B0B : 0xFFFFFFFF, 28));

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(getApplicationInfo().loadIcon(getPackageManager()));
        box.addView(icon, new LinearLayout.LayoutParams(dp(88), dp(88)));

        TextView name = text(BRAND, 26, textPrimary, true);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(16), 0, dp(4));
        box.addView(name);
        TextView tagline = text("Patches for LinkedIn  •  for use with Morphe", 14, textSecondary, false);
        tagline.setGravity(Gravity.CENTER);
        tagline.setPadding(0, 0, 0, dp(20));
        box.addView(tagline);

        // Update status, filled in when the GitHub check returns.
        LinearLayout update = new LinearLayout(this);
        update.setOrientation(LinearLayout.VERTICAL);
        update.setGravity(Gravity.CENTER_HORIZONTAL);
        update.setPadding(dp(20), dp(16), dp(20), dp(16));
        update.setBackground(outlined());
        TextView updateTitle = text("Memeriksa pembaruan…", 17, accent, true);
        updateTitle.setGravity(Gravity.CENTER);
        update.addView(updateTitle);
        TextView updateBody = text("Kamu memakai " + BRAND + " versi " + Settings.patchesVersion(), 15,
                textSecondary, false);
        updateBody.setGravity(Gravity.CENTER);
        updateBody.setPadding(0, dp(6), 0, 0);
        update.addView(updateBody);
        box.addView(update, matchWidth());
        String installed = BRAND + " " + Settings.patchesVersion() + "  •  LinkedIn " + appVersion()
                + "\nDibuat oleh " + AUTHOR;
        UpdateChecker.check((status, latest) -> {
            switch (status) {
                case UPDATE_AVAILABLE:
                    updateTitle.setText("Pembaruan tersedia");
                    updateBody.setText("Kamu memakai versi " + Settings.patchesVersion() + ".\n\nPembaruan tersedia: "
                            + latest + "\n\nUntuk memperbarui, patch ulang LinkedIn dengan Morphe Manager.");
                    break;
                case UP_TO_DATE:
                    updateTitle.setText("Sudah versi terbaru");
                    updateBody.setText(installed);
                    break;
                case NO_RELEASE:
                    updateTitle.setText("Belum ada rilis stabil");
                    updateBody.setText(installed + "\n\nBelum ada rilis stabil di GitHub untuk dibandingkan.");
                    break;
                default:
                    updateTitle.setText("Tidak bisa terhubung");
                    updateBody.setText(installed + "\n\nPeriksa koneksi internet, lalu buka halaman ini lagi.");
                    break;
            }
        });

        box.addView(sectionTitle("Tautan resmi"));
        LinearLayout links = new LinearLayout(this);
        links.setOrientation(LinearLayout.VERTICAL);
        links.setBackground(outlined());
        String repo = "https://github.com/" + UpdateChecker.REPO;
        if (!TRAKTEER_URL.isEmpty()) {
            addLink(links, IconDrawable.HEART, "Donasi (Trakteer)", v -> openUrl(TRAKTEER_URL));
        }
        if (!KOFI_URL.isEmpty()) {
            addLink(links, IconDrawable.HEART, "Donate (Ko-fi)", v -> openUrl(KOFI_URL));
        }
        addLink(links, IconDrawable.CODE, "GitHub", v -> openUrl(repo));
        addLink(links, IconDrawable.HISTORY, "Changelog", v -> openUrl(repo + "/releases"));
        addLink(links, IconDrawable.BUG, "Laporkan bug", v -> openUrl(repo + "/issues/new/choose"));
        addLink(links, IconDrawable.CHECKLIST, "Status patch", v -> showPatchStatus());
        addLink(links, IconDrawable.PEOPLE, "Kredit", v -> showCredits());
        box.addView(links, matchWidth());

        TextView disclaimer = text("Bukan aplikasi resmi LinkedIn. " + BRAND + " bukan bagian dari proyek Morphe.",
                12, textSecondary, false);
        disclaimer.setGravity(Gravity.CENTER);
        disclaimer.setPadding(0, dp(16), 0, 0);
        box.addView(disclaimer);

        showCard(box);
    }

    /** Which patches were applied when this LinkedIn was patched. */
    private void showPatchStatus() {
        LinearLayout box = cardBox("Status patch", "Patch yang dipasang saat LinkedIn ini di-patch.");
        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setBackground(outlined());

        Object[][] patches = {
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
        };
        for (int i = 0; i < patches.length; i++) {
            if (i > 0) list.addView(linkDivider());
            boolean included = (Boolean) patches[i][1];
            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(18), dp(14), dp(18), dp(14));
            row.addView(text((String) patches[i][0], 16, textPrimary, false),
                    new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            TextView state = text(included ? "Terpasang" : "Tidak dipasang", 14,
                    included ? accent : textSecondary, true);
            row.addView(state);
            list.addView(row);
        }
        box.addView(list, matchWidth());
        showCard(box);
    }

    private void showCredits() {
        LinearLayout box = cardBox("Kredit", "Orang dan proyek di balik " + BRAND + ".");
        box.addView(creditCard(IconDrawable.PEOPLE, AUTHOR, "Pembuat " + BRAND,
                "github.com/heyymichii", "https://github.com/heyymichii"));
        box.addView(creditCard(IconDrawable.CODE, "Morphe", "Patcher, Morphe Manager, dan template patch",
                "morphe.software", MORPHE_WEBSITE));
        box.addView(creditCard(IconDrawable.INFO, "LinkedIn", "Aplikasi asli. " + BRAND
                + " tidak berafiliasi dengan LinkedIn.", null, null));
        showCard(box);
    }

    private View creditCard(String icon, String title, String role, String linkLabel, String url) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(18), dp(16), dp(14), dp(16));
        card.setBackground(outlined());

        ImageView iconView = new ImageView(this);
        iconView.setImageDrawable(new IconDrawable(icon, accent));
        card.addView(iconView, new LinearLayout.LayoutParams(dp(28), dp(28)));

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(dp(18), 0, dp(8), 0);
        texts.addView(text(title, 17, textPrimary, true));
        TextView roleView = text(role, 14, textSecondary, false);
        roleView.setPadding(0, dp(2), 0, 0);
        texts.addView(roleView);
        if (linkLabel != null) {
            TextView link = text(linkLabel, 13, accent, false);
            link.setPadding(0, dp(4), 0, 0);
            texts.addView(link);
        }
        card.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        if (url != null) {
            ImageView chevron = new ImageView(this);
            chevron.setImageDrawable(new IconDrawable(IconDrawable.CHEVRON_RIGHT, accent));
            card.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
            card.setOnClickListener(v -> openUrl(url));
            card.setForeground(ripple(false));
        }

        LinearLayout.LayoutParams params = matchWidth();
        params.topMargin = dp(10);
        card.setLayoutParams(params);
        return card;
    }

    /** A dialog card with a title and subtitle, like the About card. */
    private LinearLayout cardBox(String title, String subtitle) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(24), dp(24), dp(24), dp(24));
        box.setBackground(rounded(dark ? 0xFF0B0B0B : 0xFFFFFFFF, 28));
        TextView titleView = text(title, 24, textPrimary, true);
        titleView.setGravity(Gravity.CENTER);
        box.addView(titleView, matchWidth());
        TextView subtitleView = text(subtitle, 14, textSecondary, false);
        subtitleView.setGravity(Gravity.CENTER);
        subtitleView.setPadding(0, dp(4), 0, dp(16));
        box.addView(subtitleView, matchWidth());
        return box;
    }

    private void showCard(LinearLayout box) {
        ScrollView wrapper = new ScrollView(this);
        wrapper.addView(box);
        AlertDialog dialog = new AlertDialog.Builder(this, dialogTheme()).setView(wrapper).create();
        dialog.show();
        if (dialog.getWindow() != null) dialog.getWindow().setBackgroundDrawable(new ColorDrawable(0));
    }

    private TextView sectionTitle(String title) {
        TextView view = text(title, 18, textPrimary, true);
        view.setGravity(Gravity.CENTER);
        view.setPadding(0, dp(24), 0, dp(12));
        return view;
    }

    private void addLink(LinearLayout links, String icon, String title, View.OnClickListener onClick) {
        if (links.getChildCount() > 0) links.addView(linkDivider());
        links.addView(linkRow(icon, title, onClick));
    }

    private View linkRow(String icon, String title, View.OnClickListener onClick) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(18), dp(18), dp(14), dp(18));
        row.setBackground(ripple(false));
        row.setOnClickListener(onClick);

        ImageView iconView = new ImageView(this);
        iconView.setImageDrawable(new IconDrawable(icon, accent));
        row.addView(iconView, new LinearLayout.LayoutParams(dp(26), dp(26)));

        TextView label = text(title, 18, textPrimary, true);
        label.setPadding(dp(20), 0, 0, 0);
        row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        ImageView chevron = new ImageView(this);
        chevron.setImageDrawable(new IconDrawable(IconDrawable.CHEVRON_RIGHT, accent));
        row.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
        return row;
    }

    private View linkDivider() {
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
            Downloads.toast(this, "Tidak bisa membuka link");
        }
    }

    // endregion

    // region Backup

    private void exportSettings() {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(BRAND, Settings.exportJson()));
            Downloads.toast(this, "Pengaturan disalin ke clipboard");
        } catch (Exception e) {
            Downloads.toast(this, "Ekspor gagal: " + e.getMessage());
        }
    }

    private void importSettings() {
        EditText input = new EditText(this);
        input.setHint("Tempel cadangan pengaturan di sini");
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
                .setTitle("Impor pengaturan")
                .setView(box)
                .setPositiveButton("Impor", (dialog, which) -> {
                    try {
                        int count = Settings.importJson(input.getText().toString());
                        Downloads.toast(this, count + " pengaturan diimpor");
                        refresh();
                        showRestartBanner();
                    } catch (Exception e) {
                        Downloads.toast(this, "Cadangan tidak valid");
                    }
                })
                .setNegativeButton("Batal", null)
                .show();
    }

    private void resetSettings() {
        new AlertDialog.Builder(this, dialogTheme())
                .setTitle("Kembalikan ke default?")
                .setMessage("Semua pengaturan " + BRAND + " akan diatur ulang, termasuk lokasi download.")
                .setPositiveButton("Atur ulang", (dialog, which) -> {
                    Settings.resetAll();
                    Downloads.toast(this, "Pengaturan dikembalikan ke default");
                    refresh();
                    showRestartBanner();
                })
                .setNegativeButton("Batal", null)
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
                .setTitle("Folder utama")
                .setSingleChoiceItems(dirs, checked, (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_BASE_DIR, dirs[which]);
                    refresh();
                    dialog.dismiss();
                })
                .setNegativeButton("Batal", null)
                .show();
    }

    private void editFolder() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setText(Settings.downloadFolder());
        input.setHint(Settings.DEFAULT_DOWNLOAD_FOLDER);
        input.setSelection(input.getText().length());

        TextView help = text("Pakai \"/\" untuk subfolder bertingkat, misalnya LinkedIn/Media. "
                + "Kosongkan untuk menyimpan langsung di folder utama.", 13, textSecondary, false);
        help.setPadding(0, dp(8), 0, 0);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(24), dp(8), dp(24), 0);
        box.addView(input);
        box.addView(help);

        new AlertDialog.Builder(this, dialogTheme())
                .setTitle("Nama subfolder")
                .setView(box)
                .setPositiveButton("Simpan", (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.sanitizeFolder(input.getText().toString()));
                    refresh();
                })
                .setNeutralButton("Default", (dialog, which) -> {
                    Settings.setString(Settings.DOWNLOAD_FOLDER, Settings.DEFAULT_DOWNLOAD_FOLDER);
                    refresh();
                })
                .setNegativeButton("Batal", null)
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

        TextView message = text("Buka ulang LinkedIn untuk menerapkan semua perubahan.", 14, 0xFFFFFFFF, false);
        banner.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView action = text("BUKA ULANG", 14, 0xFF2DBCB1, true);
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
        button.setContentDescription(description);
        int pad = dp(13);
        button.setPadding(pad, pad, pad, pad);
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(50), dp(50)));
        return button;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
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

    private GradientDrawable outlined() {
        GradientDrawable drawable = rounded(surface, 20);
        drawable.setStroke(dp(1), divider);
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

    private String appVersion() {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), 0);
            return info.versionName;
        } catch (Exception e) {
            return "?";
        }
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
