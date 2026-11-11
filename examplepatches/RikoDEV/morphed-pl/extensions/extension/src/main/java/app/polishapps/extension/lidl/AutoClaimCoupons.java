package app.polishapps.extension.lidl;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Activates every plain coupon as soon as the Lidl Plus coupon list has loaded.
 *
 * Nothing is sent from here. Each coupon goes through the app's own activation entry point, the
 * presenter function behind the "Activate" button, so the request, headers, authentication and
 * success handling are exactly what a tap would produce. Coupons that need an article choice
 * (selection groups) or are locked behind a level are left alone, as are coupons already active.
 *
 * The patch hands over the obfuscated member names through {@link #config()}.
 */
@SuppressWarnings("unused")
public final class AutoClaimCoupons {

    private static final String TAG = "AutoClaimCoupons";

    /** Activation attempts per coupon id for the lifetime of the process. */
    private static final int MAX_ATTEMPTS = 3;
    /** The presenter ignores a request while the previous activation job is still running. */
    private static final long RETRY_MS = 1800;
    private static final long TICK_MS = 400;
    /** Errors of automatic attempts are silenced for this long after the queue drains. */
    private static final long QUIET_MS = 6000;
    /** Give up when this many coupons in a row used up their attempts without activating. */
    private static final int MAX_STALLED = 6;
    /** Give up when the presenter's list could not be read this many ticks in a row. */
    private static final int MAX_UNREADABLE = 25;

    /** Flags value the app passes for a plain tap: no feedback dialog, empty article selection. */
    private static final int PLAIN_TAP_FLAGS = 12;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Only touched on the main thread. */
    private static final Map<String, Pending> pending = new LinkedHashMap<>();
    private static final Map<String, Integer> attempts = new HashMap<>();
    private static Object presenter;
    private static int stalled;
    private static int unreadable;
    private static boolean ticking;
    /** Outcome of the current run, reported by a toast when it ends. */
    private static int started;
    private static int activated;
    private static int failed;

    private static volatile boolean running;
    private static volatile long quietUntil;

    private static Settings settings;

    private AutoClaimCoupons() {
    }

    /**
     * Replaced by the patch with a comma separated list:
     * activate method, list field, id, location, activated, processing, groups, levels, locked.
     */
    private static String config() {
        return "";
    }

    private static final class Settings {
        final String activateMethod;
        final String listField;
        final String id;
        final String location;
        final String activated;
        final String processing;
        final String groups;
        final String levels;
        final String locked;

        Settings(String[] parts) {
            activateMethod = parts[0];
            listField = parts[1];
            id = parts[2];
            location = parts[3];
            activated = parts[4];
            processing = parts[5];
            groups = parts[6];
            levels = parts[7];
            locked = parts[8];
        }
    }

    private static final class Pending {
        final String location;
        long lastCall;

        Pending(String location) {
            this.location = location;
        }
    }

    private static Settings settings() {
        if (settings == null) {
            String[] parts = config().split(",");
            if (parts.length != 9) {
                throw new IllegalStateException("AutoClaimCoupons is not configured");
            }
            settings = new Settings(parts);
        }
        return settings;
    }

    /**
     * Called by the patched coupon list loader right after the list was filled.
     *
     * @param presenterObject the coupon list presenter
     * @param items           its current list of coupons
     */
    public static void onCouponsLoaded(Object presenterObject, List<?> items) {
        try {
            if (presenterObject == null || items == null) {
                return;
            }
            Settings s = settings();
            List<Object> snapshot = new ArrayList<>(items);
            List<String[]> eligible = new ArrayList<>();
            for (Object item : snapshot) {
                String[] claim = eligibleClaim(s, item);
                if (claim != null) {
                    eligible.add(claim);
                }
            }
            if (eligible.isEmpty()) {
                return;
            }
            MAIN.post(() -> enqueue(presenterObject, eligible));
        } catch (Throwable t) {
            // The next list load retries. Never let a failure reach the app's coroutine.
            Log.w(TAG, "Could not read the coupon list", t);
        }
    }

    /** True while automatic activations run, so the app does not show an error for each refusal. */
    public static boolean suppressErrors() {
        return running || SystemClock.uptimeMillis() < quietUntil;
    }

    private static String[] eligibleClaim(Settings s, Object item) throws Exception {
        if (item == null || flag(item, s.activated) || flag(item, s.processing)) {
            return null;
        }
        Object groups = get(item, s.groups);
        if (groups instanceof List && !((List<?>) groups).isEmpty()) {
            return null;
        }
        Object levels = get(item, s.levels);
        if (levels != null && flag(levels, s.locked)) {
            return null;
        }
        Object id = get(item, s.id);
        Object location = get(item, s.location);
        if (!(id instanceof String) || !(location instanceof String)) {
            return null;
        }
        return new String[] {(String) id, (String) location};
    }

    private static void enqueue(Object presenterObject, List<String[]> eligible) {
        presenter = presenterObject;
        for (String[] claim : eligible) {
            Integer used = attempts.get(claim[0]);
            if (used != null && used >= MAX_ATTEMPTS) {
                continue;
            }
            if (!pending.containsKey(claim[0])) {
                pending.put(claim[0], new Pending(claim[1]));
            }
        }
        if (!pending.isEmpty()) {
            running = true;
            if (!ticking) {
                ticking = true;
                stalled = 0;
                unreadable = 0;
                // Count only this run, the previous one may have left numbers behind.
                started = pending.size();
                activated = 0;
                failed = 0;
                toast(text("Aktywuję kupony: " + started, "Activating coupons: " + started));
                MAIN.postDelayed(AutoClaimCoupons::tick, TICK_MS);
            }
        }
    }

    private static void tick() {
        try {
            step();
        } catch (Throwable t) {
            Log.w(TAG, "Stopping automatic coupon activation", t);
            pending.clear();
        }
        if (pending.isEmpty()) {
            ticking = false;
            running = false;
            quietUntil = SystemClock.uptimeMillis() + QUIET_MS;
            reportResult();
        } else {
            MAIN.postDelayed(AutoClaimCoupons::tick, TICK_MS);
        }
    }

    private static void step() throws Exception {
        Settings s = settings();
        Object owner = presenter;
        if (owner == null) {
            pending.clear();
            return;
        }

        Map<String, Object> current = currentItems(s, owner);
        if (current == null) {
            if (++unreadable >= MAX_UNREADABLE) {
                Log.w(TAG, "The coupon list could not be read, giving up");
                pending.clear();
            }
            return;
        }
        unreadable = 0;

        for (Iterator<Map.Entry<String, Pending>> it = pending.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<String, Pending> entry = it.next();
            Object item = current.get(entry.getKey());
            if (item == null) {
                it.remove();
            } else if (flag(item, s.activated)) {
                stalled = 0;
                activated++;
                it.remove();
            }
        }

        long now = SystemClock.uptimeMillis();
        for (Iterator<Map.Entry<String, Pending>> it = pending.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<String, Pending> entry = it.next();
            String id = entry.getKey();
            Pending claim = entry.getValue();
            Integer used = attempts.get(id);
            int count = used == null ? 0 : used;
            if (count >= MAX_ATTEMPTS) {
                it.remove();
                stalled++;
                failed++;
                continue;
            }
            if (now - claim.lastCall < RETRY_MS) {
                continue;
            }
            claim.lastCall = now;
            attempts.put(id, count + 1);
            activate(s, owner, id, claim.location);
            break;
        }

        if (stalled >= MAX_STALLED) {
            Log.w(TAG, "Giving up, " + stalled + " coupons could not be activated");
            failed += pending.size();
            pending.clear();
        }
    }

    private static void reportResult() {
        if (activated == 0 && failed == 0) {
            return;
        }
        String pl = "Aktywowane kupony: " + activated + (failed > 0 ? ", nieudane: " + failed : "");
        String en = "Coupons activated: " + activated + (failed > 0 ? ", failed: " + failed : "");
        toast(text(pl, en));
    }

    private static String text(String polish, String english) {
        return "pl".equals(Locale.getDefault().getLanguage()) ? polish : english;
    }

    /** Shows a short toast. A missing application context only means no toast, never a failure. */
    private static void toast(String message) {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app != null) {
                Toast.makeText(app, message, Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not show a toast", t);
        }
    }

    private static Map<String, Object> currentItems(Settings s, Object owner) {
        try {
            Object value = get(owner, s.listField);
            if (!(value instanceof List)) {
                return null;
            }
            Map<String, Object> byId = new HashMap<>();
            for (Object item : new ArrayList<>((List<?>) value)) {
                Object id = item == null ? null : get(item, s.id);
                if (id instanceof String) {
                    byId.put((String) id, item);
                }
            }
            return byId;
        } catch (Exception e) {
            // The list is being rewritten by a reload. Look again on the next tick.
            return null;
        }
    }

    private static void activate(Settings s, Object owner, String id, String location) throws Exception {
        Class<?> type = owner.getClass();
        Method method = type.getDeclaredMethod(
                s.activateMethod, type, String.class, String.class, ArrayList.class, int.class);
        method.setAccessible(true);
        method.invoke(null, owner, id, location, null, PLAIN_TAP_FLAGS);
    }

    private static Object get(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private static boolean flag(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getBoolean(target);
    }
}
