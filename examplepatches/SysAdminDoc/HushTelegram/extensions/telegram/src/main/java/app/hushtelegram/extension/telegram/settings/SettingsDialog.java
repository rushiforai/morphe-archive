/*
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
package app.hushtelegram.extension.telegram.settings;

import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.ui.ShimmerTitle;

/**
 * The HushTelegram screen: a full screen, black dialog with a title bar and the preference list.
 * It is a framework dialog fragment, so it needs no activity of its own and Back closes it.
 */
@SuppressWarnings("deprecation") // Framework fragments are what the shared preference code builds on.
public final class SettingsDialog extends DialogFragment {
    private Context settingsContext;

    @Override
    public Context getContext() {
        Context base = super.getContext();
        if (base == null) return null;
        if (!(settingsContext instanceof android.view.ContextThemeWrapper)
                || ((android.view.ContextThemeWrapper) settingsContext).getBaseContext() != base)
            settingsContext = HushTelegramPreferenceFragment.themed(base);
        return settingsContext;
    }

    @Override
    public void onDetach() {
        settingsContext = null;
        super.onDetach();
    }
    /**
     * The preference list's container. Fixed, because the child manager saves the page with this
     * id and puts it back into a view with the same id after rotation or process recreation. A
     * fresh View.generateViewId() on each onCreateView left the restored page no container.
     * Outside both the generated-id range and aapt's 0x7f ids, and nothing else in this dialog
     * carries an id.
     */
    static final int CONTAINER_ID = 0x48464301;
    static final String PAGE_TITLE = "hushtelegram_page_title";
    /** The argument naming the page the screen opens on: a route of {@link SettingsNavigation}. */
    static final String START_PAGE = "hushtelegram_start_page";

    /** Marks the toolbar's Pause, Resume or Undo button. */
    static final String PAUSE_ACTION = "hushtelegram_toolbar_pause";

