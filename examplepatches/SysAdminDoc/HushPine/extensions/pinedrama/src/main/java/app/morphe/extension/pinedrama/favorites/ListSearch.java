/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.favorites;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.pinedrama.comment.CommentSearch;
import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.SearchText;
import app.morphe.extension.pinedrama.settings.preference.SettingsUi;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * Issue #11: a search bar above the profile's History and Favorites lists.
 *
 * <p>The bar goes in the column that stacks a page's tabs over its list, right under the tabs,
 * the way TikTok puts one in Favorites. Tapping it opens a search page that reads the whole list
 * ({@link ListScan}), pages PineDrama hadn't loaded yet included, and narrows it to what you
 * type. Tapping a result closes the page and opens that drama from its own row in the list, so
 * what plays is exactly what tapping it in the grid plays.
 */
public final class ListSearch {
    static final String BAR_TAG = "hushpine_list_search";
    /** How far above the list to look for the column its tabs sit in. */
    private static final int MAX_COLUMN_LEVELS = 8;
    /** Results shown at once. Typing more narrows it further. */
    private static final int MAX_RESULTS = 100;

    private ListSearch() {}

    // The bar.

    /** Puts a search bar above {@code list}, once per page. Answers the bar, or null. */
    static View addBar(View list) {
        View anchor = list;
        ViewParent parent = list.getParent();
        for (int level = 0; level < MAX_COLUMN_LEVELS && parent instanceof ViewGroup; level++) {
            if (parent instanceof LinearLayout
                    && ((LinearLayout) parent).getOrientation() == LinearLayout.VERTICAL) {
                return insertBar((LinearLayout) parent, anchor);
            }
            anchor = (View) parent;
            parent = parent.getParent();
        }
        Logger.printDebug(() -> "List search: nothing above the list stacks its children, so the bar has nowhere to go");
        return null;
    }

    static View barIn(ViewGroup column) {
        for (int index = 0; index < column.getChildCount(); index++) {
            View child = column.getChildAt(index);
            if (isBar(child)) return child;
        }
        return null;
    }

    static boolean isBar(View view) {
        return view != null && BAR_TAG.equals(view.getTag());
    }

    private static View insertBar(LinearLayout column, View anchor) {
        View existing = barIn(column);
        if (existing != null) return existing;
        HookStatus.bound(ListTools.FAMILY, "search bar");
        View bar = bar(column.getContext());
        int at = column.indexOfChild(anchor);
        column.addView(bar, Math.max(0, at));
        // A list that filled the column would now run past its bottom by the bar's height, so
        // it takes what's left instead. Only in a column with a height of its own to share.
        ViewGroup.LayoutParams columnParams = column.getLayoutParams();
        ViewGroup.LayoutParams anchorParams = anchor.getLayoutParams();
        if (anchorParams instanceof LinearLayout.LayoutParams
                && anchorParams.height == ViewGroup.LayoutParams.MATCH_PARENT
                && ((LinearLayout.LayoutParams) anchorParams).weight == 0f
                && (columnParams == null || columnParams.height != ViewGroup.LayoutParams.WRAP_CONTENT)) {
            anchorParams.height = 0;
            ((LinearLayout.LayoutParams) anchorParams).weight = 1f;
            anchor.setLayoutParams(anchorParams);
        }
        Logger.printDebug(() -> "List search: a search bar above " + anchor.getClass().getName());
        return bar;
    }

