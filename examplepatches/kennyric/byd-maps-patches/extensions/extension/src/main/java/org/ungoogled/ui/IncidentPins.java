package org.ungoogled.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * The warning pins during navigation, drawn as Google's own incident callouts: the callout Maps shows at
 * a position right after you report a hazard (AddIncidentReportCalloutEvent). Maps posts that event on
 * its app-wide event bus and every subscribed owner draws it -- the phone's and, with Android Auto, the
 * car's -- with the reporter's own icon. Ours carry the pill's own icon and no text.
 *
 * The patch reports each owner's start (subscribed, with its bus), clear (Maps removed all its callouts,
 * on navigation changes) and stop, hands back every callout drawn for one of our events (added), and
 * rewrites uaEvent/uaSend/uaDrop. For our events only, it makes Maps use the event's bitmap even where a server
 * flag would pick Google's built-in sprite for the incident type (legend()).
 *
 * The pins are the pills' own selection (WarningPins), shown only while navigating with a WARNINGS_V1
 * provider: native coordinates only, a fixed point until its state ends, any other point while its
 * position is at most 5 s old. Callouts are kept per owner and pin key, so the pills reordering two
 * warnings changes nothing; a pin that moves or changes icon is removed and posted again. While these
 * callouts draw, the personal-place labels leave the warning pins out (WazeAlerts.mapItems).
 * Display only; nothing here is logged with a position.
 */
public final class IncidentPins {
    private IncidentPins() {}

    /** On-screen size Maps gives a report icon is its own; this is only the source bitmap's size. */
    static final int ICON_DP = 48;
    static final String ICON_ASSETS = "morphe/navigation-warning-icons/";
    /** A post nobody drew is tried again after this long. */
    static final long REPOST_MS = 5000;

    // ---- The bookkeeping, JVM-testable -----------------------------------------------------------

    /** What the shell must do after a change. */
    static final class Actions {
        /** Callouts to remove: [owner, callout] pairs. */
        final List<Object[]> drops = new ArrayList<>();
        /** Pins to post on the bus (one post reaches every owner). */
        final List<WarningPins.Pin> posts = new ArrayList<>();
    }

    /** Every owner's callouts by pin key, and what was last wanted. Main thread only. */
    static final class Book {
        private final Map<Object, Map<String, Shown>> owners = new IdentityHashMap<>();
        private final Map<String, WarningPins.Pin> wanted = new LinkedHashMap<>();
        private final Map<String, Posted> posted = new HashMap<>();

        private static final class Shown {
            final WarningPins.Pin pin; final Object callout;
            Shown(WarningPins.Pin pin, Object callout) { this.pin = pin; this.callout = callout; }
        }
        private static final class Posted {
            final WarningPins.Pin pin; final long at;
            Posted(WarningPins.Pin pin, long at) { this.pin = pin; this.at = at; }
        }

        /** A new owner (subscribed): every pin goes out again at once, for it. */
        void start(Object owner) { owners.putIfAbsent(owner, new LinkedHashMap<>()); posted.clear(); }

        /** Maps removed all of [owner]'s callouts itself. */
        void cleared(Object owner) {
            Map<String, Shown> shown = owners.get(owner);
            if (shown != null) shown.clear();
            posted.clear();
        }

        void stop(Object owner) { owners.remove(owner); }

        boolean hasOwners() { return !owners.isEmpty(); }

        int shown(Object owner) { Map<String, Shown> s = owners.get(owner); return s == null ? 0 : s.size(); }

        /** Make every owner show exactly [pins] (keyed; the order is irrelevant) at [now]. */
        Actions sync(Collection<WarningPins.Pin> pins, long now) {
            wanted.clear();
            for (WarningPins.Pin pin : pins) wanted.put(pin.key, pin);
            Actions out = new Actions();
            for (Map.Entry<Object, Map<String, Shown>> owner : owners.entrySet()) {
                for (Iterator<Map.Entry<String, Shown>> it = owner.getValue().entrySet().iterator(); it.hasNext(); ) {
                    Map.Entry<String, Shown> entry = it.next();
                    WarningPins.Pin want = wanted.get(entry.getKey());
                    if (want != null && same(want, entry.getValue().pin)) continue;
                    it.remove();
                    out.drops.add(new Object[]{owner.getKey(), entry.getValue().callout});
                }
            }
            posted.keySet().retainAll(wanted.keySet());
            if (owners.isEmpty()) return out;
            for (WarningPins.Pin pin : wanted.values()) {
                boolean missing = false;
                for (Map<String, Shown> shown : owners.values()) if (!shown.containsKey(pin.key)) { missing = true; break; }
                if (!missing) continue;
                Posted last = posted.get(pin.key);
                if (last != null && same(pin, last.pin) && now >= last.at && now - last.at < REPOST_MS) continue;
                posted.put(pin.key, new Posted(pin, now));
                out.posts.add(pin);
            }
            return out;
        }

