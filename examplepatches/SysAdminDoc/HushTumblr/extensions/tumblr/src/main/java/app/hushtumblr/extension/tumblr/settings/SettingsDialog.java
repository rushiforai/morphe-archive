/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtumblr.extension.tumblr.settings;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.TextUtils;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;

/**
 * The HushTumblr screen: a full screen, black dialog with a title bar and the preference list.
 * It is a framework dialog fragment, so it needs no activity of its own and Back closes it.
 */
@SuppressWarnings("deprecation") // Framework fragments are what the shared preference code builds on.
public final class SettingsDialog extends DialogFragment {
    /**
     * The preference list's container. Fixed, because the child manager saves the page with this
     * id and puts it back into a view with the same id after rotation or process recreation. A
     * fresh View.generateViewId() on each onCreateView left the restored page no container.
     * Outside both the generated-id range and aapt's 0x7f ids, and nothing else in this dialog
     * carries an id.
     */
    static final int CONTAINER_ID = 0x48464301;
    static final String MOUNT_ERROR = "hushtumblr_mount_error";
    static final String MOUNT_RETRY = "hushtumblr_mount_retry";
    static final String MOUNT_BACK = "hushtumblr_mount_back";
    private static final String MOUNT_FAILED_STATE = "hushtumblr_mount_failed";
    private static final String REPLACE_CHILD_STATE = "hushtumblr_replace_failed_child";
    private static final String PAGE_TITLE_STATE = "hushtumblr_page_title";
    private static final String PAGE_SUBTITLE_STATE = "hushtumblr_page_subtitle";
    private static final String PAGE_HOME_STATE = "hushtumblr_page_home";
    private static final String PAGE_QUERY_STATE = "hushtumblr_page_query";
    private static final String PAGE_RESULTS_STATE = "hushtumblr_page_results";
    /** The argument naming the page the screen opens on: a route of {@link SettingsNavigation}. */
    static final String START_PAGE = "hushtumblr_start_page";

    /** Thrown once before mounting, so a test reaches recovery even when no child exists. */
    static volatile RuntimeException failNextMount;

    private TextView pageTitle;
    private TextView eyebrow;
    private TextView pageSubtitle;
    private LinearLayout titleBar;
    private LinearLayout headingBlock;
    private ImageButton backButton;
    private boolean compactHeader;
    private int forcedCompactWidth = -1;
    private int forcedCompactHeight;
    private float forcedCompactFontScale;
    private LinearLayout searchBox;
    private EditText search;
    private TextView results;
    private int found;
    private final Runnable showFound = () -> {
        String count = L10n.quantity(results.getContext(), found, "%1$d setting found", "%1$d settings found", found);
        results.setVisibility(View.VISIBLE);
        if (!count.contentEquals(results.getText())) results.setText(count);
    };
    private boolean settingSearch;
    private FrameLayout container;
    private ScrollView recovery;
    private boolean mountFailed;
    private boolean replaceFailedChild;
    private boolean retryScheduled;
    private CharSequence mountedTitle = "HushTumblr";
    private CharSequence mountedSubtitle;
    private boolean mountedHome;
    private String mountedQuery = "";
    private int mountedResults = -1;
    private final Runnable retryMount = () -> {
        retryScheduled = false;
        if (!isAdded() || getView() == null || getDialog() == null || !getDialog().isShowing()) return;
        mountPage(true);
    };

    /**
     * The screen, opening on [page] when nothing saved says otherwise: the page a restart from the
     * restart row left. Null or empty opens the first page.
     */
    static SettingsDialog onPage(@Nullable String page) {
        SettingsDialog dialog = new SettingsDialog();
        if (page != null && !page.isEmpty()) {
            Bundle arguments = new Bundle();
            arguments.putString(START_PAGE, page);
            dialog.setArguments(arguments);
        }
        return dialog;
    }

