package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.diagnostics.DebugLogShare;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.Descriptor;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.PrefsTransfer;
import app.afterglow.extension.settings.Registry;
import app.afterglow.extension.settings.TabStore;
import app.afterglow.extension.settings.ThemeColors;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.settings.ThemeDocument;
import app.afterglow.extension.settings.ThemeJson;
import app.afterglow.extension.settings.ScrubberImage;
import app.afterglow.extension.ui.SettingsModel.Page;
import app.afterglow.extension.ui.SettingsModel.PageType;
import app.afterglow.extension.ui.SettingsModel.Picker;
import app.afterglow.extension.ui.SettingsModel.Row;

/**
 * Hosts the Afterglow settings, opened from the Afterglow row in YouTube's
 * settings. The iOS pages, rows, pickers and search entries come from
 * {@link SettingsSpec}, generated from the transcription of the iOS Settings.x
 * (tools/ios-settings-ui.json), so pages, order, texts and stored values match
 * iOS. Installed upstream feature controls open in their original settings screen.
 * Built in code: the extension ships as a DEX without resources.
 */
public class AfterglowActivity extends Activity implements AfterglowPrefs.Listener {
    /** Optional extra: open straight to a registry destination id (e.g. "controlCenter"). */
    public static final String EXTRA_DESTINATION = "ytafterglow_destination";

    private static final int REQUEST_EXPORT = 0x7A01;
    private static final int REQUEST_IMPORT = 0x7A02;
    private static final int REQUEST_THEME_EXPORT = 0x7A03;
    private static final int REQUEST_THEME_IMPORT = 0x7A04;
    private static final int REQUEST_SCRUBBER_IMAGE = 0x7A05;
    private String pendingThemeExport;