    private TextView pageTitle;
    /** Pause, Resume or Undo, which {@link SettingsNavigation} labels and shows on the home list. */
    Button pauseAction;
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
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        // What the framework's own onCreateDialog builds, with Back first taking the list back to
        // where it was before a section jump. Dialog's back callback on Android 13 and newer ends
        // in onBackPressed as well, so this covers the gesture and the key alike.
        Dialog dialog = new Dialog(getContext(), getTheme()) {
            @Override
            public void onBackPressed() {
                HushTelegramPreferenceFragment page = page();
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

    /** The settings page this dialog holds, or null before it's attached. */
    @Nullable
    private HushTelegramPreferenceFragment page() {
        Object page = getChildFragmentManager().findFragmentById(CONTAINER_ID);
        return page instanceof HushTelegramPreferenceFragment ? (HushTelegramPreferenceFragment) page : null;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        LinearLayout root = new LinearLayout(getContext());
        root.setOrientation(LinearLayout.VERTICAL);
        root.setLayoutDirection(getResources().getConfiguration().getLayoutDirection());
        root.setBackgroundColor(ScreenColors.DEFAULT.background);

        LinearLayout bar = new LinearLayout(getContext());
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        // Start and end, not left and right: in a right-to-left language the bar is mirrored.
        bar.setPaddingRelative(dp(4), dp(4), dp(12), dp(4));

        android.widget.ImageButton back = new android.widget.ImageButton(getContext());
        android.graphics.drawable.Drawable arrow = SettingsIcons.icon(getContext(), SettingsIcons.BACK, ScreenColors.DEFAULT.title);
        arrow.setBounds(0, 0, dp(24), dp(24));
        arrow.setLayoutDirection(rightToLeft() ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR);
        back.setImageDrawable(arrow);
        back.setPadding(dp(12), dp(12), dp(12), dp(12));
        back.setBackground(ScreenColors.DEFAULT.control(back, ScreenColors.DEFAULT.background, ScreenColors.BUTTON_RADIUS, false));
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
            HushTelegramPreferenceFragment page = page();
            if (page != null && page.backFromJump()) return;
            SettingsEntry.onClosedByUser();
            dismissAllowingStateLoss();
        });
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));

        pageTitle = new TextView(getContext());
        pageTitle.setTag(PAGE_TITLE);
        pageTitle.setText("HushTelegram");
        ShimmerTitle.wear(pageTitle);
        pageTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        pageTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        pageTitle.setMaxLines(1);
        pageTitle.setAutoSizeTextTypeUniformWithConfiguration(12, 22, 1, TypedValue.COMPLEX_UNIT_SP);
        pageTitle.setAccessibilityHeading(true);
        pageTitle.setPaddingRelative(dp(8), dp(8), dp(8), dp(8));

        pauseAction = new Button(getContext());
        pauseAction.setTag(PAUSE_ACTION);
        pauseAction.setAllCaps(false);
        pauseAction.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        pauseAction.setTextColor(ScreenColors.DEFAULT.heading);
        pauseAction.setBackground(new android.graphics.drawable.InsetDrawable(ScreenColors.DEFAULT.control(pauseAction,
                ScreenColors.DEFAULT.background, ScreenColors.BUTTON_RADIUS, true), 0, dp(6), 0, dp(6)));
        pauseAction.setMinWidth(dp(48));
        pauseAction.setMinHeight(dp(48));
        pauseAction.setMinimumWidth(dp(48));
        pauseAction.setMinimumHeight(dp(48));
        pauseAction.setPadding(dp(14), 0, dp(14), 0);
        pauseAction.setVisibility(View.GONE);
        // From one and a half times the text size the title and Pause share one line badly, so
        // Pause goes under the title there.
        if (getResources().getConfiguration().fontScale >= 1.5f) {
            LinearLayout stack = new LinearLayout(getContext());
            stack.setOrientation(LinearLayout.VERTICAL);
            stack.addView(pageTitle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            stack.addView(pauseAction, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            bar.addView(stack, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        } else {
            bar.addView(pageTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            bar.addView(pauseAction, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        root.addView(bar);
        View divider = new View(getContext());
        divider.setBackgroundColor(ScreenColors.DEFAULT.outline);
        divider.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        root.addView(divider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));
        buildSearch(root);

        FrameLayout container = new FrameLayout(getContext());
        container.setId(CONTAINER_ID);
        root.addView(container, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // Telegram targets a recent API, so its windows are edge to edge: keep the bars off the
        // content.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                // Android 9 and 10 have no inset types, and these are the same bars there.
                view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        return root;
    }

    private void buildSearch(LinearLayout root) {
        ScreenColors palette = ScreenColors.DEFAULT;
        searchBox = new LinearLayout(getContext());
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        android.graphics.drawable.GradientDrawable surface = new android.graphics.drawable.GradientDrawable();
        surface.setColor(palette.card);
        surface.setCornerRadius(dp(ScreenColors.CARD_RADIUS));
        surface.setStroke(dp(1), palette.fieldBorder);
        searchBox.setBackground(surface);
        searchBox.setPaddingRelative(dp(16), 0, 0, 0);
        ImageView icon = new ImageView(getContext());
        icon.setImageDrawable(SettingsIcons.icon(getContext(), SettingsIcons.SEARCH, palette.summary));
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        searchBox.addView(icon, new LinearLayout.LayoutParams(dp(24), dp(24)));
        search = new EditText(getContext());
        search.setHint(L10n.t("Search settings"));
        search.setContentDescription(L10n.t("Search settings"));
        search.setSingleLine(true);
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
        search.setBackground(null);
        search.setTextColor(palette.title);
        search.setHintTextColor(palette.summary);
        palette.paintSelection(search);
        search.setOnFocusChangeListener((view, focused) ->
                surface.setStroke(dp(focused ? 2 : 1), focused ? palette.accent : palette.fieldBorder));
        search.setPaddingRelative(dp(10), dp(8), 0, dp(8));
        search.setMinimumHeight(dp(48));
        // A single-line field can't ellipsize its hint, so at a narrow width or large text the full
        // hint was cut mid-word. It falls back to the short one there; the description stays whole.
        search.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            String hint = hintThatFits(search.getPaint(), search.getWidth() - search.getTotalPaddingLeft() - search.getTotalPaddingRight());
            if (!hint.contentEquals(search.getHint())) search.post(() -> search.setHint(hint));
        });
        searchBox.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        android.widget.ImageButton clear = new android.widget.ImageButton(getContext());
        clear.setImageDrawable(SettingsIcons.icon(getContext(), SettingsIcons.CLOSE, palette.summary));
        // Inset by the focused outline's width: the button sits on the box's edge, and its fill
        // painted over the outline there.
        clear.setBackground(new android.graphics.drawable.InsetDrawable(
                palette.control(clear, palette.card, ScreenColors.BUTTON_RADIUS, false), dp(2)));
        clear.setPadding(dp(12), dp(12), dp(12), dp(12));
        clear.setContentDescription(L10n.t("Clear search"));
        clear.setVisibility(View.INVISIBLE);
        clear.setOnClickListener(ignored -> search.setText(""));
        searchBox.addView(clear, new LinearLayout.LayoutParams(dp(48), dp(48)));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                clear.setVisibility(text.length() == 0 ? View.INVISIBLE : View.VISIBLE);
                HushTelegramPreferenceFragment page = page();
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
        layout.setMargins(dp(12), dp(12), dp(12), dp(8));
        root.addView(searchBox, layout);
        // Typed letters alone tell a screen reader nothing about the list below, so the count is
        // spoken from a polite live region, once the typing has settled.
        results = new TextView(getContext());
        results.setTextColor(palette.summary);
        results.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        results.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        results.setVisibility(View.GONE);
        LinearLayout.LayoutParams place = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        place.setMarginStart(dp(16));
        place.setMarginEnd(dp(16));
        place.bottomMargin = dp(8);
        root.addView(results, place);
        // A newly opened screen must not steal focus and raise the keyboard, so the screen itself
        // holds focus. It keeps it when a keyboard takes over, and no view lies below or above a
        // view this tall, so a key that moves focus hands it to the page's list.
        root.setFocusableInTouchMode(true);
        root.setOnKeyListener((view, key, event) -> view.isFocused() && event.getAction() == KeyEvent.ACTION_DOWN
                && movesFocus(key) && focusList());
        root.requestFocus();
        searchBox.setVisibility(View.GONE);
    }

    /** The full search hint when it fits [room] pixels drawn with [paint], else the short one. */
    static String hintThatFits(android.graphics.Paint paint, int room) {
        String full = L10n.t("Search settings");
        return room <= 0 || paint.measureText(full) <= room ? full : L10n.t("Search");
    }

    /** Up, down and Tab, the keys that move a keyboard's focus between rows. */
    static boolean movesFocus(int key) {
        return key == KeyEvent.KEYCODE_DPAD_DOWN || key == KeyEvent.KEYCODE_DPAD_UP || key == KeyEvent.KEYCODE_TAB;
    }

    /** Gives the page's list a keyboard's focus, where it selects the first row it can stop on. */
    private boolean focusList() {
        HushTelegramPreferenceFragment page = page();
        View content = page == null ? null : page.getView();
        View list = content == null ? null : content.findViewById(android.R.id.list);
        return list != null && list.requestFocus();
    }

    void showPage(CharSequence title, boolean home, String query) {
        showHeading(title, home, query);
        searchBox.setVisibility(home ? View.VISIBLE : View.GONE);
        settingSearch = true;
        if (!search.getText().toString().equals(query)) search.setText(query);
        settingSearch = false;
        if (!home || query.isEmpty()) {
            search.clearFocus();
            hideKeyboard();
        }
    }

    void showSearchHeading(String query) {
        showHeading(null, true, query);
    }

    private void showHeading(CharSequence title, boolean home, String query) {
        pageTitle.setText(home ? query.isEmpty() ? "HushTelegram" : L10n.t("Search settings") : title);
    }

    /** How many settings the search shows, or -1 when there is no search. */
    void showResults(int count) {
        results.removeCallbacks(showFound);
        if (count < 0) {
            results.setVisibility(View.GONE);
            results.setText("");
            return;
        }
        if (results.getVisibility() == View.GONE) {
            results.setMinimumHeight(results.getLineHeight());
            results.setVisibility(View.INVISIBLE);
        }
        found = count;
        results.postDelayed(showFound, 600);
    }

    private void hideKeyboard() {
        android.view.inputmethod.InputMethodManager keyboard = getContext().getSystemService(android.view.inputmethod.InputMethodManager.class);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(search.getWindowToken(), 0);
    }

    @Override
    public void onDestroyView() {
        if (results != null) results.removeCallbacks(showFound);
        super.onDestroyView();
    }

    @Override
    public void onStart() {
        super.onStart();
        SettingsEntry.onDialogShown(getActivity());
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
        try {
            if (getChildFragmentManager().findFragmentById(CONTAINER_ID) == null) {
                getChildFragmentManager().beginTransaction()
                        .replace(CONTAINER_ID, new HushTelegramPreferenceFragment())
                        .commitNow();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not show the preference list", ex);
        }
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
