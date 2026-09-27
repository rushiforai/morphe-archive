/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What Open on a chosen tab does when Facebook's main screen is created: it asks Facebook to open
 * on the tab chosen in the settings, the same way Facebook's own tab shortcuts and notifications
 * ask for one.
 *
 * <p>Facebook picks the tab its main screen opens on from the intent that started it. A shortcut or
 * a notification meant for a tab carries the tab's id as {@link FacebookTabs#TARGET_TAB_ID}, and
 * Facebook opens that tab when its tab bar has it and its first tab, Home, when it doesn't. A
 * start from the launcher icon carries nothing, so Facebook opens where it chooses, usually Home.
 * The patch calls {@link #onActivityCreate} first thing in every Facebook activity's
 * {@code onCreate}. When that's the main screen started from the launcher icon, the screen gets a
 * copy of its intent with the chosen tab's id in it, before any of Facebook's own start code reads
 * it. The intent it was started with isn't touched, since Facebook's start-up prediction can be
 * reading it on another thread; all that prediction decides is what to fetch early.
 *
 * <p>Everything else keeps its own destination: a link, a notification, a shortcut or anything else
 * that carries one of Facebook's routes, and a screen restored after Android put it away. Nothing
 * here runs after the main screen is created, so tapping another tab, leaving Facebook and coming
 * back all stay as they were. It fails open: with the switch off, Hushfacebook paused, the
 * settings not ready yet, or a failure in here, the start is Facebook's own.
 *
 * <p>With Debug logging on it logs the start it saw and the tab it asked for, and two seconds after
 * the screen first shows, the tab Facebook opened and the tabs in its tab bar, read through names
 * Facebook keeps. A tab this account's tab bar hasn't got is logged too, as Facebook opening Home.
 */
public final class StartTabRoute {
    /**
     * The extras Facebook's main screen routes a start by: a tab, a screen to open inside one, a
     * link, or a fragment. A start carrying any of them already has somewhere to go.
     */
    static final String[] FACEBOOK_ROUTES = {
            FacebookTabs.TARGET_TAB_ID, "tabbar_target_intent", "extra_launch_uri", "target_fragment", "fragment_type",
    };

    /** Marks a start this asked a tab for, with the tab's file value. Facebook reads no such extra. */
    static final String ROUTED = "app.morphe.extension.facebook.START_TAB";

    /** How long after the screen first shows the tab it opened on is read. */
    static final long LANDING_CHECK_MS = 2000;

    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "StartTabRoute";

    /** What every line of this hook starts with, for a person reading the log. */
    static final String PREFIX = "Start tab: ";

    private StartTabRoute() {
    }

    /**
     * Injection point, first thing in the {@code onCreate} of every Facebook activity. Acts only on
     * the main screen, and only when it's started from the launcher icon with nothing saved to
     * restore. Never throws.
     */
    public static void onActivityCreate(@Nullable Activity activity, @Nullable Bundle savedState) {
        try {
            if (activity == null || !FacebookTabs.MAIN_TAB_ACTIVITY.equals(activity.getClass().getName())) return;
            HookStatus.invoked(FamilyNames.START_TAB);
            // Settings first: before the context is set, reading a switch would break Facebook's start.
            if (!Utils.settingsReady() || !Settings.OPEN_ON_CHOSEN_TAB.get()) return;
            StartTab tab = Settings.START_TAB.get();
            Intent intent = activity.getIntent();
            String leftAlone = whyLeftAlone(intent, savedState);
            if (leftAlone != null) {
                debug(() -> "left Facebook's own start alone: " + leftAlone + ". " + describe(intent));
                return;
            }
            activity.setIntent(routed(intent, tab));
            debug(() -> "asked Facebook to open on " + tab.fileValue + " (tab " + tab.tabId + "). " + describe(intent));
            Landing.watch(activity, tab);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.START_TAB, "start tab", failure);
        }
    }

    /**
     * Why a start of the main screen keeps Facebook's own destination, or null when it's a plain
     * start from the launcher icon, the only kind this changes.
     */
    @Nullable
    static String whyLeftAlone(@Nullable Intent intent, @Nullable Bundle savedState) {
        if (savedState != null) return "the screen is being restored";
        if (intent == null) return "the screen has no intent";
        if (!Intent.ACTION_MAIN.equals(intent.getAction()) || !intent.hasCategory(Intent.CATEGORY_LAUNCHER)) {
            return "it isn't a start from the launcher icon";
        }
        if (intent.getData() != null) return "it opens a link";
        for (String route : FACEBOOK_ROUTES) {
            if (intent.hasExtra(route)) return "Facebook routes it by " + route;
        }
        return null;
    }

    /** A copy of [intent] that asks for [tab]. */
    static Intent routed(Intent intent, StartTab tab) {
        return new Intent(intent)
                .putExtra(FacebookTabs.TARGET_TAB_ID, tab.tabId)
                .putExtra(ROUTED, tab.fileValue);
    }

    /**
     * A start's intent for the log: its action, categories and flags, whether it carries a link, and
     * the names of its extras. Never the link or a value, which can name a person or a post.
     */
    static String describe(@Nullable Intent intent) {
        if (intent == null) return "No intent.";
        StringBuilder text = new StringBuilder("Intent: action ").append(intent.getAction());
        Set<String> categories = intent.getCategories();
        text.append(", categories ").append(categories == null || categories.isEmpty()
                ? "none" : String.join(" ", new TreeSet<>(categories)));
        text.append(", flags 0x").append(Integer.toHexString(intent.getFlags()));
        text.append(intent.getData() == null ? ", no link" : ", a link");
        Bundle extras = intent.getExtras();
        text.append(", extras ").append(extras == null || extras.isEmpty()
                ? "none" : String.join(" ", new TreeSet<>(extras.keySet())));
        return text.append('.').toString();
    }

    private static void debug(Logger.LogMessage message) {
        Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                () -> PREFIX + message.buildMessageString());
    }

    /**
     * Reads which tab the main screen opened on, once, a moment after it first shows. What it
     * finds only goes to the log and Hook status; it changes nothing on screen.
     */
    static final class Landing implements Application.ActivityLifecycleCallbacks {
        private final StartTab asked;

        private Landing(StartTab asked) {
            this.asked = asked;
        }

        static void watch(Activity activity, StartTab asked) {
            activity.registerActivityLifecycleCallbacks(new Landing(asked));
        }

        @Override
        public void onActivityPostResumed(@NonNull Activity activity) {
            activity.unregisterActivityLifecycleCallbacks(this);
            WeakReference<Activity> screen = new WeakReference<>(activity);
            Utils.runOnMainThreadDelayed(() -> check(screen.get(), asked), LANDING_CHECK_MS);
        }

        @Override
        public void onActivityDestroyed(@NonNull Activity activity) {
            activity.unregisterActivityLifecycleCallbacks(this);
        }

        @Override
        public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle savedState) {
        }

        @Override
        public void onActivityStarted(@NonNull Activity activity) {
        }

        @Override
        public void onActivityResumed(@NonNull Activity activity) {
        }

        @Override
        public void onActivityPaused(@NonNull Activity activity) {
        }

        @Override
        public void onActivityStopped(@NonNull Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle outState) {
        }
    }

    /**
     * Compares the tab the main screen shows with the one it was asked for. The same tab is the
     * route working. A tab bar without the asked tab is the account's, not a fault: Facebook
     * opened Home, as it does for a notification about such a tab. Another tab while the bar has
     * the asked one is a route Facebook didn't take, or a tap in those two seconds.
     */
    static void check(@Nullable Activity activity, StartTab asked) {
        try {
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            Object current = TabBar.currentTab(activity);
            List<Object> tabs = TabBar.tabs(activity);
            String opened = TabBar.name(current);
            String bar = TabBar.describe(tabs);
            if (current != null && asked.isTab(current.getClass().getName())) {
                HookStatus.bound(FamilyNames.START_TAB, asked.fileValue + " tab");
                debug(() -> "Facebook opened " + opened + ", as asked. Tab bar: " + bar);
            } else if (tabs != null && !TabBar.has(tabs, asked)) {
                Logger.diagnosticInfo(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE, () -> PREFIX + "this tab bar has no "
                        + asked.fileValue + " tab, so Facebook opened " + opened + ". Tab bar: " + bar);
            } else {
                HookStatus.missingMember(FamilyNames.START_TAB, "start on tab", FacebookTabs.MAIN_TAB_ACTIVITY,
                        asked.fileValue);
                debug(() -> "asked for " + asked.fileValue + ", Facebook opened " + opened + ". Tab bar: " + bar);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.START_TAB, "start tab landing", failure);
        }
    }

    /**
     * Facebook's tab bar, read through the names Redex keeps: the main screen's
     * {@code getCurrentTab()}, its delegate's lazy tab bar state, the {@code TabTag} class and its
     * one long, the tab's id. Every read answers null rather than throw, and reads only what
     * Facebook has already built.
     */
    static final class TabBar {
        private TabBar() {
        }

        /** The tab the main screen shows, or null. */
        @Nullable
        static Object currentTab(Activity activity) {
            Object tab = call(activity, "getCurrentTab");
            return isTab(tab) ? tab : null;
        }

        /**
         * The tabs the tab bar shows, in order: the tab bar state's own list, which leaves out the
         * tabs hidden in Facebook's settings, or else its configuration's. Null when neither can
         * be read, or the state hasn't been built yet.
         */
        @Nullable
        static List<Object> tabs(Activity activity) {
            Object delegate = mainTabDelegate(activity);
            if (delegate == null) return null;
            Object lazy = field(delegate, FacebookTabs.TAB_BAR_STATE);
            if (lazy == null || !Boolean.TRUE.equals(call(lazy, "isInitialized"))) return null;
            Object state = call(lazy, "getValue");
            if (state == null) return null;
            List<Object> shown = tabList(state);
            if (shown != null) return shown;
            Object config = fieldOfType(state, FacebookTabs.NAVIGATION_CONFIG);
            return config == null ? null : tabList(config);
        }

        /** Whether [tabs] has a tab that is [tab]. */
        static boolean has(List<Object> tabs, StartTab tab) {
            for (Object each : tabs) {
                if (tab.isTab(each.getClass().getName())) return true;
            }
            return false;
        }

        /** "MarketplaceTab 1606854132932955" for a tab, "no tab" for none. */
        static String name(@Nullable Object tab) {
            if (tab == null) return "no tab";
            long id = tabId(tab);
            return tab.getClass().getSimpleName() + (id == -1 ? "" : " " + id);
        }

        /** Every tab of [tabs] by [name], or "unreadable". */
        static String describe(@Nullable List<Object> tabs) {
            if (tabs == null) return "unreadable";
            List<String> names = new ArrayList<>();
            for (Object tab : tabs) names.add(name(tab));
            return names.isEmpty() ? "empty" : String.join(", ", names);
        }

        /** The tab's id, the one long its TabTag holds, or -1. */
        static long tabId(Object tab) {
            for (Class<?> type = tab.getClass(); type != null; type = type.getSuperclass()) {
                if (!FacebookTabs.TAB_TAG.equals(type.getName())) continue;
                Field id = null;
                for (Field field : type.getDeclaredFields()) {
                    if (field.getType() != long.class || Modifier.isStatic(field.getModifiers())) continue;
                    if (id != null) return -1;
                    id = field;
                }
                if (id == null) return -1;
                try {
                    id.setAccessible(true);
                    return id.getLong(tab);
                } catch (ReflectiveOperationException | RuntimeException unreadable) {
                    return -1;
                }
            }
            return -1;
        }

        /** Whether [value] extends Facebook's TabTag. */
        static boolean isTab(@Nullable Object value) {
            if (value == null) return false;
            for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
                if (FacebookTabs.TAB_TAG.equals(type.getName())) return true;
            }
            return false;
        }

        /**
         * The delegate Facebook's main screen hands its work to. The screen's
         * {@code getFragmentActivityDelegate()} gives it, or a wrapper holding it.
         */
        @Nullable
        static Object mainTabDelegate(Activity activity) {
            Object delegate = call(activity, "getFragmentActivityDelegate");
            if (delegate == null) return null;
            if (FacebookTabs.MAIN_TAB_DELEGATE.equals(delegate.getClass().getName())) return delegate;
            for (Class<?> type = delegate.getClass(); ownClass(type); type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                    Object value = read(field, delegate);
                    if (value != null && FacebookTabs.MAIN_TAB_DELEGATE.equals(value.getClass().getName())) return value;
                }
            }
            return null;
        }

        /** The first list field of [owner] that holds tabs and nothing else, copied, or null. */
        @Nullable
        static List<Object> tabList(Object owner) {
            for (Class<?> type = owner.getClass(); ownClass(type); type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers()) || !List.class.isAssignableFrom(field.getType())) continue;
                    Object value = read(field, owner);
                    if (!(value instanceof List) || ((List<?>) value).isEmpty()) continue;
                    List<Object> tabs = new ArrayList<>((List<?>) value);
                    boolean allTabs = true;
                    for (Object each : tabs) allTabs &= isTab(each);
                    if (allTabs) return tabs;
                }
            }
            return null;
        }

        @Nullable
        private static Object fieldOfType(Object owner, String typeName) {
            for (Class<?> type = owner.getClass(); ownClass(type); type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (!Modifier.isStatic(field.getModifiers()) && typeName.equals(field.getType().getName())) {
                        return read(field, owner);
                    }
                }
            }
            return null;
        }

        @Nullable
        private static Object field(Object owner, String name) {
            for (Class<?> type = owner.getClass(); ownClass(type); type = type.getSuperclass()) {
                try {
                    return read(type.getDeclaredField(name), owner);
                } catch (NoSuchFieldException | RuntimeException notHere) {
                    // Try the superclass.
                }
            }
            return null;
        }

        /** Calls a public method of [target] that takes nothing, by name, or answers null. */
        @Nullable
        private static Object call(Object target, String name) {
            try {
                Method method = target.getClass().getMethod(name);
                method.setAccessible(true);
                return method.invoke(target);
            } catch (ReflectiveOperationException | RuntimeException unreadable) {
                return null;
            }
        }

        @Nullable
        private static Object read(Field field, Object owner) {
            try {
                field.setAccessible(true);
                return field.get(owner);
            } catch (ReflectiveOperationException | RuntimeException unreadable) {
                return null;
            }
        }

        /** Facebook's own classes and the app's, not Android's or Java's, whose fields are theirs. */
        private static boolean ownClass(@Nullable Class<?> type) {
            if (type == null || type == Object.class) return false;
            String name = type.getName();
            return !name.startsWith("android.") && !name.startsWith("androidx.") && !name.startsWith("java.")
                    && !name.startsWith("kotlin.");
        }
    }
}
