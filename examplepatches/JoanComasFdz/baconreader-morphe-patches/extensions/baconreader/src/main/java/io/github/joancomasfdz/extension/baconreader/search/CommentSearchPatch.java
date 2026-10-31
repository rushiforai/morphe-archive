// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.search;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.BackgroundColorSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.onelouder.baconreader.connectivity.Tasks;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * Searches the comments of a post, as the "Search comments" box of Reddit's website, which the API does not have.
 * A search button in the sort bar ("Best ▾ ... COLLAPSE ALL") turns the bar into a find bar, which stays at the
 * top of the comments when the bar scrolls away. It searches the loaded comments (also inside collapsed ones),
 * highlights the matches and scrolls between them, or shows only the matching comments; "Search all" first loads
 * the comments behind "load more comments".
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class CommentSearchPatch {
    private static final String THREAD_MANAGER = "com.onelouder.baconreader.data.ThreadManager";
    private static final String COMMENT = "com.onelouder.baconreader.reddit.Comment";
    private static final String MORE = "com.onelouder.baconreader.reddit.More";
    private static final String COMMENT_ITEM = "com.onelouder.baconreader.data.ThreadItem$CommentItem";
    private static final long SEARCH_DELAY_MS = 300;
    /** Safety limit of "Search all": requests of 100 comments or more each. */
    private static final int MAX_LOAD_REQUESTS = 60;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** The open search, whose matches are highlighted. */
    private static Search active;

    private CommentSearchPatch() {
    }

    /** The find bar of a post and its matches. */
    private static final class Search {
        Object fragment;
        Activity activity;
        ImageView button;
        LinearLayout bar;
        EditText input;
        TextView counter;
        TextView searchAll;
        ImageView filterButton;
        View sortBar;
        ListView listView;
        ViewTreeObserver.OnPreDrawListener positioner;
        /** Shows only the matching comments. */
        boolean filter;
        String linkName;
        String query = "";
        /** The matching comments (Comment objects) in thread order. */
        List<Object> matches = new ArrayList<>();
        int current = -1;
        Object currentComment;
        boolean loadingAll;
        final Runnable searchRunnable = () -> runSearch(this, true);
    }

    // region Hooks

    /** Injected after DetailLinkFragment finds the "COLLAPSE ALL" button of the sort bar. */
    public static void addSearchButton(Object fragment, TextView collapseButton) {
        try {
            ViewGroup sortBar = (ViewGroup) collapseButton.getParent();
            if (!(sortBar instanceof RelativeLayout)) return;
            Activity activity = (Activity) collapseButton.getContext();
            for (int i = 0; i < sortBar.getChildCount(); i++) {
                Object tag = sortBar.getChildAt(i).getTag();
                if (tag instanceof Search) {
                    ((Search) tag).fragment = fragment;
                    return;
                }
            }

            final Search search = new Search();
            search.fragment = fragment;
            search.activity = activity;

            ImageView button = new ImageView(activity);
            button.setTag(search);
            button.setId(View.generateViewId());
            button.setContentDescription(str("revanced_comment_search_hint"));
            button.setImageDrawable(tinted(activity, "abc_ic_search_api_material", collapseButton.getTextColors()));
            button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            int padding = dp(activity, 12);
            button.setPadding(padding, 0, padding, 0);
            button.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackgroundBorderless));
            button.setOnClickListener(v -> open(search, collapseButton));
            search.button = button;

            if (collapseButton.getId() == View.NO_ID) collapseButton.setId(View.generateViewId());
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                    dp(activity, 48), ViewGroup.LayoutParams.MATCH_PARENT);
            params.addRule(RelativeLayout.LEFT_OF, collapseButton.getId());
            sortBar.addView(button, params);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not add the comment search button", ex);
        }
    }

    /** Injected after CommentHolder sets the text of a comment: highlights the matches of the search. */
    public static void highlight(Object holder, TextView body) {
        Search search = active;
        if (search == null || search.query.isEmpty()) return;
        try {
            Object comment = field(holder, "comment");
            if (comment == null || !search.linkName.equals(field(comment, "link_id"))) return;
            CharSequence text = body.getText();
            Spannable spannable = text instanceof Spannable ? (Spannable) text : new SpannableString(text);
            int accent = accentColor(search.activity);
            boolean isCurrent = comment == search.currentComment;
            int color = isCurrent ? accent : withAlpha(accent, 0x55);
            String string = spannable.toString();
            String query = search.query;
            boolean found = false;
            for (int i = 0; i + query.length() <= string.length(); i++) {
                if (string.regionMatches(true, i, query, 0, query.length())) {
                    spannable.setSpan(new BackgroundColorSpan(color), i, i + query.length(),
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    i += query.length() - 1;
                    found = true;
                }
            }
            if (found && !(text instanceof Spannable)) body.setText(spannable);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not highlight the comment", ex);
        }
    }

    // endregion

    // region Find bar

    private static void open(Search search, TextView collapseButton) {
        try {
            Activity activity = search.activity;
            ListView listView = (ListView) field(search.fragment, "listView");
            View swipeLayout = (View) field(search.fragment, "swipeLayout");
            Object link = field(field(search.fragment, "adapter"), "link");
            if (link == null) link = field(search.fragment, "link");
            search.linkName = (String) field(link, "name");
            if (search.linkName == null) search.linkName = "t3_" + field(link, "id");

            if (search.bar == null) buildBar(search, collapseButton, (ViewGroup) swipeLayout.getParent());
            search.listView = listView;
            search.sortBar = (View) collapseButton.getParent();
            if (search.bar.getVisibility() != View.VISIBLE) {
                search.bar.setVisibility(View.VISIBLE);
                search.positioner = () -> {
                    position(search);
                    return true;
                };
                listView.getViewTreeObserver().addOnPreDrawListener(search.positioner);
                position(search);
            }
            active = search;
            search.input.requestFocus();
            InputMethodManager keyboard = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            keyboard.showSoftInput(search.input, InputMethodManager.SHOW_IMPLICIT);
            runSearch(search, false);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not open the comment search", ex);
        }
    }

    private static void close(Search search) {
        try {
            MAIN.removeCallbacks(search.searchRunnable);
            hideKeyboard(search);
            search.bar.setVisibility(View.GONE);
            if (search.positioner != null) {
                search.listView.getViewTreeObserver().removeOnPreDrawListener(search.positioner);
                search.positioner = null;
            }
            if (active == search) active = null;
            requery(search); // Shows all comments again, without highlights.
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not close the comment search", ex);
        }
    }

    /**
     * Keeps the find bar over the sort bar while it is on screen, else at the top of the comments: the bar
     * never covers the post.
     */
    private static void position(Search search) {
        try {
            ListView listView = search.listView;
            View header = (View) field(search.fragment, "header");
            float y = 0;
            boolean pinned = true;
            if (listView.getFirstVisiblePosition() == 0 && header != null && header.getParent() == listView) {
                int[] barLocation = new int[2];
                int[] containerLocation = new int[2];
                search.sortBar.getLocationInWindow(barLocation);
                ((View) search.bar.getParent()).getLocationInWindow(containerLocation);
                float top = barLocation[1] - containerLocation[1];
                if (top > 0) {
                    y = top;
                    pinned = false;
                }
            }
            if (search.bar.getTranslationY() != y) search.bar.setTranslationY(y);
            float elevation = pinned ? dp(search.activity, 4) : 0;
            if (search.bar.getElevation() != elevation) search.bar.setElevation(elevation);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not place the find bar", ex);
        }
    }

    private static void buildBar(final Search search, TextView collapseButton, ViewGroup container) {
        Activity activity = search.activity;
        ColorStateList secondary = collapseButton.getTextColors();

        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        View sortBar = (View) collapseButton.getParent();
        // The sort bar's color (translucent) over the list's background, so the comments do not show through.
        Drawable sortBackground = sortBar.getBackground() == null ? null
                : sortBar.getBackground().getConstantState().newDrawable().mutate();
        Drawable listBackground = new ColorDrawable(themeColor(activity, "bgColor", Color.BLACK));
        bar.setBackground(sortBackground == null ? listBackground
                : new LayerDrawable(new Drawable[]{listBackground, sortBackground}));
        bar.setClickable(true); // Touches do not reach the list below.

        EditText input = new EditText(activity);
        input.setBackground(null);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        input.setHint(str("revanced_comment_search_hint"));
        input.setHintTextColor(secondary);
        input.setTextColor(primaryTextColor(activity, secondary.getDefaultColor()));
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        input.setPadding(dp(activity, 16), 0, dp(activity, 8), 0);
        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                MAIN.removeCallbacks(search.searchRunnable);
                MAIN.postDelayed(search.searchRunnable, SEARCH_DELAY_MS);
            }
        });
        input.setOnEditorActionListener((v, actionId, event) -> {
            MAIN.removeCallbacks(search.searchRunnable);
            hideKeyboard(search);
            if (!search.query.equals(currentQuery(search))) runSearch(search, true);
            else move(search, 1);
            return true;
        });
        bar.addView(input, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));
        search.input = input;

        TextView counter = new TextView(activity);
        counter.setTextColor(secondary);
        counter.setTextSize(TypedValue.COMPLEX_UNIT_PX, collapseButton.getTextSize());
        counter.setTypeface(collapseButton.getTypeface());
        counter.setPadding(dp(activity, 4), 0, dp(activity, 4), 0);
        bar.addView(counter, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        search.counter = counter;

        TextView searchAll = new TextView(activity);
        searchAll.setText(str("revanced_comment_search_all"));
        searchAll.setTextColor(secondary);
        searchAll.setTextSize(TypedValue.COMPLEX_UNIT_PX, collapseButton.getTextSize());
        searchAll.setTypeface(collapseButton.getTypeface());
        searchAll.setGravity(Gravity.CENTER_VERTICAL);
        searchAll.setPadding(dp(activity, 8), 0, dp(activity, 8), 0);
        searchAll.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackground));
        searchAll.setOnClickListener(v -> loadAll(search));
        bar.addView(searchAll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));
        search.searchAll = searchAll;

        ImageView filterButton = new ImageView(activity);
        filterButton.setImageDrawable(new FunnelDrawable(dp(activity, 18)));
        filterButton.setImageTintList(secondary);
        filterButton.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        filterButton.setContentDescription(str("revanced_comment_search_filter"));
        filterButton.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackgroundBorderless));
        filterButton.setOnClickListener(v -> toggleFilter(search));
        bar.addView(filterButton, new LinearLayout.LayoutParams(dp(activity, 36), ViewGroup.LayoutParams.MATCH_PARENT));
        search.filterButton = filterButton;

        bar.addView(iconButton(activity, "ic_menu_arrow_up_black_24dp", secondary, v -> move(search, -1)),
                new LinearLayout.LayoutParams(dp(activity, 36), ViewGroup.LayoutParams.MATCH_PARENT));
        bar.addView(iconButton(activity, "ic_menu_arrow_down_black_24dp", secondary, v -> move(search, 1)),
                new LinearLayout.LayoutParams(dp(activity, 36), ViewGroup.LayoutParams.MATCH_PARENT));
        bar.addView(iconButton(activity, "abc_ic_clear_material", secondary, v -> close(search)),
                new LinearLayout.LayoutParams(dp(activity, 44), ViewGroup.LayoutParams.MATCH_PARENT));

        bar.setVisibility(View.GONE);
        if (container instanceof RelativeLayout) {
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 48));
            params.addRule(RelativeLayout.ALIGN_PARENT_TOP);
            container.addView(bar, params);
        } else {
            container.addView(bar, 0, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 48)));
        }
        search.bar = bar;
    }

    private static ImageView iconButton(Activity activity, String drawable, ColorStateList color,
                                        View.OnClickListener listener) {
        ImageView button = new ImageView(activity);
        button.setImageDrawable(tinted(activity, drawable, color));
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        button.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackgroundBorderless));
        button.setOnClickListener(listener);
        return button;
    }

    private static void hideKeyboard(Search search) {
        InputMethodManager keyboard = (InputMethodManager) search.activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        keyboard.hideSoftInputFromWindow(search.input.getWindowToken(), 0);
    }

    private static String currentQuery(Search search) {
        return search.input.getText().toString().trim();
    }

    // endregion

    // region Searching

    /** Finds the comments with the query, and with [jump] scrolls to the first one. */
    private static void runSearch(Search search, boolean jump) {
        try {
            String query = currentQuery(search);
            boolean changed = !query.equals(search.query);
            search.query = query;
            Object previous = search.currentComment;
            search.matches = query.isEmpty() ? new ArrayList<>() : findMatches(search, query);
            search.current = search.matches.indexOf(previous);
            if (search.current < 0) {
                search.currentComment = null;
                if (jump && !search.matches.isEmpty()) {
                    search.current = 0;
                    search.currentComment = search.matches.get(0);
                }
            }
            updateCounter(search);
            if (search.currentComment != null && (changed || previous != search.currentComment || search.filter)) {
                scrollTo(search, search.currentComment);
            } else if (search.filter) {
                requery(search);
            } else {
                refresh(search);
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not search the comments", ex);
        }
    }

    private static void move(Search search, int direction) {
        if (search.matches.isEmpty()) return;
        int next = search.current < 0 ? (direction > 0 ? 0 : search.matches.size() - 1)
                : (search.current + direction + search.matches.size()) % search.matches.size();
        search.current = next;
        search.currentComment = search.matches.get(next);
        updateCounter(search);
        scrollTo(search, search.currentComment);
    }

    private static void updateCounter(Search search) {
        if (search.query.isEmpty()) search.counter.setText("");
        else if (search.matches.isEmpty()) search.counter.setText("0/0");
        else search.counter.setText(Math.max(1, search.current + 1) + "/" + search.matches.size());
        int unloaded = 0;
        try {
            unloaded = unloadedCount(search);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not count the comments that are not loaded", ex);
        }
        search.filterButton.setImageTintList(search.filter
                ? ColorStateList.valueOf(accentColor(search.activity))
                : search.searchAll.getTextColors());
        search.searchAll.setVisibility(unloaded > 0 || search.loadingAll ? View.VISIBLE : View.GONE);
        search.searchAll.setEnabled(!search.loadingAll);
        search.searchAll.setText(search.loadingAll
                ? str("revanced_comment_search_loading")
                : str("revanced_comment_search_all"));
    }

    private static List<Object> findMatches(Search search, String query) throws Exception {
        List<Object> matches = new ArrayList<>();
        Class<?> commentClass = Class.forName(COMMENT);
        for (Object reply : replies(search)) {
            if (!commentClass.isInstance(reply)) continue;
            String body = (String) field(reply, "body");
            String author = (String) field(reply, "author");
            if (contains(unescape(body), query) || contains(author, query)) matches.add(reply);
        }
        return matches;
    }

    private static boolean contains(String text, String query) {
        if (text == null) return false;
        for (int i = 0; i + query.length() <= text.length(); i++) {
            if (text.regionMatches(true, i, query, 0, query.length())) return true;
        }
        return false;
    }

    /** Reddit escapes these in the markdown of comments. */
    private static String unescape(String body) {
        if (body == null) return null;
        return body.replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&");
    }

    /** Expands the collapsed comments above the comment, then scrolls to it. */
    private static void scrollTo(Search search, Object comment) {
        try {
            Object adapter = field(search.fragment, "adapter");
            Class<?> threadManager = Class.forName(THREAD_MANAGER);
            synchronized (threadManager) {
                Object thread = thread(search);
                if (thread != null) {
                    Set<String> collapsed = (Set<String>) field(thread, "collapsedIds");
                    Map<String, Object> byName = new HashMap<>();
                    for (Object reply : (List<Object>) field(thread, "replies")) {
                        Object name = field(reply, "name");
                        if (name instanceof String) byName.put((String) name, reply);
                    }
                    Set<Object> seen = new HashSet<>();
                    Object parent = byName.get((String) field(comment, "parent_id"));
                    while (parent != null && seen.add(parent)) {
                        collapsed.remove((String) field(parent, "id"));
                        parent = byName.get((String) field(parent, "parent_id"));
                    }
                }
            }
            // Reloading the list after scrolling would put it back where it was: reload first.
            adapter.getClass().getMethod("requery").invoke(adapter);

            List<Object> items = (List<Object>) field(adapter, "items");
            int position = -1;
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                Field commentField = findField(item.getClass(), "comment");
                if (commentField != null && commentField.get(item) == comment) {
                    position = i;
                    break;
                }
            }
            final ListView listView = (ListView) field(search.fragment, "listView");
            if (position < 0) return;
            final int listPosition = position + listView.getHeaderViewsCount();
            final int barHeight = dp(search.activity, 48);
            listView.post(() -> {
                listView.setSelectionFromTop(listPosition, barHeight);
                // A long comment: also bring the matching words on screen.
                listView.post(() -> revealWord(search, listView, listPosition, barHeight));
            });
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not scroll to the comment", ex);
        }
    }

    private static void revealWord(Search search, ListView listView, int listPosition, int barHeight) {
        try {
            View item = listView.getChildAt(listPosition - listView.getFirstVisiblePosition());
            if (item == null) return;
            TextView body = item.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "commentBody"));
            if (body == null || body.getLayout() == null) return;
            int at = indexOfIgnoreCase(body.getText().toString(), search.query);
            if (at < 0) return;
            Layout layout = body.getLayout();
            int line = layout.getLineForOffset(at);
            int y = body.getTotalPaddingTop() + layout.getLineTop(line);
            for (View view = body; view != item && view != null; view = (View) view.getParent()) {
                y += view.getTop();
            }
            int lineHeight = layout.getLineBottom(line) - layout.getLineTop(line);
            int visibleBottom = listView.getHeight() - listView.getPaddingBottom();
            if (item.getTop() + y + lineHeight <= visibleBottom - dp(search.activity, 16)) return;
            // The line a third down the visible comments.
            int target = barHeight + (visibleBottom - barHeight) / 3;
            listView.setSelectionFromTop(listPosition, target - y);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not scroll to the matching words", ex);
        }
    }

    private static int indexOfIgnoreCase(String text, String query) {
        for (int i = 0; i + query.length() <= text.length(); i++) {
            if (text.regionMatches(true, i, query, 0, query.length())) return i;
        }
        return -1;
    }

    private static void toggleFilter(Search search) {
        search.filter = !search.filter;
        updateCounter(search);
        if (search.currentComment != null) scrollTo(search, search.currentComment);
        else requery(search);
    }

    /**
     * Injected at the end of CommentsAdapter.processData, where the list gets its items: with "only matching
     * comments", replaces them with the matches (also the ones inside collapsed comments).
     */
    public static void onItemsProcessed(Object adapter) {
        Search search = active;
        if (search == null || !search.filter || search.query.isEmpty()) return;
        try {
            if (field(search.fragment, "adapter") != adapter) return;
            List<Object> items = (List<Object>) field(adapter, "items");
            items.clear();
            Class<?> itemClass = Class.forName(COMMENT_ITEM);
            for (Object match : findMatches(search, search.query)) {
                Object item = itemClass.newInstance();
                findField(itemClass, "comment").set(item, match);
                items.add(item);
            }
            // No "loading" row at the end: "SEARCH ALL" loads the rest.
            findField(adapter.getClass(), "hasMore").setBoolean(adapter, false);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show only the matching comments", ex);
        }
    }

    private static void requery(Search search) {
        try {
            Object adapter = field(search.fragment, "adapter");
            adapter.getClass().getMethod("requery").invoke(adapter);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not reload the comments", ex);
        }
    }

    /** Redraws the comments, with or without highlights. */
    private static void refresh(Search search) {
        try {
            Object adapter = field(search.fragment, "adapter");
            adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not redraw the comments", ex);
        }
    }

    // endregion

    // region Search all

    /** Loads every "load more comments" of the post, one request at a time, then searches again. */
    private static void loadAll(final Search search) {
        if (search.loadingAll) return;
        search.loadingAll = true;
        updateCounter(search);
        loadNext(search, new HashSet<>(), 0);
    }

    private static void loadNext(final Search search, final Set<String> tried, final int requests) {
        try {
            if (active != search || search.bar.getVisibility() != View.VISIBLE) {
                search.loadingAll = false;
                return;
            }
            Object adapter = field(search.fragment, "adapter");
            // The list loads its last "more" by itself when scrolled to the end: never load it twice.
            if (Boolean.TRUE.equals(field(adapter, "loading"))) {
                MAIN.postDelayed(() -> loadNext(search, tried, requests), 500);
                return;
            }
            Object more = null;
            if (requests < MAX_LOAD_REQUESTS) {
                Object thread;
                Set<String> loading;
                synchronized (Class.forName(THREAD_MANAGER)) {
                    thread = thread(search);
                    loading = thread == null ? new HashSet<>()
                            : new HashSet<>(((Map<String, Integer>) field(thread, "states")).keySet());
                }
                for (Object reply : replies(search)) {
                    if (!reply.getClass().getName().equals(MORE)) continue;
                    List<String> children = (List<String>) field(reply, "children");
                    String id = (String) field(reply, "id");
                    if (children != null && !children.isEmpty() && !tried.contains(id) && !loading.contains(id)) {
                        more = reply;
                        break;
                    }
                }
            }
            if (more == null) {
                search.loadingAll = false;
                runSearch(search, true);
                return;
            }
            tried.add((String) field(more, "id"));

            Class<?> threadManager = Class.forName(THREAD_MANAGER);
            Object threadKey = field(search.fragment, "threadKey");
            Method loadMore = null;
            for (Method method : threadManager.getMethods()) {
                if (method.getName().equals("loadMore") && method.getParameterTypes().length == 5) loadMore = method;
            }
            if (loadMore == null) throw new NoSuchMethodException("ThreadManager.loadMore");
            loadMore.invoke(null, search.activity, adapter, threadKey, more, new Tasks.OnCompleteListener<Object>() {
                @Override
                public void onComplete(Object data) {
                    try {
                        Object adapter = field(search.fragment, "adapter");
                        adapter.getClass().getMethod("requery").invoke(adapter);
                    } catch (Exception ex) {
                        Logger.printInfo(() -> "Could not show the loaded comments", ex);
                    }
                    updateCounter(search);
                    loadNext(search, tried, requests + 1);
                }

                @Override
                public void onCancel(String error) {
                    search.loadingAll = false;
                    Utils.showToastLong(str("revanced_comment_search_error", error));
                    runSearch(search, true);
                }
            });
        } catch (Exception ex) {
            search.loadingAll = false;
            updateCounter(search);
            ErrorDialog.printException(() -> "Could not load all comments", ex);
        }
    }

    /** Comments behind "load more comments" (not "continue this thread", which is another page). */
    private static int unloadedCount(Search search) throws Exception {
        int count = 0;
        for (Object reply : replies(search)) {
            if (!reply.getClass().getName().equals(MORE)) continue;
            List<String> children = (List<String>) field(reply, "children");
            if (children != null && !children.isEmpty()) count += Math.max(children.size(), (int) field(reply, "count"));
        }
        return count;
    }

    // endregion

    // region Thread data

    /** ThreadManager's thread of the post: its comments and "more" items in order. */
    private static Object thread(Search search) throws Exception {
        Object threadKey = field(search.fragment, "threadKey");
        Map<Object, Object> threads = (Map<Object, Object>) staticField(Class.forName(THREAD_MANAGER), "threads");
        return threads.get(threadKey);
    }

    private static List<Object> replies(Search search) throws Exception {
        Class<?> threadManager = Class.forName(THREAD_MANAGER);
        synchronized (threadManager) {
            Object thread = thread(search);
            if (thread == null) return new ArrayList<>();
            return new ArrayList<>((Collection<Object>) field(thread, "replies"));
        }
    }

    // endregion

    // region Utilities

    private static Object field(Object target, String name) throws Exception {
        if (target == null) return null;
        Field field = findField(target.getClass(), name);
        if (field == null) throw new NoSuchFieldException(name);
        return field.get(target);
    }

    private static Object staticField(Class<?> type, String name) throws Exception {
        Field field = findField(type, name);
        if (field == null) throw new NoSuchFieldException(name);
        return field.get(null);
    }

    private static final Map<String, Field> FIELDS = new HashMap<>();

    private static Field findField(Class<?> type, String name) {
        String key = type.getName() + "." + name;
        synchronized (FIELDS) {
            if (FIELDS.containsKey(key)) return FIELDS.get(key);
        }
        Field found = null;
        for (Class<?> current = type; current != null && found == null; current = current.getSuperclass()) {
            try {
                found = current.getDeclaredField(name);
                found.setAccessible(true);
            } catch (NoSuchFieldException ignored) {
            }
        }
        synchronized (FIELDS) {
            FIELDS.put(key, found);
        }
        return found;
    }

    private static Drawable tinted(Activity activity, String name, ColorStateList color) {
        int id = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, name);
        if (id == 0) return null;
        Drawable drawable = activity.getDrawable(id).mutate();
        drawable.setTintList(color);
        return drawable;
    }

    private static Drawable themeDrawable(Activity activity, int attribute) {
        TypedValue value = new TypedValue();
        if (!activity.getTheme().resolveAttribute(attribute, value, true) || value.resourceId == 0) return null;
        return activity.getDrawable(value.resourceId).mutate();
    }

    private static int primaryTextColor(Activity activity, int fallback) {
        TypedArray array = activity.getTheme().obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        try {
            return array.getColor(0, fallback);
        } finally {
            array.recycle();
        }
    }

    private static int accentColor(Activity activity) {
        TypedArray array = activity.getTheme().obtainStyledAttributes(new int[]{android.R.attr.colorAccent});
        try {
            return array.getColor(0, 0xFFFF8B60);
        } finally {
            array.recycle();
        }
    }

    private static int themeColor(Activity activity, String attributeName, int fallback) {
        int attribute = ResourceUtils.getIdentifier(ResourceType.ATTR, attributeName);
        TypedValue value = new TypedValue();
        if (attribute == 0 || !activity.getTheme().resolveAttribute(attribute, value, true)) return fallback;
        if (value.resourceId != 0) return activity.getColor(value.resourceId);
        return value.data;
    }

    /** A funnel: the "show only matching comments" button (the app has no filter icon). */
    private static final class FunnelDrawable extends Drawable {
        private final int size;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private ColorStateList tint = ColorStateList.valueOf(Color.GRAY);

        FunnelDrawable(int size) {
            this.size = size;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float w = bounds.width(), h = bounds.height();
            float left = bounds.left, top = bounds.top;
            path.reset();
            path.moveTo(left + w * 0.08f, top + h * 0.15f);
            path.lineTo(left + w * 0.92f, top + h * 0.15f);
            path.lineTo(left + w * 0.58f, top + h * 0.52f);
            path.lineTo(left + w * 0.58f, top + h * 0.85f);
            path.lineTo(left + w * 0.42f, top + h * 0.75f);
            path.lineTo(left + w * 0.42f, top + h * 0.52f);
            path.close();
            paint.setColor(tint.getColorForState(getState(), tint.getDefaultColor()));
            canvas.drawPath(path, paint);
        }

        @Override
        public void setTintList(ColorStateList tint) {
            if (tint != null) this.tint = tint;
            invalidateSelf();
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            invalidateSelf();
            return true;
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static int withAlpha(int color, int alpha) {
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    // endregion
}
