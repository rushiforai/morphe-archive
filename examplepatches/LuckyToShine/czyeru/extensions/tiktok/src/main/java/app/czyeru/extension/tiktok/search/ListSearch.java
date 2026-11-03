package app.czyeru.extension.tiktok.search;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.czyeru.extension.shared.Logger;

/**
 * Search bar for a TikTok RecyclerView whose adapter extends the app's base data adapter
 * (getData/setData with a plain List). Shared by the liked videos page and the
 * "save to collection" sheet.
 * <p>
 * AndroidX RecyclerView is obfuscated in TikTok, so this class only uses framework View APIs
 * plus reflection on members that keep their real names (getAdapter, getData, setData).
 * Filtering swaps a filtered copy into the adapter and keeps the unfiltered list as the source.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class ListSearch {
    /** Decides whether a list item stays visible. The query is already folded (see {@link #fold}). */
    public interface Matcher {
        boolean keep(Object item, String query);
    }

    /** Told about every query change. The query is the trimmed text as typed (not folded). */
    public interface QueryListener {
        void onQuery(View recyclerView, String query);
    }

    private static final int SEARCH_HEIGHT_DP = 40;
    private static final int SEARCH_MARGIN_DP = 16;
    private static final int SEARCH_GAP_DP = 8;

    // Values must not reach their keys: a list's search bar and root are its own parent and
    // ancestor, so a strong value would keep every old tab's views alive.
    private static final Map<View, Boolean> searchBars = new WeakHashMap<>();
    private static final Map<View, WeakReference<View>> listsByRoot = new WeakHashMap<>();
    private static final Map<Object, FilterState> filterStates = new WeakHashMap<>();

    private ListSearch() {
    }

    private static final class FilterState {
        WeakReference<View> listRef;
        Matcher matcher;
        /** The adapter clears its list and adds the whole new list on every change. */
        boolean rebuilds;
        List full;
        List shown;
        List shownSnapshot;
        int shownSize;
        String query = "";
        boolean reapplyPosted;
        boolean autoLoad;
        /** Source size when the last page was requested, so each page is requested once. */
        int loadRequestedSize = -1;
        /** Items found elsewhere (server search) for the current query, shown after the matches. */
        List extras;
    }

    // region Install

    /**
     * Adds the search bar above the list. Automatically uses {@link #installOverlay} when
     * the list's parent is a FrameLayout, or {@link #installWrapped} otherwise.
     */
    public static void install(View recyclerView, View root, String hint, Matcher matcher) {
        install(recyclerView, recyclerView, root, hint, matcher);
    }

    /**
     * @param anchor the view the bar is placed above: the list, or a container that must stay
     *               the list's only child (TikTok's pull-to-refresh layout)
     */
    public static void install(View anchor, View recyclerView, View root, String hint, Matcher matcher) {
        if (anchor == null || recyclerView == null) {
            return;
        }
        ViewParent parent = anchor.getParent();
        if (parent instanceof FrameLayout) {
            installOverlay(anchor, recyclerView, root, hint, matcher, false, null);
        } else if (parent instanceof ViewGroup) {
            installWrapped(recyclerView, hint, matcher);
        }
    }

    /**
     * Adds the search bar above the list as an overlay. The list's parent must be a FrameLayout,
     * and the list is moved down by the bar height.
     *
     * @param root optional fragment root, used by {@link #onResume(Object)} to find the list
     */
    public static void installOverlay(View recyclerView, View root, String hint, Matcher matcher) {
        installOverlay(recyclerView, recyclerView, root, hint, matcher, false, null);
    }

    /**
     * @param autoLoad while a query is typed, keep asking the adapter's load-more listener for
     *                 the next page, so items that were never scrolled to are searched too
     */
    public static void installOverlay(View recyclerView, View root, String hint, Matcher matcher, boolean autoLoad) {
        installOverlay(recyclerView, recyclerView, root, hint, matcher, autoLoad, null);
    }

    /** @param queryListener optional, told about every query change (see {@link #setExtraItems}) */
    public static void installOverlay(View recyclerView, View root, String hint, Matcher matcher,
                                      boolean autoLoad, QueryListener queryListener) {
        installOverlay(recyclerView, recyclerView, root, hint, matcher, autoLoad, queryListener);
    }

    private static void installOverlay(View anchor, View recyclerView, View root, String hint,
                                       Matcher matcher, boolean autoLoad, QueryListener queryListener) {
        try {
            ViewParent parent = anchor.getParent();
            if (!(parent instanceof FrameLayout)) {
                Logger.printDebug(() -> "List search: unsupported list parent " + parent);
                return;
            }
            if (searchBars.containsKey(recyclerView)) {
                return;
            }

            Context context = recyclerView.getContext();
            int searchHeight = dp(context, SEARCH_HEIGHT_DP);
            int margin = dp(context, SEARCH_MARGIN_DP);
            int gap = dp(context, SEARCH_GAP_DP);

            EditText search = createSearchBox(recyclerView, hint, matcher, false, autoLoad, queryListener);
            FrameLayout.LayoutParams searchParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    searchHeight,
                    Gravity.TOP
            );
            searchParams.setMarginStart(margin);
            searchParams.setMarginEnd(margin);
            searchParams.topMargin = gap;
            ((FrameLayout) parent).addView(search, searchParams);

            ViewGroup.LayoutParams params = anchor.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) params).topMargin += searchHeight + gap;
                anchor.setLayoutParams(params);
            }

            searchBars.put(recyclerView, Boolean.TRUE);
            if (root != null) {
                listsByRoot.put(root, new WeakReference<>(recyclerView));
            }
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search install failed", throwable);
        }
    }

    /**
     * Adds the search bar above the list by wrapping the list in a vertical LinearLayout that
     * takes over the list's layout params. Works for any parent, including ConstraintLayout.
     * If the parent has a fixed height (a bottom sheet), it is made taller by the bar's height.
     */
    public static void installWrapped(View recyclerView, String hint, Matcher matcher) {
        installWrapped(recyclerView, hint, matcher, false);
    }

    /**
     * @param rebuilds true when the adapter clears its list and adds the whole new list on every
     *                 change, so a changed list is the new unfiltered source
     */
    public static void installWrapped(View recyclerView, String hint, Matcher matcher, boolean rebuilds) {
        try {
            ViewParent viewParent = recyclerView.getParent();
            if (!(viewParent instanceof ViewGroup)) {
                Logger.printDebug(() -> "List search: unsupported list parent " + viewParent);
                return;
            }
            if (searchBars.containsKey(recyclerView)) {
                return;
            }

            ViewGroup parent = (ViewGroup) viewParent;
            Context context = recyclerView.getContext();
            int searchHeight = dp(context, SEARCH_HEIGHT_DP);
            int margin = dp(context, SEARCH_MARGIN_DP);
            int gap = dp(context, SEARCH_GAP_DP);

            EditText search = createSearchBox(recyclerView, hint, matcher, rebuilds, false, null);

            int index = parent.indexOfChild(recyclerView);
            ViewGroup.LayoutParams listParams = recyclerView.getLayoutParams();
            parent.removeViewAt(index);

            LinearLayout wrapper = new LinearLayout(context);
            wrapper.setOrientation(LinearLayout.VERTICAL);

            LinearLayout.LayoutParams searchParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    searchHeight
            );
            searchParams.setMarginStart(margin);
            searchParams.setMarginEnd(margin);
            searchParams.topMargin = gap;
            searchParams.bottomMargin = gap;
            wrapper.addView(search, searchParams);
            wrapper.addView(recyclerView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    0,
                    1f
            ));
            parent.addView(wrapper, index, listParams);

            ViewGroup.LayoutParams parentParams = parent.getLayoutParams();
            if (parentParams != null && parentParams.height > 0) {
                parentParams.height += searchHeight + gap * 2;
                parent.setLayoutParams(parentParams);
            }

            searchBars.put(recyclerView, Boolean.TRUE);
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search wrap failed", throwable);
        }
    }

    private static EditText createSearchBox(View recyclerView, String hint, Matcher matcher,
                                            boolean rebuilds, boolean autoLoad, QueryListener queryListener) {
        Context context = recyclerView.getContext();
        boolean dark = isDarkMode(context);

        EditText search = new EditText(context);
        search.setHint(hint);
        search.setSingleLine(true);
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        search.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        search.setTextColor(dark ? 0xFFFFFFFF : 0xFF161823);
        search.setHintTextColor(dark ? 0x80FFFFFF : 0x80161823);
        search.setGravity(Gravity.CENTER_VERTICAL);
        int horizontalPadding = dp(context, 12);
        search.setPadding(horizontalPadding, 0, horizontalPadding, 0);

        GradientDrawable background = new GradientDrawable();
        background.setColor(dark ? 0x1FFFFFFF : 0x0F161823);
        background.setCornerRadius(dp(context, 8));
        search.setBackground(background);

        search.setOnEditorActionListener((view, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH) {
                hideKeyboard(view);
                return true;
            }
            return false;
        });
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                applyQuery(recyclerView, s.toString(), matcher, rebuilds, autoLoad);
                if (queryListener != null) {
                    try {
                        queryListener.onQuery(recyclerView, s.toString().trim());
                    } catch (Throwable throwable) {
                        Logger.printException(() -> "List search query listener failed", throwable);
                    }
                }
            }
        });
        return search;
    }

    private static void hideKeyboard(View view) {
        InputMethodManager manager = (InputMethodManager) view.getContext()
                .getSystemService(Context.INPUT_METHOD_SERVICE);
        if (manager != null) {
            manager.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
        view.clearFocus();
    }

    // endregion

    // region Hooks

    /** Start of the adapter's bind. TikTok replaced or extended the list, so filter the new data. */
    public static void onBind(Object adapter) {
        try {
            FilterState state = filterStates.get(adapter);
            if (state == null || state.query.isEmpty() || state.reapplyPosted) {
                return;
            }

            Object current = getAdapterList(adapter, state);
            if (current == state.shown && (current == null || ((List) current).size() == state.shownSize)) {
                return;
            }

            // Do not change adapter data during bind or layout.
            state.reapplyPosted = true;
            app.czyeru.extension.shared.Utils.runOnMainThread(() -> {
                state.reapplyPosted = false;
                try {
                    applyFilter(adapter, state);
                } catch (Throwable throwable) {
                    Logger.printException(() -> "List search refresh failed", throwable);
                }
            });
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search bind hook failed", throwable);
        }
    }

    /**
     * Start of a fragment's onResume. TikTok edits its own list by position when the page
     * comes back (for example after un-liking a video), so give it the unfiltered list first.
     * The next bind filters again.
     */
    public static void onResume(Object fragment) {
        try {
            Object root = invoke(fragment, "getView");
            WeakReference<View> listReference = root instanceof View ? listsByRoot.get(root) : null;
            View list = listReference == null ? null : listReference.get();
            Object adapter = list == null ? null : invoke(list, "getAdapter");
            FilterState state = adapter == null ? null : filterStates.get(adapter);
            if (state == null || state.query.isEmpty() || state.full == null) {
                return;
            }

            Object current = getAdapterList(adapter, state);
            if (current != state.full) {
                setAdapterList(adapter, state, state.full);
            }
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search resume hook failed", throwable);
        }
    }

    // endregion

    // region Filtering

    private static void applyQuery(View recyclerView, String query, Matcher matcher, boolean rebuilds, boolean autoLoad) {
        try {
            Object adapter = invoke(recyclerView, "getAdapter");
            if (adapter == null) {
                return;
            }

            FilterState state = filterStates.get(adapter);
            if (state == null) {
                state = new FilterState();
                filterStates.put(adapter, state);
            }
            state.listRef = new WeakReference<>(recyclerView);
            state.matcher = matcher;
            state.rebuilds = rebuilds;
            state.autoLoad = autoLoad;
            String folded = query == null ? "" : fold(query.trim());
            if (!folded.equals(state.query)) {
                state.extras = null;
            }
            state.query = folded;
            applyFilter(adapter, state);
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search failed", throwable);
        }
    }

    private static void applyFilter(Object adapter, FilterState state) {
        Object currentObject = getAdapterList(adapter, state);
        List current = currentObject instanceof List ? (List) currentObject : null;

        if (current != state.shown) {
            // New list from TikTok: it is the unfiltered source.
            state.full = current != null ? new ArrayList(current) : null;
        } else if (current != null && state.rebuilds && current.size() != state.shownSize) {
            // TikTok cleared the list we set and added its whole new list to it.
            state.full = new ArrayList(current);
        } else if (current != null && state.full != null && current.size() != state.shownSize) {
            // TikTok changed the list we set. Mirror its additions and removals in the source list.
            // Hash sets keep this linear: List.contains in both loops was quadratic on big lists.
            if (state.shownSnapshot != null) {
                Set currentItems = new HashSet(current);
                Set removed = new HashSet();
                for (Object item : state.shownSnapshot) {
                    if (!currentItems.contains(item)) {
                        removed.add(item);
                    }
                }
                if (!removed.isEmpty()) {
                    state.full.removeAll(removed);
                }
            }
            Set fullItems = new HashSet(state.full);
            Set extraKeys = keysOf(state.extras);
            for (Object item : current) {
                // Extras are shown in our list but are not TikTok's items: keep them out of the source.
                if ((extraKeys.isEmpty() || !extraKeys.contains(keyOf(item))) && fullItems.add(item)) {
                    state.full.add(item);
                }
            }
        }

        List next;
        if (state.query.isEmpty() || state.full == null || state.matcher == null) {
            next = state.full;
        } else {
            next = new ArrayList();
            for (Object item : state.full) {
                if (state.matcher.keep(item, state.query)) {
                    next.add(item);
                }
            }
        }

        if (next != null && next != state.full && state.extras != null) {
            Set shownKeys = keysOf(next);
            for (Object extra : state.extras) {
                if (shownKeys.add(keyOf(extra))) {
                    next.add(extra);
                }
            }
        }

        if (next != current) {
            setAdapterList(adapter, state, next);
        }
        state.shown = next;
        state.shownSize = next == null ? 0 : next.size();
        state.shownSnapshot = next == null || next == state.full ? null : new ArrayList(next);

        if (state.query.isEmpty()) {
            state.loadRequestedSize = -1;
        } else if (state.autoLoad && state.full != null && state.full.size() != state.loadRequestedSize) {
            // A new page arrived (or the search just started): ask for the next one. TikTok
            // ignores the call while a page is loading or when there are no more pages.
            state.loadRequestedSize = state.full.size();
            requestNextPage(adapter);
        }
    }

    /**
     * Shows items found elsewhere (server search) after the matches, while the query is still
     * the one they were found for. Items already shown (same video id) are not added twice.
     */
    public static void setExtraItems(View recyclerView, String query, List items) {
        try {
            Object adapter = invoke(recyclerView, "getAdapter");
            FilterState state = adapter == null ? null : filterStates.get(adapter);
            if (state == null || query == null || state.query.isEmpty()
                    || !state.query.equals(fold(query.trim()))) {
                return;
            }
            state.extras = items == null || items.isEmpty() ? null : new ArrayList(items);
            applyFilter(adapter, state);
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search: extra items failed", throwable);
        }
    }

    /** Video id for videos (two Aweme objects of one video differ in equals), the item itself otherwise. */
    private static Object keyOf(Object item) {
        Object id = item == null ? null : invoke(item, "getAid");
        return id != null ? id : item;
    }

    private static Set keysOf(List items) {
        Set keys = new HashSet();
        if (items != null) {
            for (Object item : items) {
                keys.add(keyOf(item));
            }
        }
        return keys;
    }

    /** Calls the adapter's load-more listener, the same one TikTok calls when the list is scrolled to the end. */
    public static void requestNextPage(Object adapter) {
        Object listener = readField(adapter, "mmLoadMoreListener");
        if (listener == null) {
            Logger.printDebug(() -> "List search: no load-more listener on " + adapter);
            return;
        }
        // Post: the caller may be inside a text change or a bind.
        app.czyeru.extension.shared.Utils.runOnMainThread(() -> invoke(listener, "loadMore"));
    }

    private static List getAdapterList(Object adapter, FilterState state) {
        if (adapter != null) {
            Object current = invoke(adapter, "getData");
            if (current instanceof List) {
                return (List) current;
            }
        }
        if (state != null && state.listRef != null) {
            View list = state.listRef.get();
            if (list != null) {
                Object listItems = invoke(list, "getListItems");
                if (listItems instanceof List) {
                    return (List) listItems;
                }
            }
        }
        if (adapter != null) {
            Object powerListItems = invoke(adapter, "LLLIIII");
            if (powerListItems instanceof List) {
                return (List) powerListItems;
            }
        }
        return null;
    }

    private static void setAdapterList(Object adapter, FilterState state, List next) {
        if (adapter != null) {
            Method setDataMethod = findMethod(adapter.getClass(), "setData", List.class);
            if (setDataMethod != null) {
                try {
                    setDataMethod.setAccessible(true);
                    setDataMethod.invoke(adapter, next);
                    return;
                } catch (Throwable throwable) {
                    Logger.printException(() -> "List search: setData failed", throwable);
                }
            }
        }
        if (state != null && state.listRef != null) {
            View list = state.listRef.get();
            if (list != null) {
                Object powerState = invoke(list, "getState");
                if (powerState != null) {
                    Method updateMethod = findCollectionRunnableMethod(powerState.getClass());
                    if (updateMethod != null) {
                        try {
                            updateMethod.setAccessible(true);
                            updateMethod.invoke(powerState, next, null);
                            return;
                        } catch (Throwable throwable) {
                            Logger.printException(() -> "List search: PowerList update failed", throwable);
                        }
                    }
                }
            }
        }
    }

    /** Lower case without accents, so "cancion" finds "Canción". */
    public static String fold(String text) {
        if (text == null) {
            return "";
        }
        String decomposed = Normalizer.normalize(text, Normalizer.Form.NFD);
        StringBuilder result = new StringBuilder(decomposed.length());
        for (int i = 0; i < decomposed.length(); i++) {
            char c = decomposed.charAt(i);
            if (Character.getType(c) != Character.NON_SPACING_MARK) {
                result.append(c);
            }
        }
        return result.toString().toLowerCase(Locale.ROOT);
    }

    /** True when every word of the folded query appears in the text. */
    public static boolean containsAllWords(String text, String query) {
        if (query.isEmpty()) {
            return true;
        }
        if (text == null || text.isEmpty()) {
            return false;
        }
        return foldedContainsAllWords(fold(text), queryWords(query));
    }

    private static boolean foldedContainsAllWords(String haystack, String[] words) {
        if (haystack == null || haystack.isEmpty()) {
            return false;
        }
        for (String word : words) {
            if (!word.isEmpty() && !haystack.contains(word)) {
                return false;
            }
        }
        return true;
    }

    // Main thread only. Splitting with a regex for every field of every item was the main cost.
    private static String lastQuery;
    private static String[] lastQueryWords;

    private static String[] queryWords(String query) {
        if (!query.equals(lastQuery)) {
            lastQueryWords = query.split("\\s+");
            lastQuery = query;
        }
        return lastQueryWords;
    }

    /** Reads the searchable texts of an item, already folded (see {@link #fold}). Nulls are allowed. */
    public interface TextReader {
        String[] read(Object item);
    }

    /**
     * Folded texts per item, read once so a keystroke only runs String.contains.
     * Keyed by instance: TikTok's equals compares mutable fields (Aweme) or is not paired with
     * a matching hashCode (MusNotice), so a lookup also checks that it found the same object.
     */
    public static final class TextCache {
        private static final class Entry {
            final WeakReference<Object> item;
            final String[] texts;

            Entry(Object item, String[] texts) {
                this.item = new WeakReference<>(item);
                this.texts = texts;
            }
        }

        private final Map<Object, Entry> entries = new WeakHashMap<>();

        public String[] get(Object item, TextReader reader) {
            Entry entry = entries.get(item);
            if (entry != null && entry.item.get() == item) {
                return entry.texts;
            }
            String[] texts = reader.read(item);
            entries.put(item, new Entry(item, texts));
            return texts;
        }
    }

    /** True when one of the folded texts of the item contains every word of the folded query. */
    public static boolean anyTextMatches(Object item, String query, TextCache cache, TextReader reader) {
        if (query.isEmpty()) {
            return true;
        }
        if (item == null) {
            return false;
        }
        String[] words = queryWords(query);
        for (String text : cache.get(item, reader)) {
            if (foldedContainsAllWords(text, words)) {
                return true;
            }
        }
        return false;
    }

    private static final TextCache awemeTexts = new TextCache();

    private static final TextReader AWEME_TEXTS = aweme -> {
        Object author = call(aweme, "getAuthor");
        return new String[]{
                foldOrNull(call(aweme, "getDesc")),
                foldOrNull(call(aweme, "getTitle")),
                foldOrNull(call(author, "getNickname")),
                foldOrNull(call(author, "getUniqueId")),
        };
    };

    /**
     * Matches a video (Aweme) by description, title, creator name or creator username.
     * Aweme and User keep their real getter names.
     */
    public static boolean awemeMatches(Object aweme, String query) {
        return anyTextMatches(aweme, query, awemeTexts, AWEME_TEXTS);
    }

    /** {@link #fold} of a String, or null for anything else. */
    public static String foldOrNull(Object value) {
        return value instanceof String ? fold((String) value) : null;
    }

    /**
     * Matches a user by nickname, uniqueId (handle), or signature (bio).
     */
    public static boolean userMatches(Object user, String query) {
        if (user == null) {
            return false;
        }
        return containsAllWords(text(call(user, "getNickname")), query)
                || containsAllWords(text(call(user, "getUniqueId")), query)
                || containsAllWords(text(call(user, "getSignature")), query);
    }

    /**
     * Matches a comment by text or comment author.
     */
    public static boolean commentMatches(Object comment, String query) {
        if (comment == null) {
            return false;
        }
        return containsAllWords(text(call(comment, "getText")), query)
                || userMatches(call(comment, "getUser"), query);
    }

    private static String text(Object value) {
        return value instanceof String ? (String) value : null;
    }

    // endregion

    // region Reflection helpers

    /** Finds a public method by name and parameter types, returning null on failure. */
    public static Method findMethod(Class<?> clazz, String name, Class<?>... parameterTypes) {
        try {
            return clazz.getMethod(name, parameterTypes);
        } catch (NoSuchMethodException ignored) {
            return null;
        }
    }

    private static Method findCollectionRunnableMethod(Class<?> clazz) {
        try {
            return clazz.getMethod("LJIILL", java.util.Collection.class, Runnable.class);
        } catch (NoSuchMethodException ignored) {
        }
        for (Method m : clazz.getMethods()) {
            Class<?>[] params = m.getParameterTypes();
            if (params.length == 2 && java.util.Collection.class.isAssignableFrom(params[0]) && Runnable.class.isAssignableFrom(params[1])) {
                return m;
            }
        }
        return null;
    }

    /** Reads a field declared on the object's class or a superclass. Returns null on any failure. */
    private static Object readField(Object target, String name) {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                // Check the superclass.
            } catch (Throwable throwable) {
                return null;
            }
        }
        return null;
    }

    /** Calls a public no-argument method by name. Returns null on any failure. */
    public static Object call(Object target, String name) {
        return target == null ? null : invoke(target, name);
    }

    private static Object invoke(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable throwable) {
            return null;
        }
    }

    private static void invoke(Object target, String name, Class<?> parameterType, Object argument) {
        try {
            Method method = target.getClass().getMethod(name, parameterType);
            method.setAccessible(true);
            method.invoke(target, argument);
        } catch (Throwable throwable) {
            Logger.printException(() -> "List search: " + name + " failed", throwable);
        }
    }

    private static boolean isDarkMode(Context context) {
        int mode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    // endregion
}
