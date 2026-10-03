/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Opens the Feeds tab on the filter chosen in the settings, once, after a start from the launcher
 * icon that {@link StartTabRoute} sent to Feeds (#56).
 *
 * <p>Facebook already has a way to pick one of the Feeds tab's filters. Its main screen hands an
 * intent meant for the tab to the tab's {@code handleDeeplinkFromMainActivity}, which looks for the
 * feed type it last showed among the tab's filters and picks that filter when they have it. A start
 * from the icon never calls it, so the patch calls {@link #feedsResumed} as the Feeds tab's
 * {@code onResume} ends, and when this start asked for a filter, that calls the handler. Where the
 * handler reads the feed type it last showed, the patch asks {@link #feedType}, which answers the
 * chosen filter's instead while that call lasts, and the lookup's answer goes through
 * {@link #filterFound}, which says whether the tab had it. A filter has a name on each of
 * Facebook's two lists of filters, so each is asked for in turn until the tab has one. A filter it
 * hasn't got under either leaves the tab as it opened.
 *
 * <p>It's asked once: the first time the Feeds tab resumes after such a start, whether as the tab
 * Facebook opened on or later from the Menu, and not again until the next start from the icon.
 * Everything else picks as Facebook does: a link, a notification, a screen restored after Android
 * put it away, and every filter the person taps. A link the main screen hands the Feeds tab before
 * it's asked cancels the ask, so the link still opens where it leads. The feed types are found by the names Facebook
 * keeps, the class's and the handler's, and by what each one is called. It fails open: when
 * anything isn't as expected, the Feeds tab opens as Facebook chooses.
 */
public final class FeedsSubtabRoute {
    /** Facebook's feed type class, whose name and whose feed types' names it keeps. */
    static final String FEED_TYPE_CLASS = "com.facebook.api.feedtype.FeedType";

    /** The Feeds tab's handler for an intent its main screen hands it. */
    static final String HANDLER = "handleDeeplinkFromMainActivity";

    /** What {@link #found} holds while no lookup has answered. */
    private static final int NOT_FOUND = -1;

    /** The main screen whose start asked for a filter, and the filter, or null. */
    private static final class Armed {
        final WeakReference<Activity> screen;
        final FeedsSubtab subtab;

        Armed(Activity screen, FeedsSubtab subtab) {
            this.screen = new WeakReference<>(screen);
            this.subtab = subtab;
        }
    }

    @Nullable
    private static volatile Armed armed;

    /** The feed type asked for while {@link #feedsResumed} calls the handler, null the rest of the time. */
    @Nullable
    private static volatile Object asking;

    /** Where the tab's filters had the feed type asked for, while asking. */
    private static volatile int found = NOT_FOUND;

    private FeedsSubtabRoute() {
    }

    /** Asks for [subtab] the next time the Feeds tab resumes while [screen] is there. All asks for nothing. */
    static void arm(Activity screen, FeedsSubtab subtab) {
        armed = subtab == FeedsSubtab.ALL ? null : new Armed(screen, subtab);
    }

    /** Forgets what an earlier start asked for. */
    static void disarm() {
        armed = null;
    }

    /**
     * Injection point, as the Feeds tab's {@code onResume} ends, with the tab. Asks the tab for the
     * filter this start asked for, the first time only. Never throws.
     */
    public static void feedsResumed(@Nullable Object feeds) {
        try {
            Armed asked = armed;
            if (asked == null || feeds == null) return;
            // Once, whatever happens next.
            armed = null;
            Activity screen = asked.screen.get();
            if (screen == null || screen.isDestroyed()) return;
            Class<?> types = Class.forName(FEED_TYPE_CLASS, false, feeds.getClass().getClassLoader());
            Method handler = feeds.getClass().getMethod(HANDLER, Intent.class);
            for (String name : asked.subtab.feedTypes) {
                Object type = feedTypeNamed(types, name);
                if (type == null) {
                    HookStatus.missingMember(FamilyNames.START_TAB, "feeds filter", FEED_TYPE_CLASS, name);
                    continue;
                }
                found = NOT_FOUND;
                asking = type;
                try {
                    handler.invoke(feeds, new Intent());
                } finally {
                    asking = null;
                }
                int at = found;
                if (at != NOT_FOUND) {
                    HookStatus.bound(FamilyNames.START_TAB, asked.subtab.fileValue + " filter");
                    debug(() -> "asked the Feeds tab for its " + name + " filter, which it has at " + at + ".");
                    return;
                }
            }
            debug(() -> "the Feeds tab has no " + asked.subtab.fileValue + " filter, so it stays as it opened.");
        } catch (Throwable failure) {
            // What Facebook's method threw, rather than the reflection's wrapper around it.
            Throwable cause = failure instanceof InvocationTargetException && failure.getCause() != null
                    ? failure.getCause() : failure;
            HookStatus.threw(FamilyNames.START_TAB, "feeds filter", cause);
        }
    }

    /**
     * Injection point, where the Feeds tab's handler reads the feed type it last showed: the
     * chosen filter's while {@link #feedsResumed} asks, and [last] the rest of the time. The rest
     * of the time it's Facebook handing the tab a link, which wins: the start's ask is dropped.
     */
    @Nullable
    public static Object feedType(@Nullable Object last) {
        Object type = asking;
        if (type != null) return type;
        if (armed != null) {
            armed = null;
            debug(() -> "a link reached the Feeds tab first, so it opens where the link leads.");
        }
        return last;
    }

    /**
     * Injection point, right after the handler's lookup answers where the tab's filters have the
     * feed type: [index], or -1 when they haven't got it. Kept while {@link #feedsResumed} asks, and
     * handed back as it is.
     */
    public static int filterFound(int index) {
        if (asking != null) found = index < 0 ? NOT_FOUND : index;
        return index;
    }

    /** The feed type Facebook keeps as a constant of [types] and calls [name], or null. */
    @Nullable
    static Object feedTypeNamed(Class<?> types, String name) {
        if (!FEED_TYPE_CLASS.equals(types.getName())) return null;
        for (Field field : types.getFields()) {
            int modifiers = field.getModifiers();
            if (!Modifier.isStatic(modifiers) || !Modifier.isFinal(modifiers) || field.getType() != types) continue;
            try {
                Object type = field.get(null);
                if (type != null && name.equals(String.valueOf(type))) return type;
            } catch (ReflectiveOperationException | RuntimeException unreadable) {
                // The next one.
            }
        }
        return null;
    }

    private static void debug(Logger.LogMessage message) {
        Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, StartTabRoute.SOURCE,
                () -> StartTabRoute.PREFIX + message.buildMessageString());
    }
}