        /**
         * [owner] drew [callout] for the post of [pin]. Kept when that pin is still wanted as posted and the
         * owner has none for it yet; otherwise it is to be removed again (returned true).
         */
        boolean added(Object owner, WarningPins.Pin pin, Object callout) {
            Map<String, Shown> shown = owners.get(owner);
            WarningPins.Pin want = wanted.get(pin.key);
            if (shown == null || want == null || !same(want, pin) || shown.containsKey(pin.key)) return true;
            shown.put(pin.key, new Shown(pin, callout));
            return false;
        }
    }

    /** Whether a shown callout still draws [want]: same place and icon (no text is drawn). */
    static boolean same(WarningPins.Pin want, WarningPins.Pin drawn) {
        return want.icon.equals(drawn.icon) && Double.compare(want.lat, drawn.lat) == 0 && Double.compare(want.lng, drawn.lng) == 0;
    }

    /** The pins to show: only while navigating with WARNINGS_V1 warnings. */
    static List<WarningPins.Pin> wanted(boolean navigating, boolean pinMode, List<WarningPins.Pin> pins) {
        if (!navigating || !pinMode || pins == null) return Collections.emptyList();
        return pins;
    }

    /** Google's incident type closest to each of our icons (the event's type; ours draw our own icon). */
    static String type(String icon) {
        switch (icon) {
            case "speed_trap": case "speed_trap_hotspot": return "MOBILE_SPEED_CAMERA";
            case "speed_camera": return "SPEED_CAMERA";
            case "average_speed": return "SPEED_CAMERA_ZONE";
            case "traffic_jam": return "JAM";
            case "roadworks": return "CONSTRUCTION";
            case "emergency": return "POLICE_PRESENCE";
            case "bridge": return "ROAD_CLOSURE";
            case "matrix": return "LANE_CLOSURE";
            // incident, poor_road, animals, and the kinds Google has no type for.
            default: return "OBJECT_ON_ROAD";
        }
    }
    /** Every type type() returns: the patch checks Maps still has each. */
    static final String[] TYPES = {"MOBILE_SPEED_CAMERA", "SPEED_CAMERA", "SPEED_CAMERA_ZONE", "JAM", "CONSTRUCTION",
        "POLICE_PRESENCE", "ROAD_CLOSURE", "LANE_CLOSURE", "OBJECT_ON_ROAD"};

    // ---- The live owners -------------------------------------------------------------------------

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Book book = new Book();
    /** Main thread only: the bus of each started owner. */
    private static final Map<Object, Object> buses = new IdentityHashMap<>();
    /** Our posts not yet drawn everywhere, by identity: the pin each carries and when it went out. */
    private static final Map<Object, WarningPins.Pin> ours = new IdentityHashMap<>();
    private static final Map<Object, Long> oursAt = new IdentityHashMap<>();
    private static final WarningPins.Throttle throttle = new WarningPins.Throttle(WarningPins.MIN_REDRAW_MS);
    private static boolean pending;
    private static List<WarningPins.Pin> last = Collections.emptyList();
    /** Read by Maps' label thread: whether these callouts draw the warning pins now. */
    private static volatile boolean drawing;
    private static final Map<String, Drawable> icons = new HashMap<>();
    private static boolean loggedFailure;

    /** Whether the warning pins are drawn as incident callouts now (the labels then leave them out). */
    static boolean drawing() { return drawing; }

    /** From ExternalTelemetry with every telemetry update: syncs when what should show changed. */
    static void update(boolean navigating, boolean pinMode, List<WarningPins.Pin> pins) {
        List<WarningPins.Pin> next = wanted(navigating, pinMode, pins);
        main.post(() -> {
            if (next.equals(last)) return;
            last = next;
            refresh();
        });
    }

    /** Coalesced, at most once a second. */
    static void refresh() {
        main.post(() -> {
            if (pending) return;
            pending = true;
            main.postDelayed(IncidentPins::syncNow, throttle.delay(SystemClock.elapsedRealtime()));
        });
    }

    private static void syncNow() {
        pending = false;
        long now = SystemClock.elapsedRealtime();
        throttle.ran(now);
        // A post an owner never drew (it was not subscribed yet) is forgotten after a while.
        synchronized (ours) {
            for (Iterator<Map.Entry<Object, Long>> it = oursAt.entrySet().iterator(); it.hasNext(); ) {
                Map.Entry<Object, Long> entry = it.next();
                if (now - entry.getValue() > 2 * REPOST_MS) { ours.remove(entry.getKey()); it.remove(); }
            }
        }
        boolean was = drawing;
        drawing = !last.isEmpty() && book.hasOwners();
        if (was != drawing) SavedOnMap.refresh();
        Actions actions = book.sync(last, now);
        apply(actions, now);
    }

