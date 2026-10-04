package app.onlynazril.extension.tiktok;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.HandleSettings;

/**
 * Called at entry of User.getNickname(). Returns "@handle", or null to let the original method run
 * (no flip, no mutation of the model).
 *
 * This class is the handle element and nothing else. The region and the post time are written by
 * the view bridges (`AuthorInfoBridge`, `CommentDateBridge`), which ask this class nothing; whether
 * the stamp may appear here is one question with one answer, `HandleSettings.handleOn(surface)`.
 *
 * The surface is read from the class on the stack — exact, per-thread, and independent of which
 * obfuscated method calls the getter. Detection never consults a switch: a surface that is switched
 * off is still recognised and says so, so a quiet log means "the stamp is not rendered here" rather
 * than "turned off".
 */
public final class HandleDelegate {
    /** Enough frames to see the binder; short enough to keep the walk cheap. */
    private static final int MAX_FRAMES = 40;
    /**
     * Raised by hand while a surface outside the feed is being traced. The miss budget matters most:
     * the first second of a process spends all of a small one on background reads, so a UI miss, the
     * one line that names the class drawing a name where we do not look, was never reported.
     */
    private static final int MAX_MISS_REPORTS = 60;
    private static final int MAX_RENDER_REPORTS = 120;
    private static final int MAX_SKIP_REPORTS = 40;
    /** Deep enough to see past the helpers a render goes through and reach the cell. */
    private static final int MAX_RENDER_FRAMES = 16;
    private static final int MAX_MISS_FRAMES = 8;

    private static int reportedMisses;
    private static int reportedRenders;
    private static int reportedSkips;

    private HandleDelegate() {}

