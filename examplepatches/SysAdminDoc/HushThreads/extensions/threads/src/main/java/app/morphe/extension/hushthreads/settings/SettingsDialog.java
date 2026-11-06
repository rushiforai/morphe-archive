/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40e (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

import android.app.Dialog;
import android.app.DialogFragment;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;

/**
 * The HushThreads screen: a full screen, black dialog with a title bar and the preference list.
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
    /** The argument naming the page the screen opens on: a route of {@link SettingsNavigation}. */
    static final String START_PAGE = "hushthreads_start_page";
    static final String RESTART_STATUS = "hushthreads_restart_status";
    static final String VIEW_TOGGLE = "hushthreads_view_toggle";
    static final String PAUSE_ACTION = "hushthreads_toolbar_pause";
    static final String PAGE_TITLE = "hushthreads_page_title";
    /** The build line in small type at the bottom of the settings. */
    static final String BUILD_DETAILS = "hushthreads_build_details";
    /** Tags of what shows in the container when the page couldn't be attached. */
    static final String ATTACH_FAILURE = "hushthreads_attach_failure";
    static final String ATTACH_RETRY = "hushthreads_attach_retry";
    static final String ATTACH_BACK = "hushthreads_attach_back";

    private TextView pageTitle;
    /** What the bar calls the page once the header's name has scrolled away. */
    private CharSequence pageName = "HushThreads";
    private HeaderColumn column;
    /** The header over the search: the logo, the name and the version line. */
    private View headerIcon;
    private TextView headerName;
    private View headerVersion;
    /** Pause, Resume or Undo, at the end of the bar on the main page. */
    Button pauseAction;
    private LinearLayout searchBox;
    /** Under the search: shows the settings as one list or a button per section. */
    private LinearLayout viewToggle;
    private ImageView viewToggleIcon;
    private TextView viewToggleLabel;
    private EditText search;
    private TextView results;
    private int found;
    private final Runnable showFound = () -> {
        String count = L10n.quantity(results.getContext(), found, "%1$d setting found", "%1$d settings found", found);
        results.setVisibility(View.VISIBLE);
        if (!count.contentEquals(results.getText())) results.setText(count);
    };
    private boolean settingSearch;
    /** How many changes wait for a restart, in the restart row's words. See {@link #liveStatus}. */
    private TextView restartStatus;

    /** The screen, set to open on [page], or on the first page for null or "". */
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
        try {
            super.onCreate(savedInstanceState);
        } catch (Exception ex) {
            // A saved page is put back in here, out of attachPage's reach, so one that fails to
            // attach would crash Threads. Taken away, it gives way to a fresh page when the view
            // is made, or to Retry and Back if that fails too. The second call lets the dialog
            // finish its own setup, now with no page to put back.
            Logger.printInfo(() -> "Could not put the saved preference list back", ex);
            dropBrokenPage();
            super.onCreate(null);
        }
        setStyle(STYLE_NO_TITLE, ScreenColors.THEME);
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        // What the framework's own onCreateDialog builds, with Back first taking the list back to
        // where it was before a section jump. Dialog's back callback on Android 13 and newer ends
        // in onBackPressed as well, so this covers the gesture and the key alike.
        Dialog dialog = new Dialog(getActivity(), getTheme()) {
            @Override
            public void onBackPressed() {
                HushThreadsPreferenceFragment page = page();
                if (page != null && page.backFromJump()) return;
                super.onBackPressed();
            }
        };
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(ScreenColors.DEFAULT.background));
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            // With three-button navigation Android lays a grey scrim under the buttons; the
            // screen is black edge to edge, so the scrim only shows as a grey band. Android 9 has
            // no scrim to turn off.
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setNavigationBarContrastEnforced(false);
            window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        return dialog;
    }

    /**
     * The settings page this dialog holds, or null before it's attached. Only a page that was
     * added counts: Android keeps one that failed partway in among its fragments after it's taken
     * away, and finding pages by container id found that one, after recreation too.
     */
    @Nullable
    private HushThreadsPreferenceFragment page() {
        for (android.app.Fragment page : getChildFragmentManager().getFragments()) {
            if (page instanceof HushThreadsPreferenceFragment && page.getId() == CONTAINER_ID) {
                return (HushThreadsPreferenceFragment) page;
            }
        }
        return null;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        ScreenColors palette = ScreenColors.DEFAULT;
        HeaderColumn root = new HeaderColumn(getContext());
        column = root;
        root.setBackgroundColor(palette.background);

        LinearLayout bar = new LinearLayout(getContext());
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        // Start and end, not left and right: in a right-to-left language the bar is mirrored.
        bar.setPaddingRelative(dp(4), dp(4), dp(12), dp(4));

        android.widget.ImageButton back = new android.widget.ImageButton(getContext());
        android.graphics.drawable.Drawable arrow = SettingsIcons.icon(getContext(), SettingsIcons.BACK, palette.title);
        arrow.setBounds(0, 0, dp(24), dp(24));
        arrow.setLayoutDirection(rightToLeft() ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR);
        back.setImageDrawable(arrow);
        back.setPadding(dp(12), dp(12), dp(12), dp(12));
        ScreenColors.pressFeedback(back, palette.title, true);
        back.setMinimumWidth(dp(48));
        back.setMinimumHeight(dp(48));
        back.setContentDescription(L10n.t(getContext(), "Back"));
        // A screen reader calls it a button, as it would the back arrow of any other screen.
        back.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        back.setOnClickListener(v -> {
            HushThreadsPreferenceFragment page = page();
            if (page != null && page.backFromJump()) return;
            SettingsEntry.onClosedByUser();
            dismissAllowingStateLoss();
        });
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        boolean largeText = getResources().getConfiguration().fontScale >= 1.5f;
        LinearLayout labels = bar;
        if (largeText) {
            labels = new LinearLayout(getContext());
            labels.setOrientation(LinearLayout.VERTICAL);
            bar.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        }

        TextView title = new TextView(getContext());
        pageTitle = title;
        title.setTag(PAGE_TITLE);
        title.setText("HushThreads");
        title.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        // The bar, every page opened from it and search all show their name here, in the logo's blues.
        ShimmerTitle.wear(title, palette.background);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setIncludeFontPadding(false);
        title.setPaddingRelative(dp(8), dp(8), dp(8), dp(8));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setAutoSizeTextTypeUniformWithConfiguration(12, 22, 1, TypedValue.COMPLEX_UNIT_SP);
        title.setMaxLines(1);
        title.setAccessibilityHeading(true);
        labels.addView(title, new LinearLayout.LayoutParams(largeText ? ViewGroup.LayoutParams.MATCH_PARENT : 0,
                ViewGroup.LayoutParams.WRAP_CONTENT, largeText ? 0 : 1));
        pauseAction = new Button(getContext());
        pauseAction.setTag(PAUSE_ACTION);
        pauseAction.setVisibility(View.GONE);
        LinearLayout.LayoutParams actionPlace = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        actionPlace.gravity = Gravity.END;
        labels.addView(pauseAction, actionPlace);
        root.addView(bar);
        View divider = new View(getContext());
        divider.setBackgroundColor(palette.outline);
        root.addView(divider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));
        // The bar and its line stay put while the header, the search and the list scroll under them.
        root.pin(2);

        headerName = SettingsHeader.addTo(root, palette);
        headerIcon = root.findViewWithTag(SettingsHeader.ICON);
        headerVersion = root.findViewWithTag(SettingsHeader.VERSION);

        buildSearch(root);
        restartStatus = liveStatus(root, RESTART_STATUS);

        FrameLayout container = new FrameLayout(getContext());
        container.setId(CONTAINER_ID);
        // The column gives it the height below the bar.
        root.addView(container, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0));

        root.setOnScrollChangeListener((view, x, y, oldX, oldY) -> showBarTitle());
        root.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom)
                -> showBarTitle());
        // Threads targets a recent API, so its windows are edge to edge: keep the bars and the
        // keyboard off the content.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.ime());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                // Android 9 and 10 have no inset types; their system window insets hold the
                // keyboard too, with the window set to resize for it.
                view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        return root;
    }

    /** Lets the header follow [list]: it slides up under the bar as the rows scroll. */
    void followList(ListView list) {
        if (column != null) column.follow(list);
    }

    /**
     * The bar leaves the name off while the header under it shows it, and names the page again
     * once the header has scrolled away. While a search is typed it says so. Invisible rather than
     * gone, so the bar keeps its height and its buttons stay where they were.
     */
    private void showBarTitle() {
        if (pageTitle == null || column == null || headerName == null) return;
        boolean searching = searchBox.getVisibility() == View.VISIBLE && search.length() > 0;
        CharSequence text = searching ? L10n.t("Search settings") : pageName;
        if (!TextUtils.equals(text, pageTitle.getText())) pageTitle.setText(text);
        // "Search settings" names what the screen is doing, not the page; the header's name, which
        // stays during a search, is the page's heading then.
        if (pageTitle.isAccessibilityHeading() == searching) pageTitle.setAccessibilityHeading(!searching);
        boolean nameShows = !searching && headerName.getVisibility() == View.VISIBLE
                && (!column.isLaidOut() || headerName.getBottom() > column.getScrollY() + column.pinnedBottom());
        int shown = nameShows ? View.INVISIBLE : View.VISIBLE;
        if (pageTitle.getVisibility() != shown) pageTitle.setVisibility(shown);
    }

    private void buildSearch(LinearLayout root) {
        ScreenColors palette = ScreenColors.DEFAULT;
        searchBox = new LinearLayout(getContext());
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(palette.card);
        surface.setCornerRadius(dp(10));
        surface.setStroke(dp(1), ScreenColors.focusStroke(palette.heading, palette.outline));
        searchBox.setBackground(surface);
        searchBox.setAddStatesFromChildren(true);
        searchBox.setPaddingRelative(dp(14), 0, dp(4), 0);
        ImageView icon = new ImageView(getContext());
        icon.setImageDrawable(SettingsIcons.icon(getContext(), SettingsIcons.SEARCH, palette.summary));
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        searchBox.addView(icon, new LinearLayout.LayoutParams(dp(20), dp(20)));
        search = new EditText(getContext());
        search.setHint(L10n.t("Search settings"));
        search.setContentDescription(L10n.t("Search settings"));
        search.setSingleLine(true);
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH
                | android.view.inputmethod.EditorInfo.IME_FLAG_NO_FULLSCREEN
                | android.view.inputmethod.EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        search.setBackground(null);
        search.setTextColor(palette.title);
        search.setHintTextColor(palette.hint);
        palette.paintTextEditing(search);
        search.setPaddingRelative(dp(12), dp(10), 0, dp(10));
        search.setMinimumHeight(dp(48));
        searchBox.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        android.widget.ImageButton clear = new android.widget.ImageButton(getContext());
        clear.setImageDrawable(SettingsIcons.icon(getContext(), SettingsIcons.CLOSE, palette.summary));
        ScreenColors.pressFeedback(clear, palette.summary, true);
        clear.setPadding(dp(12), dp(12), dp(12), dp(12));
        clear.setContentDescription(L10n.t("Clear search"));
        // At large text sizes an empty button's reserved width cuts off the search hint.
        int emptyClearVisibility = getResources().getConfiguration().fontScale >= 1.5f
                ? View.GONE : View.INVISIBLE;
        clear.setVisibility(emptyClearVisibility);
        clear.setOnClickListener(ignored -> {
            search.setText("");
            search.requestFocus();
        });
        searchBox.addView(clear, new LinearLayout.LayoutParams(dp(48), dp(48)));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                clear.setVisibility(text.length() == 0 ? emptyClearVisibility : View.VISIBLE);
                showBarTitle();
                HushThreadsPreferenceFragment page = page();
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
        // On the 18 dp line the section cards and the restart bar stand on.
        layout.setMargins(dp(18), dp(4), dp(18), dp(12));
        root.addView(searchBox, layout);
        buildViewToggle(root, palette);
        // Typed letters alone tell a screen reader nothing about the list below, so the count is
        // spoken from a polite live region, once the typing has settled.
        results = new TextView(getContext());
        results.setTextColor(palette.summary);
        results.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        results.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        results.setVisibility(View.GONE);
        LinearLayout.LayoutParams place = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        place.setMarginStart(dp(20));
        place.setMarginEnd(dp(20));
        place.topMargin = dp(8);
        place.bottomMargin = dp(8);
        root.addView(results, place);
        // A newly opened screen must not steal focus and raise the keyboard.
        root.setFocusableInTouchMode(true);
        root.requestFocus();
        searchBox.setVisibility(View.GONE);
    }

    /**
     * Under the search, a row of the page like a section's button: it shows every section's rows
     * on one list, or a button per section, and offers whichever the list isn't showing. It stays
     * while a search is typed.
     */
    private void buildViewToggle(LinearLayout root, ScreenColors palette) {
        viewToggle = new LinearLayout(getContext());
        viewToggle.setTag(VIEW_TOGGLE);
        viewToggle.setOrientation(LinearLayout.HORIZONTAL);
        viewToggle.setGravity(Gravity.CENTER_VERTICAL);
        viewToggle.setMinimumHeight(dp(48));
        viewToggle.setPaddingRelative(dp(20), dp(4), dp(20), dp(4));
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(palette.card);
        surface.setStroke(dp(1), palette.interactionOutline(palette.outline));
        // Edge to edge like the rows under it: only the line along its bottom shows.
        android.graphics.drawable.Drawable inset = new InsetDrawable(surface, -dp(1), -dp(1), -dp(1), 0);
        viewToggle.setBackground(new RippleDrawable(ScreenColors.interactionRipple(palette.heading), inset, null));
        viewToggle.setFocusable(true);
        viewToggle.setClickable(true);
        viewToggleIcon = new ImageView(getContext());
        viewToggleIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        viewToggleIcon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        viewToggleIcon.setPaddingRelative(0, 0, dp(14), 0);
        viewToggle.addView(viewToggleIcon, new LinearLayout.LayoutParams(dp(38), dp(24)));
        viewToggleLabel = new TextView(getContext());
        viewToggleLabel.setTextColor(palette.title);
        viewToggleLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        viewToggleLabel.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        viewToggleLabel.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        viewToggle.addView(viewToggleLabel, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        viewToggle.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        viewToggle.setOnClickListener(ignored -> {
            HushThreadsPreferenceFragment page = page();
            if (page != null && page.navigation != null) page.navigation.showAsList(!page.navigation.listMode());
        });
        showViewToggle(false);
        viewToggle.setVisibility(View.GONE);
        root.addView(viewToggle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** The toggle offers the view the list isn't showing: [list] is the one it shows now. */
    void showViewToggle(boolean list) {
        CharSequence label = list ? L10n.t("Show settings by category") : L10n.t("Show all settings as a list");
        if (!TextUtils.equals(label, viewToggleLabel.getText())) viewToggleLabel.setText(label);
        viewToggleIcon.setImageDrawable(SettingsIcons.icon(getContext(), list ? SettingsIcons.FEED : SettingsIcons.MENU,
                ScreenColors.DEFAULT.heading));
    }

    /**
     * A line a screen reader reads whenever its words change, and nobody sees. It's a polite live
     * region, so the words wait for whatever is being read and focus stays where it is. The row
     * that shows the same words is built again on every change, and a new view's text is no change
     * to read, so the words are kept here, in a view that stays for as long as the screen does. The
     * line is one clear pixel over the top of the list, and takes no room.
     */
    private TextView liveStatus(LinearLayout root, String tag) {
        TextView status = new TextView(getContext());
        status.setTag(tag);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        status.setTextColor(android.graphics.Color.TRANSPARENT);
        LinearLayout.LayoutParams place = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1);
        place.bottomMargin = -1;
        root.addView(status, place);
        return status;
    }

    /**
     * The restart row's title while a change waits for a restart, and null once none does. Words
     * the line already holds are left alone: a screen reader reads a change, and reads it once.
     */
    void showRestartStatus(@Nullable CharSequence title) {
        String text = title == null ? "" : title.toString();
        if (!text.contentEquals(restartStatus.getText())) restartStatus.setText(text);
    }

    void showPage(CharSequence title, boolean home, String query) {
        pageName = title;
        // The header belongs to the main page, and stays there while a search is typed.
        int header = home ? View.VISIBLE : View.GONE;
        headerIcon.setVisibility(header);
        headerName.setVisibility(header);
        headerVersion.setVisibility(header);
        int headingSize = 22;
        if (home) {
            pageTitle.setAutoSizeTextTypeUniformWithConfiguration(12, headingSize, 1, TypedValue.COMPLEX_UNIT_SP);
        } else {
            pageTitle.setAutoSizeTextTypeWithDefaults(TextView.AUTO_SIZE_TEXT_TYPE_NONE);
            pageTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, headingSize);
        }
        pageTitle.setMaxLines(home ? 1 : Integer.MAX_VALUE);
        searchBox.setVisibility(home ? View.VISIBLE : View.GONE);
        viewToggle.setVisibility(home ? View.VISIBLE : View.GONE);
        settingSearch = true;
        if (!search.getText().toString().equals(query)) search.setText(query);
        settingSearch = false;
        showBarTitle();
        if (!home || query.isEmpty()) {
            search.clearFocus();
            hideKeyboard();
        }
    }

    /** How many settings the search shows, or -1 when there is no search. */
    void showResults(int count) {
        results.removeCallbacks(showFound);
        if (count < 0) {
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
        // A page the framework saved comes back by itself, into the container with the same id.
        if (page() == null) attachPage();
    }

    /**
     * Puts a new preference page in the container. A page that fails before it's attached can't
     * show its own Retry and Back, so the dialog shows them in its place. Nothing here writes a
     * setting, so a retry opens on the choices that were saved.
     */
    private void attachPage() {
        View failure = getView() == null ? null : getView().findViewWithTag(ATTACH_FAILURE);
        if (failure != null) ((ViewGroup) failure.getParent()).removeView(failure);
        android.app.FragmentManager children = getChildFragmentManager();
        try {
            children.beginTransaction()
                    .replace(CONTAINER_ID, new HushThreadsPreferenceFragment())
                    .commitNow();
            return;
        } catch (Exception ex) {
            // The recovery below is what the person sees, so the log stays quiet about it.
            Logger.printInfo(() -> "Could not show the preference list", ex);
        }
        dropBrokenPage();
        showAttachFailure();
    }

    /**
     * A page that failed partway in is still added to the container. Left there, Back would ask
     * it about a list it never built, and the next lifecycle step would attach it again behind
     * Retry and Back.
     */
    private void dropBrokenPage() {
        android.app.Fragment broken = page();
        if (broken == null) return;
        try {
            getChildFragmentManager().beginTransaction().remove(broken).commitNowAllowingStateLoss();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not take away the page that failed", ex);
        }
    }

    /**
     * Retry and Back where the page should be, with the words and colours of the page's own
     * recovery, in a scroll view so both stay reachable at the largest text sizes.
     */
    private void showAttachFailure() {
        View root = getView();
        ViewGroup container = root == null ? null : root.findViewById(CONTAINER_ID);
        if (container == null) return;
        container.removeAllViews();
        android.content.Context context = getContext();

        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout message = new LinearLayout(context);
        message.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(context);
        title.setId(android.R.id.title);
        title.setText(L10n.t(context, "HushThreads settings couldn't open"));
        title.setAccessibilityHeading(true);
        message.addView(title, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView summary = new TextView(context);
        summary.setId(android.R.id.summary);
        summary.setText(L10n.t(context, "Try again, or go back to Threads."));
        message.addView(summary, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        column.addView(message, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        ScreenColors.recoveryMessage(message);

        // Retry leads, as it does on the page's own recovery: it's the one that can fix this.
        recoveryAction(column, ATTACH_RETRY, L10n.t(context, "Retry"), true, ignored -> attachPage());
        recoveryAction(column, ATTACH_BACK, L10n.t(context, "Back"), false, ignored -> {
            Dialog dialog = getDialog();
            if (dialog != null) {
                dialog.cancel();
            } else {
                SettingsEntry.onClosedByUser();
                dismissAllowingStateLoss();
            }
        });

        android.widget.ScrollView scroll = new android.widget.ScrollView(context);
        scroll.setTag(ATTACH_FAILURE);
        scroll.setFillViewport(true);
        // Its views share the page's ids, and the page saves its own state under them.
        scroll.setSaveFromParentEnabled(false);
        scroll.addView(column);
        container.addView(scroll, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private static void recoveryAction(LinearLayout column, String tag, String label, boolean primary,
                                       View.OnClickListener action) {
        TextView row = new TextView(column.getContext());
        row.setId(android.R.id.title);
        row.setTag(tag);
        row.setText(label);
        row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        row.setFocusable(true);
        row.setOnClickListener(action);
        row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setClassName(Button.class.getName());
            }
        });
        column.addView(row, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        ScreenColors.recoveryAction(row, primary);
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