    /** The page this screen was asked to open on, or "" for the first page. */
    String startPage() {
        Bundle arguments = getArguments();
        return arguments == null ? "" : arguments.getString(START_PAGE, "");
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setStyle(STYLE_NO_TITLE, ScreenColors.THEME);
        if (savedInstanceState != null) {
            mountFailed = savedInstanceState.getBoolean(MOUNT_FAILED_STATE);
            replaceFailedChild = savedInstanceState.getBoolean(REPLACE_CHILD_STATE);
            mountedTitle = savedInstanceState.getCharSequence(PAGE_TITLE_STATE, "HushTumblr");
            mountedSubtitle = savedInstanceState.getCharSequence(PAGE_SUBTITLE_STATE);
            mountedHome = savedInstanceState.getBoolean(PAGE_HOME_STATE);
            mountedQuery = savedInstanceState.getString(PAGE_QUERY_STATE, "");
            mountedResults = savedInstanceState.getInt(PAGE_RESULTS_STATE, -1);
        }
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        // What the framework's own onCreateDialog builds, with Back first taking the list back to
        // where it was before a section jump. Dialog's back callback on Android 13 and newer ends
        // in onBackPressed as well, so this covers the gesture and the key alike.
        Dialog dialog = new Dialog(HushTumblrPreferenceFragment.themed(getActivity()), getTheme()) {
            @Override
            public void dismiss() {
                try {
                    if (SettingsDialog.this.isAdded() && SettingsDialog.this.getActivity() != null) {
                        HushTumblrPreferenceFragment page = page();
                        if (page != null) page.closeOwnedDialogs();
                    }
                } finally {
                    super.dismiss();
                }
            }

            @Override
            public void onBackPressed() {
                HushTumblrPreferenceFragment page = page();
                if (!mountFailed && page != null && page.backFromJump()) return;
                super.onBackPressed();
            }
        };
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(ScreenColors.DEFAULT.background));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            // With three-button navigation Android lays a grey scrim under the buttons; the
            // screen is black edge to edge, so the scrim only shows as a grey band. The scrim and
            // the call to turn it off both came with Android 10.
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setNavigationBarContrastEnforced(false);
            window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        return dialog;
    }

    /** The settings page this dialog holds, or null before it's attached. */
    @Nullable
    private HushTumblrPreferenceFragment page() {
        Object page = getChildFragmentManager().findFragmentById(CONTAINER_ID);
        return page instanceof HushTumblrPreferenceFragment ? (HushTumblrPreferenceFragment) page : null;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        ScreenColors palette = ScreenColors.DEFAULT;
        Context context = inflater.getContext();
        LinearLayout root = new LinearLayout(context) {
            @Override protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                int width = MeasureSpec.getSize(widthMeasureSpec) - getPaddingLeft() - getPaddingRight();
                int height = MeasureSpec.getSize(heightMeasureSpec) - getPaddingTop() - getPaddingBottom();
                float fontScale = getResources().getConfiguration().fontScale;
                if (MeasureSpec.getMode(heightMeasureSpec) != MeasureSpec.UNSPECIFIED) {
                    updateHeaderForViewport(width, height, fontScale);
                }
                super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                if (!compactHeader && titleBar != null && container != null
                        && container.getMeasuredHeight() - container.getPaddingTop()
                        - container.getPaddingBottom() < dp(48)) {
                    forcedCompactWidth = width;
                    forcedCompactHeight = height;
                    forcedCompactFontScale = fontScale;
                    compactHeader = true;
                    applyHeaderLayout();
                    super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                }
            }
        };
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ScreenColors.DEFAULT.background);

        LinearLayout bar = new LinearLayout(context);
        titleBar = bar;
        bar.setOrientation(LinearLayout.VERTICAL);
        bar.setGravity(Gravity.START);

        ImageButton back = new ImageButton(context);
        backButton = back;
        android.graphics.drawable.Drawable arrow = SettingsIcons.icon(context, SettingsIcons.BACK, palette.title);
        arrow.setBounds(0, 0, dp(24), dp(24));
        arrow.setLayoutDirection(rightToLeft() ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR);
        back.setImageDrawable(arrow);
        back.setImageTintList(ScreenColors.dimmedWhenDisabled(palette.title));
        back.setPadding(dp(12), dp(12), dp(12), dp(12));
        back.setBackground(palette.interactive(back, palette.card, 10));
        back.setMinimumWidth(dp(48));
        back.setMinimumHeight(dp(48));
        back.setContentDescription(L10n.t(getContext(), "Back"));
        back.setTooltipText(L10n.t(getContext(), "Back"));
        // A screen reader calls it a button, as it would the back arrow of any other screen.
        back.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        back.setOnClickListener(v -> {
            HushTumblrPreferenceFragment page = page();
            if (!mountFailed && page != null && page.backFromJump()) return;
            SettingsEntry.onClosedByUser();
            dismissAllowingStateLoss();
        });
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));

        headingBlock = new LinearLayout(context);
        headingBlock.setOrientation(LinearLayout.VERTICAL);
        eyebrow = new TextView(context);
        eyebrow.setText(L10n.t("HushTumblr").toUpperCase(Locale.ROOT));
        eyebrow.setTextColor(palette.heading);
        eyebrow.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        eyebrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        eyebrow.setLetterSpacing(0.12f);
        eyebrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        headingBlock.addView(eyebrow);

        TextView title = new TextView(context);
        pageTitle = title;
        title.setText("HushTumblr");
        title.setTextColor(palette.title);
        title.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        HushTumblrPreferenceFragment.markHeading(title);
        headingBlock.addView(title);
        pageSubtitle = new TextView(context);
        pageSubtitle.setTextColor(palette.summary);
        pageSubtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        pageSubtitle.setLineSpacing(dp(2), 1);
        headingBlock.addView(pageSubtitle);
        bar.addView(headingBlock, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        applyHeaderLayout();
        root.addView(bar);

        buildSearch(root);
        // The header, the search field and its count, before the page's own rows are added.
        ScreenColors.startSide(root);

        container = new FrameLayout(context);
        container.setId(CONTAINER_ID);
        root.addView(container, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // Tumblr targets a recent API, so its windows are edge to edge: keep the bars off the
        // content.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                // Android 10 has no inset types, and these are the same bars there.
                view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        return root;
    }

    private static void keysReachRows(ViewGroup root, boolean keys) {
        root.setDescendantFocusability(keys ? ViewGroup.FOCUS_AFTER_DESCENDANTS : ViewGroup.FOCUS_BEFORE_DESCENDANTS);
    }

    private void buildSearch(LinearLayout root) {
        ScreenColors palette = ScreenColors.DEFAULT;
        Context context = root.getContext();
        searchBox = new LinearLayout(context);
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        android.graphics.drawable.GradientDrawable surface = new android.graphics.drawable.GradientDrawable();
        surface.setColor(palette.card);
        surface.setCornerRadius(dp(12));
        surface.setStroke(dp(1), palette.switchOff);
        searchBox.setBackground(surface);
        searchBox.setPaddingRelative(dp(16), 0, 0, 0);
        ImageView icon = new ImageView(context);
        icon.setImageDrawable(SettingsIcons.icon(context, SettingsIcons.SEARCH, palette.summary));
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        searchBox.addView(icon, new LinearLayout.LayoutParams(dp(24), dp(24)));
        search = new EditText(context);
        search.setHint(L10n.t("Search settings"));
        search.setContentDescription(L10n.t("Search settings"));
        search.setSingleLine(true);
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
        search.setBackground(null);
        search.setTextColor(palette.title);
        search.setHintTextColor(palette.summary);
        palette.paintSelection(search);
        search.setOnFocusChangeListener((view, focused) ->
                surface.setStroke(dp(focused ? 2 : 1), focused ? palette.accent : palette.switchOff));
        search.setPaddingRelative(dp(12), dp(12), 0, dp(12));
        search.setMinimumHeight(dp(56));
        searchBox.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        android.widget.ImageButton clear = new android.widget.ImageButton(context);
        clear.setImageDrawable(SettingsIcons.icon(context, SettingsIcons.CLOSE, palette.summary));
        clear.setImageTintList(ScreenColors.dimmedWhenDisabled(palette.summary));
        android.graphics.drawable.RippleDrawable clearSurface = palette.interactive(clear, palette.card, 8);
        clearSurface.setLayerInsetRelative(0, dp(4), dp(4), dp(4), dp(4));
        clear.setBackground(clearSurface);
        clear.setPadding(dp(12), dp(12), dp(12), dp(12));
        clear.setContentDescription(L10n.t("Clear search"));
        clear.setTooltipText(L10n.t("Clear search"));
        clear.setVisibility(View.INVISIBLE);
        clear.setOnClickListener(ignored -> search.setText(""));
        searchBox.addView(clear, new LinearLayout.LayoutParams(dp(48), dp(48)));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                clear.setVisibility(text.length() == 0 ? View.INVISIBLE : View.VISIBLE);
                if (!settingSearch) mountedQuery = text.toString();
                HushTumblrPreferenceFragment page = page();
                if (!settingSearch && page != null && page.navigation != null) page.navigation.search(text.toString());
            }
            @Override public void afterTextChanged(Editable text) { }
        });
        search.setOnEditorActionListener((view, action, event) -> {
            if (action != android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH) return false;
            hideKeyboard();
            return true;
        });
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        layout.setMargins(dp(20), 0, dp(20), dp(14));
        root.addView(searchBox, layout);
        // Typed letters alone tell a screen reader nothing about the list below, so the count is
        // spoken from a polite live region, once the typing has settled.
        results = new TextView(context);
        results.setTextColor(palette.summary);
        results.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        results.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        results.setVisibility(View.GONE);
        LinearLayout.LayoutParams place = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        place.setMarginStart(dp(20));
        place.setMarginEnd(dp(20));
        place.bottomMargin = dp(8);
        root.addView(results, place);
        // A newly opened screen must not steal focus and raise the keyboard.
        root.setFocusableInTouchMode(true);
        root.requestFocus();
        // Holding focus itself, the root kept it from arrow keys too: none moves from a view that
        // covers every row. Without touch it hands focus to its rows first, so leaving touch
        // gives it to the first one, as on any screen. Set before the window hears of the change.
        root.getViewTreeObserver().addOnTouchModeChangeListener(inTouch -> {
            keysReachRows(root, !inTouch);
            // Back under touch, focus on a row is dropped, and the root holds it again.
            if (inTouch) root.post(() -> {
                if (root.isInTouchMode() && !root.hasFocus()) root.requestFocus();
            });
        });
        root.post(() -> {
            if (root.isInTouchMode()) return;
            keysReachRows(root, true);
            if (root.isFocused()) root.requestFocus(View.FOCUS_DOWN);
        });
        searchBox.setVisibility(View.GONE);
    }

    void showPage(CharSequence title, boolean home, String query) {
        showPage(title, home, query, home ? L10n.t("Make Tumblr feel like yours.") : null);
    }

    void showPage(CharSequence title, boolean home, String query, @Nullable CharSequence subtitle) {
        CharSequence displayTitle = home ? L10n.t("Your settings") : title;
        if (!TextUtils.equals(mountedTitle, title) || !TextUtils.equals(mountedSubtitle, subtitle)
                || mountedHome != home || (pageTitle != null && !TextUtils.equals(pageTitle.getText(), displayTitle))) {
            forcedCompactWidth = -1;
        }
        mountedTitle = title;
        mountedSubtitle = subtitle;
        mountedHome = home;
        mountedQuery = query;
        if (mountFailed) return;
        pageTitle.setText(displayTitle);
        pageSubtitle.setText(subtitle);
        applyHeaderLayout();
        if (getDialog() != null && getDialog().getWindow() != null) getDialog().getWindow().setTitle(title);
        searchBox.setVisibility(home ? View.VISIBLE : View.GONE);
        settingSearch = true;
        if (!search.getText().toString().equals(query)) search.setText(query);
        settingSearch = false;
        if (!home || query.isEmpty()) {
            search.clearFocus();
            hideKeyboard();
        }
    }

    private void updateHeaderForViewport(int width, int height, float fontScale) {
        if (titleBar == null || pageTitle == null || height <= 0) return;
        // A keyboard, landscape or large text can leave little room below a tall masthead.
        // Keep the route heading and Back together while the native list keeps its space.
        boolean forced = forcedCompactWidth == width && forcedCompactHeight == height
                && Float.compare(forcedCompactFontScale, fontScale) == 0;
        boolean compact = forced || height <= dp(480) || (fontScale >= 1.5f && height <= dp(640));
        if (compactHeader == compact) return;
        compactHeader = compact;
        applyHeaderLayout();
    }

    private void applyHeaderLayout() {
        titleBar.setOrientation(compactHeader ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
        titleBar.setGravity(compactHeader ? Gravity.CENTER_VERTICAL : Gravity.START);
        titleBar.setPaddingRelative(dp(20), dp(compactHeader ? 12 : 20), dp(20),
                dp(compactHeader ? 12 : 22));
        LinearLayout.LayoutParams back = new LinearLayout.LayoutParams(dp(48), dp(48));
        back.setMarginEnd(dp(compactHeader ? 12 : 0));
        back.bottomMargin = dp(compactHeader ? 0 : 22);
        backButton.setLayoutParams(back);
        headingBlock.setLayoutParams(compactHeader
                ? new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1)
                : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        eyebrow.setVisibility(compactHeader ? View.GONE : View.VISIBLE);
        pageTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP,
                pageTitle.getText().length() > 26 ? (compactHeader ? 20 : 26) : (compactHeader ? 24 : 32));
        LinearLayout.LayoutParams title = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        title.topMargin = dp(compactHeader ? 0 : 6);
        pageTitle.setLayoutParams(title);
        LinearLayout.LayoutParams subtitle = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitle.topMargin = dp(6);
        pageSubtitle.setLayoutParams(subtitle);
        pageSubtitle.setVisibility(compactHeader || pageSubtitle.length() == 0 ? View.GONE : View.VISIBLE);
    }

    /** How many settings the search shows, or -1 when there is no search. */
    void showResults(int count) {
        if ((mountedResults < 0) != (count < 0)) forcedCompactWidth = -1;
        mountedResults = count;
        results.removeCallbacks(showFound);
        if (mountFailed || count < 0) {
            results.setVisibility(View.GONE);
            results.setText("");
            return;
        }
        found = count;
        results.postDelayed(showFound, 600);
    }

    private void hideKeyboard() {
        android.view.inputmethod.InputMethodManager keyboard = getContext().getSystemService(android.view.inputmethod.InputMethodManager.class);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(search.getWindowToken(), 0);
    }

    @Override
    public void onCancel(android.content.DialogInterface dialog) {
        // Back key or a tap outside: the person closed it.
        SettingsEntry.onClosedByUser();
        super.onCancel(dialog);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (mountFailed) showMountRecovery();
        else mountPage(false);
    }

    private void mountPage(boolean retry) {
        try {
            RuntimeException injected = failNextMount;
            if (injected != null) {
                failNextMount = null;
                throw injected;
            }
            FragmentManager manager = getChildFragmentManager();
            Fragment current = manager.findFragmentById(CONTAINER_ID);
            if (!(current instanceof HushTumblrPreferenceFragment) || replaceFailedChild
                    || (retry && (current.getView() == null || current.getView().getParent() != container))) {
                HushTumblrPreferenceFragment replacement = new HushTumblrPreferenceFragment();
                if (current instanceof HushTumblrPreferenceFragment && current.isAdded()) {
                    if (current.getArguments() != null) replacement.setArguments(new Bundle(current.getArguments()));
                    replacement.setInitialSavedState(manager.saveFragmentInstanceState(current));
                }
                // If commitNow fails after adding a child, Retry must replace that partial page.
                replaceFailedChild = true;
                manager.beginTransaction().replace(CONTAINER_ID, replacement).commitNow();
                replaceFailedChild = false;
            }
            mountFailed = false;
            clearMountRecovery();
            showPage(mountedTitle, mountedHome, mountedQuery, mountedSubtitle);
            showResults(mountedResults);
            if (retry) {
                View list = getView().findViewById(android.R.id.list);
                if (list != null) {
                    list.setFocusableInTouchMode(true);
                    list.requestFocus();
                    list.sendAccessibilityEvent(AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
                }
            }
        } catch (Exception ex) {
            mountFailed = true;
            // Recovery is the visible outcome. Keep the diagnostic logger's toast quiet.
            Logger.printInfo(() -> "Could not show the preference list", ex);
            showMountRecovery();
        }
    }

    /** Built without the child manager, which is the part that just failed. */
    private void showMountRecovery() {
        if (container == null) return;
        Context context = container.getContext();
        if (recovery != null) container.removeView(recovery);
        forcedCompactWidth = -1;
        pageTitle.setText("HushTumblr");
        pageSubtitle.setText(L10n.t(getContext(), "Try again, or go back to Tumblr."));
        applyHeaderLayout();
        searchBox.setVisibility(View.GONE);
        search.clearFocus();
        hideKeyboard();
        results.removeCallbacks(showFound);
        results.setVisibility(View.GONE);
        recovery = new ScrollView(context);
        recovery.setTag(MOUNT_ERROR);
        recovery.setBackgroundColor(ScreenColors.DEFAULT.background);
        recovery.setFillViewport(true);
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        recovery.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout message = new LinearLayout(context);
        message.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(context);
        title.setId(android.R.id.title);
        title.setText(L10n.t(getContext(), "HushTumblr settings couldn't open"));
        HushTumblrPreferenceFragment.markHeading(title);
        message.addView(title);
        TextView summary = new TextView(context);
        summary.setId(android.R.id.summary);
        summary.setText(L10n.t(getContext(), "Try again, or go back to Tumblr."));
        message.addView(summary);
        content.addView(message);
        ScreenColors.recoveryMessage(message);
        message.setPadding(dp(20), dp(24), dp(20), dp(24));
        Button retry = recoveryButton(MOUNT_RETRY, L10n.t(getContext(), "Retry"), true);
        retry.setOnClickListener(ignored -> {
            if (!mountFailed || retryScheduled || getView() == null) return;
            retryScheduled = true;
            retry.setEnabled(false);
            getView().post(retryMount);
        });
        content.addView(retry);
        Button back = recoveryButton(MOUNT_BACK, L10n.t(getContext(), "Back"), false);
        back.setOnClickListener(ignored -> {
            if (getDialog() != null) getDialog().cancel();
            else {
                SettingsEntry.onClosedByUser();
                dismissAllowingStateLoss();
            }
        });
        content.addView(back);
        container.addView(recovery, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        coverChild();
        retry.setFocusableInTouchMode(true);
        retry.requestFocus();
        recovery.sendAccessibilityEvent(AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
    }

    private Button recoveryButton(String tag, String label, boolean primary) {
        Button button = new Button(container.getContext());
        button.setTag(tag);
        button.setText(label);
        button.setAllCaps(false);
        button.setSingleLine(false);
        button.setMaxLines(Integer.MAX_VALUE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        button.setTextColor(primary ? ScreenColors.DEFAULT.onAccent : ScreenColors.DEFAULT.secondaryActionText());
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        ScreenColors.recoveryAction(button, primary);
        button.setBackgroundTintList(null);
        return button;
    }

    private void coverChild() {
        for (int i = 0; i < container.getChildCount(); i++) {
            View child = container.getChildAt(i);
            if (child == recovery) continue;
            child.setVisibility(View.INVISIBLE);
            child.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        }
        recovery.bringToFront();
    }

    private void clearMountRecovery() {
        if (recovery == null) return;
        container.removeView(recovery);
        recovery = null;
        for (int i = 0; i < container.getChildCount(); i++) {
            View child = container.getChildAt(i);
            child.setVisibility(View.VISIBLE);
            child.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        }
    }

    @Override public void onStart() {
        super.onStart();
        // The framework restores an existing child's view after this dialog's onViewCreated.
        if (mountFailed && recovery != null) coverChild();
    }

    @Override public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putBoolean(MOUNT_FAILED_STATE, mountFailed);
        outState.putBoolean(REPLACE_CHILD_STATE, replaceFailedChild);
        outState.putCharSequence(PAGE_TITLE_STATE, mountedTitle);
        outState.putCharSequence(PAGE_SUBTITLE_STATE, mountedSubtitle);
        outState.putBoolean(PAGE_HOME_STATE, mountedHome);
        outState.putString(PAGE_QUERY_STATE, mountedQuery);
        outState.putInt(PAGE_RESULTS_STATE, mountedResults);
    }

    @Override public void onDestroyView() {
        if (getView() != null) getView().removeCallbacks(retryMount);
        if (results != null) results.removeCallbacks(showFound);
        retryScheduled = false;
        recovery = null;
        container = null;
        forcedCompactWidth = -1;
        super.onDestroyView();
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                getResources().getDisplayMetrics()));
    }

    /** Whether the phone's language reads right to left, so the way back points right. */
    private boolean rightToLeft() {
        return getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
    }
}