    private final ArrayList<SettingsScreen> stack = new ArrayList<>();
    private final Map<String, View> rowViews = new HashMap<>();
    private final Handler handler = new Handler(Looper.getMainLooper());
    private RowViews views;
    private TextView titleView;
    private FrameLayout headerSlot;
    private ScrollView scroll;
    private LinearLayout content;
    private FrameLayout overlay;
    private String pendingHighlight;
    private boolean refreshPosted;
    private String cacheSize;
    private boolean cacheSizeLoading;
    private boolean paletteDirty;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DebugLog.initialize(this);
        // Settings can be the first activity after a cold shortcut launch.
        if (app.afterglow.extension.destinations.ExperimentRuntime.nativeHooksInstalled()) {
            app.afterglow.extension.destinations.ExperimentRuntime.onActivityCreate(this);
        }
        try {
            // The patch declares the activity with Theme.DeviceDefault.DayNight, whose action bar
            // would show the app label ("YouTube") above Afterglow's own navigation bar.
            requestWindowFeature(Window.FEATURE_NO_TITLE);
            views = new RowViews(this, RowViews.Palette.from(getResources().getConfiguration()));
            if (savedInstanceState != null) pendingThemeExport = savedInstanceState.getString("themeExport");
            showFrame();
            stack.add(screenFor(SettingsBehavior.page(SettingsSpec.ROOT)));
            String destination = getIntent() != null ? getIntent().getStringExtra(EXTRA_DESTINATION) : null;
            if (destination != null) openDestination(destination);
            render(0);
            AfterglowPrefs.addListener(this);
            if (Build.VERSION.SDK_INT >= 33) BackApi33.register(this);
        } catch (Throwable error) {
            Afterglow.error("AfterglowActivity.onCreate", error);
            finish();
        }
    }

    @Override
    protected void onDestroy() {
        AfterglowDestinations.onDestroy(this);
        AfterglowPrefs.removeListener(this);
        handler.removeCallbacksAndMessages(null);
        super.onDestroy();
    }

    /** The patch declares configChanges incl. uiMode, so dark/light switches arrive here. */
    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        int y = scroll != null ? scroll.getScrollY() : 0;
        views = new RowViews(this, RowViews.Palette.from(newConfig));
        showFrame();
        render(y);
    }

    @Override
    public void onBackPressed() {
        handleBack();
    }

    /** Back: pop one settings screen, or close the settings from the root. */
    void handleBack() {
        if (!stack.isEmpty() && top().onBack()) return;
        if (stack.size() > 1) pop();
        else finish();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putString("themeExport", pendingThemeExport);
    }

    /**
     * When the host app opts into predictive back (Android 13+), onBackPressed is no
     * longer called; this callback keeps sub-page back navigation working there.
     */
    private static final class BackApi33 {
        static void register(AfterglowActivity activity) {
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, activity::handleBack);
        }
    }

    /**
     * iOS ytag_refreshSettingsHierarchy: any preference change re-renders the visible screen.
     * Theme keys also rebuild the palette, so Theme Studio edits recolor these pages live.
     */
    @Override
    public void onChanged(String key) {
        runOnUiThread(() -> {
            if (key == null || key.startsWith("theme_")) paletteDirty = true;
            refresh();
        });
    }

    // ---------------------------------------------------------------- frame and stack

    RowViews views() {
        return views;
    }

    ScrollView scrollView() {
        return scroll;
    }

    FrameLayout overlay() {
        return overlay;
    }

    /**
     * Shows a freshly built page frame. The system bars are styled after setContentView: before
     * it the window has no decor, and Window.getInsetsController() throws on Android 16.
     */
    private void showFrame() {
        setContentView(buildFrame());
        applySystemBars(views.palette);
    }

    /**
     * Page frame: navigation bar (iOS-style back chevron and bold title, themed only when the
     * theme sets a navigation surface, YTAGNavigationAppearance), pinned header slot, scrolling
     * content, and an overlay for drags. The page background is the theme gradient or color.
     */
    private View buildFrame() {
        RowViews.Palette palette = views.palette;
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(palette.pageBackground());
        root.setFitsSystemWindows(true);

        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(views.dp(4), views.dp(4), views.dp(16), views.dp(4));
        bar.setBackgroundColor(palette.navBackground);
        ImageView back = new ImageView(this);
        back.setImageDrawable(new RowViews.ChevronDrawable(palette.navTint, true, views.dp(24)));
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setBackground(views.touchFeedback());
        back.setContentDescription("Back");
        back.setOnClickListener(v -> handleBack());
        bar.addView(back, new LinearLayout.LayoutParams(views.dp(48), views.dp(48)));
        titleView = views.text("", 20, palette.navForeground, true);
        titleView.setSingleLine(true);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        titleView.setPadding(views.dp(4), 0, 0, 0);
        bar.addView(titleView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        root.addView(bar);
        if (palette.navBorder != null) {
            View border = new View(this);
            border.setBackgroundColor(palette.navBorder);
            root.addView(border, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, views.dp(0.5f))));
        }

        headerSlot = new FrameLayout(this);
        root.addView(headerSlot);

        FrameLayout body = new FrameLayout(this);
        scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, 0, 0, views.dp(24));
        content.setClipChildren(false); // the wordmark glow spills past its header row
        scroll.addView(content);
        body.addView(scroll, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlay = new FrameLayout(this);
        body.addView(overlay, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(body, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        return root;
    }

    /**
     * Status and navigation bars follow the page (iOS bars sit on the page or themed surface).
     * Cosmetic only, so it never throws: a failure leaves the system's default bars.
     */
    private void applySystemBars(RowViews.Palette palette) {
        try {
            Window window = getWindow();
            // Installs the decor if it is missing; getInsetsController() needs it.
            View decor = window.getDecorView();
            int statusColor = palette.navBackground != android.graphics.Color.TRANSPARENT ? palette.navBackground
                    : (palette.gradient != null ? palette.gradient[0] : palette.background);
            int navigationColor = palette.gradient != null ? palette.gradient[1] : palette.background;
            // No-ops when the app targets Android 15+ (edge to edge); the page background shows instead.
            window.setStatusBarColor(statusColor);
            window.setNavigationBarColor(navigationColor);
            boolean lightStatus = ThemeColors.luminance(statusColor) > 0.5;
            boolean lightNavigation = ThemeColors.luminance(navigationColor) > 0.5;
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                WindowInsetsController controller = window.getInsetsController();
                if (controller != null) {
                    int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    int value = (lightStatus ? WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS : 0)
                            | (lightNavigation ? WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS : 0);
                    controller.setSystemBarsAppearance(value, mask);
                }
            } else {
                int flags = decor.getSystemUiVisibility();
                flags = lightStatus ? flags | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR : flags & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                flags = lightNavigation ? flags | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : flags & ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                decor.setSystemUiVisibility(flags);
            }
        } catch (Throwable error) {
            Afterglow.error("AfterglowActivity.applySystemBars", error);
        }
    }

    private SettingsScreen top() {
        return stack.get(stack.size() - 1);
    }

    void push(SettingsScreen screen) {
        top().scrollY = scroll.getScrollY();
        stack.add(screen);
        cacheSize = null; // iOS re-reads the cache size every time About is shown
        render(0);
    }

    void pop() {
        if (stack.size() <= 1) return;
        stack.remove(stack.size() - 1);
        render(top().scrollY);
    }

    /** Re-renders the visible screen, coalesced; waits while the screen is mid-gesture. */
    void refresh() {
        if (refreshPosted) return;
        refreshPosted = true;
        handler.post(() -> {
            refreshPosted = false;
            if (isFinishing() || stack.isEmpty()) return;
            if (top().isBusy()) {
                handler.postDelayed(this::refresh, 100);
                return;
            }
            int y = scroll.getScrollY();
            if (paletteDirty) {
                paletteDirty = false;
                views = new RowViews(this, RowViews.Palette.from(getResources().getConfiguration()));
                showFrame();
            }
            render(y);
        });
    }

    private void render(int scrollTo) {
        SettingsScreen screen = top();
        titleView.setText(screen.title());
        View pinned = screen.pinnedHeader();
        if (pinned == null) {
            headerSlot.removeAllViews();
        } else if (headerSlot.getChildCount() != 1 || headerSlot.getChildAt(0) != pinned) {
            headerSlot.removeAllViews();
            if (pinned.getParent() instanceof ViewGroup) ((ViewGroup) pinned.getParent()).removeView(pinned);
            headerSlot.addView(pinned);
        }
        content.removeAllViews();
        rowViews.clear();
        // UIKit grouped screens sit on the system grouped background (cleared over a theme gradient).
        content.setBackgroundColor(screen.grouped() && views.palette.gradient == null
                ? views.palette.groupedBackground : android.graphics.Color.TRANSPARENT);
        screen.build(content);
        String highlight = pendingHighlight;
        pendingHighlight = null;
        scroll.post(() -> {
            scroll.scrollTo(0, scrollTo);
            if (highlight != null) highlightRow(highlight);
        });
        screen.onShown();
    }

    private SettingsScreen screenFor(Page page) {
        if (page.type == PageType.SEARCH) return new SearchScreen();
        if (page.type == PageType.TAB_EDITOR) return new TabEditorScreen(this);
        return new PageScreen(page);
    }

    // ---------------------------------------------------------------- screens

    /** A list page (root or sub-page): optional real section title, then its rows in iOS order. */
    private final class PageScreen extends SettingsScreen {
        private final Page page;

        PageScreen(Page page) {
            this.page = page;
        }

        @Override
        String title() {
            return page.navTitle.get();
        }

        @Override
        void build(LinearLayout list) {
            if (page.type == PageType.ROOT) {
                list.addView(views.wordmarkHeader());
                if (SettingsBehavior.keyVisible("destination.controlCenter"))
                    list.addView(views.detailRow("Control Center", "Vault, quick controls, themes and recovery tools.", null,
                            true, v -> navigateDestination("controlCenter")));
                if (MorpheSettingsBridge.isInstalled()) {
                    list.addView(views.detailRow("Additional features", "Original Morphe feature settings.", null,
                            true, v -> MorpheSettingsBridge.open(AfterglowActivity.this)));
                    list.addView(views.spacer());
                }
            }
            else if (page.sectionTitle != null) list.addView(views.sectionTitle(page.sectionTitle.get()));
            if ("page:vault".equals(page.id) && SettingsBehavior.keyVisible("destination.vault")) {
                list.addView(views.detailRow("Open Vault", "Saved media, imports and your download queue.", null,
                        true, v -> app.afterglow.extension.ui.DownloadsUi.openVault(AfterglowActivity.this)));
                list.addView(views.spacer());
            }
            for (Row row : page.rows) addRow(list, row);
            if ("page:about.credits".equals(page.id)) {
                list.addView(views.spacer());
                list.addView(views.header("Android open source", "Includes source adapted from Morphe and ReVanced."));
                list.addView(views.detailRow("Open-source notices", "Attribution and notices for the Android patches.", null,
                        true, v -> showLicenseAsset("Open-source notices", "NOTICE")));
                list.addView(views.detailRow("GNU General Public License", "Version 3", null,
                        true, v -> showLicenseAsset("GNU General Public License", "LICENSE")));
            }
        }
    }

    /** Checkmark list for a picker row, plus any rows iOS shows under the options (Comments reset). */
    private final class PickerScreen extends SettingsScreen {
        private final Row row;

        PickerScreen(Row row) {
            this.row = row;
        }

        @Override
        String title() {
            return row.pickerTitle != null ? row.pickerTitle.get() : row.displayTitle();
        }

        @Override
        void build(LinearLayout list) {
            List<SettingsBehavior.Choice> choices = SettingsBehavior.choices(row);
            if (row.picker == Picker.ANCHOR || row.picker == Picker.STARTUP_TAB) {
                List<String> supported = app.afterglow.extension.navigation.NativeTabs.supportedTabs();
                choices.removeIf(choice -> !supported.contains(choice.tabId));
            }
            int selected = SettingsBehavior.selectedIndex(row, choices);
            for (int i = 0; i < choices.size(); i++) {
                SettingsBehavior.Choice choice = choices.get(i);
                int index = i;
                list.addView(views.optionRow(choice.label, i == selected, v -> pick(choice, index)));
            }
            if (row.trailingRows != null) {
                for (Row trailing : row.trailingRows) {
                    if (SettingsBehavior.shownInGroup(trailing, row.trailingRows)) addRowView(list, trailing);
                }
            }
        }

        private void pick(SettingsBehavior.Choice choice, int index) {
            if (row.picker == Picker.GLOW_STRENGTH && index == 3) {
                numberDialog(SettingsBehavior.text(row.dialogTitle), SettingsBehavior.text(row.dialogMessage),
                        AfterglowPrefs.getInt("theme_glowStrengthCustom"), row.min, row.max, row.fallback, row.suffix,
                        SettingsBehavior::saveCustomGlowStrength);
                return;
            }
            SettingsBehavior.select(row, choice, index);
            if (row.popsAfterSelect) pop();
            else refresh();
        }
    }

    /** "Search Settings" (iOS YTAGSettingsSearchController, Settings.x:950-1084). */
    private final class SearchScreen extends SettingsScreen {
        private final List<SearchIndex.Item> items = SearchIndex.build(SettingsBehavior.advancedMode());
        private EditText field;
        private boolean focused;

        @Override
        String title() {
            return SettingsBehavior.page(SettingsSpec.SEARCH_PAGE).navTitle.get();
        }

        @Override
        boolean grouped() {
            return true;
        }

        @Override
        View pinnedHeader() {
            if (field == null) {
                // UISearchBar look: rounded tertiary-fill field under the navigation bar.
                field = new EditText(AfterglowActivity.this);
                field.setSingleLine(true);
                field.setHint(SettingsSpec.SEARCH_PLACEHOLDER.get());
                field.setTextColor(views.palette.groupedLabel);
                field.setHintTextColor(views.palette.groupedSecondaryLabel);
                android.graphics.drawable.GradientDrawable fill = new android.graphics.drawable.GradientDrawable();
                fill.setColor(views.palette.searchFieldFill);
                fill.setCornerRadius(views.dp(10));
                field.setBackground(fill);
                field.setPadding(views.dp(12), views.dp(8), views.dp(12), views.dp(8));
                field.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
                field.setInputType(InputType.TYPE_CLASS_TEXT);
                field.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                params.setMargins(views.dp(16), 0, views.dp(16), views.dp(8));
                field.setLayoutParams(params);
                field.addTextChangedListener(new TextWatcher() {
                    @Override
                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

                    @Override
                    public void onTextChanged(CharSequence s, int start, int before, int count) {}

                    @Override
                    public void afterTextChanged(Editable s) {
                        render(0);
                    }
                });
            }
            return field;
        }

        @Override
        void build(LinearLayout list) {
            String query = field == null ? "" : field.getText().toString();
            List<SearchIndex.Item> results = SearchIndex.filter(items, query);
            LinearLayout card = views.groupedCard();
            if (results.isEmpty()) {
                card.addView(views.emptyRow(SettingsSpec.SEARCH_EMPTY_TITLE.get(), SettingsSpec.SEARCH_EMPTY_SUBTITLE.get()));
            } else {
                for (int i = 0; i < results.size(); i++) {
                    SearchIndex.Item item = results.get(i);
                    card.addView(views.resultRow(item.title, item.subtitle, i < results.size() - 1, v -> openSearchEntry(item.entry)));
                }
            }
            LinearLayout.LayoutParams params = views.groupedCardParams();
            params.topMargin = views.dp(8);
            list.addView(card, params);
        }

        @Override
        void onShown() {
            if (focused || field == null) return;
            focused = true;
            field.requestFocus();
            field.post(() -> {
                InputMethodManager input = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                if (input != null) input.showSoftInput(field, InputMethodManager.SHOW_IMPLICIT);
            });
        }
    }

    /** Screens whose feature is not ported yet: titled like iOS, showing the iOS description. */
    private final class PlaceholderScreen extends SettingsScreen {
        private final String title;
        private final String body;

        PlaceholderScreen(String title, String body) {
            this.title = title;
            this.body = body;
        }

        @Override
        String title() {
            return title;
        }

        @Override
        void build(LinearLayout list) {
            if (body != null && !body.isEmpty()) list.addView(views.paragraph(body));
        }
    }

    // ---------------------------------------------------------------- rows

    /** Adds a row when it shows on this build (iOS condition plus installed tweaks). */
    private void addRow(LinearLayout list, Row row) {
        if (SettingsBehavior.shown(row)) addRowView(list, row);
    }

    private void addRowView(LinearLayout list, Row row) {
        View view;
        switch (row.kind) {
            case INFO:
                if (row.role == SettingsModel.Role.SPACER) view = views.spacer();
                else if (row.role == SettingsModel.Role.HEADER) view = views.header(row.displayTitle(), SettingsBehavior.text(row.description));
                else view = views.caption(SettingsBehavior.text(row.description));
                break;
            case SWITCH:
                view = views.switchRow(row.displayTitle(), SettingsBehavior.switchDescription(row),
                        SettingsBehavior.switchValue(row), SettingsBehavior.switchEnabled(row),
                        (button, checked) -> onSwitch(row, button, checked));
                break;
            default: {
                if (row.detail == SettingsModel.Detail.CACHE_SIZE && cacheSize == null) loadCacheSize();
                String detail = SettingsBehavior.detail(row, cacheSize);
                String description = "destination.themeStudio".equals(row.registryKey)
                        ? "Presets, custom themes, a color editor, and your theme library."
                        : SettingsBehavior.text(row.description);
                view = views.detailRow(row.displayTitle(), description, detail, true, v -> onRowTap(row));
                break;
            }
        }
        list.addView(view);
        rowViews.put(row.id, view);
    }

    /** iOS switchWithTitle switchBlock (Settings.x:1400-1454) plus the Debug HUD switch (3271-3281). */
    private void onSwitch(Row row, CompoundButton button, boolean checked) {
        String key = row.key;
        if ("shortsOnlyMode".equals(key)) {
            // Written only after confirmation; No (or dismissing) puts the switch back.
            confirm(L10n.get("Warning", "Warning"), L10n.get("ShortsOnlyWarning", null),
                    L10n.get("Yes", "Yes"), L10n.get("No", "No"),
                    () -> AfterglowPrefs.setBool(key, checked), this::refresh);
            return;
        }
        AfterglowPrefs.setBool(key, checked);
        if (LiteMode.KEY.equals(key)) {
            liteModeRestartAlert(checked);
        } else if ("playlistOldMinibar".equals(key)) {
            playlistMinibarRestartAlert();
        } else if ("debugLogFirehose".equals(key) && checked) {
            AfterglowPrefs.setBool("debugLogEnabled", true);
        } else if ("debugLogEnabled".equals(key) && !checked) {
            AfterglowPrefs.setBool("debugLogFirehose", false);
            AfterglowPrefs.setBool("debugHUDEnabled", false);
        } else if ("debugHUDEnabled".equals(key) && checked) {
            AfterglowPrefs.setBool("debugLogEnabled", true);
        }
    }

    private void onRowTap(Row row) {
        switch (row.kind) {
            case PICKER:
                // iOS anchor pickers do nothing when there are no native tabs (Settings.x:1805).
                if (row.picker == Picker.ANCHOR && TabStore.nativeTabs().isEmpty()) return;
                push(new PickerScreen(row));
                break;
            case TEXT:
                numberDialog(row.displayTitle(), SettingsBehavior.text(row.description), AfterglowPrefs.getInt(row.key),
                        row.min, row.max, row.fallback, row.suffix, value -> AfterglowPrefs.setInt(row.key, value));
                break;
            case ACTION:
                runAction(row);
                break;
            case DESTINATION:
                if ("destination.themeStudio".equals(row.registryKey)) {
                    push(new ThemeStudioScreen(this));
                } else if ("destination.glowLab".equals(row.registryKey)) {
                    push(new GlowLabScreen(this));
                } else if (row.target == SettingsModel.Target.PAGE) {
                    push(screenFor(SettingsBehavior.page(row.targetPage)));
                } else {
                    Descriptor descriptor = AfterglowPrefs.descriptor(row.registryKey);
                    if (descriptor != null && descriptor.destination != null) navigateDestination(descriptor.destination);
                }
                break;
            case LINK:
                openUrl(row.url);
                break;
            case CUSTOM:
                if (row.custom == SettingsModel.Custom.COLOR_PICKER) colorDialog(row);
                else if (row.custom == SettingsModel.Custom.IMAGE_PICKER)
                    startDocument(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE),
                            REQUEST_SCRUBBER_IMAGE, "No image picker is available.");
                break;
            default:
                break;
        }
    }

    private void colorDialog(Row row) {
        EditText input = new EditText(this); input.setSingleLine(true);
        Integer color = ThemeColors.color(row.key);
        input.setText(color == null ? "#" : String.format(Locale.ROOT, "#%08X", color));
        AlertDialog dialog = new AlertDialog.Builder(this).setTitle(row.displayTitle())
                .setMessage("Enter #RRGGBB or #AARRGGBB.").setView(input)
                .setNegativeButton("Cancel", null).setNeutralButton("Use Default", (d, w) -> AfterglowPrefs.remove(row.key))
                .setPositiveButton("Apply", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            Integer selected = ThemeColors.decode(input.getText().toString());
            if (selected == null) { input.setError("Enter a valid hex color."); return; }
            AfterglowPrefs.setInt(row.key, selected); dialog.dismiss();
        })); dialog.show();
    }

    // ---------------------------------------------------------------- actions

    private void runAction(Row row) {
        switch (row.action) {
            case RESET_DEFAULTS:
                // iOS resetDefaultsItemWithKeys (Settings.x:1486-1519): no confirmation, toast "Done".
                boolean restartPlaylist = false;
                for (String key : SettingsBehavior.resetKeys(row)) {
                    if ("playlistOldMinibar".equals(key) && AfterglowPrefs.getBool(key)) restartPlaylist = true;
                    AfterglowPrefs.remove(key);
                }
                toast(L10n.get("Done", "Done"));
                if (restartPlaylist) playlistMinibarRestartAlert();
                break;
            case RESET_ALL_COLORS:
                confirm(L10n.get("ResetAllColors", "Reset All Colors"),
                        "This removes every preset, custom color, and gradient value in Themes. Restart YouTube to fully return to the default look.",
                        L10n.get("ResetAndRestart", "Reset & Restart"), L10n.get("Cancel", "Cancel"),
                        () -> {
                            ThemeStore.resetToSystem();
                            AppRestart.restart(this);
                        }, null);
                break;
            case CLEAR_CACHE:
                clearCache();
                break;
            case EXPORT_PREFERENCES:
                startDocument(new Intent(Intent.ACTION_CREATE_DOCUMENT)
                        .addCategory(Intent.CATEGORY_OPENABLE)
                        .setType("application/octet-stream")
                        .putExtra(Intent.EXTRA_TITLE, PrefsTransfer.FILE_NAME), REQUEST_EXPORT,
                        L10n.get("Error.FailedToExport", "Failed to export preferences"));
                break;
            case IMPORT_PREFERENCES:
                confirm(L10n.get("ImportPreferences", "Import preferences"), L10n.get("PreImportMessage", null),
                        L10n.get("Yes", "Yes"), L10n.get("No", "No"),
                        () -> startDocument(new Intent(Intent.ACTION_OPEN_DOCUMENT)
                                .addCategory(Intent.CATEGORY_OPENABLE)
                                .setType("*/*"), REQUEST_IMPORT,
                                L10n.get("Error.FailedToImport", "Failed to import preferences")), null);
                break;
            case RESET_SETTINGS:
                confirm(L10n.get("Warning", "Warning"), L10n.get("ResetMessage", null),
                        L10n.get("Yes", "Yes"), L10n.get("No", "No"),
                        () -> {
                            AfterglowPrefs.resetAll();
                            AppRestart.restart(this);
                        }, null);
                break;
            case SHARE_DEBUG_LOG:
                DebugLogShare.show(this);
                break;
            case CLEAR_DEBUG_LOG:
                DebugLog.clear();
                toast(L10n.get("Done", "Done"));
                break;
            case USE_DEFAULT_COLOR:
                // iOS removes the color and pops this sub-page (Settings.x:2081-2087).
                AfterglowPrefs.remove(row.actionKeys[0]);
                pop();
                break;
            case REMOVE_IMAGE:
                AfterglowPrefs.remove(row.actionKeys[0]);
                break;
            default:
                break;
        }
    }

    /** iOS Lite Mode restart alert (Settings.x:617-634); its texts are English literals on iOS. */
    private void liteModeRestartAlert(boolean enabled) {
        confirm(enabled ? "Lite Mode Enabled" : "Lite Mode Disabled",
                "Lite Mode needs a restart before the startup debloat profile fully applies.",
                "Restart Now", "Later", () -> AppRestart.restart(this), null);
    }

    private void playlistMinibarRestartAlert() {
        confirm(L10n.get("PlaylistOldMinibar", "Old playlist minibar"),
                "Restart YouTube to switch playlist bar layouts.",
                "Restart Now", "Later", () -> AppRestart.restart(this), null);
    }

    private void clearCache() {
        File cache = getCacheDir();
        new Thread(() -> {
            deleteChildren(cache);
            runOnUiThread(() -> {
                cacheSize = null;
                refresh();
            });
        }, "afterglow-clear-cache").start();
        toast(L10n.get("Done", "Done"));
    }

    /** iOS GetCacheSize runs inline; Android walks the cache folder off the main thread. */
    private void loadCacheSize() {
        if (cacheSizeLoading) return;
        cacheSizeLoading = true;
        File cache = getCacheDir();
        new Thread(() -> {
            String text = byteCount(sizeOf(cache));
            runOnUiThread(() -> {
                cacheSizeLoading = false;
                cacheSize = text;
                refresh();
            });
        }, "afterglow-cache-size").start();
    }

    private static long sizeOf(File file) {
        if (file == null) return 0;
        if (file.isFile()) return file.length();
        long total = 0;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) total += sizeOf(child);
        return total;
    }

    private static void deleteChildren(File directory) {
        File[] children = directory == null ? null : directory.listFiles();
        if (children == null) return;
        for (File child : children) {
            if (child.isDirectory()) deleteChildren(child);
            //noinspection ResultOfMethodCallIgnored
            child.delete();
        }
    }

    /** NSByteCountFormatter, file count style (iOS GetCacheSize): 1000-based units. */
    static String byteCount(long bytes) {
        if (bytes <= 0) return "Zero KB";
        if (bytes < 1000) return bytes + (bytes == 1 ? " byte" : " bytes");
        if (bytes < 1000L * 1000) return Math.round(bytes / 1000.0) + " KB";
        if (bytes < 1000L * 1000 * 1000) return String.format(Locale.getDefault(), "%.1f MB", bytes / 1e6);
        return String.format(Locale.getDefault(), "%.2f GB", bytes / 1e9);
    }

    /**
     * There is no FileProvider in the extension, so export/import go through the
     * system document picker instead of the iOS share sheet / document picker.
     */
    private void startDocument(Intent intent, int request, String failure) {
        try {
            startActivityForResult(intent, request);
        } catch (Throwable error) {
            toast(failure);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (AfterglowDestinations.onActivityResult(this, requestCode, resultCode, data)) return;
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        if (requestCode == REQUEST_SCRUBBER_IMAGE) {
            new Thread(() -> {
                try (InputStream input = getContentResolver().openInputStream(uri)) {
                    if (input == null) throw new IOException("Could not open the selected image.");
                    String image = ScrubberImage.read(input);
                    runOnUiThread(() -> {
                        if (!isFinishing() && !isDestroyed()) { AfterglowPrefs.setString(ScrubberImage.KEY, image); toast("Scrubber image saved"); }
                    });
                } catch (Exception error) { runOnUiThread(() -> { if (!isFinishing() && !isDestroyed()) alert("Scrubber image", error.getMessage()); }); }
            }, "Afterglow-scrubber-image").start();
        } else if (requestCode == REQUEST_THEME_EXPORT || requestCode == REQUEST_THEME_IMPORT) {
            String export = pendingThemeExport;
            pendingThemeExport = null;
            new Thread(() -> {
                try {
                    if (requestCode == REQUEST_THEME_EXPORT) {
                        if (export == null) throw new IOException("The theme export expired. Please export it again.");
                        try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
                            if (out == null) throw new IOException("Could not open the selected file.");
                            out.write(export.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                        }
                        runOnUiThread(() -> toast("Theme exported"));
                    } else {
                        byte[] bytes;
                        try (InputStream in = getContentResolver().openInputStream(uri)) {
                            if (in == null) throw new IOException("Could not open the selected file.");
                            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                            byte[] buffer = new byte[8192]; int count;
                            while ((count = in.read(buffer)) != -1) {
                                if (out.size() + count > ThemeJson.MAX_LENGTH) throw new IOException("Theme file is too large.");
                                out.write(buffer, 0, count);
                            }
                            bytes = out.toByteArray();
                        }
                        ThemeDocument theme;
                        String text = new String(bytes, java.nio.charset.StandardCharsets.UTF_8).trim();
                        if (text.startsWith("\uFEFF")) text = text.substring(1);
                        if (text.startsWith("<")) theme = ThemeDocument.fromMap(PrefsTransfer.parsePropertyList(bytes));
                        else theme = ThemeDocument.parse(text);
                        ThemeDocument imported = theme;
                        runOnUiThread(() -> {
                            if (isFinishing() || isDestroyed()) return;
                            new AlertDialog.Builder(this).setTitle("Import " + imported.name + "?")
                                    .setMessage("Save and activate this theme, then restart YouTube?")
                                    .setNegativeButton("Cancel", null).setPositiveButton("Import & Restart", (d, w) -> {
                                        try { ThemeStore.importTheme(imported); AppRestart.restart(this); }
                                        catch (IllegalArgumentException error) { alert("Could not import theme", error.getMessage()); }
                                    }).show();
                        });
                    }
                } catch (Exception error) {
                    runOnUiThread(() -> { if (!isFinishing() && !isDestroyed()) alert("Theme file", error.getMessage()); });
                }
            }, "Afterglow-theme-file").start();
        } else if (requestCode == REQUEST_EXPORT) {
            try (OutputStream out = getContentResolver().openOutputStream(uri)) {
                if (out == null) throw new IOException("no output stream");
                out.write(PrefsTransfer.exportPlist());
                toast(L10n.get("Done", "Done"));
            } catch (Throwable error) {
                toast(L10n.get("Error.FailedToExport", "Failed to export preferences"));
            }
        } else if (requestCode == REQUEST_IMPORT) {
            boolean oldPlaylistBar = AfterglowPrefs.getBool("playlistOldMinibar");
            try (InputStream in = getContentResolver().openInputStream(uri)) {
                if (in == null) throw new IOException("no input stream");
                PrefsTransfer.importPlist(in);
                toast(L10n.get("Done", "Done"));
                if (SettingsBehavior.keyVisible("playlistOldMinibar")
                        && oldPlaylistBar != AfterglowPrefs.getBool("playlistOldMinibar")) {
                    playlistMinibarRestartAlert();
                }
            } catch (PrefsTransfer.ImportException error) {
                toast(error.getMessage());
            } catch (Throwable error) {
                toast(L10n.get("Error.FailedToImport", "Failed to import preferences"));
            }
            refresh();
        }
    }

    void importThemeFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*")
                .addCategory(Intent.CATEGORY_OPENABLE);
        try { startActivityForResult(intent, REQUEST_THEME_IMPORT); }
        catch (Exception error) { alert("Import Theme", "No file picker is available."); }
    }

    void exportThemeFile(ThemeDocument document) {
        pendingThemeExport = document.json();
        String name = ThemeDocument.normalizedName(document.name).replaceAll("[^\\p{L}\\p{N}._-]", "-");
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT).setType("application/json")
                .addCategory(Intent.CATEGORY_OPENABLE).putExtra(Intent.EXTRA_TITLE, name + ".afterglow-theme.json");
        try { startActivityForResult(intent, REQUEST_THEME_EXPORT); }
        catch (Exception error) { pendingThemeExport = null; alert("Export Theme", "No file picker is available."); }
    }

    // ---------------------------------------------------------------- search navigation

    /** Opens a search entry's page chain and flashes its row (iOS ytag_openSettingsSearchEntry). */
    private void openSearchEntry(SettingsModel.SearchEntry entry) {
        View focus = getCurrentFocus();
        if (focus != null) {
            InputMethodManager input = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
            if (input != null) input.hideSoftInputFromWindow(focus.getWindowToken(), 0);
        }
        stack.clear();
        for (String pageId : entry.pageChain) stack.add(screenFor(SettingsBehavior.page(pageId)));
        pendingHighlight = entry.rowId;
        render(0);
    }

    private void highlightRow(String rowId) {
        View row = rowViews.get(rowId);
        if (row == null) return; // hidden by advanced mode or a capability: the page still opens
        int y = row.getTop() + row.getHeight() / 2 - scroll.getHeight() / 2;
        scroll.scrollTo(0, Math.max(0, y));
        views.flash(row);
    }

    private void openDestination(String destination) {
        if ("vault".equals(destination) && SettingsBehavior.keyVisible("destination.vault")) {
            DownloadsUi.openVault(this);
            return;
        }
        SettingsScreen screen = destinationScreen(destination);
        if (screen != null) stack.add(screen);
    }

    private void navigateDestination(String destination) {
        if ("vault".equals(destination) && SettingsBehavior.keyVisible("destination.vault")) {
            DownloadsUi.openVault(this);
            return;
        }
        SettingsScreen screen = destinationScreen(destination);
        if (screen != null) push(screen);
    }

    private SettingsScreen destinationScreen(String destination) {
        AfterglowDestinations.Navigator navigator = new AfterglowDestinations.Navigator() {
            @Override public void openDestination(String target) { navigateDestination(target); }
            @Override public void openSettingsPage(String pageId) {
                SettingsModel.Page page = SettingsBehavior.page(pageId);
                if (page != null) push(screenFor(page));
            }
            @Override public void closeToNativeHome() { finish(); }
        };
        if ("experimentSafety".equals(destination) && SettingsBehavior.keyVisible("destination.experimentLab"))
            return AfterglowDestinations.create(this, destination, navigator);
        for (Descriptor descriptor : Registry.ALL) {
            // Destinations follow their tweak, like their settings rows.
            if (destination.equals(descriptor.destination) && SettingsBehavior.keyVisible(descriptor.key)) {
                return "destination.themeStudio".equals(descriptor.key) ? new ThemeStudioScreen(this)
                        : "destination.glowLab".equals(descriptor.key) ? new GlowLabScreen(this)
                        : AfterglowDestinations.create(this, destination, navigator);
            }
        }
        return null;
    }

    // ---------------------------------------------------------------- dialogs

    void alert(String title, String message) {
        new AlertDialog.Builder(this).setTitle(title).setMessage(message).setPositiveButton("OK", null).show();
    }

    private void showLicenseAsset(String title, String fileName) {
        try (InputStream input = getAssets().open("afterglow/licenses/" + fileName)) {
            java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int length;
            while ((length = input.read(buffer)) != -1) bytes.write(buffer, 0, length);
            alert(title, new String(bytes.toByteArray(), java.nio.charset.StandardCharsets.UTF_8));
        } catch (IOException error) {
            Afterglow.error("AfterglowActivity.showLicenseAsset", error);
            alert(title, "Could not read the bundled notice.");
        }
    }

    private void confirm(String title, String message, String positive, String negative, Runnable onPositive, Runnable onNegative) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this).setTitle(title).setMessage(message)
                .setPositiveButton(positive, (dialog, which) -> {
                    if (onPositive != null) onPositive.run();
                })
                .setNegativeButton(negative, (dialog, which) -> {
                    if (onNegative != null) onNegative.run();
                });
        if (onNegative != null) builder.setOnCancelListener(dialog -> onNegative.run());
        builder.show();
    }

    interface IntSink {
        void accept(int value);
    }

    /**
     * iOS themePresentGlowNumberInput (Settings.x:1990-2015): number-pad alert with
     * "<description>\nRange: <min>-<max><suffix>", Cancel and Save; the value is clamped.
     */
    private void numberDialog(String title, String description, int current, int min, int max, int fallback,
                              String suffix, IntSink onSave) {
        EditText field = new EditText(this);
        field.setInputType(InputType.TYPE_CLASS_NUMBER);
        field.setText(String.valueOf(Math.max(min, Math.min(current, max))));
        field.setHint(String.valueOf(fallback));
        field.setSelectAllOnFocus(true);
        FrameLayout wrapper = new FrameLayout(this);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(views.dp(20), views.dp(8), views.dp(20), 0);
        wrapper.addView(field, params);
        String message = (description == null ? "" : description) + "\nRange: " + min + "-" + max + (suffix == null ? "" : suffix);
        new AlertDialog.Builder(this).setTitle(title).setMessage(message).setView(wrapper)
                .setNegativeButton(L10n.get("Cancel", "Cancel"), null)
                .setPositiveButton(L10n.get("Save", "Save"), (dialog, which) -> {
                    int value;
                    try {
                        value = Integer.parseInt(field.getText().toString().trim());
                    } catch (NumberFormatException error) {
                        value = 0; // iOS integerValue of non-numeric text
                    }
                    onSave.accept(Math.max(min, Math.min(value, max)));
                })
                .show();
    }

    private void toast(String message) {
        if (message == null || message.isEmpty()) return;
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }

    private void openUrl(String url) {
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (Throwable error) {
            Afterglow.error("AfterglowActivity.openUrl", error);
        }
    }
}
