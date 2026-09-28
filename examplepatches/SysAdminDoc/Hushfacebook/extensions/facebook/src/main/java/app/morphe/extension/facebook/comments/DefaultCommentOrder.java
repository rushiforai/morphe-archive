/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The order a comment sheet asks Facebook for.
 *
 * <p>Every request for a post's comments is built from one params object, and the patch has its
 * constructor ask {@link #requestedOrder} first. An ordinary sheet asks for no order, and then
 * Facebook's servers choose one, usually Most relevant, and choose it again on every refresh and
 * every reopening, whatever was picked in the sheet's menu. While the switch is on and an order is
 * chosen, this fills in that order where Facebook would have chosen, and nowhere else:
 *
 * <ul>
 *   <li>a request that already names an order keeps it: a pick in the sheet's menu, a list that
 *       names its own, a request restored after Android closed Facebook;
 *   <li>a link to one comment, a notification about a reply for one, keeps Facebook's order, so
 *       the comment it leads to is where Facebook puts it;
 *   <li>a post whose order was picked in its sheet's menu since Facebook started gets that order
 *       again ({@link #picked} hears the pick first), until Facebook restarts.
 * </ul>
 *
 * <p>Facebook's answer names the order it used, which is what the sheet's menu then shows. Its own
 * links to a post can name an order the same way. What its servers answer for a post that doesn't
 * offer the order named hasn't been seen on a phone yet.
 *
 * <p>It fails open: with the patch not in the build, the switch off, Hushfacebook paused, the
 * settings not ready yet, Facebook's order chosen, or a failure in here, the request is Facebook's
 * own.
 */
public final class DefaultCommentOrder {
    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "DefaultCommentOrder";

    /** What every line of this hook starts with, for a person reading the log. */
    static final String PREFIX = "Default comment order: ";

    /** How long after a pick in the menu the request it sends may come. It comes at once. */
    static final long PICK_WINDOW_MS = 2000;

    /** The posts whose picked order is kept, the most recently used ones. */
    static final int REMEMBERED_POSTS = 200;

    /** Requests logged one by one before the log only counts them. */
    static final int LOGGED_ONE_BY_ONE = 40;

    /** After those, one line per this many requests. */
    static final int SUMMED_UP_BY = 50;

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    /** The order a test chooses instead of the saved one. The switch is still asked. */
    @Nullable
    static volatile CommentOrder orderForTests;

    /** The clock a test sets instead of the phone's uptime, in milliseconds. */
    @Nullable
    static volatile Long nowForTests;

    /** Thrown by the next hook call, for a test of the fail-open path. */
    @Nullable
    static volatile RuntimeException failNextForTests;

    /** A pick heard in the menu, waiting for the request it sends on the same thread. */
    private static final class Pick {
        final String token;
        final long at;

        Pick(String token, long at) {
            this.token = token;
            this.at = at;
        }
    }

    private static final ThreadLocal<Pick> pending = new ThreadLocal<>();

    /** Feedback id to the order picked for that post, least recently used first. */
    private static final Map<String, String> picks = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > REMEMBERED_POSTS;
                }
            });

    /** How many requests this changed or left alone for a reason worth a line. */
    private static final AtomicInteger decisions = new AtomicInteger();

    private DefaultCommentOrder() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.defaultCommentOrder();
    }

    private static long now() {
        Long forced = nowForTests;
        return forced != null ? forced : SystemClock.uptimeMillis();
    }

    private static boolean isEmpty(@Nullable String text) {
        return text == null || text.isEmpty();
    }

    /**
     * The order to ask for when a request names none: the chosen one while the patch is in, the
     * settings are ready and the switch is on, which a pause answers off. Null for Facebook's own
     * choice. Never throws.
     */
    @Nullable
    static CommentOrder chosen() {
        try {
            if (!inBuild() || !Utils.settingsReady() || !Settings.DEFAULT_COMMENT_ORDER.get()) return null;
            CommentOrder forced = orderForTests;
            CommentOrder order = forced != null ? forced : Settings.COMMENT_ORDER.get();
            return order == null || order.token == null ? null : order;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DEFAULT_COMMENT_ORDER, "comment order setting", failure);
            return null;
        }
    }

    /**
     * Injection point, first thing in the constructor of the params every request for a post's
     * comments is built from. [token] is the order the request would name, empty or null for none,
     * [feedbackId] the post's feedback id and [focusedCommentId] the comment a link leads to, if
     * any. Answers the order the request names. Never throws.
     */
    @Nullable
    public static String requestedOrder(@Nullable String token, @Nullable String feedbackId,
                                        @Nullable String focusedCommentId) {
        try {
            if (!inBuild()) return token;
            HookStatus.invoked(FamilyNames.DEFAULT_COMMENT_ORDER);
            RuntimeException failure = failNextForTests;
            if (failure != null) {
                failNextForTests = null;
                throw failure;
            }
            boolean named = !isEmpty(token);
            if (named) rememberPick(token, feedbackId);
            if (isEmpty(feedbackId)) return token;
            HookStatus.bound(FamilyNames.DEFAULT_COMMENT_ORDER, "comment request");
            if (named) return token;
            CommentOrder order = chosen();
            if (order == null) return token;
            if (!isEmpty(focusedCommentId)) {
                log("left a link to one comment in Facebook's order.");
                return token;
            }
            String picked = picks.get(feedbackId);
            if (picked != null) {
                log("asked for the order picked for this post, " + describe(picked) + ".");
                return picked;
            }
            log("asked for " + describe(order.token) + ".");
            return order.token;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DEFAULT_COMMENT_ORDER, "comment request", failure);
            return token;
        }
    }

    /**
     * Injection point, first thing in a comment sheet's pick handler, with the token of the order
     * picked in its menu. The request it sends comes next, on this thread, and {@link
     * #requestedOrder} keeps the order for that post. Never throws.
     */
    public static void picked(@Nullable String token) {
        try {
            if (!inBuild()) return;
            HookStatus.invoked(FamilyNames.DEFAULT_COMMENT_ORDER);
            if (isEmpty(token)) return;
            HookStatus.bound(FamilyNames.DEFAULT_COMMENT_ORDER, "order picked in a comment sheet");
            pending.set(new Pick(token, now()));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DEFAULT_COMMENT_ORDER, "order picked in a comment sheet", failure);
        }
    }

    /**
     * Keeps [token] as the order picked for [feedbackId] when this request is the one a pick just
     * sent: the same token, on the same thread, within {@link #PICK_WINDOW_MS}. A pick is used up
     * by the first request that names an order, whatever it names.
     */
    private static void rememberPick(String token, @Nullable String feedbackId) {
        Pick pick = pending.get();
        if (pick == null) return;
        pending.remove();
        if (isEmpty(feedbackId) || !pick.token.equals(token) || now() - pick.at > PICK_WINDOW_MS) return;
        String before = picks.put(feedbackId, token);
        if (!token.equals(before)) {
            log("kept " + describe(token) + ", picked in a post's comments, for that post until Facebook restarts.");
        }
    }

    /** An order as a line names it: its name here and Facebook's token, or the token alone. */
    static String describe(String token) {
        CommentOrder order = CommentOrder.ofToken(token);
        return order == null ? token : order.fileValue + " (" + token + ")";
    }

    /** One line per decision for the first {@link #LOGGED_ONE_BY_ONE}, then one per {@link #SUMMED_UP_BY}. */
    private static void log(String line) {
        int count = decisions.incrementAndGet();
        if (count <= LOGGED_ONE_BY_ONE) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE, () -> PREFIX + line);
        } else if (count % SUMMED_UP_BY == 0) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> PREFIX + count + " comment requests so far. The last one " + line);
        }
    }

    /** Forgets the picks, the pending one and the line count, as a new process would. */
    static void forget() {
        picks.clear();
        pending.remove();
        decisions.set(0);
    }
}