    private static View bar(Context context) {
        boolean dark = SettingsUi.isDarkContext(context);
        String label = L10n.t(context, "Search this list");
        LinearLayout bar = new LinearLayout(context);
        bar.setTag(BAR_TAG);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        GradientDrawable fill = new GradientDrawable();
        fill.setColor(SettingsUi.surfaceOn(dark));
        fill.setCornerRadius(SettingsUi.dp(context, SettingsUi.RADIUS_FIELD));
        fill.setStroke(Math.max(1, Math.round(SettingsUi.strokePx(context, 1f))), SettingsUi.borderOn(dark));
        bar.setBackground(new RippleDrawable(ColorStateList.valueOf(SettingsUi.borderOn(dark)), fill, null));
        int padding = SettingsUi.dp(context, 12);
        bar.setPadding(padding, 0, padding, 0);
        bar.setMinimumHeight(SettingsUi.dp(context, 40));
        bar.setClickable(true);
        bar.setFocusable(true);
        bar.setContentDescription(label);

        ImageView glyph = new ImageView(context);
        glyph.setImageDrawable(new CommentSearch.SearchGlyphDrawable(context, SettingsUi.textSecondaryOn(dark)));
        glyph.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int glyphSize = SettingsUi.dp(context, 20);
        bar.addView(glyph, new LinearLayout.LayoutParams(glyphSize, glyphSize));

        TextView hint = new TextView(context);
        hint.setText(label);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY_SMALL);
        hint.setTextColor(SettingsUi.textSecondaryOn(dark));
        hint.setSingleLine(true);
        hint.setEllipsize(TextUtils.TruncateAt.END);
        hint.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        hintParams.setMarginStart(SettingsUi.dp(context, 8));
        bar.addView(hint, hintParams);