    public static String getDisplayName(Object user) {
        try {
            if (user == null) return null;

            // Learned before any switch is asked: this index is what lets a reply name find a handle,
            // and every render carrying a uid can fill it, whether or not that render is stamped.
            UserIndex.learnUser(Reflect.string(user, "getUid", "uid"), RegionSource.handleOf(user));

            String surface = surface();
            if (surface == null) return null;

            if (!HandleSettings.handleOn(surface)) {
                reportSkip(surface, HandleSettings.isEnabled() ? "surface off" : "handle off");
                return null;
            }

            // A reply line draws two names through this getter: the commenter, whose user payload
            // carries a uid, and the person being replied to, for which the app builds a stand-in
            // user. The stand-in has no uid and its uniqueId reads back as the nickname, so it is
            // resolved through UserIndex rather than stamped from its own fields.
            String uid = Reflect.string(user, "getUid", "uid");
            String raw = rawNickname(user);
            if (uid == null || uid.isEmpty()) {
                // The stand-in has no handle of its own, so it is resolved through what the comments
                // and the real users have already taught the index. No answer means no stamp: the
                // name stays as TikTok drew it instead of becoming an @ in front of a nickname.
                String reply = UserIndex.handleOfReply(raw);
                if (reply == null) {
                    reportSkip(surface, "a reply reference with no handle learned");
                    return null;
                }
                String replyTarget = StampText.handle(reply);
                if (replyTarget.equals(raw)) return null;
                reportRender(surface, replyTarget, user);
                return replyTarget;
            }

            String unique = RegionSource.handleOf(user);
            if (unique == null) return null;

            String target = StampText.handle(unique);
            // Idempotent: if it already equals the raw field, let the original return.
            if (target.equals(raw)) return null;

            reportRender(surface, target, user);
            return target;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Where this render is happening, or null when it is not a surface we stamp. */
    private static String surface() {
        // Specific surfaces first: a feed marker can still be fresh while another surface renders.
        if (onStackAny(Surfaces.COMMENT_CLASSES)) return Surfaces.COMMENTS;
        String marked = BindBridge.currentSurface();
        if (marked != null) return marked;
        // Kept from the feed path: a render can slip just outside the binder's window.
        if (mentionsFeed()) return Surfaces.FEED;
        reportMiss();
        return null;
    }

    private static boolean onStack(String className) {
        return onStackAny(new String[] {className});
    }

    private static boolean onStackAny(String[] classNames) {
        StackTraceElement[] frames = Thread.currentThread().getStackTrace();
        int limit = Math.min(frames.length, MAX_FRAMES);
        for (int i = 0; i < limit; i++) {
            String name = frames[i].getClassName();
            if (name == null) continue;
            for (String candidate : classNames) {
                if (name.startsWith(candidate)) return true;
            }
        }
        return false;
    }

    /**
     * Prints the first few frames of renders that matched no surface. Reported whether or not any
     * surface is switched on: which class draws a name is the one thing that cannot be worked out
     * from the dex, and a switch must not be what decides whether that is visible.
     */
    private static void reportMiss() {
        if (reportedMisses >= MAX_MISS_REPORTS) return;
        reportedMisses++;
        Debug.print("surface miss: " + frames(MAX_MISS_FRAMES));
    }

    private static boolean mentionsFeed() {
        StackTraceElement[] frames = Thread.currentThread().getStackTrace();
        int limit = Math.min(frames.length, MAX_FRAMES);
        for (int i = 0; i < limit; i++) {
            String name = frames[i].getClassName();
            if (name == null) continue;
            for (String hint : Surfaces.FEED_HINTS) {
                if (name.contains(hint)) return true;
            }
        }
        return false;
    }

    /** The nickname field, read directly: this getter is the method being hooked, so it cannot ask. */
    private static String rawNickname(Object user) {
        Object raw = user == null ? null : Reflect.readField(user, "nickname");
        return raw instanceof String ? (String) raw : null;
    }

    /**
     * Frames of a name that was stamped, capped, with method names and without this extension's own
     * frames or the VM's. The classes that render a name are obfuscated — and a render goes through
     * helpers, so the interesting frame is several down. This is what says which class drew it.
     */
    private static void reportRender(String surface, String target, Object user) {
        if (reportedRenders >= MAX_RENDER_REPORTS) return;
        reportedRenders++;
        Debug.print("name render on " + surface + ": '" + target + "'" + gates(surface)
                + model(user) + " via " + frames(MAX_RENDER_FRAMES));
    }

    /**
     * The payload behind a rendered name: uid, handle and the raw nickname field.
     *
     * A reply line draws two names of two different people through this one getter, and the expected
     * stamp differs between them: the commenter becomes "@handle" while the person being replied to
     * is a reference to someone else and has to stay as TikTok drew it. Which render is which cannot
     * be read from the getter's argument alone, so the values are printed next to the cast, and the
     * nickname is read from the field because this getter is the method being hooked.
     */
    private static String model(Object user) {
        if (user == null) return " model=no user";
        Object nickname = Reflect.readField(user, "nickname");
        return " model=uid:" + Reflect.string(user, "getUid", "uid")
                + " uniqueId:" + RegionSource.handleOf(user)
                + " nickname:'" + (nickname instanceof String ? nickname : "") + "'";
    }

    /** A render that the switches stopped. Printed with the switch that stopped it. */
    private static void reportSkip(String surface, String why) {
        if (reportedSkips >= MAX_SKIP_REPORTS) return;
        reportedSkips++;
        Debug.print("name skip on " + surface + ": " + why + gates(surface));
    }

    /**
     * Every switch in the state it was read in, so one line says both what was drawn and why. The
     * elements are independent, so a claim about one of them can be checked from any other's line.
     */
    private static String gates(String surface) {
        return " (surface=" + onOff(HandleSettings.surfaceEnabled(surface))
                + " handle=" + onOff(HandleSettings.isEnabled())
                + " region=" + onOff(HandleSettings.isRegionEnabled())
                + " time=" + onOff(HandleSettings.isPostTimeEnabled()) + ")";
    }

    private static String onOff(boolean value) {
        return value ? "on" : "off";
    }

    /**
     * Up to [limit] frames of this thread that are worth reading: the extension's own frames and the
     * VM's say nothing about who is rendering, and they are what filled the first report.
     */
    private static String frames(int limit) {
        StringBuilder chain = new StringBuilder();
        int taken = 0;
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            String name = frame.getClassName();
            if (name.startsWith("app.onlynazril.extension")
                    || name.startsWith("dalvik.")
                    || name.startsWith("java.lang.Thread")) {
                continue;
            }
            if (taken++ > 0) chain.append(" <- ");
            chain.append(name).append('#').append(frame.getMethodName());
            if (taken >= limit) break;
        }
        return chain.toString();
    }
}
