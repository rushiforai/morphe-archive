package app.dewaze.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;

/**
 * Shows the user's favorites as star markers (with their name) on the Waze main map,
 * on the phone and in Android Auto, whether navigating or not.
 *
 * The patch adds three hooks that call into this class:
 * <ul>
 *   <li>{@link #onDriveToManagerCreated(Object)}: end of DriveToNativeManagerBase constructor.</li>
 *   <li>{@link #onMainMapControllerCreated(Object)}: end of the main map controller constructor.</li>
 *   <li>{@link #onMainMapContent(Object)}: every return of the main map content resolver.</li>
 * </ul>
 *
 * Waze is obfuscated, so the names below are for Waze 5.27.4.900 and must be re-checked for
 * other versions. Every hook fails safe: on any error the original Waze behaviour is kept.
 */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class FavoritesOnMapPatch {

    private static final String TAG = "WazeFavoritesOnMap";

    // region Obfuscated names (Waze 5.27.4.900)

    /** MapContentRequest(routes=, eventsOnRoute=, markers=, ...). */
    private static final String MAP_CONTENT_REQUEST = "com.waze.map.b.be";
    /** be.i(be, List, List markers, List, bv, di, bd, int mask): Kotlin copy(). */
    private static final String MAP_CONTENT_REQUEST_COPY = "i";
    /** be.e(): markers list. */
    private static final String MAP_CONTENT_REQUEST_MARKERS = "e";
    /** Copy mask that only replaces the markers argument. */
    private static final int COPY_MASK_MARKERS_ONLY = 251;

    /** MainMapContent(baseContent=, colorScheme=, ...). */
    private static final String MAIN_MAP_CONTENT_BASE = "e";
    private static final String MAIN_MAP_CONTENT_COPY = "k";
    /** Copy mask that only replaces baseContent. */
    private static final int COPY_MASK_BASE_ONLY = 2046;

    /** MutableStateFlow<MainMapContent> field in the main map controller. */
    private static final String MAIN_MAP_STATE_FIELD = "v";
    private static final String STATE_FLOW_GET = "d";
    private static final String STATE_FLOW_SET = "e";

    private static final String COORDINATE = "com.waze.shared_infra.h.b";
    private static final String RENDERABLE = "com.waze.main_screen.ab.a.p";
    private static final String BITMAP_RENDERABLE = "com.waze.map.ai";
    private static final String MARKER = "com.waze.map.ao";
    private static final String ALIGNMENT = "com.waze.map.ac";
    private static final String PRIORITY = "com.waze.map.ah";
    private static final String ZOOM_RANGE = "com.waze.map.b.en";
    private static final String SHOW_ANIMATION = "com.waze.map.am";
    private static final String ROTATION = "com.waze.map.ag";
    /** Kotlin default-arguments mask used by Waze itself for a simple pin. */
    private static final int MARKER_DEFAULTS_MASK = 2032;
    /** Static helper that wraps a marker into a non-clickable map marker item. */
    private static final String MARKER_ITEM_FACTORY = "com.waze.main_screen.v.ac";
    private static final String MARKER_ITEM_FACTORY_METHOD = "g";

    // endregion

    /** AddressItem.FAVORITE_ITEM (home = 1, work = 3 are drawn by Waze itself). */
    private static final int FAVORITE_ITEM = 5;
    private static final int MAX_FAVORITES = 100;
    private static final long REFETCH_INTERVAL_MS = 60_000;
    private static final int MAX_LABEL_LENGTH = 22;

    private static volatile Object driveToManager;
    private static volatile WeakReference<Object> mainMapController = new WeakReference<>(null);

    private static volatile List<Object> favoriteMarkers = Collections.emptyList();
    private static volatile Set<Object> favoriteMarkerSet = Collections.emptySet();
    private static volatile String favoritesKey = "";
    private static volatile long lastFetchMs;

    private static Method copyMapContentRequest;
    private static Method markersOfMapContentRequest;

    private FavoritesOnMapPatch() {
    }

    // region Hooks

    /** Injected at the end of DriveToNativeManagerBase.&lt;init&gt;. */
    public static void onDriveToManagerCreated(Object manager) {
        driveToManager = manager;
    }

    /** Injected at the end of the main map controller constructor. */
    public static void onMainMapControllerCreated(Object controller) {
        mainMapController = new WeakReference<>(controller);
        requestFavorites();
    }

    /**
     * Injected before every object return of the main map content resolver.
     * The value is either the resolved MapContentRequest or a coroutine marker.
     */
    public static Object onMainMapContent(Object result) {
        try {
            if (result == null || !MAP_CONTENT_REQUEST.equals(result.getClass().getName())) {
                return result;
            }
            if (System.currentTimeMillis() - lastFetchMs > REFETCH_INTERVAL_MS) {
                requestFavorites();
            }
            if (favoriteMarkers.isEmpty()) {
                return result;
            }
            return withFavoriteMarkers(result);
        } catch (Throwable t) {
            Log.e(TAG, "onMainMapContent failed", t);
            return result;
        }
    }

    // endregion

    // region Favorites

    private static void requestFavorites() {
        final Object manager = driveToManager;
        if (manager == null) {
            return;
        }
        lastFetchMs = System.currentTimeMillis();
        try {
            Method getFavorites = null;
            for (Method m : manager.getClass().getMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (m.getName().equals("getFavorites") && p.length == 2
                        && p[0] == boolean.class && p[1].isInterface()) {
                    getFavorites = m;
                    break;
                }
            }
            if (getFavorites == null) {
                Log.e(TAG, "getFavorites(boolean, callback) not found");
                return;
            }
            Class<?> callbackType = getFavorites.getParameterTypes()[1];
            Object callback = function1(callbackType, args -> {
                onFavorites(args.length > 0 ? args[0] : null);
                return null;
            });
            getFavorites.invoke(manager, true, callback);
        } catch (Throwable t) {
            Log.e(TAG, "requestFavorites failed", t);
        }
    }

    private static void onFavorites(Object items) {
        try {
            if (!(items instanceof Object[])) {
                return;
            }
            List<int[]> positions = new ArrayList<>();
            List<String> titles = new ArrayList<>();
            StringBuilder key = new StringBuilder();

            for (Object item : (Object[]) items) {
                if (item == null || positions.size() >= MAX_FAVORITES) {
                    continue;
                }
                Class<?> c = item.getClass();
                int type = (Integer) c.getMethod("getType").invoke(item);
                if (type != FAVORITE_ITEM) {
                    continue;
                }
                int lat = (Integer) c.getMethod("getLatitudeInt").invoke(item);
                int lon = (Integer) c.getMethod("getLongitudeInt").invoke(item);
                if (lat == 0 && lon == 0) {
                    continue;
                }
                Object titleObj = c.getMethod("getTitle").invoke(item);
                String title = titleObj == null ? "" : titleObj.toString().trim();

                positions.add(new int[]{lat, lon});
                titles.add(title);
                key.append(lat).append(',').append(lon).append(',').append(title).append(';');
            }

            String newKey = key.toString();
            if (newKey.equals(favoritesKey)) {
                return;
            }

            List<Object> markers = new ArrayList<>();
            for (int i = 0; i < positions.size(); i++) {
                int[] pos = positions.get(i);
                markers.add(createMarker(pos[0], pos[1], titles.get(i)));
            }
            Set<Object> set = Collections.newSetFromMap(new IdentityHashMap<>());
            set.addAll(markers);

            favoriteMarkers = Collections.unmodifiableList(markers);
            favoriteMarkerSet = set;
            favoritesKey = newKey;
            Log.i(TAG, "Favorites on map: " + markers.size());

            refreshMainMap();
        } catch (Throwable t) {
            Log.e(TAG, "onFavorites failed", t);
        }
    }

    // endregion

    // region Map content

    /** Returns a copy of the MapContentRequest with our markers (re)appended exactly once. */
    private static Object withFavoriteMarkers(Object mapContentRequest) throws Exception {
        Class<?> cls = mapContentRequest.getClass();
        if (markersOfMapContentRequest == null) {
            markersOfMapContentRequest = cls.getMethod(MAP_CONTENT_REQUEST_MARKERS);
            for (Method m : cls.getDeclaredMethods()) {
                if (m.getName().equals(MAP_CONTENT_REQUEST_COPY)
                        && Modifier.isStatic(m.getModifiers())
                        && m.getParameterTypes().length == 8) {
                    m.setAccessible(true);
                    copyMapContentRequest = m;
                    break;
                }
            }
            if (copyMapContentRequest == null) {
                throw new IllegalStateException("MapContentRequest copy method not found");
            }
        }

        List<?> current = (List<?>) markersOfMapContentRequest.invoke(mapContentRequest);
        Set<Object> ours = favoriteMarkerSet;
        List<Object> merged = new ArrayList<>(current.size() + favoriteMarkers.size());
        for (Object marker : current) {
            if (!ours.contains(marker)) {
                merged.add(marker);
            }
        }
        merged.addAll(favoriteMarkers);

        return copyMapContentRequest.invoke(null, mapContentRequest,
                null, merged, null, null, null, null, COPY_MASK_MARKERS_ONLY);
    }

    /**
     * Puts the markers into the main map state so Waze re-resolves and redraws the map now,
     * instead of waiting for the next map state change.
     */
    private static void refreshMainMap() {
        Object controller = mainMapController.get();
        if (controller == null) {
            return;
        }
        try {
            Field stateField = controller.getClass().getDeclaredField(MAIN_MAP_STATE_FIELD);
            stateField.setAccessible(true);
            Object stateFlow = stateField.get(controller);
            if (stateFlow == null) {
                return;
            }
            Method get = publicMethod(stateFlow.getClass(), STATE_FLOW_GET, 0);
            Method set = publicMethod(stateFlow.getClass(), STATE_FLOW_SET, 1);

            Object current = get.invoke(stateFlow);
            if (current == null) {
                return;
            }
            Class<?> contentClass = current.getClass();
            Method base = contentClass.getMethod(MAIN_MAP_CONTENT_BASE);
            Method copy = null;
            for (Method m : contentClass.getDeclaredMethods()) {
                if (m.getName().equals(MAIN_MAP_CONTENT_COPY)
                        && Modifier.isStatic(m.getModifiers())
                        && m.getParameterTypes().length == 11) {
                    copy = m;
                    break;
                }
            }
            if (copy == null) {
                Log.e(TAG, "MainMapContent copy method not found");
                return;
            }
            copy.setAccessible(true);

            Object newBase = withFavoriteMarkers(base.invoke(current));
            Object next = copy.invoke(null, current, newBase,
                    null, null, null, null, null, false, false, null, COPY_MASK_BASE_ONLY);
            set.invoke(stateFlow, next);
        } catch (Throwable t) {
            Log.e(TAG, "refreshMainMap failed", t);
        }
    }

    private static Object createMarker(int lat, int lon, final String title) throws Exception {
        Class<?> coordinateClass = Class.forName(COORDINATE);
        Object coordinate = coordinateClass.getConstructor(int.class, int.class).newInstance(lat, lon);

        Class<?> bitmapRenderableClass = Class.forName(BITMAP_RENDERABLE);
        Constructor<?> bitmapRenderableCtor = bitmapRenderableClass.getDeclaredConstructors()[0];
        Class<?> creatorType = bitmapRenderableCtor.getParameterTypes()[0];
        Object creator = function1(creatorType, args -> {
            Context context = null;
            for (Object arg : args) {
                if (arg instanceof Context) {
                    context = (Context) arg;
                    break;
                }
            }
            if (context == null) {
                context = applicationContext();
            }
            return drawStar(context, title);
        });
        bitmapRenderableCtor.setAccessible(true);
        Object renderable = bitmapRenderableCtor.newInstance(creator);

        Class<?> alignmentClass = Class.forName(ALIGNMENT);
        Class<?> priorityClass = Class.forName(PRIORITY);
        Object center = constantNamed(alignmentClass, "CENTER");
        Object pois = constantNamed(priorityClass, "POIS");

        Constructor<?> markerCtor = Class.forName(MARKER).getDeclaredConstructor(
                coordinateClass,
                Class.forName(RENDERABLE),
                alignmentClass,
                priorityClass,
                Class.forName(ZOOM_RANGE),
                float.class,
                Class.forName(SHOW_ANIMATION),
                Class.forName(ROTATION),
                int.class
        );
        markerCtor.setAccessible(true);
        Object marker = markerCtor.newInstance(coordinate, renderable, center, pois,
                null, 0f, null, null, MARKER_DEFAULTS_MASK);

        Method wrap = null;
        for (Method m : Class.forName(MARKER_ITEM_FACTORY).getDeclaredMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (m.getName().equals(MARKER_ITEM_FACTORY_METHOD) && p.length == 1
                    && p[0] == marker.getClass()) {
                wrap = m;
                break;
            }
        }
        if (wrap == null) {
            throw new IllegalStateException("Marker item factory not found");
        }
        return wrap.invoke(null, marker);
    }

    // endregion

    // region Drawing

    /**
     * A star centred on the bitmap (so the star sits exactly on the favorite), with the name
     * underneath. The bitmap is padded at the top so the star stays in the centre.
     */
    static Bitmap drawStar(Context context, String title) {
        float density = context != null
                ? context.getResources().getDisplayMetrics().density
                : 2.5f;

        String label = title == null ? "" : title;
        if (label.length() > MAX_LABEL_LENGTH) {
            label = label.substring(0, MAX_LABEL_LENGTH - 1) + "…";
        }

        float starRadius = 11 * density;
        float strokeWidth = 1.5f * density;
        float gap = 2 * density;
        float padH = 5 * density;
        float padV = 2 * density;

        Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        text.setColor(Color.WHITE);
        text.setTextSize(12 * density);
        text.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        Paint.FontMetrics fm = text.getFontMetrics();

        boolean hasLabel = !label.isEmpty();
        float labelW = hasLabel ? text.measureText(label) + 2 * padH : 0;
        float labelH = hasLabel ? (fm.descent - fm.ascent) + 2 * padV : 0;

        float starBox = 2 * (starRadius + strokeWidth);
        float below = hasLabel ? gap + labelH : 0;
        int width = (int) Math.ceil(Math.max(starBox, labelW)) + 2;
        int height = (int) Math.ceil(starBox + 2 * below) + 2;

        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        float cx = width / 2f;
        float cy = height / 2f;

        Path star = starPath(cx, cy, starRadius, starRadius * 0.45f);
        Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        fill.setStyle(Paint.Style.FILL);
        fill.setColor(0xFFFFC107);
        canvas.drawPath(star, fill);
        Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setStrokeWidth(strokeWidth);
        stroke.setColor(0xFF5D4037);
        canvas.drawPath(star, stroke);

        if (hasLabel) {
            float top = cy + starBox / 2f + gap;
            RectF pill = new RectF(cx - labelW / 2f, top, cx + labelW / 2f, top + labelH);
            Paint bg = new Paint(Paint.ANTI_ALIAS_FLAG);
            bg.setColor(0xCC202124);
            canvas.drawRoundRect(pill, labelH / 2f, labelH / 2f, bg);
            text.setTextAlign(Paint.Align.CENTER);
            canvas.drawText(label, cx, top + padV - fm.ascent, text);
        }
        return bitmap;
    }

    private static Path starPath(float cx, float cy, float outer, float inner) {
        Path path = new Path();
        for (int i = 0; i < 10; i++) {
            double angle = Math.PI / 5 * i - Math.PI / 2;
            float r = (i % 2 == 0) ? outer : inner;
            float x = (float) (cx + r * Math.cos(angle));
            float y = (float) (cy + r * Math.sin(angle));
            if (i == 0) {
                path.moveTo(x, y);
            } else {
                path.lineTo(x, y);
            }
        }
        path.close();
        return path;
    }

    // endregion

    // region Reflection helpers

    private interface Fn {
        Object apply(Object[] args) throws Throwable;
    }

    /** Implements Waze's obfuscated kotlin.jvm.functions.Function1 with a dynamic proxy. */
    private static Object function1(Class<?> type, final Fn fn) {
        InvocationHandler handler = (proxy, method, args) -> {
            Object[] a = args == null ? new Object[0] : args;
            switch (method.getName()) {
                case "equals":
                    return a.length == 1 && proxy == a[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "toString":
                    return "FavoritesOnMapPatch$Function1";
                default:
                    return fn.apply(a);
            }
        };
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler);
    }

    private static Object constantNamed(Class<?> cls, String name) throws Exception {
        for (Field f : cls.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) && f.getType() == cls) {
                f.setAccessible(true);
                Object value = f.get(null);
                String valueName = value instanceof Enum ? ((Enum<?>) value).name() : String.valueOf(value);
                if (name.equals(valueName)) {
                    return value;
                }
            }
        }
        throw new IllegalStateException(cls.getName() + "." + name + " not found");
    }

    private static Method publicMethod(Class<?> cls, String name, int paramCount) {
        for (Method m : cls.getMethods()) {
            if (m.getName().equals(name) && m.getParameterTypes().length == paramCount) {
                return m;
            }
        }
        throw new IllegalStateException(cls.getName() + "." + name + " not found");
    }

    private static Context applicationContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    // endregion
}