        int side = SettingsUi.dp(context, 16);
        int gap = SettingsUi.dp(context, 8);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(side, gap, side, gap);
        bar.setLayoutParams(params);
        bar.setOnClickListener(ListSearch::open);
        return bar;
    }

    // Matching.

    /** Whether every word typed is in the row's text, in any order, accents aside. */
    static boolean matches(String text, String query) {
        return matchesNormalized(SearchText.normalize(text), SearchText.normalize(query));
    }

    private static boolean matchesNormalized(String text, String query) {
        if (query.isEmpty()) return false;
        for (String word : query.split(" ")) {
            if (!text.contains(word)) return false;
        }
        return true;
    }

    /** One row of the list as the search shows it. */
    static final class Item {
        final int position;
        final String title;
        final String detail;
        final String search;

        private Item(int position, String title, String detail, String search) {
            this.position = position;
            this.title = title;
            this.detail = detail;
            this.search = search;
        }

        /** The longest text on the row is its title. The rest, in order, is what's under it. */
        static Item of(int position, List<String> texts) {
            String title = "";
            for (String text : texts) {
                if (text.length() > title.length()) title = text;
            }
            StringBuilder detail = new StringBuilder();
            boolean titleSkipped = false;
            for (String text : texts) {
                if (!titleSkipped && text.equals(title)) {
                    titleSkipped = true;
                    continue;
                }
                if (detail.length() > 0) detail.append(" · ");
                detail.append(text);
            }
            return new Item(position, title, detail.toString(), SearchText.normalize(TextUtils.join(" ", texts)));
        }
    }

    // The search page.

    private static void open(View bar) {
        try {
            View list = listUnder(bar);
            Activity activity = ListTools.activityOf(bar.getContext());
            if (list == null || activity == null || activity.isFinishing()) return;
            new Page(activity, list).show();
        } catch (Throwable error) {
            Logger.printException(() -> "List search could not open", error);
        }
    }

    /**
     * The list on screen in the bar's column: a page's own list first, else the deepest one shown.
     * The pager that holds the Dramas and Posts pages is a list too, one page per row, and it
     * covers more of the screen than the list on the page it shows, so a list with another list
     * inside it never counts.
     */
    static View listUnder(View bar) {
        ViewParent parent = bar.getParent();
        if (!(parent instanceof ViewGroup)) return null;
        ViewGroup column = (ViewGroup) parent;
        View best = null;
        int bestArea = 0;
        for (View list : ListTools.lists()) {
            int area = shownArea(list);
            if (area > bestArea && isInside(list, column) && !hasListInside(list)) {
                best = list;
                bestArea = area;
            }
        }
        if (best != null) return best;
        List<View> found = new ArrayList<>();
        deepestLists(column, found);
        for (View list : found) {
            int area = shownArea(list);
            if (area > bestArea) {
                best = list;
                bestArea = area;
            }
        }
        return best;
    }

    private static int shownArea(View view) {
        if (!view.isShown()) return 0;
        Rect rect = new Rect();
        return view.getGlobalVisibleRect(rect) ? rect.width() * rect.height() : 0;
    }

    private static boolean isInside(View view, ViewGroup ancestor) {
        ViewParent parent = view.getParent();
        while (parent instanceof View) {
            if (parent == ancestor) return true;
            parent = parent.getParent();
        }
        return false;
    }

    static boolean hasListInside(View view) {
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (ListTools.isList(child) || hasListInside(child)) return true;
        }
        return false;
    }

    /** Lists with no list inside them, which leaves out the pager around a page's list. */
    private static boolean deepestLists(View view, List<View> into) {
        boolean below = false;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                below |= deepestLists(group.getChildAt(index), into);
            }
        }
        if (ListTools.isList(view)) {
            if (!below) into.add(view);
            return true;
        }
        return below;
    }

    /** A full screen page with a search box and the rows that match it. */
    private static final class Page {
        private final Dialog dialog;
        private final Context context;
        private final boolean dark;
        private final EditText box;
        private final TextView status;
        private final LinearLayout results;
        private final ListScan scan;
        private final List<Integer> shown = new ArrayList<>();
        private boolean chosen;

        Page(Activity activity, View list) {
            dark = SettingsUi.isDarkContext(activity);
            dialog = new Dialog(activity, dark ? android.R.style.Theme_Material_NoActionBar
                    : android.R.style.Theme_Material_Light_NoActionBar);
            context = dialog.getContext();
            scan = new ListScan(list, this::refresh);

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(SettingsUi.backgroundOn(dark));
            int side = SettingsUi.dp(context, 16);
            int top = SettingsUi.dp(context, 8);
            root.setPadding(side, top, side, 0);
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                view.setPadding(side, top + insets.getSystemWindowInsetTop(), side,
                        insets.getSystemWindowInsetBottom());
                return insets;
            });

            LinearLayout header = new LinearLayout(context);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);
            box = new EditText(context);
            box.setHint(L10n.t(context, "Search this list"));
            box.setSingleLine(true);
            box.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
            box.setInputType(InputType.TYPE_CLASS_TEXT);
            box.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY);
            box.setTextColor(SettingsUi.textPrimaryOn(dark));
            box.setHintTextColor(SettingsUi.textSecondaryOn(dark));
            box.setBackground(fieldBackground(context, dark));
            int padding = SettingsUi.dp(context, 12);
            box.setPadding(padding, padding, padding, padding);
            box.setMinimumHeight(SettingsUi.dp(context, 48));
            header.addView(box, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            TextView close = new TextView(context);
            close.setText(L10n.t(context, "Close"));
            close.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY);
            close.setTextColor(SettingsUi.accentOn(dark));
            close.setGravity(Gravity.CENTER);
            close.setPadding(padding, 0, 0, 0);
            close.setMinimumHeight(SettingsUi.dp(context, 48));
            close.setMinimumWidth(SettingsUi.dp(context, 48));
            close.setClickable(true);
            close.setFocusable(true);
            close.setOnClickListener(view -> dialog.dismiss());
            header.addView(close, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(header, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            status = SettingsUi.resultCount(context, "hushpine_list_search_status");
            status.setTextColor(SettingsUi.textSecondaryOn(dark));
            status.setPadding(0, top, 0, top);
            root.addView(status, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            ScrollView scroller = new ScrollView(context);
            results = new LinearLayout(context);
            results.setOrientation(LinearLayout.VERTICAL);
            scroller.addView(results, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(scroller, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            box.addTextChangedListener(new TextWatcher() {
                @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                @Override public void onTextChanged(CharSequence s, int start, int before, int count) {}
                @Override public void afterTextChanged(Editable typed) {
                    refresh();
                }
            });
            box.setOnEditorActionListener((view, actionId, event) -> {
                boolean enter = actionId == EditorInfo.IME_NULL && event != null
                        && event.getKeyCode() == KeyEvent.KEYCODE_ENTER;
                if (actionId != EditorInfo.IME_ACTION_SEARCH && !enter) return false;
                if (enter && event.getAction() != KeyEvent.ACTION_UP) return true;
                InputMethodManager keyboard = (InputMethodManager)
                        context.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (keyboard != null) keyboard.hideSoftInputFromWindow(view.getWindowToken(), 0);
                return true;
            });

            dialog.setContentView(root);
            dialog.setOnDismissListener(ignored -> {
                if (!chosen) scan.cancel();
            });
        }

        void show() {
            Window window = dialog.getWindow();
            // Set before the page shows: a window reads this as it takes focus, not after.
            if (window != null) {
                window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
            }
            box.requestFocus();
            dialog.show();
            if (window != null) {
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            }
            // And asked for once the box is in the window, for a phone that skips the first.
            box.post(() -> {
                InputMethodManager keyboard = (InputMethodManager)
                        context.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (keyboard != null && dialog.isShowing()) {
                    keyboard.showSoftInput(box, InputMethodManager.SHOW_IMPLICIT);
                }
            });
            scan.start();
            refresh();
        }

        private void refresh() {
            String query = SearchText.normalize(box.getText() == null ? "" : box.getText().toString());
            List<Item> matched = new ArrayList<>();
            for (Item item : scan.items()) {
                if (query.isEmpty() || matchesNormalized(item.search, query)) matched.add(item);
            }
            boolean done = scan.done();
            String line;
            if (!query.isEmpty() && matched.isEmpty() && done) {
                line = L10n.t(context, "Nothing in this list matches");
            } else if (done) {
                line = L10n.quantity(context, matched.size(), "1 result", "%1$d results", matched.size());
            } else {
                line = L10n.quantity(context, matched.size(), "1 result so far", "%1$d results so far",
                        matched.size());
            }
            SettingsUi.setTextIfChanged(status, line);

            List<Integer> positions = new ArrayList<>();
            for (int index = 0; index < matched.size() && index < MAX_RESULTS; index++) {
                positions.add(matched.get(index).position);
            }
            if (positions.equals(shown)) return;
            shown.clear();
            shown.addAll(positions);
            results.removeAllViews();
            for (int index = 0; index < positions.size(); index++) {
                results.addView(row(matched.get(index)));
            }
        }

        private View row(Item item) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.VERTICAL);
            int vertical = SettingsUi.dp(context, 12);
            row.setPadding(0, vertical, 0, vertical);
            row.setMinimumHeight(SettingsUi.dp(context, 48));
            row.setBackground(new RippleDrawable(ColorStateList.valueOf(SettingsUi.borderOn(dark)), null,
                    new android.graphics.drawable.ColorDrawable(0xFFFFFFFF)));
            row.setClickable(true);
            row.setFocusable(true);
            TextView title = new TextView(context);
            title.setText(item.title);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY);
            title.setTextColor(SettingsUi.textPrimaryOn(dark));
            title.setMaxLines(2);
            title.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(title);
            if (!item.detail.isEmpty()) {
                TextView detail = new TextView(context);
                detail.setText(item.detail);
                detail.setTextSize(TypedValue.COMPLEX_UNIT_SP, SettingsUi.TEXT_BODY_SMALL);
                detail.setTextColor(SettingsUi.textSecondaryOn(dark));
                detail.setSingleLine(true);
                detail.setEllipsize(TextUtils.TruncateAt.END);
                row.addView(detail);
            }
            row.setOnClickListener(view -> {
                chosen = true;
                dialog.dismiss();
                scan.open(item.position);
            });
            return row;
        }

        private static StateListDrawable fieldBackground(Context context, boolean dark) {
            float radius = SettingsUi.dp(context, SettingsUi.RADIUS_FIELD);
            int stroke = Math.max(1, Math.round(context.getResources().getDisplayMetrics().density));
            GradientDrawable focused = new GradientDrawable();
            focused.setColor(dark ? SettingsUi.liftedSurfaceOn(true) : SettingsUi.surfaceOn(false));
            focused.setCornerRadius(radius);
            focused.setStroke(stroke * 2, SettingsUi.accentOn(dark));
            GradientDrawable resting = new GradientDrawable();
            resting.setColor(SettingsUi.surfaceOn(dark));
            resting.setCornerRadius(radius);
            resting.setStroke(stroke, SettingsUi.borderOn(dark));
            StateListDrawable states = new StateListDrawable();
            states.addState(new int[]{android.R.attr.state_focused}, focused);
            states.addState(new int[]{}, resting);
            return states;
        }
    }
}
