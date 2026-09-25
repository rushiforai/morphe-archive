package app.onlynazril.extension.tiktokHandle;

import app.onlynazril.extension.tiktokHandle.internal.Debug;
import app.onlynazril.extension.tiktokHandle.internal.Reflect;
import app.onlynazril.extension.tiktokHandle.settings.HandleSettings;

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
    private static final int MAX_MISS_REPORTS = 8;
    private static final int MAX_RENDER_REPORTS = 8;
    private static final int MAX_SKIP_REPORTS = 8;
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

            String surface = surface();
            if (surface == null) return null;

            if (!HandleSettings.handleOn(surface)) {
                reportSkip(surface, HandleSettings.isEnabled() ? "surface off" : "handle off");
                return null;
            }

            String unique = RegionSource.handleOf(user);
            if (unique == null) return null;

            String target = StampText.handle(unique);
            // Idempotent: if it already equals the raw field, let the original return.
            if (target.equals(Reflect.readField(user, "nickname"))) return null;

            reportRender(surface, target);
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

    /**
     * Frames of a name that was stamped, capped, with method names and without this extension's own
     * frames or the VM's. The classes that render a name are obfuscated — and a render goes through
     * helpers, so the interesting frame is several down. This is what says which class drew it.
     */
    private static void reportRender(String surface, String target) {
        if (reportedRenders >= MAX_RENDER_REPORTS) return;
        reportedRenders++;
        Debug.print("name render on " + surface + ": '" + target + "'" + gates(surface)
                + " via " + frames(MAX_RENDER_FRAMES));
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
