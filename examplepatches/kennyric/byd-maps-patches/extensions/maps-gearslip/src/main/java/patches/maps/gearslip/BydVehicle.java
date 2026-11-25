package patches.maps.gearslip;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Reads the vehicle's state of charge and remaining range from byd-open-remote and hands them to
 * {@link BydEtaText} for the navigation card's status line.
 *
 * <p>The UI path never blocks: {@link #decorate} reads a cache only. The cache is filled by the
 * provider's change broadcast, and an asynchronous query refills it when it goes stale. Data older
 * than {@link #MAX_AGE_MS} is treated as unknown and renders nothing, so a car parked overnight
 * never shows yesterday's range.
 */
public final class BydVehicle {
    private static final String TAG = "BydVehicle";
    public static final String AUTHORITY = "com.bydopenremote.app.vehicle";
    public static final String ACTION_STATUS_CHANGED = "com.bydopenremote.app.action.VEHICLE_STATUS_CHANGED";
    public static final String PERMISSION = "com.bydopenremote.app.permission.READ_VEHICLE";
    /** Built on demand: {@code Uri.parse} is an Android stub and throws in plain JVM tests. */
    static Uri statusUri() {
        return Uri.parse("content://" + AUTHORITY + "/status");
    }
    static final String COLUMN_SOC = "soc";
    static final String COLUMN_RANGE = "range_km";
    static final String COLUMN_TS = "ts";
    static final String COLUMN_UNIT = "distance_unit";
    static final long MAX_AGE_MS = 15L * 60L * 1000L;

    private static final AtomicBoolean ATTACHED = new AtomicBoolean();
    /**
     * TEMPORARY: renders fixed values so the display path can be verified before byd-open-remote
     * publishes the provider. False in every real build; flipped only for a demo APK.
     */
    static boolean DEMO = false;
    private static final ExecutorService QUERIES = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "byd-vehicle");
        thread.setDaemon(true);
        return thread;
    });

    private static volatile int soc = -1;
    private static volatile int rangeKm = -1;
    private static volatile long timestamp;
    private static volatile String unit = "km";
    private static volatile long lastQueryAt;
    /** After a missing provider or an empty row, do not retry before this moment. */
    private static volatile long nextQueryAt;
    /** Remaining route distance in kilometres, -1 when the navigation strip could not be read. */
    private static volatile double remainingKm = -1;
    /** Distance driven since the last reading the app could confirm, capped for sanity. */
    private static volatile double travelledKm;
    private static volatile double lastRemainingForTrip = -1;
    private static final double MAX_TRAVELLED_KM = 500d;
    /** Maps' own car surface, set by the projection renderer while a host is attached. */
    private static volatile WeakReference<View> carSurface;

    private BydVehicle() {
    }

    /** The status line with the arrival battery, or the original when nothing fresh is known. */
    public static String decorate(String original) {
        if (!ATTACHED.get()) attach(appContext());
        Context context = appContext();
        if (!showEstimate(context)) return original;
        if (!DEMO && !fresh(timestamp, System.currentTimeMillis())) return original;
        int charge = DEMO ? 62 : soc;
        int range = DEMO ? 310 : rangeKm;
        String rangeUnit = DEMO ? "km" : unit;
        double rangeInKm = BydEtaText.kilometres(range, rangeUnit);
        int arrival = rangeInKm > 0
                ? BydEtaText.arrivalPercent(charge, (int) Math.round(rangeInKm), remainingKm)
                : -1;
        return BydEtaText.withArrival(original, charge, arrival);
    }

    /** Remaining route distance, in kilometres, as last read from the navigation strip. */
    static void setRemainingKm(double value) {
        if (!Double.isFinite(value) || value < 0) return;
        remainingKm = value;
        double previous = lastRemainingForTrip;
        if (previous >= 0 && value <= previous) {
            travelledKm = Math.min(MAX_TRAVELLED_KM, travelledKm + (previous - value));
        } else if (previous >= 0) {
            // Remaining distance grew: a reroute or a new trip. Old progress no longer applies.
            travelledKm = 0;
        }
        lastRemainingForTrip = value;
    }

    /** Distance driven since the last confirmed reading; sent to the app with every refresh. */
    static double travelledKm() {
        return travelledKm;
    }

    /**
     * Maps has no Context at the card binder, and this hook must not depend on a separate startup
     * patch. {@code ActivityThread.currentApplication()} is the process-wide Application.
     */
    private static Context appContext() {
        try {
            Class<?> thread = Class.forName("android.app.ActivityThread");
            Object application = thread.getMethod("currentApplication").invoke(null);
            return application instanceof Context ? (Context) application : null;
        } catch (Throwable unavailable) {
            return null;
        }
    }

    /** True when {@code ts} is recent enough to show; seconds are tolerated for old payloads. */
    static boolean fresh(long ts, long now) {
        if (ts <= 0) return false;
        long millis = ts < 100_000_000_000L ? ts * 1000L : ts;
        return now - millis <= MAX_AGE_MS;
    }

    /** Validates and caches one reading; out-of-range values are ignored rather than shown. */
    static void onStatus(int socPercent, int rangeKmValue, long ts, String distanceUnit) {
        if (socPercent < -1 || socPercent > 100) return;
        if (rangeKmValue < -1) return;
        if (ts <= 0) return;
        soc = socPercent;
        rangeKm = rangeKmValue;
        timestamp = ts;
        unit = distanceUnit == null || distanceUnit.isEmpty() ? "km" : distanceUnit;
    }

    /** Registers the change receiver once; safe to call from any thread and any number of times. */
    public static void attach(Context context) {
        if (context == null || !ATTACHED.compareAndSet(false, true)) return;
        try {
            Context app = context.getApplicationContext();
            if (app == null) app = context;
            IntentFilter filter = new IntentFilter(ACTION_STATUS_CHANGED);
            if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(RECEIVER, filter, Context.RECEIVER_EXPORTED);
            else app.registerReceiver(RECEIVER, filter);
            if (app instanceof android.app.Application) {
                ((android.app.Application) app).registerActivityLifecycleCallbacks(LIFECYCLE);
            }
            mainHandler = new Handler(Looper.getMainLooper());
            mainHandler.post(TICK);
            // One line that answers "which Maps build am I running?" without guessing.
            Log.i(TAG, "build=" + (DEMO ? "demo" : "real") + " demo=" + DEMO);
            refresh(app);
        } catch (RuntimeException denied) {
            // A missing permission or an unsupported registration must not affect Maps at all.
            Log.w(TAG, "Vehicle status receiver unavailable", denied);
        }
    }

    private static volatile Handler mainHandler;
    private static volatile WeakReference<android.app.Activity> resumed;
    /** The suffix currently painted, so a view Maps repaints can be re-decorated without doubling it. */
    private static volatile String appliedSuffix = "";

    private static final android.app.Application.ActivityLifecycleCallbacks LIFECYCLE =
            new android.app.Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityResumed(android.app.Activity activity) {
                    resumed = new WeakReference<>(activity);
                }

                @Override public void onActivityPaused(android.app.Activity activity) {
                    WeakReference<android.app.Activity> current = resumed;
                    if (current != null && current.get() == activity) resumed = null;
                }

                @Override public void onActivityCreated(android.app.Activity activity, android.os.Bundle state) { }

                @Override public void onActivityStarted(android.app.Activity activity) { }

                @Override public void onActivityStopped(android.app.Activity activity) { }

                @Override public void onActivitySaveInstanceState(android.app.Activity activity, android.os.Bundle state) { }

                @Override public void onActivityDestroyed(android.app.Activity activity) { }
            };

    /**
     * The phone's own navigation strip ("18 min" / "15 mi · 4:54 AM") is a plain TextView that Maps
     * rewrites every second, so it is decorated on a timer rather than at a call site. The car UI
     * uses the turn card and needs none of this.
     */
    private static final Runnable TICK = new Runnable() {
        @Override public void run() {
            try {
                WeakReference<android.app.Activity> current = resumed;
                android.app.Activity activity = current == null ? null : current.get();
                if (activity != null) paint(activity);
                WeakReference<View> car = carSurface;
                View surface = car == null ? null : car.get();
                if (surface != null) paintCar(surface);
                maybePoke();
            } catch (RuntimeException ignored) {
                // Never let the decoration affect Maps' own rendering.
            } finally {
                Handler handler = mainHandler;
                // 700 ms: Maps repaints the ETA card on its own schedule, so a slower tick leaves a
                // visible gap where its text wins. The work per tick is a small view-tree walk.
                if (handler != null) handler.postDelayed(this, 700L);
            }
        }
    };

    /** Registers the car surface; the renderer calls this when the host has one. */
    public static void setCarSurface(View surface) {
        carSurface = surface == null ? null : new WeakReference<>(surface);
        paintCar(surface);
    }

    public static void clearCarSurface() {
        carSurface = null;
        lastCarSubApplied = "";
        TextView chip = carChip == null ? null : carChip.get();
        if (chip != null && chip.getParent() instanceof android.view.ViewGroup) {
            ((android.view.ViewGroup) chip.getParent()).removeView(chip);
        }
        carChip = null;
    }

    private static volatile String lastCarSubApplied = "";
    private static volatile WeakReference<TextView> carChip;
    private static final java.util.WeakHashMap<TextView, String> CLIPPED_INLINE = new java.util.WeakHashMap<>();
    private static final java.util.regex.Pattern TIME_PATTERN = java.util.regex.Pattern.compile("[0-9]{1,2}:[0-9]{2}");

    private static void paintCar(View root) {
        if (!showEstimate(root.getContext())) {
            hideChip();
            lastCarSubApplied = "";
            return;
        }
        if (!(root instanceof android.view.ViewGroup)) {
            hideChip();
            return;
        }
        TextView duration = findEtaInBottomCard(root);
        if (duration == null) {
            hideChip();
            return;
        }
        onNavigationFrame(root.getContext());
        double distance = siblingDistanceKm(duration);
        if (distance >= 0) setRemainingKm(distance);
        if (!DEMO && !fresh(timestamp, System.currentTimeMillis())) refresh(root.getContext());
        int level = chargeLevel();
        if (level < 0) {
            hideChip();
            return;
        }
        CharSequence badge = badgeText(level);
        TextView arrivalLine = findEtaArrivalTimeView(duration);
        String blockedKey = arrivalLine == null ? null : cardWidthKey(root, arrivalLine, badge.toString());
        if (arrivalLine != null
                && !blockedKey.equals(CLIPPED_INLINE.get(arrivalLine))
                && fitsInline(root, arrivalLine, SUFFIX_TAIL + badge)) {
            allowInlineGrowth(root, arrivalLine);
            hideChip();
            lastCarSubApplied = appendInlineBadge(arrivalLine, badge, lastCarSubApplied);
            android.text.Layout layout = arrivalLine.getLayout();
            int innerW = arrivalLine.getWidth() - arrivalLine.getPaddingLeft() - arrivalLine.getPaddingRight();
            if (layout != null && innerW > 0
                    && (layout.getEllipsisCount(0) > 0 || layout.getLineWidth(0) > innerW + 1f)) {
                // Remember that this width+badge clipped so we don't oscillate back and forth.
                CLIPPED_INLINE.put(arrivalLine, blockedKey);
                stripInlineBadge(arrivalLine);
                lastCarSubApplied = "";
                showChip(root, duration, badge);
            }
        } else {
            if (arrivalLine != null) stripInlineBadge(arrivalLine);
            lastCarSubApplied = "";
            showChip(root, duration, badge);
        }
    }

    private static String cardWidthKey(View root, TextView target, String badge) {
        return root.getWidth() + ":" + target.getWidth() + ":" + badge;
    }

    /** Arrival charge only, e.g. "57%". The native automotive card also carries the battery icon. */
    static CharSequence badgeText(int level) {
        return level < 0 ? "" : level + "%";
    }

    /** The Customization screen's "BYD battery estimate" switch. Default on. */
    static boolean showEstimate(Context context) {
        if (showEstimateOverride != null) return showEstimateOverride;
        if (context == null) context = appContext();
        if (context == null) return true;
        try {
            return context.getSharedPreferences(PREFS, android.content.Context.MODE_PRIVATE)
                    .getBoolean(PREF_SHOW_ESTIMATE, true);
        } catch (RuntimeException unreadable) {
            return true;
        }
    }

    private static void allowInlineGrowth(View root, TextView target) {
        target.setMaxWidth(Integer.MAX_VALUE);
        android.view.ViewGroup.LayoutParams lp = target.getLayoutParams();
        if (lp != null && lp.width > 0) {
            lp.width = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
            target.setLayoutParams(lp);
        }
        if (target.getParent() instanceof View && target.getParent() != root) {
            View parent = (View) target.getParent();
            android.view.ViewGroup.LayoutParams plp = parent.getLayoutParams();
            if (plp != null && plp.width > 0) {
                plp.width = android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
                parent.setLayoutParams(plp);
            }
        }
    }

    private static void showChip(View root, TextView duration, CharSequence badge) {
        TextView chip = ensureChip((android.view.ViewGroup) root, duration);
        if (!android.text.TextUtils.equals(badge, chip.getText())) chip.setText(badge);
        styleChip(chip, duration, root.getResources().getDisplayMetrics().density);
        chip.setVisibility(View.VISIBLE);
        placeChip(chip, duration, root);
    }

    private static boolean fitsInline(View root, TextView target, CharSequence suffix) {
        CharSequence raw = target.getText();
        if (raw == null) return false;
        String text = raw.toString();
        int sep = text.indexOf(SUFFIX_TAIL);
        String base = sep >= 0 ? text.substring(0, sep) : text;
        float needed = target.getPaint().measureText(base + suffix.toString());
        // Walk up to the ETA card container (the widest ancestor narrower than the full car surface)
        // so wrap_content inner rows don't under-report available width.
        View card = target;
        View p = target.getParent() instanceof View ? (View) target.getParent() : null;
        int rootW = root.getWidth();
        for (int i = 0; i < 4 && p != null && p != root; i++) {
            if (p.getWidth() > card.getWidth() && (rootW <= 0 || p.getWidth() < rootW * 0.85f)) {
                card = p;
            }
            p = p.getParent() instanceof View ? (View) p.getParent() : null;
        }
        int[] cardAt = new int[2];
        int[] targetAt = new int[2];
        card.getLocationInWindow(cardAt);
        target.getLocationInWindow(targetAt);
        int leftOffset = Math.max(0, targetAt[0] - cardAt[0]);
        int available = card.getWidth() - leftOffset - card.getPaddingRight() - target.getPaddingLeft() - target.getPaddingRight();
        float marginPx = 24f * target.getResources().getDisplayMetrics().density;
        return available > 0 && needed + marginPx <= available;
    }

    private static void stripInlineBadge(TextView target) {
        CharSequence raw = target.getText();
        if (raw == null) return;
        String text = raw.toString();
        int sep = text.indexOf(SUFFIX_TAIL);
        if (sep < 0) return;
        reapplying = true;
        try {
            target.setText(raw.subSequence(0, sep), TextView.BufferType.SPANNABLE);
        } finally {
            reapplying = false;
        }
    }

    private static final java.util.WeakHashMap<TextView, Boolean> WATCHED = new java.util.WeakHashMap<>();
    private static boolean reapplying;

    private static String appendInlineBadge(TextView target, CharSequence badge, String lastValue) {
        watchInlineTarget(target);
        CharSequence raw = target.getText();
        if (raw == null || raw.length() == 0) return lastValue;
        String text = raw.toString();
        int sep = text.indexOf(SUFFIX_TAIL);
        CharSequence base = sep >= 0 ? raw.subSequence(0, sep) : raw;
        String suffix = SUFFIX_TAIL + badge;
        String line = base.toString() + suffix;
        if (line.equals(text) && line.equals(lastValue)) return lastValue;
        android.text.SpannableStringBuilder ssb = new android.text.SpannableStringBuilder(base);
        ssb.append(SUFFIX_TAIL);
        ssb.append(badge);
        reapplying = true;
        try {
            target.setText(ssb, TextView.BufferType.SPANNABLE);
        } finally {
            reapplying = false;
        }
        return line;
    }

    /** Re-appends the battery suffix synchronously whenever Maps rewrites the TextView, avoiding flicker. */
    private static void watchInlineTarget(final TextView target) {
        if (WATCHED.containsKey(target)) return;
        WATCHED.put(target, Boolean.TRUE);
        target.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { }
            @Override public void afterTextChanged(android.text.Editable s) {
                if (reapplying || s == null || s.length() == 0) return;
                if (s.toString().contains(SUFFIX_TAIL)) return;
                int level = chargeLevel();
                if (level < 0) return;
                CharSequence badge = badgeText(level);
                View root = carSurface == null ? null : carSurface.get();
                if (root != null && !fitsInline(root, target, SUFFIX_TAIL + badge)) return;
                appendInlineBadge(target, badge, "");
            }
        });
    }

    private static TextView findEtaArrivalTimeView(TextView duration) {
        TextView chip = carChip == null ? null : carChip.get();
        View node = duration;
        for (int level = 0; level < 4 && node != null; level++) {
            android.view.ViewParent parent = node.getParent();
            if (!(parent instanceof android.view.ViewGroup)) break;
            TextView found = findTimeTextView((android.view.ViewGroup) parent, duration, chip, 2);
            if (found != null) return found;
            node = (View) parent;
        }
        return null;
    }

    private static TextView findTimeTextView(android.view.ViewGroup group, View duration, View chip, int depth) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child == duration || child == chip) continue;
            if (child instanceof TextView && child.isShown()) {
                CharSequence t = ((TextView) child).getText();
                if (t != null) {
                    String s = t.toString();
                    int sep = s.indexOf(SUFFIX_TAIL);
                    String base = sep >= 0 ? s.substring(0, sep) : s;
                    if (TIME_PATTERN.matcher(base).find()) return (TextView) child;
                }
            }
            if (depth > 0 && child instanceof android.view.ViewGroup) {
                TextView found = findTimeTextView((android.view.ViewGroup) child, duration, chip, depth - 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void hideChip() {
        TextView chip = carChip == null ? null : carChip.get();
        if (chip != null) chip.setVisibility(View.GONE);
    }

    private static void styleChip(TextView chip, TextView duration, float density) {
        int cardText = duration.getCurrentTextColor();
        CharSequence durText = duration.getText();
        if (durText instanceof android.text.Spanned) {
            android.text.style.ForegroundColorSpan[] spans = ((android.text.Spanned) durText)
                    .getSpans(0, durText.length(), android.text.style.ForegroundColorSpan.class);
            if (spans != null && spans.length > 0) {
                cardText = spans[0].getForegroundColor();
            }
        }
        double lum = (0.299 * ((cardText >> 16) & 0xFF)
                + 0.587 * ((cardText >> 8) & 0xFF)
                + 0.114 * (cardText & 0xFF)) / 255.0;
        boolean darkCard = lum > 0.5;
        android.graphics.drawable.GradientDrawable bg =
                chip.getBackground() instanceof android.graphics.drawable.GradientDrawable
                        ? (android.graphics.drawable.GradientDrawable) chip.getBackground()
                        : new android.graphics.drawable.GradientDrawable();
        bg.setCornerRadius(999f);
        if (darkCard) {
            bg.setColor(0xE6202124);
            bg.setStroke(Math.max(1, Math.round(density)), 0x33FFFFFF);
        } else {
            bg.setColor(0xF5FFFFFF);
            bg.setStroke(Math.max(1, Math.round(density)), 0x1F000000);
        }
        chip.setTextColor(cardText);
        chip.setBackground(bg);
    }

    private static TextView ensureChip(android.view.ViewGroup root, TextView card) {
        TextView chip = carChip == null ? null : carChip.get();
        float density = root.getResources().getDisplayMetrics().density;
        float textPx = Math.max(card.getTextSize() * 0.62f, 16f * density);
        if (chip != null && chip.getParent() == root) {
            if (Math.abs(chip.getTextSize() - textPx) > 0.5f) chip.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, textPx);
            return chip;
        }
        chip = new TextView(root.getContext());
        chip.setTextColor(card.getCurrentTextColor());
        chip.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, textPx);
        chip.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        chip.setGravity(android.view.Gravity.CENTER);
        int horizontal = Math.round(textPx * 0.65f), vertical = Math.round(textPx * 0.25f);
        chip.setPadding(horizontal, vertical, horizontal, vertical);
        chip.setElevation(4f * density);
        android.graphics.drawable.GradientDrawable background = new android.graphics.drawable.GradientDrawable();
        background.setCornerRadius(999f);
        chip.setBackground(background);
        try {
            root.addView(chip, new android.view.ViewGroup.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT,
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
        } catch (RuntimeException rejected) {
            Log.w(TAG, "Battery chip could not be added", rejected);
            return chip;
        }
        carChip = new WeakReference<>(chip);
        return chip;
    }

    private static void placeChip(TextView chip, TextView card, View root) {
        try {
            int[] cardAt = new int[2];
            int[] rootAt = new int[2];
            card.getLocationInWindow(cardAt);
            root.getLocationInWindow(rootAt);
            chip.measure(android.view.View.MeasureSpec.UNSPECIFIED, android.view.View.MeasureSpec.UNSPECIFIED);
            float gap = chip.getResources().getDisplayMetrics().density * 10f;
            float x = cardAt[0] - rootAt[0];
            float y = cardAt[1] - rootAt[1] - chip.getMeasuredHeight() - gap;
            chip.setTranslationX(Math.max(0, x));
            chip.setTranslationY(Math.max(0, y));
        } catch (RuntimeException unplaceable) {
            Log.w(TAG, "Battery chip could not be placed", unplaceable);
        }
    }

    /**
     * Finds the active-navigation ETA text in the bottom half of the car surface so search lists
     * and route-preview cards (which sit in the upper half) never get matched.
     */
    private static TextView findEtaInBottomCard(View root) {
        int height = root.getHeight();
        if (height <= 0) return null;
        int[] rootAt = new int[2];
        root.getLocationInWindow(rootAt);
        return findDurationBelow(root, rootAt[1] + Math.round(height * 0.55f));
    }

    private static TextView findDurationBelow(View view, int minWindowY) {
        if (view instanceof TextView && view.isShown()) {
            CharSequence text = ((TextView) view).getText();
            if (text != null) {
                String s = text.toString();
                int sep = s.indexOf(SUFFIX_TAIL);
                String base = sep >= 0 ? s.substring(0, sep) : s;
                if (looksLikeDuration(base)) {
                    int[] at = new int[2];
                    view.getLocationInWindow(at);
                    if (at[1] >= minWindowY) return (TextView) view;
                }
            }
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findDurationBelow(group.getChildAt(i), minWindowY);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** A line carrying a route duration ("19 min", "1 hr 12 min") and no charge of ours yet. */
    private static boolean looksLikeDuration(String value) {
        if (value.isEmpty() || value.contains(SUFFIX_TAIL)) return false;
        if (value.length() > 24) return false;
        String lower = value.toLowerCase(java.util.Locale.ROOT);
        if (!(lower.contains("min") || lower.contains("hr") || lower.contains("h "))) return false;
        for (int i = 0; i < lower.length(); i++) if (Character.isDigit(lower.charAt(i))) return true;
        return false;
    }

    private static final String SUFFIX_TAIL = " • ";

    /** How often Maps asks the app for fresher data; the app debounces independently. */
    /** Default refresh interval; the Customization screen ("BYD battery refresh") overrides it. */
    private static final int POKE_DEFAULT_MINUTES = 5;
    private static final String PREFS = "ungoogled_ui";
    private static final String PREF_REFRESH_MINUTES = "byd_refresh_minutes";
    /** Whether the patched storefront shows our arrival estimate at all. */
    private static final String PREF_SHOW_ESTIMATE = "byd_show_estimate";
    /** Null in production; tests pin the toggle without Android prefs. */
    static volatile Boolean showEstimateOverride;
    private static volatile long lastPokeAt;
    /** Last moment Maps showed its navigation UI; a poke is only allowed while this is fresh. */
    private static volatile long lastNavigationAt;

    /**
     * Asks byd-open-remote to refresh from the cloud. Without this the card can show nothing until
     * the app is opened by hand, because its own sync is on a long, user-configurable interval.
     */
    /** Marks navigation active and immediately triggers a fetch when navigation just started. */
    private static void onNavigationFrame(Context context) {
        long now = System.currentTimeMillis();
        boolean justStarted = lastNavigationAt == 0 || now - lastNavigationAt > NAVIGATION_WINDOW_MS;
        lastNavigationAt = now;
        if (justStarted) {
            // Fresh trip: only progress measured after this frame belongs to the next reading.
            travelledKm = 0;
            lastRemainingForTrip = remainingKm;
            poke(context, true);
        }
    }

    private static void maybePoke() {
        poke(appContext(), false);
    }

    private static void poke(Context context, boolean force) {
        if (!showEstimate(context)) return;
        long now = System.currentTimeMillis();
        // Only while navigating: browsing the map must never cost a cloud request.
        if (now - lastNavigationAt > NAVIGATION_WINDOW_MS) return;
        if (context == null) context = appContext();
        if (context == null) return;
        int minutes;
        try {
            minutes = context.getSharedPreferences(PREFS, android.content.Context.MODE_PRIVATE)
                    .getInt(PREF_REFRESH_MINUTES, POKE_DEFAULT_MINUTES);
        } catch (RuntimeException unreadable) {
            minutes = POKE_DEFAULT_MINUTES;
        }
        if (minutes <= 0) return;
        // First poke of a trip (or when navigation just started) is immediate.
        if (!force && lastPokeAt != 0 && now - lastPokeAt < minutes * 60_000L) return;
        lastPokeAt = now;
        final double distance = travelledKm;
        final Context app = context.getApplicationContext() != null
                ? context.getApplicationContext() : context;
        try {
            // Off the UI thread: the call may start byd-open-remote's process on a cold start.
            QUERIES.execute(() -> {
                if (!askForRefresh(app, distance)) return;
                // The app has the gap; a new reading (or its estimate) anchors the next one.
                travelledKm = 0;
                lastRemainingForTrip = remainingKm;
                query(app);
            });
        } catch (RuntimeException rejected) {
            Log.w(TAG, "poke rejected", rejected);
        }
    }

    /**
     * Asks byd-open-remote for a refresh and hands it the distance driven since the last reading.
     * Uses {@code ContentResolver.call}, which identifies the caller on every Android version;
     * the broadcast fallback exists only for app builds that predate the distance extra.
     */
    private static boolean askForRefresh(Context context, double distanceKm) {
        try {
            android.os.Bundle extras = new android.os.Bundle();
            extras.putDouble("distance_km", distanceKm);
            android.os.Bundle reply = context.getContentResolver()
                    .call(statusUri(), "refresh", null, extras);
            if (reply != null && reply.getBoolean("requested", false)) {
                Log.i(TAG, "poke -> " + AUTHORITY_PACKAGE + " distance=" + distanceKm + "km");
                return true;
            }
        } catch (RuntimeException unavailable) {
            Log.w(TAG, "provider call failed, falling back to broadcast", unavailable);
        }
        try {
            android.content.Intent intent = new android.content.Intent(ACTION_REQUEST_REFRESH);
            intent.setPackage(AUTHORITY_PACKAGE);
            context.sendBroadcast(intent);
            Log.i(TAG, "poke (broadcast) -> " + AUTHORITY_PACKAGE);
        } catch (RuntimeException ignored) {
            // A poke is an optimisation; the provider stays the source of truth.
        }
        return false;
    }

    /** How recently the navigation UI must have been seen for a poke to be allowed. */
    private static final long NAVIGATION_WINDOW_MS = 15_000L;
    private static final String ACTION_REQUEST_REFRESH = "com.bydopenremote.app.action.REQUEST_REFRESH";
    private static final String AUTHORITY_PACKAGE = "com.bydopenremote.app";

    /** "15 mi" / "1.2 km" / "350 ft" near the ETA, converted to kilometres; -1 when unreadable. */
    private static double siblingDistanceKm(TextView time) {
        android.view.View node = time;
        // The ETA time and distance are often siblings one row apart, sometimes nested; three
        // levels up covers both without scanning the whole screen.
        for (int level = 0; level < 4 && node != null; level++) {
            android.view.ViewParent parent = node.getParent();
            if (!(parent instanceof android.view.ViewGroup)) break;
            double km = distanceIn((android.view.ViewGroup) parent, time, 2);
            if (km >= 0) return km;
            node = (android.view.View) parent;
        }
        return -1;
    }

    private static double distanceIn(android.view.ViewGroup group, android.view.View time, int depth) {
        for (int i = 0; i < group.getChildCount(); i++) {
            android.view.View child = group.getChildAt(i);
            if (child == time) continue;
            if (child instanceof TextView) {
                CharSequence text = ((TextView) child).getText();
                if (text != null) {
                    java.util.regex.Matcher matcher = DISTANCE.matcher(text.toString());
                    if (matcher.find()) {
                        try {
                            double km = BydEtaText.kilometres(parseDistanceNumber(matcher.group(1)), matcher.group(2));
                            if (km >= 0) return km;
                        } catch (NumberFormatException unreadable) {
                            // Keep looking at the other texts in the row.
                        }
                    }
                }
            }
            if (depth > 0 && child instanceof android.view.ViewGroup) {
                double km = distanceIn((android.view.ViewGroup) child, time, depth - 1);
                if (km >= 0) return km;
            }
        }
        return -1;
    }

    /** Parses "1,397" / "1,397.5" and "1.397" / "1.397,5" (both thousands styles) as well as "5,2" / "5.2". */
    static double parseDistanceNumber(String raw) {
        if (raw.matches("[0-9]{1,3}(?:,[0-9]{3})+(?:\\.[0-9]+)?")) {
            return Double.parseDouble(raw.replace(",", ""));
        }
        if (raw.matches("[0-9]{1,3}(?:\\.[0-9]{3})+(?:,[0-9]+)?")) {
            return Double.parseDouble(raw.replace(".", "").replace(',', '.'));
        }
        return Double.parseDouble(raw.replace(',', '.'));
    }

    /** A distance with its unit, as Maps writes it into the navigation strip. */
    private static final java.util.regex.Pattern DISTANCE = java.util.regex.Pattern.compile(
            "([0-9]+(?:[.,][0-9]{3})*(?:[.,][0-9]+)?)\\s*(mi|km|m|ft|miles|mile|kilometres|kilometers|kilometre|kilometer|feet|foot)\\b",
            java.util.regex.Pattern.CASE_INSENSITIVE);

    private static void paint(android.app.Activity activity) {
        if (!showEstimate(activity)) return;
        int id = activity.getResources().getIdentifier(
                "navigation_time_remaining_label", "id", activity.getPackageName());
        if (id == 0) return;
        TextView view = activity.findViewById(id);
        if (view == null) return;
        onNavigationFrame(activity.getApplicationContext());
        CharSequence current = view.getText();
        if (current == null || current.length() == 0) return;
        String text = current.toString();
        if (text.equals(lastApplied)) return;
        double distance = siblingDistanceKm(view);
        if (distance >= 0) setRemainingKm(distance);
        // Self-healing: if the cache is stale (never read, or a grant arrived later), re-query.
        // refresh() is debounced, so ticking once a second cannot flood the provider.
        if (!DEMO && !fresh(timestamp, System.currentTimeMillis())) refresh(activity.getApplicationContext());
        int level = chargeLevel();
        if (level < 0) return;
        // "19 min • 84%": keep Maps' own traffic-colour spans on the duration and append the
        // arrival charge only, matching the native automotive card.
        CharSequence badge = badgeText(level);
        String suffix = " • " + badge;
        String line = text + suffix;
        lastApplied = line;
        android.text.SpannableStringBuilder ssb = new android.text.SpannableStringBuilder(current);
        int start = ssb.length();
        ssb.append(" • ");
        ssb.append(badge);
        ssb.setSpan(new android.text.style.ForegroundColorSpan(socColor(view, level)),
                start, ssb.length(), android.text.Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        view.setText(ssb, TextView.BufferType.SPANNABLE);
    }

    private static int socColor(TextView card, int level) {
        int cardText = card.getCurrentTextColor();
        double lum = (0.299 * ((cardText >> 16) & 0xFF)
                + 0.587 * ((cardText >> 8) & 0xFF)
                + 0.114 * (cardText & 0xFF)) / 255.0;
        boolean darkCard = lum > 0.5;
        if (darkCard) return level >= 30 ? 0xFFA8DAB5 : level >= 15 ? 0xFFFDD663 : 0xFFF28B82;
        return level >= 30 ? 0xFF137333 : level >= 15 ? 0xFFB06000 : 0xFFC5221F;
    }

    /** Expected charge on arrival, or the current charge when the distance is unknown; -1 for none. */
    static int chargeLevel() {
        if (!DEMO && !fresh(timestamp, System.currentTimeMillis())) return -1;
        int charge = DEMO ? 62 : soc;
        String rangeUnit = DEMO ? "km" : unit;
        int range = DEMO ? 310 : rangeKm;
        double rangeInKm = BydEtaText.kilometres(range, rangeUnit);
        if (rangeInKm > 0) {
            int arrival = BydEtaText.arrivalPercent(charge, (int) Math.round(rangeInKm), remainingKm);
            if (arrival >= 0) return arrival;
        }
        return charge;
    }

    /** The decorated line we last wrote, so Maps' own repaint can be told apart from ours. */
    private static volatile String lastApplied = "";

    /** Queries the provider off the UI thread; the answer lands in the cache for the next bind. */
    public static void refresh(Context context) {
        if (context == null) return;
        // Hidden estimate: no provider query, so no consumer-triggered cloud refresh either.
        if (!showEstimate(context)) return;
        long now = System.currentTimeMillis();
        if (now < nextQueryAt) return;
        if (now - lastQueryAt < 2000L) return;
        lastQueryAt = now;
        Context app = context.getApplicationContext();
        if (app == null) app = context;
        final Context target = app;
        try {
            QUERIES.execute(() -> query(target));
        } catch (RuntimeException rejected) {
            Log.w(TAG, "Vehicle status query rejected", rejected);
        }
    }

    private static void query(Context context) {
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(statusUri(), null, null, null, null);
            if (cursor == null || !cursor.moveToFirst()) {
                // The app is installed but has no reading yet: retry at the user's interval.
                nextQueryAt = System.currentTimeMillis() + failureBackoffMs(context);
                return;
            }
            onStatus(
                    value(cursor, COLUMN_SOC, -1),
                    value(cursor, COLUMN_RANGE, -1),
                    cursor.getLong(cursor.getColumnIndexOrThrow(COLUMN_TS)),
                    cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_UNIT)));
            nextQueryAt = 0L;
        } catch (RuntimeException unavailable) {
            // No provider, no permission, or a malformed row: keep whatever the broadcast gave us
            // and back off instead of probing every two seconds.
            nextQueryAt = System.currentTimeMillis() + failureBackoffMs(context);
            Log.w(TAG, "Vehicle status unavailable", unavailable);
        } finally {
            if (cursor != null) cursor.close();
        }
    }

    /** Retry a failed/empty read at the Customization refresh interval (default 5 min). */
    static long failureBackoffMs(Context context) {
        int minutes = POKE_DEFAULT_MINUTES;
        try {
            if (context != null) {
                minutes = context.getSharedPreferences(PREFS, android.content.Context.MODE_PRIVATE)
                        .getInt(PREF_REFRESH_MINUTES, POKE_DEFAULT_MINUTES);
            }
        } catch (RuntimeException unreadable) {
            minutes = POKE_DEFAULT_MINUTES;
        }
        if (minutes <= 0) minutes = POKE_DEFAULT_MINUTES;
        return Math.max(60_000L, minutes * 60_000L);
    }

    private static int value(Cursor cursor, String column, int fallback) {
        int index = cursor.getColumnIndex(column);
        return index < 0 || cursor.isNull(index) ? fallback : cursor.getInt(index);
    }

    private static final BroadcastReceiver RECEIVER = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            refresh(context);
        }
    };

    /** Clears the cache; used by tests and when the feature is switched off. */
    static void reset() {
        soc = -1;
        rangeKm = -1;
        timestamp = 0;
        unit = "km";
        lastQueryAt = 0;
        nextQueryAt = 0;
        remainingKm = -1;
        travelledKm = 0;
        lastRemainingForTrip = -1;
        showEstimateOverride = null;
    }

    /** Tests pin the toggle without Android prefs. */
    static void setShowEstimateForTesting(Boolean value) {
        showEstimateOverride = value;
    }
}
