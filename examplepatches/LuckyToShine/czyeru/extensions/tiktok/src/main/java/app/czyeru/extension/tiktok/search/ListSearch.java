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
import java.lang.reflect.Method;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
    }

    // region Install

    /**
     * Adds the search bar above the list. Automatically uses {@link #installOverlay} when
     * the list's parent is a FrameLayout, or {@link #installWrapped} otherwise.
     */
    public static void install(View recyclerView, View root, String hint, Matcher matcher) {
        if (recyclerView == null) {
            return;
        }
        ViewParent parent = recyclerView.getParent();
        if (parent instanceof FrameLayout) {
            installOverlay(recyclerView, root, hint, matcher);
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
        try {
            ViewParent parent = recyclerView.getParent();
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

            EditText search = createSearchBox(recyclerView, hint, matcher, false);
            FrameLayout.LayoutParams searchParams = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    searchHeight,
                    Gravity.TOP
            );
            searchParams.setMarginStart(margin);
            searchParams.setMarginEnd(margin);
            searchParams.topMargin = gap;
            ((FrameLayout) parent).addView(search, searchParams);

            ViewGroup.LayoutParams params = recyclerView.getLayoutParams();
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) params).topMargin += searchHeight + gap;
                recyclerView.setLayoutParams(params);
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

            EditText search = createSearchBox(recyclerView, hint, matcher, rebuilds);

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

    private static EditText createSearchBox(View recyclerView, String hint, Matcher matcher, boolean rebuilds) {
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
                applyQuery(recyclerView, s.toString(), matcher, rebuilds);
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

    private static void applyQuery(View recyclerView, String query, Matcher matcher, boolean rebuilds) {
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
            state.query = query == null ? "" : fold(query.trim());
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
            if (state.shownSnapshot != null) {
                for (Object item : state.shownSnapshot) {
                    if (!current.contains(item)) {
                        state.full.remove(item);
                    }
                }
            }
            for (Object item : current) {
                if (!state.full.contains(item)) {
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

        if (next != current) {
            setAdapterList(adapter, state, next);
        }
        state.shown = next;
        state.shownSize = next == null ? 0 : next.size();
        state.shownSnapshot = next == null || next == state.full ? null : new ArrayList(next);
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
        String haystack = fold(text);
        for (String word : query.split("\\s+")) {
            if (!word.isEmpty() && !haystack.contains(word)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Matches a video (Aweme) by description, title, creator name or creator username.
     * Aweme and User keep their real getter names.
     */
    public static boolean awemeMatches(Object aweme, String query) {
        Object author = call(aweme, "getAuthor");
        return containsAllWords(text(call(aweme, "getDesc")), query)
                || containsAllWords(text(call(aweme, "getTitle")), query)
                || containsAllWords(text(call(author, "getNickname")), query)
                || containsAllWords(text(call(author, "getUniqueId")), query);
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
