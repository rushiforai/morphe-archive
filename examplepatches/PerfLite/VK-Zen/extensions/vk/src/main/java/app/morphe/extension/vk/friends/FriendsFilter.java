package app.morphe.extension.vk.friends;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

public class FriendsFilter {
    private static final String TAG = "MorpheFriends";

    private static final String PREF_NAME = "morphe_friends_prefs";
    public static final String KEY_HIDE_FRIEND_SUGGESTIONS = "morphe_hide_friend_suggestions";

    private static final Map<Object, Boolean> handledHolders = Collections.synchronizedMap(new WeakHashMap<Object, Boolean>());

    private static Context getAppContext() {
        Context context = null;
        try {
            context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {}
        if (context == null) {
            try {
                context = (Context) Class.forName("android.app.AppGlobals")
                        .getMethod("getInitialApplication")
                        .invoke(null);
            } catch (Throwable ignored) {}
        }
        if (context == null) {
            try {
                Class<?> holder = Class.forName("xsna.bf3");
                Field f = holder.getDeclaredField("a");
                f.setAccessible(true);
                context = (Context) f.get(null);
            } catch (Throwable ignored) {}
        }
        return context;
    }

    public static boolean isHideFriendSuggestionsEnabled() {
        Context context = getAppContext();
        if (context != null) {
            SharedPreferences sp = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            return sp.getBoolean(KEY_HIDE_FRIEND_SUGGESTIONS, true);
        }
        return true;
    }

    public static void setHideFriendSuggestionsEnabled(boolean enabled) {
        Context context = getAppContext();
        if (context != null) {
            SharedPreferences sp = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            sp.edit().putBoolean(KEY_HIDE_FRIEND_SUGGESTIONS, enabled).commit();
        }
    }

    public static boolean toggleHideFriendSuggestions() {
        boolean newVal = !isHideFriendSuggestionsEnabled();
        setHideFriendSuggestionsEnabled(newVal);
        return newVal;
    }

    /**
     * Intercepts ActionSortVh.a() to ensure "Сначала онлайн" is active by default.
     */
    public static void onSortUpdate(Object sortVh) {
        if (sortVh == null) return;
        try {
            Field fBlock = sortVh.getClass().getDeclaredField("e");
            fBlock.setAccessible(true);
            Object block = fBlock.get(sortVh);
            if (block == null) return;

            if (handledHolders.containsKey(sortVh)) {
                return;
            }
            handledHolders.put(sortVh, Boolean.TRUE);

            Field fList = sortVh.getClass().getDeclaredField("f");
            fList.setAccessible(true);
            Object listObj = fList.get(sortVh);
            if (!(listObj instanceof List)) return;
            List<?> filters = (List<?>) listObj;
            if (filters.isEmpty()) return;

            Object onlineFilter = null;
            for (Object f : filters) {
                if (f == null) continue;

                Field fText = f.getClass().getDeclaredField("c");
                fText.setAccessible(true);
                Object textObj = fText.get(f);
                String text = textObj != null ? textObj.toString().toLowerCase() : "";

                Field fId = f.getClass().getDeclaredField("b");
                fId.setAccessible(true);
                Object idObj = fId.get(f);
                String id = idObj != null ? idObj.toString().toLowerCase() : "";

                if (text.contains("онлайн") || text.contains("online") || id.contains("online")) {
                    onlineFilter = f;
                    break;
                }
            }

            if (onlineFilter != null) {
                Field fSelected = onlineFilter.getClass().getDeclaredField("e");
                fSelected.setAccessible(true);
                boolean isOnlineSelected = fSelected.getBoolean(onlineFilter);

                if (!isOnlineSelected) {
                    Field fId = onlineFilter.getClass().getDeclaredField("b");
                    fId.setAccessible(true);
                    String onlineReplacementId = (String) fId.get(onlineFilter);

                    // Mark online filter as selected, others as unselected
                    for (Object f : filters) {
                        Field fSel = f.getClass().getDeclaredField("e");
                        fSel.setAccessible(true);
                        fSel.setBoolean(f, f == onlineFilter);
                    }

                    // Trigger catalog reload with onlineReplacementId
                    Field fB = sortVh.getClass().getDeclaredField("b");
                    fB.setAccessible(true);
                    Object presenter = fB.get(sortVh);

                    Field fG = sortVh.getClass().getDeclaredField("g");
                    fG.setAccessible(true);
                    View sortView = (View) fG.get(sortVh);
                    Context context = sortView != null ? sortView.getContext() : getAppContext();

                    if (presenter != null && onlineReplacementId != null) {
                        Class<?> zesClass = Class.forName("xsna.zes$a");
                        Constructor<?> zesCtor = zesClass.getConstructor(Context.class);
                        Object zes = zesCtor.newInstance(context);

                        Method mC = Class.forName("xsna.eib").getMethod(
                                "c",
                                Class.forName("xsna.eib"),
                                String.class,
                                Class.forName("xsna.zes"),
                                Class.forName("com.vk.catalog2.common.dto.api.ui.UIBlock"),
                                int.class
                        );
                        Object disposable = mC.invoke(null, presenter, onlineReplacementId, zes, null, 12);
                        Field fD = sortVh.getClass().getDeclaredField("d");
                        fD.setAccessible(true);
                        fD.set(sortVh, disposable);
                    }
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in onSortUpdate", t);
        }
    }

    /**
     * Checks if a catalog block represents "Возможные друзья" (friend suggestions).
     */
    public static boolean isFriendSuggestionsBlock(Object block) {
        if (block == null) return false;
        if (!isHideFriendSuggestionsEnabled()) return false;

        String className = block.getClass().getName();
        if (className.contains("FriendsSuggest") || className.contains("FriendSuggest")) {
            return true;
        }

        try {
            Field fLayout = block.getClass().getDeclaredField("i");
            fLayout.setAccessible(true);
            Object layout = fLayout.get(block);
            if (layout != null) {
                Field fType = layout.getClass().getDeclaredField("b");
                fType.setAccessible(true);
                Object type = fType.get(layout);
                if (type != null) {
                    String typeName = type.toString().toUpperCase();
                    if (typeName.contains("FRIEND_SUGGEST") || typeName.contains("FRIENDS_SUGGEST")) {
                        return true;
                    }
                }

                Field fTitle = layout.getClass().getDeclaredField("d");
                fTitle.setAccessible(true);
                Object title = fTitle.get(layout);
                if (title instanceof String) {
                    String s = ((String) title).toLowerCase();
                    if (s.contains("возможные друзья") || s.contains("рекомендации друзей")) {
                        return true;
                    }
                }
            }
        } catch (Throwable ignored) {}

        try {
            Field fDataType = block.getClass().getDeclaredField("c");
            fDataType.setAccessible(true);
            Object dt = fDataType.get(block);
            if (dt != null) {
                String dtStr = dt.toString().toUpperCase();
                if (dtStr.contains("FRIEND_SUGGEST") || dtStr.contains("FRIENDS_SUGGEST")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}

        try {
            String repr = block.toString().toLowerCase();
            if (repr.contains("friends_suggest") || repr.contains("возможные друзья")) {
                return true;
            }
        } catch (Throwable ignored) {}

        return false;
    }

    /**
     * Filters catalog blocks to remove friend suggestions.
     */
    public static List<?> filterCatalogBlocks(List<?> blocks) {
        if (blocks == null) return null;
        if (!isHideFriendSuggestionsEnabled()) return blocks;

        ArrayList<Object> result = new ArrayList<>(blocks.size());
        for (Object b : blocks) {
            if (b == null || isFriendSuggestionsBlock(b)) {
                continue;
            }
            result.add(b);
        }
        return result;
    }

    /**
     * Collapses FriendsSuggestsVh view if friend suggestions are disabled.
     */
    public static View onSuggestsViewCreated(View view) {
        if (view != null && isHideFriendSuggestionsEnabled()) {
            view.setVisibility(View.GONE);
            view.setLayoutParams(new ViewGroup.LayoutParams(0, 0));
        }
        return view;
    }

    /**
     * Clears friend recommendations from API response if disabled.
     */
    public static Object filterRecommendationsResult(Object result) {
        if (result == null) return null;
        if (isHideFriendSuggestionsEnabled()) {
            if (result instanceof List) {
                ((List<?>) result).clear();
            }
        }
        return result;
    }
}
