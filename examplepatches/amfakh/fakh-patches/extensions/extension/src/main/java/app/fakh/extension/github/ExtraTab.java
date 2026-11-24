/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.fakh.extension.shared.AppRuntime;

/**
 * Tabs the patch adds to the navigation bar: Repositories and Stars, which open the signed-in user's repository list
 * and starred repositories. The patch makes this class a subclass of the app's tab type and gives it a constructor
 * that takes the kind of tab, and the route method the type declares, so the app draws, selects and opens these tabs
 * like its own. There is one instance per kind.
 */
@SuppressWarnings("unused")
public final class ExtraTab {
    private static final String TAG = "FakhExtraTab";
    private static final int REPOSITORIES = 0;
    private static final int STARS = 1;
    /** The resource names of the tabs' labels, by kind, which also name their switches in the tab sheet. */
    static final List<String> LABELS = java.util.Arrays.asList("repositories_header_title", "feed_filter_type_stars");
    private static final String[] ICONS = {"ic_repo_24", "ic_star_24"};
    /** The filled icons the patch adds, as GitHub has none at this size. */
    private static final String[] SELECTED_ICONS = {"fakh_ic_repo_fill_24", "fakh_ic_star_fill_24"};
    /** The start of the routes of each kind's screen: its entry route and the route of the screen it opens. */
    private static final String[] SCREEN_ROUTES = {"com.github.android.repository.navigation.Repositories",
            "com.github.android.starredreposandlists.navigation.StarredReposAndLists"};
    private static final String[] KEYS = {"RepositoriesFragment", "StarredReposAndListsFragment"};
    private static final String REPOSITORIES_ROUTE = "com.github.android.repository.navigation.RepositoriesEntryPointRoute";
    private static final String STARS_ROUTE =
            "com.github.android.starredreposandlists.navigation.StarredReposAndListsEntryPointRoute";
    private static final String VIEW_TYPE = "com.github.android.repositories.RepositoriesViewType$Repositories";
    /** The tabs, by kind, made the first time the app lists its tabs. */
    private static List<Object> tabs;
    /** The activity in front, which holds the signed-in account. */
    private static WeakReference<Activity> front = new WeakReference<>(null);

    /** Which tab this is; set by the patched constructor. */
    private int kind;

    /** The tabs, made on first use. */
    static List<Object> all() {
        if (tabs == null) {
            watchActivities();
            tabs = java.util.Arrays.asList(new ExtraTab(REPOSITORIES), new ExtraTab(STARS));
        }
        return tabs;
    }

    /** Replaced by the patch with a constructor that passes the tab's values to the tab type's and keeps {@code kind}. */
    private ExtraTab(int kind) {
        this.kind = kind;
    }

    /**
     * Called by the patched constructor, before it calls the tab type's own: the label as a string resource id.
     *
     * @param kind the kind of tab
     * @return the id of its label
     */
    public static int label(int kind) {
        return resource(LABELS.get(kind), "string");
    }

    /**
     * Called by the patched constructor: the icon of the tab while another tab is selected.
     *
     * @param kind the kind of tab
     * @return the id of its outline icon
     */
    public static int icon(int kind) {
        return resource(ICONS[kind], "drawable");
    }

    /**
     * Called by the patched constructor: the icon of the selected tab.
     *
     * @param kind the kind of tab
     * @return the id of its filled icon, or the outline one when it is missing
     */
    public static int selectedIcon(int kind) {
        int id = resource(SELECTED_ICONS[kind], "drawable");
        return id == 0 ? icon(kind) : id;
    }

    /**
     * Called by the patched constructor: the routes the tab is selected for, by the app's own check. None, since
     * {@link #selected} decides for these tabs.
     *
     * @param kind the kind of tab
     * @return an empty list
     */
    public static List<Object> routes(int kind) {
        return Collections.emptyList();
    }

