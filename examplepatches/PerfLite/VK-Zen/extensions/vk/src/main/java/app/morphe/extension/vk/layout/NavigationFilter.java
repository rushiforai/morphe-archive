package app.morphe.extension.vk.layout;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

public class NavigationFilter {

    private static final String TAG = "MorpheTabbar";

    private static final String PREF_NAME = "morphe_tabbar_prefs";
    private static final String KEY_TABS = "user_tabs";
    private static final String KEY_TABS_VERSION = "tabs_version";
    private static final int TABS_VERSION = 2;
    /**
     * Default arrangement: Главная, Друзья, Сообщения, Музыка, Сервисы. The music slot shows up
     * either when VK's own config includes it or through the opt-in "add missing tabs" switch,
     * since the server leaves it out for some accounts.
     */
    public static final String DEFAULT_TABS = "home,friends,im,music,hub";

    private static final String KEY_SEEN_TABS = "seen_tabs";
    private static final String KEY_HIDDEN_TABS = "hidden_tabs";
    private static final String KEY_ADD_MISSING = "add_missing_tabs";

    /** Fallback used until VK's actual tab list has been observed at least once. */
    public static final String[] ALL_TAB_KEYS = {
        "home", "friends", "im", "music", "hub", "overview", "clips"
    };

    public static final String[] ALL_TAB_LABELS = {
        "Главная",
        "Друзья",
        "Сообщения",
        "Музыка",
        "Сервисы",
        "Обзор",
        "Клипы"
    };

    /** Labels for keys VK can send but that our fallback list does not contain. */
    private static String extraLabel(String key) {
        if ("overview".equals(key)) return "Обзор";
        if ("clips".equals(key)) return "Клипы";
        if ("news".equals(key)) return "Новости";
        if ("groups".equals(key)) return "Сообщества";
        if ("video".equals(key)) return "Видео";
        if ("profile".equals(key)) return "Профиль";
        return null;
    }

    /**
     * VK decides the bottom bar composition per account and it changes between launches
     * (five tabs for some configs, six for others, with different spellings), so the set the
     * settings screen offers comes from what the platform actually sent us.
     */
    public static String[] availableKeys() {
        SharedPreferences prefs = getPrefs(null);
        if (prefs != null) {
            String seen = prefs.getString(KEY_SEEN_TABS, null);
            String[] keys = splitKeys(seen);
            if (keys.length > 0) {
                return keys;
            }
        }
        return ALL_TAB_KEYS;
    }

    /** Picker options: what VK sends now, plus our stable names when the user opted in. */
    public static String[] choiceKeys() {
        String[] available = availableKeys();
        if (!isAddMissingEnabled()) {
            return available;
        }
        LinkedHashSet<String> all = new LinkedHashSet<>();
        for (String key : available) {
            all.add(key);
        }
        for (String key : ALL_TAB_KEYS) {
            all.add(key);
        }
        return all.toArray(new String[0]);
    }

    public static String labelFor(String key) {        String extra = extraLabel(key);
        if (extra != null) {
            return extra;
        }
        for (int i = 0; i < ALL_TAB_KEYS.length; i++) {
            if (ALL_TAB_KEYS[i].equals(key)) {
                return ALL_TAB_LABELS[i];
            }
        }
        return key;
    }

    /** Tabs the user chose to hide; they stay in VK's config but are dropped from the bar. */
    public static String[] hiddenKeys() {
        SharedPreferences prefs = getPrefs(null);
        if (prefs == null) {
            return new String[0];
        }
        return splitKeys(prefs.getString(KEY_HIDDEN_TABS, ""));
    }

    public static boolean isHidden(String key) {
        for (String hidden : hiddenKeys()) {
            if (hidden.equals(key)) {
                return true;
            }
        }
        return false;
    }

