package dev.rikunode.settings;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.WeakHashMap;

/** Collect only actual PR entries received by the original feed. No independent network API. */
public final class HoshioriPrTab {
    private static final String KEY = "showPrTab";
    private static final int ORIGINAL_COUNT = 11;
    private static final int MAX_ENTRIES = 300;
    private static final String PAGE = "hoshiori_pr_page";
    private static final String HOST = "com.hatena.android.bookmark.";
    private static final WeakHashMap<Object, Boolean> ADAPTERS = new WeakHashMap<>();
    private static final LinkedHashMap<String, Object> ENTRIES = new LinkedHashMap<>();
    private static final WeakHashMap<Object, Boolean> PAGES = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Context app;

    private HoshioriPrTab() {}

    public static boolean enabled(Context context) {
        return context != null && HoshioriSettingsActivity.enabled(context, KEY, false);
    }

    public static void initAdapter(Object adapter, Context context) {
        app = context.getApplicationContext();
        boolean show = enabled(context);
        ADAPTERS.put(adapter, show);
        if (!show) synchronized (ENTRIES) { ENTRIES.clear(); }
    }

    public static int count(Object adapter, int original) {
        return Boolean.TRUE.equals(ADAPTERS.get(adapter)) ? original + 1 : original;
    }

    public static boolean isPrPage(Object adapter, int position) {
        return position == ORIGINAL_COUNT && Boolean.TRUE.equals(ADAPTERS.get(adapter));
    }

    public static boolean configChanged(Object fragment) {
        try {
            Object adapter = call(fragment, "getAdapter");
            return Boolean.TRUE.equals(ADAPTERS.get(adapter)) != enabled(app);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.e("HoshioriPR", "Could not compare tab configuration", failure);
            return false;
        }
    }

    /** Called before the stock mute / PR filter, regardless of the mute list. */
    public static boolean capture(Object entry) {
        if (!enabled(app) || entry == null) return false;
        try {
            Class<?> type = entry.getClass();
            if (!Boolean.TRUE.equals(type.getMethod("isPrEntry").invoke(entry))) return false;
            Uri url = (Uri) type.getMethod("getUrlToBrowse").invoke(entry);
            Uri original = (Uri) type.getMethod("getOriginalUri").invoke(entry);
            String title = (String) type.getMethod("getTitle").invoke(entry);
            if (url != null && title != null &&
                    ("http".equalsIgnoreCase(url.getScheme()) || "https".equalsIgnoreCase(url.getScheme()))) {
                String key = original != null ? original.toString() : url.toString();
                boolean added;
                synchronized (ENTRIES) {
                    added = !ENTRIES.containsKey(key);
                    if (added) {
                        // Preserve the complete stock BookmarkEntry, including image and users.
                        ENTRIES.put(key, entry);
                        if (ENTRIES.size() > MAX_ENTRIES)
                            ENTRIES.remove(ENTRIES.keySet().iterator().next());
                    }
                }
                if (added) {
                    Log.i("HoshioriPR", "Captured PR entry: " + title);
                    MAIN.post(HoshioriPrTab::refresh);
                }
            }
            return true;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.e("HoshioriPR", "Could not capture PR entry", failure);
            return false;
        }
    }

    private static Object call(Object receiver, String name) throws ReflectiveOperationException {
        Method method = receiver.getClass().getMethod(name);
        method.setAccessible(true);
        return method.invoke(receiver);
    }

    /** The PR page is the real HotEntryListFragment, with only its data source changed. */
    public static Object createFragment(Object adapter) {
        try {
            Field categoryField = adapter.getClass().getDeclaredField("topCategory");
            categoryField.setAccessible(true);
            Object category = categoryField.get(adapter);
            Class<?> categoryType = Class.forName(HOST + "model.TopCategory");
            Class<?> union = Class.forName(HOST + "model.TopCategoryOrCategory");
            Object wrapped = Class.forName(HOST + "model.TopCategoryOrCategory$TopCategory")
                    .getConstructor(categoryType).newInstance(category);
            Class<?> fragment = Class.forName(HOST + "presentation.fragment.entrylist.HotEntryListFragment");
            Object companion = fragment.getField("Companion").get(null);
            Object page = companion.getClass().getMethod("newInstance", union).invoke(companion, wrapped);
            ((Bundle) call(page, "getArguments")).putBoolean(PAGE, true);
            return page;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            throw new IllegalStateException("Could not create native PR page", failure);
        }
    }

    public static boolean isNativePrPage(Object fragment) {
        try {
            Bundle args = (Bundle) call(fragment, "getArguments");
            return args != null && args.getBoolean(PAGE, false);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            throw new IllegalStateException("Could not read native PR page arguments", failure);
        }
    }

    /** Called after the native recycler, decorations and swipe listener are installed. */
    public static boolean attachPage(Object fragment) {
        if (!isNativePrPage(fragment)) return false;
        PAGES.put(fragment, true);
        submit(fragment);
        return true; // Do not subscribe to the stock category network feed on this page.
    }

    public static void detachPage(Object fragment) {
        PAGES.remove(fragment);
    }

    public static boolean reloadPage(Object fragment) {
        if (!isNativePrPage(fragment)) return false;
        submit(fragment);
        try {
            View view = (View) call(fragment, "getView");
            if (view != null) {
                int id = view.getResources().getIdentifier("swipe_refresh", "id",
                        view.getContext().getPackageName());
                View swipe = view.findViewById(id);
                if (swipe != null) swipe.getClass().getMethod("setRefreshing", boolean.class)
                        .invoke(swipe, false);
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.e("HoshioriPR", "Could not reset native refresh indicator", failure);
        }
        return true;
    }

    private static void refresh() {
        for (Object fragment : new ArrayList<>(PAGES.keySet())) {
            if (fragment != null) submit(fragment);
        }
    }

    private static void submit(Object fragment) {
        try {
            if (call(fragment, "getView") == null) return;
            Field field = fragment.getClass().getDeclaredField("adapter");
            field.setAccessible(true);
            Object adapter = field.get(fragment);
            Object owner = call(fragment, "getViewLifecycleOwner");
            Object lifecycle = call(owner, "getLifecycle");
            Class<?> entry = Class.forName(HOST + "model.BookmarkEntry");
            Class<?> dated = Class.forName(HOST + "model.EntryWithDate");
            Class<?> item = Class.forName(HOST + "presentation.viewmodel.HotEntryListViewModel$ListItem$EntryItem");
            List<Object> snapshot;
            synchronized (ENTRIES) { snapshot = new ArrayList<>(ENTRIES.values()); }
            List<Object> rows = new ArrayList<>(snapshot.size());
            ZonedDateTime now = ZonedDateTime.now();
            for (Object value : snapshot) {
                Object wrapped = dated.getConstructor(entry, ZonedDateTime.class).newInstance(value, now);
                rows.add(item.getConstructor(dated).newInstance(wrapped));
            }
            Class<?> paging = Class.forName("androidx.paging.PagingData");
            Object companion = paging.getField("Companion").get(null);
            Object data = companion.getClass().getMethod("from", List.class).invoke(companion, rows);
            adapter.getClass().getMethod("submitData", Class.forName("androidx.lifecycle.Lifecycle"), paging)
                    .invoke(adapter, lifecycle, data);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.e("HoshioriPR", "Could not submit native PR cards", failure);
        }
    }
}