    /**
     * Called by the route method the patch gives this class, when the tab is tapped: the screen of the signed-in
     * account.
     *
     * @param agent whether the app would open its agent view, which only the Copilot tab has
     * @return the route to open
     */
    public Object route(boolean agent) {
        String login = login();
        if (login == null) Log.w(TAG, "No signed-in account found");
        if (login == null) login = "";
        try {
            if (kind == STARS) return Class.forName(STARS_ROUTE).getConstructor(String.class).newInstance(login);
            Class<?> route = Class.forName(REPOSITORIES_ROUTE);
            Object viewType = Class.forName(VIEW_TYPE).getField("INSTANCE").get(null);
            for (Constructor<?> constructor : route.getConstructors()) {
                if (constructor.getParameterTypes().length == 5) {
                    return constructor.newInstance(viewType, login, login, Boolean.FALSE, Boolean.FALSE);
                }
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Route", error);
        }
        return null;
    }

    /**
     * Injected at the start of the method that names the screen of a tab: a name for these tabs, which the app does
     * not know and would throw for.
     *
     * @param tab the tab
     * @return the name for one of these tabs, or null for the app's own tabs
     */
    public static String key(Object tab) {
        return tab instanceof ExtraTab ? KEYS[((ExtraTab) tab).kind] : null;
    }

    /**
     * Injected at the start of the method that tells whether a tab is selected for the screen shown. These screens
     * open inside the graph of the tab they were opened from, which would stay selected too; while one shows, only
     * its tab is.
     *
     * @param tab         the tab
     * @param destination the screen shown, whose description names its route
     * @return 1 or 0 to select the tab or not, or -1 to let the app decide
     */
    public static int selected(Object tab, Object destination) {
        int shown = -1;
        String description = String.valueOf(destination);
        for (int kind = 0; kind < SCREEN_ROUTES.length; kind++) {
            if (description.contains(" route=" + SCREEN_ROUTES[kind])) shown = kind;
        }
        if (tab instanceof ExtraTab) return ((ExtraTab) tab).kind == shown ? 1 : 0;
        return shown < 0 ? -1 : 0;
    }

    @Override
    public String toString() {
        return kind == STARS ? "Stars" : "Repositories";
    }

    /** The login of the account of the activity in front, or null when there is none. */
    private static String login() {
        Activity activity = front.get();
        if (activity == null) return null;
        for (Class<?> type = activity.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                Method getter = accountGetter(field.getType());
                if (getter == null) continue;
                try {
                    field.setAccessible(true);
                    Object holder = field.get(activity);
                    Object account = holder == null ? null : getter.invoke(holder);
                    String login = account == null ? null : loginOf(account);
                    if (login != null) return login;
                } catch (ReflectiveOperationException | RuntimeException error) {
                    Log.w(TAG, "Account", error);
                }
            }
        }
        return null;
    }

    /**
     * The method of the account holder that returns the signed-in account: no parameters and an account class
     * returned, one that is built from its SharedPreferences and its key; null when {@code type} has none. R8 moves
     * the holder to the default package, so any type is looked at.
     */
    private static Method accountGetter(Class<?> type) {
        for (Method method : type.getDeclaredMethods()) {
            if (Modifier.isStatic(method.getModifiers()) || method.getParameterTypes().length != 0) continue;
            Class<?> account = method.getReturnType();
            if (!account.getName().startsWith("com.github.account.")) continue;
            try {
                account.getDeclaredConstructor(SharedPreferences.class, String.class);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    /**
     * The login of an account. The account keeps its key, "login" or "login:host" on GitHub Enterprise, and the parts
     * of the key in its string fields; the login is the field that the key equals or starts with, followed by ":".
     */
    private static String loginOf(Object account) throws IllegalAccessException {
        List<String> values = new ArrayList<>();
        for (Field field : account.getClass().getDeclaredFields()) {
            if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            values.add((String) field.get(account));
        }
        for (int i = 0; i < values.size(); i++) {
            String value = values.get(i);
            if (value == null || value.isEmpty()) continue;
            for (int j = 0; j < values.size(); j++) {
                String other = values.get(j);
                if (j != i && other != null && (other.equals(value) || other.startsWith(value + ":"))) return value;
            }
        }
        return null;
    }

    /** Keeps {@link #front} at the activity in front. */
    private static void watchActivities() {
        Application application = AppRuntime.application();
        if (application == null) return;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                front = new WeakReference<>(activity);
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                front = new WeakReference<>(activity);
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /** The id of the app's resource {@code name} of {@code type}, or 0. */
    private static int resource(String name, String type) {
        Context context = AppRuntime.application();
        return context == null ? 0 : context.getResources().getIdentifier(name, type, context.getPackageName());
    }
}