    public static void setHidden(Context context, String key, boolean hide) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs == null || key == null || key.isEmpty()) {
            return;
        }
        LinkedHashSet<String> hidden = new LinkedHashSet<>();
        for (String existing : hiddenKeys()) {
            hidden.add(existing);
        }
        if (hide) {
            hidden.add(key);
        } else {
            hidden.remove(key);
        }
        StringBuilder sb = new StringBuilder();
        for (String value : hidden) {
            if (sb.length() > 0) {
                sb.append(',');
            }
            sb.append(value);
        }
        prefs.edit().putString(KEY_HIDDEN_TABS, sb.toString()).apply();
        Log.i(TAG, "setHidden: " + key + " -> " + hide + " (now [" + sb + "])");
    }

    /**
     * Drops the hidden tabs from an already ordered list. Refuses to empty the bar, so a user
     * cannot lock himself out of the app by hiding every tab.
     */
    private static List<?> dropHidden(List<?> ordered) {
        String[] hidden = hiddenKeys();
        if (hidden.length == 0 || ordered.size() <= 1) {
            return ordered;
        }
        ArrayList<Object> kept = new ArrayList<>();
        for (Object item : ordered) {
            String name = getItemName(item);
            boolean isHidden = false;
            for (String key : hidden) {
                if (key.equals(name)) {
                    isHidden = true;
                    break;
                }
            }
            if (!isHidden) {
                kept.add(item);
            }
        }
        if (kept.isEmpty() || kept.size() == ordered.size()) {
            return ordered;
        }
        logOnce("dropHidden: " + ordered.size() + " -> " + kept.size() + " tabs");
        return kept;
    }

    /**
     * Opt-in switch: put back tabs that this VK build knows how to open but did not include in
     * the current server payload (music being the common one). On by default so the default tab
     * order actually renders as advertised; it stays a user-visible switch in the settings.
     */
    public static boolean isAddMissingEnabled() {
        SharedPreferences prefs = getPrefs(null);
        return prefs == null || prefs.getBoolean(KEY_ADD_MISSING, true);
    }

    public static void setAddMissing(Context context, boolean enabled) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs == null) {
            return;
        }
        prefs.edit().putBoolean(KEY_ADD_MISSING, enabled).apply();
        Log.i(TAG, "setAddMissing: " + enabled);
    }

    private static Object createTabbarItem(Class<?> itemClass, String name) {
        try {
            for (Constructor<?> ctor : itemClass.getConstructors()) {
                Class<?>[] types = ctor.getParameterTypes();
                if (types.length == 5 && types[0] == String.class && types[3] == boolean.class) {
                    return ctor.newInstance(name, null, labelFor(name), true, null);
                }
            }
        } catch (Throwable t) {
            Log.i(TAG, "createTabbarItem failed for \"" + name + "\": " + t);
        }
        return null;
    }

    /** Placeholder slots VK uses for empty positions; never offer them as a tab. */
    private static boolean isPlaceholder(String key) {
        return key.isEmpty() || key.equals("empty");
    }

    private static String[] splitKeys(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return new String[0];
        }
        ArrayList<String> keys = new ArrayList<>();
        for (String token : raw.split(",")) {
            String key = token.trim().toLowerCase();
            if (!isPlaceholder(key) && !containsKey(keys, key)) {
                keys.add(key);
            }
        }
        return keys.toArray(new String[0]);
    }

    private static boolean containsKey(List<String> keys, String key) {
        for (String existing : keys) {
            if (existing.equals(key)) {
                return true;
            }
        }
        return false;
    }

    private static void rememberSeenKeys(String[] names) {
        ArrayList<String> keys = new ArrayList<>();
        for (String name : names) {
            if (!isPlaceholder(name) && !containsKey(keys, name)) {
                keys.add(name);
            }
        }
        if (keys.isEmpty()) {
            return;
        }
        SharedPreferences prefs = getPrefs(null);
        if (prefs == null) {
            return;
        }
        StringBuilder joined = new StringBuilder();
        for (String key : keys) {
            if (joined.length() > 0) {
                joined.append(',');
            }
            joined.append(key);
        }
        String previous = prefs.getString(KEY_SEEN_TABS, null);
        if (!joined.toString().equals(previous)) {
            prefs.edit().putString(KEY_SEEN_TABS, joined.toString()).apply();
            Log.i(TAG, "rememberSeenKeys: VK tabs are now [" + joined + "]");
        }
    }

    /**
     * Called from TabbarState's items getter. Rewrites the items field to the user's order when
     * it differs, then lets the untouched getter return it. Never replaces the list with
     * something VK cannot route, and writes only on an actual change.
     */
    public static void applyCustomOrder(Object state) {
        if (state == null) {
            return;
        }
        try {
            Field f = state.getClass().getDeclaredField("items");
            f.setAccessible(true);
            Object current = f.get(state);
            if (!(current instanceof List)) {
                return;
            }
            List<?> list = (List<?>) current;
            if (!list.isEmpty()) {
                String[] observed = new String[list.size()];
                for (int i = 0; i < list.size(); i++) {
                    observed[i] = getItemName(list.get(i));
                }
                rememberSeenKeys(observed);
            }
            List<?> reordered = filterTabbarItems(list);
            if (reordered == null || reordered == list || sameOrder(list, reordered)) {
                return;
            }
            f.set(state, reordered);
            Log.i(TAG, "applyCustomOrder: state=" + System.identityHashCode(state)
                    + " items replaced with user order");
        } catch (Throwable t) {
            Log.i(TAG, "applyCustomOrder failed: " + t);
        }
    }

    private static boolean sameOrder(List<?> a, List<?> b) {
        if (a.size() != b.size()) {
            return false;
        }
        for (int i = 0; i < a.size(); i++) {
            if (a.get(i) != b.get(i)) {
                return false;
            }
        }
        return true;
    }

    private static final int LOG_LIMIT = 10;
    private static volatile int loggedCalls = 0;

    private static void logOnce(String message) {
        if (loggedCalls < LOG_LIMIT) {
            loggedCalls++;
            Log.i(TAG, message);
        }
    }

    /**
     * Filters and customizes TabbarState items according to user preferences.
     */
    public static List<?> filterTabbarItems(List<?> items) {
        if (items == null) {
            logOnce("filterTabbarItems: items=null");
            return null;
        }

        // VK builds TabbarState several times per launch, including empty/loading states.
        // Never replace those with fabricated items: a name the client does not know has no
        // route and no icon, so the whole bar renders as if nothing was applied.
        if (items.isEmpty()) {
            logOnce("filterTabbarItems: empty state -> left untouched");
            return items;
        }

        SharedPreferences prefs = getPrefs(null);
        String savedTabs = getEffectiveTabs(prefs);

        int count = items.size();
        String[] names = new String[count];
        StringBuilder incoming = new StringBuilder();
        for (int i = 0; i < count; i++) {
            names[i] = getItemName(items.get(i));
            incoming.append(names[i]).append(' ');
        }
        logOnce("filterTabbarItems: size=" + count
                + " savedTabs=" + savedTabs
                + " names=[" + incoming.toString().trim() + "]");

        boolean[] used = new boolean[count];
        ArrayList<Object> result = new ArrayList<>();
        int matched = 0;
        Class<?> itemClass = items.get(0).getClass();

        for (String reqKey : savedTabs.split(",")) {
            String raw = reqKey.trim().toLowerCase();
            if (raw.isEmpty()) {
                continue;
            }
            // Exact name first: VK can send "overview" and "friends" as two different tabs at
            // once, and folding onto the alias first would steal the wrong slot.
            int match = indexOfName(items, names, used, raw);
            if (match < 0) {
                match = indexOfName(items, names, used, canonicalizeKey(raw));
            }
            if (match >= 0) {
                used[match] = true;
                result.add(items.get(match));
                matched++;
            } else if (isAddMissingEnabled() && itemClass != null) {
                // Opt-in: VK's own configs have used these names before, so the client still has
                // a route and an icon for them even when this payload omits the entry.
                Object synthesized = createTabbarItem(itemClass, raw);
                if (synthesized != null) {
                    result.add(synthesized);
                    matched++;
                    logOnce("filterTabbarItems: synthesized missing tab \"" + raw + "\"");
                }
            }
        }

        if (matched == 0) {
            logOnce("filterTabbarItems: no requested key exists in this VK build -> left untouched");
            return dropHidden(items);
        }

        // Keep every leftover tab in its original place so the bar always ends up with the
        // same number of real, routable tabs VK gave us.
        for (int i = 0; i < count; i++) {
            if (!used[i]) {
                result.add(items.get(i));
            }
        }

        StringBuilder outNames = new StringBuilder();
        for (int i = 0; i < result.size(); i++) {
            outNames.append(getItemName(result.get(i))).append(' ');
        }
        logOnce("filterTabbarItems: reordered " + matched + " tabs, total=" + result.size()
                + " out=[" + outNames.toString().trim() + "]");
        return dropHidden(result);
    }

    /** VK renames tab keys between builds; our settings screen keeps the stable names. */
    private static String canonicalizeKey(String rawKey) {
        String key = rawKey.trim().toLowerCase();
        if (key.isEmpty()) {
            return key;
        }
        if (key.equals("friends")) return "overview";
        if (key.equals("news")) return "home";
        if (key.equals("services")) return "hub";
        return key;
    }

    private static int indexOfName(List<?> items, String[] names, boolean[] used, String wanted) {
        if (wanted == null || wanted.isEmpty()) {
            return -1;
        }
        for (int i = 0; i < names.length; i++) {
            if (!used[i] && wanted.equals(names[i])) {
                return i;
            }
        }
        return -1;
    }

    private static String getItemName(Object item) {
        try {
            Method m = item.getClass().getMethod("c");
            Object val = m.invoke(item);
            if (val instanceof String) {
                return ((String) val).toLowerCase();
            }
        } catch (Throwable ignored) {}

        try {
            Field f = item.getClass().getDeclaredField("name");
            f.setAccessible(true);
            Object val = f.get(item);
            if (val instanceof String) {
                return ((String) val).toLowerCase();
            }
        } catch (Throwable ignored) {}

        String repr = item.toString().toLowerCase();
        for (String key : ALL_TAB_KEYS) {
            if (repr.contains("name=" + key) || repr.contains("id=" + key)) {
                return key;
            }
        }
        Log.i(TAG, "getItemName: UNRESOLVED class=" + item.getClass().getName() + " repr=" + repr);
        return "";
    }

    public static String getEffectiveTabs(SharedPreferences prefs) {
        if (prefs == null) {
            return DEFAULT_TABS;
        }
        int ver = prefs.getInt(KEY_TABS_VERSION, 0);
        if (ver < TABS_VERSION) {
            Log.i(TAG, "getEffectiveTabs: version " + ver + " < " + TABS_VERSION + " -> RESET to defaults (user tabs discarded)");
            prefs.edit().putString(KEY_TABS, DEFAULT_TABS).putInt(KEY_TABS_VERSION, TABS_VERSION).apply();
            return DEFAULT_TABS;
        }
        String saved = prefs.getString(KEY_TABS, null);
        if (saved == null || saved.trim().isEmpty()) {
            return DEFAULT_TABS;
        }
        return saved;
    }

    /**
     * The tabs to show in the settings screen: everything VK currently offers, ordered by the
     * user's saved preference. Keys the user chose but the platform does not send right now are
     * simply absent from the view - they stay in the stored order (see mergeOrder) so they
     * reappear in their slot as soon as VK adds the tab back.
     */
    public static String[] displayOrder(String saved) {
        // Resolve against what the picker offers, not only what VK sent: with the opt-in on,
        // "music" is a legitimate saved entry even though it is absent from the payload, and
        // resolving it away made it jump back to the last row on every reopen.
        String[] universe = choiceKeys();
        LinkedHashSet<String> order = new LinkedHashSet<>();
        for (String token : saved.split(",")) {
            String key = token.trim().toLowerCase();
            if (isPlaceholder(key)) {
                continue;
            }
            String resolved = resolveKey(key, universe);
            if (resolved != null) {
                order.add(resolved);
            }
        }
        for (String key : universe) {
            order.add(key);
        }
        return order.toArray(new String[0]);
    }

    /**
     * Saves a new arrangement of the currently available tabs without losing the user's choice
     * for tabs VK has not sent right now: those are re-inserted at their previous positions.
     */
    public static String mergeOrder(String saved, String[] newOrder) {
        LinkedHashSet<String> chosen = new LinkedHashSet<>(java.util.Arrays.asList(newOrder));
        ArrayList<String> result = new ArrayList<>(chosen);
        String[] platformTabs = availableKeys();
        String[] previous = saved.split(",");
        for (int i = 0; i < previous.length; i++) {
            String key = previous[i].trim().toLowerCase();
            if (isPlaceholder(key) || chosen.contains(key) || result.contains(key)) {
                continue;
            }
            // Only tabs the platform does not offer right now keep their old position; anything
            // VK actually has was already placed (or swapped) by the user's new order.
            if (resolveKey(key, platformTabs) != null) {
                continue;
            }
            result.add(Math.min(i, result.size()), key);
        }
        StringBuilder sb = new StringBuilder();
        for (String key : result) {
            if (sb.length() > 0) {
                sb.append(',');
            }
            sb.append(key);
        }
        return sb.toString();
    }

    /** Exact match wins; aliases only apply when VK has no tab under our stable name. */
    private static String resolveKey(String key, String[] available) {
        for (String candidate : available) {
            if (candidate.equals(key)) {
                return candidate;
            }
        }
        String alias = canonicalizeKey(key);
        for (String candidate : available) {
            if (candidate.equals(alias)) {
                return candidate;
            }
        }
        String reverse = reverseAlias(key);
        for (String candidate : available) {
            if (candidate.equals(reverse)) {
                return candidate;
            }
        }
        return null;
    }

    /** Saved values may carry VK's alternate spellings; fold them onto our stable keys. */
    private static String reverseAlias(String key) {
        if (key.equals("overview")) return "friends";
        if (key.equals("news")) return "home";
        if (key.equals("services")) return "hub";
        return key;
    }

    /**
     * Intercepts VK TabbarSettingsRouter to show full VK Zen settings page.
     */
    public static void openSettings(final Context context) {
        if (context == null) return;
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    Intent intent = new Intent(context, app.morphe.extension.vk.settings.VkZenSettingsActivity.class);
                    if (!(context instanceof Activity)) {
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    }
                    context.startActivity(intent);
                    return;
                } catch (Throwable t) {
                    android.util.Log.e("MorpheNav", "Failed to launch VkZenSettingsActivity, fallback to dialog", t);
                }
                Activity activity = findActivity(context);
                if (activity != null) {
                    showTabbarSettingsDialog(activity);
                }
            }
        });
    }

    public static void onTabbarSettingsFragmentCreated(final Object fragment) {
        if (fragment == null) return;
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                Activity activity = null;
                try {
                    Method getActivity = fragment.getClass().getMethod("getActivity");
                    activity = (Activity) getActivity.invoke(fragment);
                } catch (Throwable ignored) {}
                try {
                    Method dismiss = fragment.getClass().getMethod("dismiss");
                    dismiss.invoke(fragment);
                } catch (Throwable ignored) {
                    try {
                        Method dismiss = fragment.getClass().getMethod("dismissAllowingStateLoss");
                        dismiss.invoke(fragment);
                    } catch (Throwable ignored2) {}
                }
                if (activity != null) {
                    openSettings(activity);
                }
            }
        });
    }

    private static Activity findActivity(Context context) {
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof android.content.ContextWrapper) {
            Context base = ((android.content.ContextWrapper) context).getBaseContext();
            if (base instanceof Activity) {
                return (Activity) base;
            }
            if (base != null && base != context) {
                return findActivity(base);
            }
        }
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Object activityThread = activityThreadClass.getMethod("currentActivityThread").invoke(null);
            Field activitiesField = activityThreadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
            java.util.Map<?, ?> activities = (java.util.Map<?, ?>) activitiesField.get(activityThread);
            if (activities != null) {
                for (Object record : activities.values()) {
                    Field activityField = record.getClass().getDeclaredField("activity");
                    activityField.setAccessible(true);
                    Activity act = (Activity) activityField.get(record);
                    if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                        return act;
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    /**
     * Called from MainActivity.onResume to attach long click listener to tabbar.
     */
    public static void onMainActivityResume(final Activity activity) {
        if (activity == null) return;
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    setupTabbarLongClick(activity);
                } catch (Throwable ignored) {}
            }
        }, 400);
    }

    private static void setupTabbarLongClick(final Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        View tabbar = null;
        try {
            int id = activity.getResources().getIdentifier("tabbar", "id", activity.getPackageName());
            if (id != 0) {
                tabbar = activity.findViewById(id);
            }
        } catch (Throwable ignored) {}

        if (tabbar == null) {
            tabbar = findTabbarView(activity.getWindow().getDecorView());
        }

        if (tabbar != null) {
            View.OnLongClickListener listener = new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    openSettings(activity);
                    return true;
                }
            };
            tabbar.setOnLongClickListener(listener);
            attachLongClickListenerToChildren(tabbar, listener);
        }
    }

    private static View findTabbarView(View root) {
        if (root == null) return null;
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            int childCount = vg.getChildCount();
            if (childCount >= 3 && childCount <= 6) {
                int height = vg.getHeight();
                if (height > 50 && height < 300) {
                    return vg;
                }
            }
            for (int i = 0; i < childCount; i++) {
                View found = findTabbarView(vg.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void attachLongClickListenerToChildren(View v, View.OnLongClickListener listener) {
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View child = vg.getChildAt(i);
                child.setOnLongClickListener(listener);
                attachLongClickListenerToChildren(child, listener);
            }
        }
    }

    public static void showTabbarSettingsDialog(final Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        boolean hideFriends = app.morphe.extension.vk.friends.FriendsFilter.isHideFriendSuggestionsEnabled();
        String[] menuItems = new String[] {
            "Настройка нижней панели (вкладки 1-5)",
            "Скрыть «Возможные друзья»: " + (hideFriends ? "ВКЛ (скрыты)" : "ВЫКЛ (показаны)")
        };

        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Настройки Morphe");
        builder.setItems(menuItems, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                if (which == 0) {
                    openTabbarSlotsPicker(activity);
                } else if (which == 1) {
                    boolean newVal = app.morphe.extension.vk.friends.FriendsFilter.toggleHideFriendSuggestions();
                    Toast.makeText(activity,
                            newVal ? "«Возможные друзья» отключены!" : "«Возможные друзья» включены!",
                            Toast.LENGTH_SHORT).show();
                    showTabbarSettingsDialog(activity);
                }
            }
        });
        builder.setNegativeButton("Закрыть", null);
        builder.show();
    }

    private static void openTabbarSlotsPicker(final Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        SharedPreferences prefs = getPrefs(activity);
        String current = getEffectiveTabs(prefs);
        String[] parts = current.split(",");
        final String[] slots = new String[5];
        String[] defaults = DEFAULT_TABS.split(",");
        for (int i = 0; i < 5; i++) {
            if (i < parts.length && !parts[i].trim().isEmpty()) {
                slots[i] = parts[i].trim().toLowerCase();
            } else if (i < defaults.length) {
                slots[i] = defaults[i];
            } else {
                slots[i] = "home";
            }
        }

        showSlotsDialog(activity, slots);
    }

    private static void showSlotsDialog(final Activity activity, final String[] slots) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        String[] itemTexts = new String[5];
        for (int i = 0; i < 5; i++) {
            itemTexts[i] = "Вкладка " + (i + 1) + ": " + getTabLabelByKey(slots[i]);
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("Настройка нижней панели (все 5)");
        builder.setItems(itemTexts, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, final int whichSlot) {
                int selectedIdx = -1;
                for (int j = 0; j < ALL_TAB_KEYS.length; j++) {
                    if (ALL_TAB_KEYS[j].equalsIgnoreCase(slots[whichSlot])) {
                        selectedIdx = j;
                        break;
                    }
                }

                AlertDialog.Builder slotPicker = new AlertDialog.Builder(activity);
                slotPicker.setTitle("Выберите вкладку " + (whichSlot + 1));
                slotPicker.setSingleChoiceItems(ALL_TAB_LABELS, selectedIdx, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface pickerDialog, int whichOption) {
                        slots[whichSlot] = ALL_TAB_KEYS[whichOption];
                        pickerDialog.dismiss();
                        showSlotsDialog(activity, slots);
                    }
                });
                slotPicker.setNegativeButton("Назад", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface pickerDialog, int w) {
                        showSlotsDialog(activity, slots);
                    }
                });
                slotPicker.show();
            }
        });

        builder.setPositiveButton("Сохранить", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < 5; i++) {
                    if (i > 0) sb.append(",");
                    sb.append(slots[i]);
                }
                SharedPreferences p = getPrefs(activity);
                boolean written = false;
                if (p != null) {
                    written = p.edit().putString(KEY_TABS, sb.toString()).putInt(KEY_TABS_VERSION, TABS_VERSION).commit();
                }
                Log.i(TAG, "SAVE tabs=" + sb + " prefsNull=" + (p == null) + " committed=" + written);
                Toast.makeText(activity, "Вкладки сохранены! Перезапуск...", Toast.LENGTH_SHORT).show();
                restartApp(activity);
            }
        });

        builder.setNeutralButton("Сброс", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                SharedPreferences p = getPrefs(activity);
                if (p != null) {
                    p.edit().putString(KEY_TABS, DEFAULT_TABS).putInt(KEY_TABS_VERSION, TABS_VERSION).commit();
                }
                Toast.makeText(activity, "Сброшено по умолчанию! Перезапуск...", Toast.LENGTH_SHORT).show();
                restartApp(activity);
            }
        });

        builder.setNegativeButton("Отмена", null);
        builder.show();
    }

    public static void saveTabs(Context context, String tabs) {
        SharedPreferences p = getPrefs(context);
        boolean written = false;
        if (p != null) {
            written = p.edit().putString(KEY_TABS, tabs).putInt(KEY_TABS_VERSION, TABS_VERSION).commit();
        }
        Log.i(TAG, "saveTabs: tabs=" + tabs + " prefsNull=" + (p == null) + " committed=" + written);
    }

    public static void restartApp(final Activity activity) {
        if (activity == null) return;
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
                    Log.i(TAG, "restartApp: pkg=" + activity.getPackageName() + " launchIntent=" + (intent != null));
                    if (intent != null) {
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        activity.startActivity(intent);
                        Runtime.getRuntime().exit(0);
                    } else {
                        Log.i(TAG, "restartApp: no launch intent -> recreate() only (process keeps old tabbar)");
                        activity.recreate();
                    }
                } catch (Throwable t) {
                    Log.i(TAG, "restartApp: failed, falling back to recreate: " + t);
                    try {
                        activity.recreate();
                    } catch (Throwable ignored) {}
                }
            }
        }, 300);
    }

    public static String getTabLabelByKey(String key) {
        for (int i = 0; i < ALL_TAB_KEYS.length; i++) {
            if (ALL_TAB_KEYS[i].equalsIgnoreCase(key)) {
                return ALL_TAB_LABELS[i];
            }
        }
        return key;
    }

    public static SharedPreferences getPrefs(Context context) {
        if (context == null) {
            try {
                context = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication")
                        .invoke(null);
            } catch (Throwable ignored) {}
        }
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
        if (context != null) {
            return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
        }
        Log.i(TAG, "getPrefs: NULL (no context resolvable) -> tab prefs unavailable");
        return null;
    }
}
