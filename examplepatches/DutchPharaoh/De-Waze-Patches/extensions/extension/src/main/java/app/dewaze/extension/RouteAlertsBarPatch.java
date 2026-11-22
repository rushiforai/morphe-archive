package app.dewaze.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Draws a vertical "alerts ahead" bar on the right side of the Waze map in Android Auto,
 * like the trip bar in Flitsmeister: your car at the bottom, the next {@link #WINDOW_METERS}
 * of road above it, and every report on the way (speed camera, police, accident, jam, hazard,
 * closure, ...) as a round icon at its distance.
 *
 * <p>The patch hooks Waze's Android Auto SurfaceCallback: {@link #onSurfaceAvailable(Object)} gives
 * Waze an intermediate surface, and {@link BarGl} copies each map frame onto the real car surface
 * with the bar on top. (Waze's map engine swaps its frames natively, so drawing into them from
 * Java is not possible.) The phone map is not touched.
 *
 * <p>Data comes from RtAlertsNativeManager.getRtAlertsOnRoute(), the same list Waze uses for its
 * own "reports on route" list. It is polled every {@link #POLL_INTERVAL_MS} while the car map
 * is on screen.
 *
 * <p>Every hook fails safe: on errors the bar is skipped and Waze keeps working as before.
 * Logs: {@code adb logcat -s DeWazeAlertsBar}.
 */
@SuppressWarnings("unused")
public final class RouteAlertsBarPatch {

    static final String TAG = "DeWazeAlertsBar";

    // region Obfuscated names (Waze 5.27.4.900)

    private static final String ALERTS_MANAGER = "com.waze.rtalerts.RtAlertsNativeManager";
    private static final String ALERTS_ON_ROUTE = "getRtAlertsOnRoute";
    private static final String NATIVE_MANAGER = "com.waze.NativeManager";
    private static final String IS_NAVIGATING = "isNavigating";

    // endregion

    // region Tuning

    /** How far ahead the bar looks. */
    static final int WINDOW_METERS = 10_000;
    /** Types from this value up are alerters (cameras) rather than user reports. */
    static final int ALERTER_TYPE_MIN = 1000;
    private static final long POLL_INTERVAL_MS = 2_000;
    /** Stop polling when no car frame was drawn for this long (car disconnected or app hidden). */
    private static final long CAR_IDLE_MS = 10_000;
    private static final int MAX_ERRORS = 20;

    // endregion

    private static volatile long lastCarFrameMs;
    private static volatile int errorCount;

    private RouteAlertsBarPatch() {
    }

    // region Diagnostics (test builds): each milestone is logged and shown once as a toast on the phone

    static final boolean SHOW_TOASTS = false;
    private static final Set<String> REPORTED = new HashSet<>();

    static void reportOnce(String key, String message) {
        synchronized (REPORTED) {
            if (!REPORTED.add(key)) {
                return;
            }
        }
        Log.i(TAG, message);
        if (!SHOW_TOASTS) {
            return;
        }
        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Context context = BarPainter.appContext();
                    if (context != null) {
                        Toast.makeText(context, "De-Waze bar: " + message, Toast.LENGTH_LONG).show();
                    }
                } catch (Throwable ignored) {
                    // Diagnostics only.
                }
            });
        } catch (Throwable ignored) {
            // Diagnostics only.
        }
    }

    // endregion

    // region Hook

    /** Original car SurfaceContainer -> compositor that feeds it. */
    private static final Map<Object, BarGl.Compositor> COMPOSITORS = new HashMap<>();
    /** Original car SurfaceContainer -> the container handed to Waze instead. */
    private static final Map<Object, Object> REPLACEMENTS = new HashMap<>();

    /**
     * Injected at the start of Waze's car SurfaceCallback.onSurfaceAvailable. Returns the
     * SurfaceContainer Waze should use: one with an intermediate surface that gets the bar drawn
     * on top, or the original if that cannot be set up.
     */
    public static Object onSurfaceAvailable(Object container) {
        if (container == null || errorCount > MAX_ERRORS) {
            return container;
        }
        try {
            synchronized (COMPOSITORS) {
                Object existing = REPLACEMENTS.get(container);
                if (existing != null) {
                    return existing;
                }
            }
            try {
                AverageSpeedZone.registerTestReceiver(BarPainter.appContext());
            } catch (Throwable t) {
                Log.w(TAG, "Zone test receiver", t);
            }
            Class<?> c = container.getClass();
            Surface surface = (Surface) c.getMethod("getSurface").invoke(container);
            int width = (Integer) c.getMethod("getWidth").invoke(container);
            int height = (Integer) c.getMethod("getHeight").invoke(container);
            int dpi = (Integer) c.getMethod("getDpi").invoke(container);
            if (surface == null || !surface.isValid() || width <= 0 || height <= 0) {
                return container;
            }
            BarGl.Compositor compositor = BarGl.start(surface, width, height, dpi);
            if (compositor == null) {
                return container;
            }
            Object replacement = c.getConstructor(Surface.class, int.class, int.class, int.class)
                    .newInstance(compositor.inputSurface(), width, height, dpi);
            synchronized (COMPOSITORS) {
                COMPOSITORS.put(container, compositor);
                REPLACEMENTS.put(container, replacement);
            }
            AlertsSource.ensureStarted();
            return replacement;
        } catch (Throwable t) {
            errorCount++;
            Log.e(TAG, "onSurfaceAvailable failed", t);
            reportOnce("surface-error", "surface error: " + t);
            return container;
        }
    }

    /**
     * Injected at the start of Waze's car SurfaceCallback.onSurfaceDestroyed. Hands Waze the
     * container it was given, and frees the compositor once Waze has let go of its surface.
     */
    public static Object onSurfaceDestroyed(Object container) {
        if (container == null) {
            return null;
        }
        BarGl.Compositor compositor;
        Object replacement;
        synchronized (COMPOSITORS) {
            compositor = COMPOSITORS.remove(container);
            replacement = REPLACEMENTS.remove(container);
        }
        if (compositor == null) {
            return container;
        }
        // Waze stops rendering asynchronously; give it time before the surface disappears.
        final BarGl.Compositor toRelease = compositor;
        new Handler(Looper.getMainLooper()).postDelayed(toRelease::release, 2_000);
        return replacement != null ? replacement : container;
    }

    /**
     * Whether the bar should be on screen: only while navigating. Without a route Waze shows extra
     * buttons (recenter, zoom) in the right column, where the bar would sit under them.
     */
    static boolean shouldShowBar() {
        return AlertsSource.navigating;
    }

    /** Part of the car surface not covered by Android Auto's own UI (null until known). */
    static volatile android.graphics.Rect visibleArea;
    /** Part of the car surface that stays uncovered while the UI changes (null until known). */
    static volatile android.graphics.Rect stableArea;

    /** Injected at the start of Waze's car SurfaceCallback.onVisibleAreaChanged. */
    public static void onVisibleAreaChanged(Object rect) {
        if (rect instanceof android.graphics.Rect) {
            visibleArea = new android.graphics.Rect((android.graphics.Rect) rect);
            Log.d(TAG, "Visible area " + visibleArea.toShortString());
        }
    }

    /** Injected at the start of Waze's car SurfaceCallback.onStableAreaChanged. */
    public static void onStableAreaChanged(Object rect) {
        if (rect instanceof android.graphics.Rect) {
            stableArea = new android.graphics.Rect((android.graphics.Rect) rect);
            Log.d(TAG, "Stable area " + stableArea.toShortString());
        }
    }

    /** Called by the compositor for every car frame. */
    static void onCarFrame() {
        lastCarFrameMs = System.currentTimeMillis();
        AlertsSource.ensureStarted();
    }

    // endregion

    static boolean isCarActive() {
        return System.currentTimeMillis() - lastCarFrameMs < CAR_IDLE_MS;
    }

    // region Data

    /** One report ahead on the route. */
    static final class Alert {
        final int id;
        final int type;
        final int distanceMeters;
        final String icon;

        Alert(int id, int type, int distanceMeters, String icon) {
            this.id = id;
            this.type = type;
            this.distanceMeters = distanceMeters;
            this.icon = icon;
        }
    }

    /** Polls Waze for the reports on the route and keeps the latest bar bitmap. */
    static final class AlertsSource {

        private static final Object LOCK = new Object();
        private static Handler handler;
        private static volatile Bitmap bitmap;
        private static volatile List<Alert> alerts = Collections.emptyList();
        private static volatile String lastLogKey = "";
        /** Navigation state; shown until the first check, and if the check is not possible. */
        static volatile boolean navigating = true;
        private static Method isNavigating;
        private static boolean isNavigatingMissing;
        private static volatile int logBudget = 5;

        private static Object manager;
        private static Method alertsOnRoute;
        private static Class<?> callbackType;

        private AlertsSource() {
        }

        static Bitmap bitmap() {
            return bitmap;
        }

        /** The latest bar, or an empty one, so the bar shows even before the first poll answers. */
        static Bitmap bitmapOrEmpty() {
            Bitmap b = bitmap;
            if (b == null && BarGl.barWidthPx > 0) {
                b = BarPainter.paint(BarGl.barWidthPx, BarGl.canvasWidthPx, BarGl.barHeightPx, alerts);
                bitmap = b;
            }
            return b;
        }

        /** Drops the current bitmap, e.g. when the bar size changed. */
        static void invalidate() {
            bitmap = null;
        }

        static void ensureStarted() {
            if (handler != null) {
                return;
            }
            synchronized (LOCK) {
                if (handler != null) {
                    return;
                }
                HandlerThread thread = new HandlerThread(TAG);
                thread.start();
                handler = new Handler(thread.getLooper());
                handler.post(AlertsSource::tick);
                reportOnce("started", "car map seen, bar started");
            }
        }

        private static void tick() {
            try {
                if (isCarActive()) {
                    updateNavigating();
                    try {
                        requestAlerts();
                    } finally {
                        rebuildBitmap();
                    }
                }
            } catch (Throwable t) {
                Log.e(TAG, "tick failed", t);
                reportOnce("tick-error", "alerts error: " + t);
            }
            handler.postDelayed(AlertsSource::tick, POLL_INTERVAL_MS);
        }

        private static void updateNavigating() {
            if (isNavigatingMissing) {
                return;
            }
            try {
                if (isNavigating == null) {
                    Class<?> c = Class.forName(NATIVE_MANAGER);
                    isNavigating = c.getDeclaredMethod(IS_NAVIGATING);
                    isNavigating.setAccessible(true);
                }
                Object manager = Class.forName(NATIVE_MANAGER).getMethod("getInstance").invoke(null);
                boolean now = (Boolean) isNavigating.invoke(manager);
                if (now != navigating) {
                    Log.i(TAG, "Navigating: " + now);
                }
                navigating = now;
            } catch (Throwable t) {
                isNavigatingMissing = true;
                navigating = true;
                Log.e(TAG, "Navigation state not available, always showing the bar", t);
                reportOnce("nav-error", "navigation state error: " + t);
            }
        }

        private static void requestAlerts() throws Exception {
            if (alertsOnRoute == null) {
                Class<?> managerClass = Class.forName(ALERTS_MANAGER);
                manager = managerClass.getMethod("getInstance").invoke(null);
                for (Method m : managerClass.getMethods()) {
                    if (m.getName().equals(ALERTS_ON_ROUTE) && m.getParameterTypes().length == 1
                            && m.getParameterTypes()[0].isInterface()) {
                        alertsOnRoute = m;
                        callbackType = m.getParameterTypes()[0];
                        break;
                    }
                }
                if (alertsOnRoute == null) {
                    throw new IllegalStateException(ALERTS_ON_ROUTE + "(callback) not found");
                }
            }
            InvocationHandler onResult = (proxy, method, args) -> {
                switch (method.getName()) {
                    case "equals":
                        return proxy == args[0];
                    case "hashCode":
                        return System.identityHashCode(proxy);
                    case "toString":
                        return "DeWazeAlertsCallback";
                    default:
                        onAlerts(args != null && args.length > 0 ? args[0] : null);
                        return unit(method.getReturnType());
                }
            };
            Object callback = Proxy.newProxyInstance(
                    callbackType.getClassLoader(), new Class<?>[]{callbackType}, onResult);
            alertsOnRoute.invoke(manager, callback);
        }

        /** Kotlin lambdas return Unit; returning the Unit singleton keeps Waze's caller happy. */
        private static Object unit(Class<?> returnType) {
            if (returnType == void.class) {
                return null;
            }
            try {
                for (Field f : returnType.getDeclaredFields()) {
                    if (f.getType() == returnType && java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                        f.setAccessible(true);
                        return f.get(null);
                    }
                }
            } catch (Throwable ignored) {
                // Fall through.
            }
            return null;
        }

        /** Callback with an RtAlertItemList proto (or null). */
        private static void onAlerts(Object list) {
            try {
                List<?> items = list == null
                        ? Collections.emptyList()
                        : (List<?>) list.getClass().getMethod("getRtAlertItemList").invoke(list);
                if (items == null) {
                    items = Collections.emptyList();
                }
                List<Alert> onRoute = new ArrayList<>();
                List<Alert> all = new ArrayList<>();
                StringBuilder log = new StringBuilder();
                for (Object item : items) {
                    Class<?> c = item.getClass();
                    int id = (Integer) c.getMethod("getId").invoke(item);
                    int type = (Integer) c.getMethod("getTypeValue").invoke(item);
                    int distance = (Integer) c.getMethod("getDistance").invoke(item);
                    boolean isOnRoute = (Boolean) c.getMethod("getIsAlertOnRoute").invoke(item);
                    String icon = (String) c.getMethod("getIcon").invoke(item);
                    Alert alert = new Alert(id, type, distance, icon);
                    all.add(alert);
                    // Alerter items (speed / red light cameras, type >= 1000) are not flagged as on
                    // route but are only reported for the route ahead.
                    if (isOnRoute || type >= ALERTER_TYPE_MIN) {
                        onRoute.add(alert);
                    }
                    log.append(" [id=").append(id).append(" type=").append(type)
                            .append(" dist=").append(distance).append(" onRoute=").append(isOnRoute)
                            .append(" icon=").append(icon).append(']');
                }
                // Prefer the flagged ones; if Waze flags none, show what it gave us.
                List<Alert> source = onRoute.isEmpty() ? all : onRoute;
                List<Alert> ahead = new ArrayList<>();
                for (Alert a : source) {
                    if (a.distanceMeters >= 0 && a.distanceMeters <= WINDOW_METERS) {
                        ahead.add(a);
                    }
                }
                alerts = ahead;
                rebuildBitmap();
                reportOnce("alerts-" + Math.min(items.size(), 1),
                        "alerts total=" + items.size() + " onRoute=" + onRoute.size() + " inBar=" + ahead.size());

                String key = items.size() + "/" + ahead.size();
                if (!key.equals(lastLogKey) || logBudget > 0) {
                    logBudget = Math.max(0, logBudget - 1);
                    lastLogKey = key;
                    Log.i(TAG, "Alerts: total=" + items.size() + " onRoute=" + onRoute.size()
                            + " inBar=" + ahead.size() + log);
                }
            } catch (Throwable t) {
                Log.e(TAG, "onAlerts failed", t);
                reportOnce("onalerts-error", "alerts parse error: " + t);
            }
        }

        private static void rebuildBitmap() {
            if (BarGl.barWidthPx <= 0) {
                return;
            }
            bitmap = BarPainter.paint(BarGl.barWidthPx, BarGl.canvasWidthPx, BarGl.barHeightPx, alerts);
        }
    }

    // endregion

    // region Painting

    /** Paints the bar into a bitmap; the GL side only puts that bitmap on screen. */
    static final class BarPainter {

        private static final Map<String, Drawable> ICON_CACHE = new HashMap<>();

        private BarPainter() {
        }

        static Bitmap paint(int barWidth, int canvasWidth, int barHeight, List<Alert> alerts) {
            int width = Math.max(24, barWidth);
            int canvasW = Math.max(width, canvasWidth);
            int height = Math.max(80, barHeight);
            Bitmap bmp = Bitmap.createBitmap(canvasW, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bmp);
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

            float radius = width / 2f;
            // The bar is at the right of the canvas; the distance labels go to its left.
            float cx = canvasW - radius;

            // Background pill.
            paint.setColor(0xCC1F2226);
            canvas.drawRoundRect(new RectF(cx - radius, 0, cx + radius, height), radius, radius, paint);

            // Track: from just above the car marker to just below the top.
            float iconSize = width * 0.82f;
            float trackTop = radius;
            float carY = height - radius;
            float trackBottom = carY - iconSize * 0.5f;
            paint.setColor(0xFF5F6368);
            float trackWidth = Math.max(3f, width * 0.14f);
            canvas.drawRoundRect(new RectF(cx - trackWidth / 2, trackTop, cx + trackWidth / 2, trackBottom),
                    trackWidth / 2, trackWidth / 2, paint);

            List<Alert> sorted = new ArrayList<>(alerts);
            Collections.sort(sorted, (a, b) -> Integer.compare(b.distanceMeters, a.distanceMeters));
            float[] ys = new float[sorted.size()];
            for (int i = 0; i < sorted.size(); i++) {
                float fraction = Math.min(1f, sorted.get(i).distanceMeters / (float) WINDOW_METERS);
                ys[i] = trackBottom - fraction * (trackBottom - trackTop);
            }

            // Distance labels left of the icons, at the same height ("4,2" over "km"), so they never
            // hit the car marker. Nearest first; one that would overlap a label already placed is
            // left out.
            float numberSize = width * 0.36f;
            float unitSize = width * 0.27f;
            float labelRight = cx - radius - width * 0.06f;
            List<RectF> labelRects = new ArrayList<>();
            List<String[]> labelTexts = new ArrayList<>();
            for (int i = sorted.size() - 1; i >= 0; i--) {
                String[] text = splitDistance(sorted.get(i).distanceMeters);
                paint.setTypeface(Typeface.DEFAULT_BOLD);
                paint.setTextSize(numberSize);
                float textWidth = paint.measureText(text[0]);
                paint.setTypeface(Typeface.DEFAULT);
                paint.setTextSize(unitSize);
                textWidth = Math.max(textWidth, paint.measureText(text[1]));
                float padX = numberSize * 0.3f;
                float labelHeight = numberSize * 1.05f + unitSize * 1.15f + numberSize * 0.3f;
                float top = Math.max(0, Math.min(height - labelHeight, ys[i] - labelHeight / 2f));
                RectF rect = new RectF(Math.max(0, labelRight - textWidth - 2 * padX), top,
                        labelRight, top + labelHeight);
                boolean free = true;
                for (RectF other : labelRects) {
                    if (RectF.intersects(rect, other)) {
                        free = false;
                        break;
                    }
                }
                if (free) {
                    labelRects.add(rect);
                    labelTexts.add(text);
                }
            }

            // Alerts: farthest first, so the nearest ends up on top.
            for (int i = 0; i < sorted.size(); i++) {
                drawAlert(canvas, paint, sorted.get(i), cx, ys[i], iconSize / 2f);
            }
            for (int i = 0; i < labelRects.size(); i++) {
                drawLabel(canvas, paint, labelRects.get(i), labelTexts.get(i), numberSize, unitSize);
            }

            drawCar(canvas, paint, cx, carY, iconSize / 2f);
            return bmp;
        }

        private static void drawLabel(Canvas canvas, Paint paint, RectF rect, String[] text,
                float numberSize, float unitSize) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0xE6303438);
            float r = Math.min(rect.width(), rect.height()) * 0.3f;
            canvas.drawRoundRect(rect, r, r, paint);
            paint.setColor(Color.WHITE);
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            paint.setTextSize(numberSize);
            float y = rect.top + numberSize * 0.15f - paint.ascent();
            canvas.drawText(text[0], rect.centerX(), y, paint);
            paint.setTypeface(Typeface.DEFAULT);
            paint.setTextSize(unitSize);
            paint.setColor(0xFFDADCE0);
            canvas.drawText(text[1], rect.centerX(), y + unitSize * 1.15f, paint);
        }

        /** {"800", "m"} below 1 km, {"6,6", "km"} above; the two lines of a bar label. */
        static String[] splitDistance(int meters) {
            String text = formatDistance(meters);
            int space = text.lastIndexOf(' ');
            return new String[]{text.substring(0, space), text.substring(space + 1)};
        }

        /** "800 m" below 1 km, "6,6 km" above; steps of 100 m, like Flitsmeister. */
        static String formatDistance(int meters) {
            int hundreds = Math.max(0, Math.round(meters / 100f));
            if (hundreds < 10) {
                return (hundreds * 100) + " m";
            }
            return (hundreds / 10) + "," + (hundreds % 10) + " km";
        }

        private static void drawCar(Canvas canvas, Paint paint, float cx, float cy, float r) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.WHITE);
            canvas.drawCircle(cx, cy, r, paint);
            paint.setColor(0xFF1A73E8);
            canvas.drawCircle(cx, cy, r * 0.84f, paint);
            Path arrow = new Path();
            arrow.moveTo(cx, cy - r * 0.5f);
            arrow.lineTo(cx + r * 0.38f, cy + r * 0.42f);
            arrow.lineTo(cx, cy + r * 0.22f);
            arrow.lineTo(cx - r * 0.38f, cy + r * 0.42f);
            arrow.close();
            paint.setColor(Color.WHITE);
            canvas.drawPath(arrow, paint);
        }

        private static void drawAlert(Canvas canvas, Paint paint, Alert alert, float cx, float cy, float r) {
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.WHITE);
            canvas.drawCircle(cx, cy, r, paint);
            paint.setColor(colorFor(alert.type));
            canvas.drawCircle(cx, cy, r * 0.86f, paint);

            Drawable icon = iconFor(alert);
            if (icon != null) {
                int half = Math.round(r * 0.62f);
                icon.setBounds(Math.round(cx) - half, Math.round(cy) - half,
                        Math.round(cx) + half, Math.round(cy) + half);
                icon.draw(canvas);
            } else {
                paint.setColor(Color.WHITE);
                paint.setTextAlign(Paint.Align.CENTER);
                paint.setTypeface(Typeface.DEFAULT_BOLD);
                paint.setTextSize(r * 1.05f);
                Paint.FontMetrics fm = paint.getFontMetrics();
                canvas.drawText(letterFor(alert.type), cx, cy - (fm.ascent + fm.descent) / 2f, paint);
            }
        }

        /** Waze alert types (RtAlertItem.Type). */
        private static int colorFor(int type) {
            switch (type) {
                case 1:  // police
                case 10: // camera
                    return 0xFF1E88E5;
                default:
                    break;
            }
            if (type >= ALERTER_TYPE_MIN) { // speed / red light camera
                return 0xFF1E88E5;
            }
            switch (type) {
                case 2:  // accident
                case 12: // closure
                case 23: // turn closure
                    return 0xFFE53935;
                case 3:  // traffic jam
                case 32: // sudden slowdown
                    return 0xFFD32F2F;
                default: // hazard, construction, weather, animal, ...
                    return 0xFFF57C00;
            }
        }

        private static String letterFor(int type) {
            if (type >= ALERTER_TYPE_MIN) {
                return "F";
            }
            switch (type) {
                case 1:
                    return "P";
                case 10:
                    return "F";
                case 2:
                    return "!";
                case 3:
                case 32:
                    return "≡";
                case 12:
                case 23:
                    return "×";
                default:
                    return "▲";
            }
        }

        /** Waze's own icon for the report, if the name it gives matches a drawable. */
        private static Drawable iconFor(Alert alert) {
            String name = alert.icon;
            if (name == null || name.isEmpty()) {
                return null;
            }
            int dot = name.lastIndexOf('.');
            if (dot > 0) {
                name = name.substring(0, dot);
            }
            synchronized (ICON_CACHE) {
                if (ICON_CACHE.containsKey(name)) {
                    return ICON_CACHE.get(name);
                }
                Drawable drawable = null;
                try {
                    Context context = appContext();
                    if (context != null) {
                        int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
                        if (id != 0) {
                            drawable = context.getResources().getDrawable(id, context.getTheme());
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "No drawable for icon " + name, t);
                }
                ICON_CACHE.put(name, drawable);
                return drawable;
            }
        }

        static Context appContext() throws Exception {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            return (Context) activityThread.getMethod("currentApplication").invoke(null);
        }
    }

    // endregion
}
