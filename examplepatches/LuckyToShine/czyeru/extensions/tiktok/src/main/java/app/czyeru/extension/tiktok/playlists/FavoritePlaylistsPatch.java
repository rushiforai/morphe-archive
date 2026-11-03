package app.czyeru.extension.tiktok.playlists;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
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
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.tiktok.search.ListSearch;
import app.czyeru.extension.tiktok.settings.Settings;

/**
 * Favorite playlists (Profile > Favorites > Collections) layout and search.
 * <p>
 * Hooked from CollectionListMainUIAssem and its adapter. AndroidX RecyclerView is
 * obfuscated in TikTok, so this class only uses framework View APIs plus reflection
 * on members that keep their real names (itemView, getAdapter, getData, setData).
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class FavoritePlaylistsPatch {
    /**
     * 8pt grid: RecyclerView side padding (12dp) plus cell side margins (4dp)
     * gives 16dp outer margins and 8dp gutters.
     */
    private static final int GRID_COLUMNS = 3;
    private static final int GRID_LIST_PADDING_DP = 12;
    private static final int GRID_CELL_MARGIN_DP = 4;
    private static final int GRID_ROW_GAP_DP = 8;
    private static final int GRID_TEXT_GAP_DP = 4;
    private static final float GRID_TITLE_SP = 12f;
    private static final float GRID_COUNT_SP = 10f;

    private static final int SEARCH_HEIGHT_DP = 40;
    private static final int SEARCH_MARGIN_DP = 16;
    private static final int SEARCH_GAP_DP = 8;

    /** Playlist item view type in the TikTok adapter. Other types are headers. */
    private static final int PLAYLIST_VIEW_TYPE = 2;

    private static final Map<View, GridCell> gridCells = new WeakHashMap<>();
    private static final Map<View, EditText> searchBars = new WeakHashMap<>();
    private static final Map<Object, FilterState> filterStates = new WeakHashMap<>();
    private static final Map<Class<?>, Field[]> itemFields = new WeakHashMap<>();
    private static final Map<String, Integer> viewIds = new HashMap<>();

    private FavoritePlaylistsPatch() {
    }

    // region Hooks

    /** Return value hook of CollectionListMainUIAssem.Kp(). */
    public static int getSpanCount(int original) {
        try {
            return Settings.FAVORITE_PLAYLIST_GRID.get() ? GRID_COLUMNS : original;
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlist span count failed", throwable);
            return original;
        }
    }

    /**
     * Called in the adapter's onCreateBasicViewHolder before TikTok picks the
     * personal-homepage row cell. True selects the standard cover card cell.
     */
    public static boolean useCoverCardCell() {
        try {
            return Settings.FAVORITE_PLAYLIST_GRID.get();
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlist cell selection failed", throwable);
            return false;
        }
    }

    /** Start of CollectionListMainUIAssem.onViewCreated(View). */
    public static void onListViewCreated(View recyclerView) {
        try {
            if (recyclerView == null) {
                return;
            }

            boolean grid = Settings.FAVORITE_PLAYLIST_GRID.get();
            boolean search = Settings.FAVORITE_PLAYLIST_SEARCH.get();
            if (!grid && !search) {
                return;
            }

            // TikTok sets the list padding later in onViewCreated. Post so these run after it.
            recyclerView.post(() -> {
                try {
                    if (grid) {
                        int padding = dp(recyclerView.getContext(), GRID_LIST_PADDING_DP);
                        recyclerView.setPaddingRelative(
                                padding,
                                recyclerView.getPaddingTop(),
                                padding,
                                recyclerView.getPaddingBottom()
                        );
                    }
                    if (search) {
                        installSearchBar(recyclerView);
                    }
                } catch (Throwable throwable) {
                    Logger.printException(() -> "Favorite playlist list setup failed", throwable);
                }
            });
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlist onViewCreated hook failed", throwable);
        }
    }

    /** Start of the adapter's onBindBasicViewHolder(ViewHolder, int). */
    public static void onBindCell(Object adapter, Object holder, int position) {
        try {
            if (Settings.FAVORITE_PLAYLIST_SEARCH.get()) {
                reapplyFilterIfReplaced(adapter);
            }
            if (!Settings.FAVORITE_PLAYLIST_GRID.get()) {
                return;
            }

            View itemView = getItemView(holder);
            if (itemView == null) {
                return;
            }

            GridCell cell = gridCells.get(itemView);
            if (cell == null) {
                cell = GridCell.create(itemView);
                if (cell == null) {
                    return;
                }
                gridCells.put(itemView, cell);
            }

            cell.bindCount(getVideoCount(getItem(adapter, position)));
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlist cell bind failed", throwable);
        }
    }

    // endregion

    // region Grid

    /** Square container so the cover keeps a 1:1 ratio at any column width. */
    private static final class SquareFrameLayout extends FrameLayout {
        SquareFrameLayout(Context context) {
            super(context);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, widthMeasureSpec);
        }
    }

    private static final class GridCell {
        final TextView title;
        final TextView count;

        private GridCell(TextView title, TextView count) {
            this.title = title;
            this.count = count;
        }

        /**
         * Rebuilds the standard playlist cell (layout c8g): CardView cover on top,
         * then title and video count below. Returns null for other cells.
         */
        static GridCell create(View itemView) {
            if (!(itemView instanceof ViewGroup)) {
                return null;
            }

            Context context = itemView.getContext();
            View card = findViewByName(itemView, "dpf");
            View originalTitle = findViewByName(itemView, "prr");
            if (card == null || !(originalTitle instanceof TextView) || card.getParent() != itemView) {
                return null;
            }

            ViewGroup root = (ViewGroup) itemView;
            root.removeView(card);

            LinearLayout column = new LinearLayout(context);
            column.setOrientation(LinearLayout.VERTICAL);

            SquareFrameLayout cover = new SquareFrameLayout(context);
            cover.addView(card, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
            column.addView(cover, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            boolean dark = isDarkMode(context);

            TextView title = new TextView(context);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, GRID_TITLE_SP);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            title.setTextColor(dark ? 0xFFFFFFFF : 0xFF161823);
            title.setMaxLines(1);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            titleParams.topMargin = dp(context, GRID_TEXT_GAP_DP);
            column.addView(title, titleParams);

            TextView count = new TextView(context);
            count.setTextSize(TypedValue.COMPLEX_UNIT_SP, GRID_COUNT_SP);
            count.setTextColor(dark ? 0x99FFFFFF : 0x99161823);
            count.setMaxLines(1);
            count.setSingleLine(true);
            count.setEllipsize(TextUtils.TruncateAt.END);
            column.addView(count, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            ViewGroup.MarginLayoutParams columnParams = new ViewGroup.MarginLayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            int cellMargin = dp(context, GRID_CELL_MARGIN_DP);
            columnParams.setMarginStart(cellMargin);
            columnParams.setMarginEnd(cellMargin);
            columnParams.bottomMargin = dp(context, GRID_ROW_GAP_DP);
            root.addView(column, columnParams);

            // TikTok keeps writing the playlist name into its overlay title. Hide that view
            // without changing its layout and mirror the text into the title below the cover.
            TextView overlayTitle = (TextView) originalTitle;
            overlayTitle.setAlpha(0f);
            title.setText(overlayTitle.getText());
            overlayTitle.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                }

                @Override
                public void afterTextChanged(Editable s) {
                    title.setText(s);
                }
            });

            return new GridCell(title, count);
        }

        void bindCount(Long total) {
            if (total == null) {
                count.setText("");
                return;
            }
            long value = total;
            count.setText(value == 1 ? "1 video" : value + " videos");
        }
    }

    // endregion

    // region Search

    private static final class FilterState {
        List full;
        List shown;
        int shownSize;
        String query = "";
        boolean reapplyPosted;
        /** Source size when the last page was requested, so each page is requested once. */
        int loadRequestedSize = -1;
    }

    private static void installSearchBar(View recyclerView) {
        ViewParent parent = recyclerView.getParent();
        if (!(parent instanceof FrameLayout)) {
            Logger.printDebug(() -> "Favorite playlist search: unsupported list parent " + parent);
            return;
        }
        if (searchBars.containsKey(recyclerView)) {
            return;
        }

        Context context = recyclerView.getContext();
        boolean dark = isDarkMode(context);

        EditText search = new EditText(context);
        search.setHint("Search playlists");
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
                applyQuery(recyclerView, s.toString());
            }
        });

        int searchHeight = dp(context, SEARCH_HEIGHT_DP);
        int margin = dp(context, SEARCH_MARGIN_DP);
        int gap = dp(context, SEARCH_GAP_DP);

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

        searchBars.put(recyclerView, search);
    }

    private static void hideKeyboard(View view) {
        InputMethodManager manager = (InputMethodManager) view.getContext()
                .getSystemService(Context.INPUT_METHOD_SERVICE);
        if (manager != null) {
            manager.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
        view.clearFocus();
    }

    private static void applyQuery(View recyclerView, String query) {
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
            state.query = query == null ? "" : query.trim().toLowerCase(Locale.ROOT);
            applyFilter(adapter, state);
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlist search failed", throwable);
        }
    }

    /** TikTok replaced or extended the list (load more, refresh). Filter the new data. */
    private static void reapplyFilterIfReplaced(Object adapter) {
        FilterState state = filterStates.get(adapter);
        if (state == null || state.query.isEmpty() || state.reapplyPosted) {
            return;
        }

        Object current = invoke(adapter, "getData");
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
                Logger.printException(() -> "Favorite playlist search refresh failed", throwable);
            }
        });
    }

    private static void applyFilter(Object adapter, FilterState state) {
        Object currentObject = invoke(adapter, "getData");
        List current = currentObject instanceof List ? (List) currentObject : null;

        if (current != state.shown) {
            // New list from TikTok: it is the unfiltered source.
            state.full = current;
        } else if (current != null && state.full != null && current.size() != state.shownSize) {
            // TikTok appended items to the list we set. Keep them in the source list.
            Set fullItems = new HashSet(state.full);
            for (Object item : current) {
                if (fullItems.add(item)) {
                    state.full.add(item);
                }
            }
        }

        List next;
        if (state.query.isEmpty() || state.full == null) {
            next = state.full;
        } else {
            next = new ArrayList();
            for (Object item : state.full) {
                if (getViewType(item) != PLAYLIST_VIEW_TYPE || nameMatches(item, state.query)) {
                    next.add(item);
                }
            }
        }

        if (next != current) {
            invoke(adapter, "setData", List.class, next);
        }
        state.shown = next;
        state.shownSize = next == null ? 0 : next.size();

        if (state.query.isEmpty()) {
            state.loadRequestedSize = -1;
        } else if (state.full != null && state.full.size() != state.loadRequestedSize) {
            // Auto-load: a new page arrived (or the search just started), so ask for the next one.
            // TikTok's listener only loads when the collections state says there are more.
            state.loadRequestedSize = state.full.size();
            ListSearch.requestNextPage(adapter);
        }
    }

    private static final ListSearch.TextCache playlistNames = new ListSearch.TextCache();

    private static final ListSearch.TextReader PLAYLIST_NAME = item -> {
        Object detail = getCollectionDetail(item);
        Object name = detail == null ? null : readField(detail, "name");
        return new String[]{name instanceof String ? ((String) name).toLowerCase(Locale.ROOT) : null};
    };

    /** The lower-case name is read once per playlist, so a keystroke only runs String.contains. */
    private static boolean nameMatches(Object item, String query) {
        String name = playlistNames.get(item, PLAYLIST_NAME)[0];
        return name != null && name.contains(query);
    }

    // endregion

    // region Reflection helpers

    private static View getItemView(Object holder) {
        Object view = readField(holder, "itemView");
        return view instanceof View ? (View) view : null;
    }

    private static Object getItem(Object adapter, int position) {
        Object data = invoke(adapter, "getData");
        if (!(data instanceof List)) {
            return null;
        }
        List list = (List) data;
        return position >= 0 && position < list.size() ? list.get(position) : null;
    }

    private static Long getVideoCount(Object item) {
        Object detail = getCollectionDetail(item);
        Object statistic = detail == null ? null : readField(detail, "statistic");
        Object total = statistic == null ? null : readField(statistic, "total");
        return total instanceof Long ? (Long) total : null;
    }

    /** List items are X.0XhM: an int view type and a CollectionDetail. */
    private static Object getCollectionDetail(Object item) {
        if (item == null) {
            return null;
        }
        for (Field field : getItemFields(item.getClass())) {
            if (field.getType().getName().endsWith(".CollectionDetail")) {
                try {
                    return field.get(item);
                } catch (Throwable ignored) {
                    return null;
                }
            }
        }
        return null;
    }

    private static int getViewType(Object item) {
        if (item == null) {
            return -1;
        }
        for (Field field : getItemFields(item.getClass())) {
            if (field.getType() == int.class) {
                try {
                    return field.getInt(item);
                } catch (Throwable ignored) {
                    return -1;
                }
            }
        }
        return -1;
    }

    private static Field[] getItemFields(Class<?> type) {
        Field[] fields = itemFields.get(type);
        if (fields == null) {
            fields = type.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
            }
            itemFields.put(type, fields);
        }
        return fields;
    }

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

    private static Object invoke(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            return method.invoke(target);
        } catch (Throwable throwable) {
            return null;
        }
    }

    private static void invoke(Object target, String name, Class<?> parameterType, Object argument) {
        try {
            Method method = target.getClass().getMethod(name, parameterType);
            method.invoke(target, argument);
        } catch (Throwable throwable) {
            Logger.printException(() -> "Favorite playlists: " + name + " failed", throwable);
        }
    }

    private static View findViewByName(View root, String idName) {
        Integer id = viewIds.get(idName);
        if (id == null) {
            Context context = root.getContext();
            id = context.getResources().getIdentifier(idName, "id", context.getPackageName());
            viewIds.put(idName, id);
        }
        return id == 0 ? null : root.findViewById(id);
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