    private static void apply(Actions actions, long now) {
        try {
            for (Object[] drop : actions.drops) uaDrop(drop[0], drop[1]);
            if (actions.posts.isEmpty() || buses.isEmpty()) return;
            Context context = Shapes.appContext();
            if (context == null) return;
            Object bus = buses.values().iterator().next();
            for (WarningPins.Pin pin : actions.posts) {
                Drawable icon = icon(context, pin.icon);
                if (icon == null) continue;
                // Recorded before it is posted: the bus runs the handler during the post, and the handler
                // asks ours(event) and hands the callout over right then (acc30).
                Object event = uaEvent(icon, pin.lat, pin.lng, type(pin.icon));
                if (event == null) continue;
                synchronized (ours) { ours.put(event, pin); oursAt.put(event, now); }
                uaSend(bus, event);
            }
        } catch (Throwable error) {
            if (!loggedFailure) { loggedFailure = true; android.util.Log.w("UA", "incident callouts unavailable", error); }
        }
    }

    /** From the end of the owner's start (it subscribed on [bus]). */
    public static void start(Object owner, Object bus) {
        if (owner == null || bus == null) return;
        onMain(() -> { book.start(owner); buses.put(owner, bus); refresh(); });
    }

    /** From the start of the owner's clear-all: Maps removes all its callouts itself. */
    public static void cleared(Object owner) {
        onMain(() -> { book.cleared(owner); refresh(); });
    }

    /** From the start of the owner's stop: it unsubscribes and clears everything. */
    public static void stop(Object owner) {
        onMain(() -> { book.stop(owner); buses.remove(owner); refresh(); });
    }

    /** From the incident handler, for its legend-sprite flag: never for our own events. */
    public static boolean ours(Object event) {
        synchronized (ours) { return ours.containsKey(event); }
    }

    /** The event and owner of the incident handler now running (it runs on the UI thread, one at a time). */
    private static Object handlingEvent, handlingOwner;

    /** From the incident handler's entry, while its event parameter still holds the event. */
    public static void handling(Object event) { handlingEvent = event; handlingOwner = null; }

    /** From the incident handler's entry, after {@link #handling}: the owner it draws on. */
    public static void handlingOwner(Object owner) { handlingOwner = owner; }

    /** From just before the handler returns, once it drew [callout] for the event recorded at its entry. */
    public static void handed(Object callout) {
        Object event = handlingEvent, owner = handlingOwner;
        handlingEvent = null; handlingOwner = null;
        if (event != null && callout != null && owner != null) added(event, callout, owner);
    }

    static boolean handOverPending() { return handlingEvent != null || handlingOwner != null; }

    /** Once [owner] drew [callout] for [event]. On the UI thread. */
    public static void added(Object event, Object callout, Object owner) {
        WarningPins.Pin pin;
        synchronized (ours) { pin = ours.get(event); }
        if (pin == null) return;   // Google's own report
        onMain(() -> {
            try {
                if (book.added(owner, pin, callout)) uaDrop(owner, callout);
            } catch (Throwable error) {
                if (!loggedFailure) { loggedFailure = true; android.util.Log.w("UA", "incident callouts unavailable", error); }
            }
        });
    }

    private static void onMain(Runnable change) {
        if (Looper.myLooper() == Looper.getMainLooper()) change.run(); else main.post(change);
    }

    /** The pill's own 256px artwork for [key] ("incident" when it has none), at ICON_DP. */
    static Drawable icon(Context context, String key) {
        Drawable cached = icons.get(key);
        if (cached != null) return cached;
        int pixels = Math.max(16, Math.round(ICON_DP * context.getResources().getDisplayMetrics().density));
        Bitmap image = decode(context, key, pixels);
        if (image == null && !"incident".equals(key)) image = decode(context, "incident", pixels);
        if (image == null) return null;
        // Maps draws the drawable into its own bitmap; this one is kept for the next post.
        Drawable drawable = new BitmapDrawable(context.getResources(), image);
        icons.put(key, drawable);
        return drawable;
    }

    static Bitmap decode(Context context, String key, int pixels) {
        String asset = ICON_ASSETS + key + ".png";
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            try (InputStream input = context.getAssets().open(asset)) { BitmapFactory.decodeStream(input, null, options); }
            options.inSampleSize = 1;
            while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > pixels * 2) options.inSampleSize *= 2;
            options.inJustDecodeBounds = false;
            Bitmap image;
            try (InputStream input = context.getAssets().open(asset)) { image = BitmapFactory.decodeStream(input, null, options); }
            if (image == null) return null;
            if (image.getWidth() == pixels && image.getHeight() == pixels) return image;
            Bitmap scaled = Bitmap.createScaledBitmap(image, pixels, pixels, true);
            if (scaled != image) image.recycle();
            return scaled;
        } catch (IOException | RuntimeException unavailable) {
            return null;
        }
    }

    /**
     * Rewritten by the patch: a new incident report callout event showing [icon] at [lat],[lng] with
     * Google's incident [type], without text, not posted yet. Null without the patch.
     */
    static Object uaEvent(Drawable icon, double lat, double lng, String type) { return null; }

    /** Rewritten by the patch: posts [event] on Maps' [bus]; Maps' handler runs during the call. */
    static void uaSend(Object bus, Object event) {}

    /** Rewritten by the patch: removes [callout] from [owner]'s callouts. */
    static void uaDrop(Object owner, Object callout) {}
}
