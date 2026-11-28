package com.waze.gw;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

/**
 * Publishes nearby WME point notices into Waze's own map-marker pipeline.
 *
 * Only immutable POI data and normalized Android bitmaps are cached. Marker/renderable objects are
 * rebuilt for every MapContentRequest so none of Waze's snapshot-bound marker state survives a map
 * renderer/context replacement. In particular, do not use the ResId renderable here: a resource id
 * from the mod dex can be resolved against a stale presenter context and produces an all-black pin.
 */
final class PointNoticeMapBridge {
    private static final String TAG = "WazeGW-PointMap";
    private static final String PREFS = "waze_hud_gw";
    private static final String PREF_ENABLED = "map_point_notices";
    private static final double RADIUS_M = 2000.0;
    private static final double EARTH_RADIUS_M = 6371008.8;
    private static final int MAX_MARKERS = 64;
    // Waze renders bitmap markers at their native pixel size. 72 px looked closer to a native
    // speed-limit control than a map pin and hid too much road, especially on narrow AA screens.
    static final String PREF_ICON_SIZE = "map_point_icon_px";
    static final int DEFAULT_ICON_PX = 46;
    private static volatile int iconPx = DEFAULT_ICON_PX;

    private static volatile List<MapPoint> points = Collections.emptyList();
    private static volatile String pointSignature = "";
    private static volatile String lastPublishedSignature = "";
    private static long lastReflectErrorMs;
    private static volatile java.lang.ref.WeakReference<Object> controllerRef =
            new java.lang.ref.WeakReference<Object>(null);
    private static volatile Object templateRequest;
    private static int publishGeneration;
    private static final ThreadLocal<Boolean> internalPublish = new ThreadLocal<Boolean>();

    private static final HashMap<String, Bitmap> normalizedIcons = new HashMap<String, Bitmap>();
    private static volatile Reflection reflection;

    private PointNoticeMapBridge() { }

    static void refreshIconSize(Context context) {
        if (context == null) return;
        int size = Math.max(24, Math.min(200, context.getSharedPreferences(PREFS,
                Context.MODE_PRIVATE).getInt(PREF_ICON_SIZE, DEFAULT_ICON_PX)));
        synchronized (normalizedIcons) {
            if (size == iconPx) return;
            iconPx = size;
            // Do not recycle: an in-flight Waze snapshot may still be copying a bitmap.
            normalizedIcons.clear();
        }
        schedulePublish();
    }

    static void update(Context context, PointNoticeDatabase database,
                       PointNoticeRepository.PositionSnapshot position, double heading,
                       java.util.Set<String> activeIds) {
        if (context == null || database == null || position == null
                || !context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getBoolean(PREF_ENABLED, false)) {
            clear();
            return;
        }


        refreshIconSize(context);
        List<PointNoticeDatabase.Notice> nearby =
                database.nearby(position.latitude, position.longitude);
        ArrayList<DistancePoint> selected = new ArrayList<DistancePoint>();
        for (PointNoticeDatabase.Notice notice : nearby) {
            // Only draw notices the alert engine currently reports (same list as the WME rail).
            if (activeIds == null || !activeIds.contains(notice.id)) continue;
            double distance = distanceM(position.latitude, position.longitude,
                    notice.latitude(), notice.longitude());
            if (distance > RADIUS_M) continue;
            // Comment editors place the point on the right-hand side of the direction that owns
            // the notice. Use the same forward/right gate as the alert rail: it removes already
            // passed points and rejects the opposite carriageway instead of drawing a 2 km circle.
            double toPoint = bearing(position.latitude, position.longitude,
                    notice.latitude(), notice.longitude());
            double sideAngle = signedAngle(heading, toPoint);
            if (sideAngle <= 0.0 || sideAngle > 70.0) continue;
            double radians = Math.toRadians(sideAngle);
            double forwardM = distance * Math.cos(radians);
            double rightM = distance * Math.sin(radians);
            double minimumRightM = position.mapMatched ? 3.0
                    : Math.max(3.0, Math.min(8.0, position.accuracyM * 0.25));
            // Drop the pin slightly before it reaches the vehicle instead of leaving it visible
            // beside/under the car while the marker layer update is being committed.
            if (forwardM < 20.0 || rightM < minimumRightM) continue;
            selected.add(new DistancePoint(new MapPoint(notice.id, notice.type,
                    notice.latitude(), notice.longitude(), rawIcon(notice)), distance));
        }
        Collections.sort(selected, new Comparator<DistancePoint>() {
            @Override public int compare(DistancePoint left, DistancePoint right) {
                int byDistance = Double.compare(left.distanceM, right.distanceM);
                return byDistance != 0 ? byDistance : left.point.id.compareTo(right.point.id);
            }
        });

        ArrayList<MapPoint> next = new ArrayList<MapPoint>(Math.min(MAX_MARKERS, selected.size()));
        StringBuilder signature = new StringBuilder();
        int count = Math.min(MAX_MARKERS, selected.size());
        for (int i = 0; i < count; i++) {
            MapPoint point = selected.get(i).point;
            next.add(point);
            signature.append(point.id).append(':').append(point.icon).append(';');
        }
        String nextSignature = signature.toString();
        if (!nextSignature.equals(pointSignature)) {
            points = Collections.unmodifiableList(next);
            pointSignature = nextSignature;
            Log.i(TAG, "nearby markers=" + next.size());
            schedulePublish();
        }
    }

    static void clear() {
        if (!points.isEmpty()) {
            points = Collections.emptyList();
            pointSignature = "";
            Log.i(TAG, "nearby markers=0");
            schedulePublish();
        }
    }

    /** Captures the unmodified stock snapshot and merges MOD markers into every replacement. */
    static Object attach(Object controller, Object mapContent) {
        if (mapContent == null || controller == null || Boolean.TRUE.equals(internalPublish.get())) {
            return mapContent;
        }
        try {
            Reflection r = reflection;
            if (r == null) {
                synchronized (PointNoticeMapBridge.class) {
                    r = reflection;
                    if (r == null) reflection = r = new Reflection(mapContent.getClass().getClassLoader());
                }
            }
            Object oldController = controllerRef.get();
            controllerRef = new java.lang.ref.WeakReference<Object>(controller);
            templateRequest = mapContent;
            if (oldController != controller) Log.i(TAG, "mobile map controller attached");
            // ej.b replaces one StateFlow<MapContentRequestForPresenter>; its returned Deferred
            // acknowledges presentation, it is NOT an independently cancellable marker layer.
            // Merge synchronously so subsequent stock updates cannot erase the MOD markers.
            List<MapPoint> snapshot = points;
            if (!snapshot.isEmpty()) return mergeContent(r, mapContent, snapshot);
        } catch (Throwable error) {
            long now = android.os.SystemClock.elapsedRealtime();
            if (now - lastReflectErrorMs > 10000L) {
                lastReflectErrorMs = now;
                Log.w(TAG, "Unable to inject map markers", error);
            }
            return mapContent;
        }
        return mapContent;
    }

    private static void schedulePublish() {
        final int generation;
        synchronized (PointNoticeMapBridge.class) {
            generation = ++publishGeneration;
        }
        new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
            @Override public void run() {
                synchronized (PointNoticeMapBridge.class) {
                    if (generation != publishGeneration) return;
                }
                publishNow();
            }
        });
    }

    private static void publishNow() {
        Object controller = controllerRef.get();
        Object template = templateRequest;
        Reflection r = reflection;
        if (controller == null || template == null || r == null) return;
        List<MapPoint> snapshot = points;
        try {
            Object request = mergeContent(r, template, snapshot);
            Method replace = replaceMethod(controller.getClass(), r.mapContentClass);
            internalPublish.set(Boolean.TRUE);
            try {
                replace.invoke(controller, request);
            } finally {
                internalPublish.remove();
            }
            lastPublishedSignature = pointSignature;
            Log.i(TAG, "stock content merged: mod markers=" + snapshot.size());
        } catch (Throwable error) {
            internalPublish.remove();
            long now = android.os.SystemClock.elapsedRealtime();
            if (now - lastReflectErrorMs > 10000L) {
                lastReflectErrorMs = now;
                Log.w(TAG, "Unable to publish marker layer", error);
            }
        }
    }

    /** The method that republishes a map-content request: b(...) up to 5.24, B(...) in 5.27. */
    private static Method replaceMethod(Class<?> controller, Class<?> contentClass)
            throws NoSuchMethodException {
        for (String name : new String[]{"b", "B"}) {
            try {
                return controller.getMethod(name, contentClass);
            } catch (NoSuchMethodException next) { /* try the other spelling */ }
        }
        throw new NoSuchMethodException("map content replace method");
    }

    private static Object mergeContent(Reflection r, Object stock, List<MapPoint> snapshot)
            throws Exception {
        // templateRequest always references stock input, never our output: no accumulation.
        if (snapshot.isEmpty()) return stock;
        ArrayList<Object> combined = new ArrayList<Object>((List<?>) r.markers.invoke(stock));
        combined.addAll(buildMarkers(r, snapshot));
        return r.mapContentCtor.newInstance(
                r.routes.invoke(stock), r.events.invoke(stock), combined,
                r.polylines.invoke(stock), r.polygons.invoke(stock),
                r.additional.invoke(stock), r.navigation.invoke(stock), r.scheme.invoke(stock));
    }

    private static ArrayList<Object> buildMarkers(Reflection r, List<MapPoint> snapshot)
            throws Exception {
        ArrayList<Object> markers = new ArrayList<Object>(snapshot.size());
        for (MapPoint point : snapshot) {
            Object coordinate = r.coordinateCtor.newInstance(point.latitude, point.longitude);
            Object bitmapCreator = Proxy.newProxyInstance(r.loader,
                    new Class<?>[]{r.function1Class}, new BitmapCreator(point.icon, iconPx));
            Object renderable = r.bitmapRenderableCtor.newInstance(bitmapCreator);
            Object markerView = r.markerViewCtor.newInstance(coordinate, renderable,
                    r.centerAlignment, r.poiPriority, r.zoomRange, 1.0f,
                    null, null, null, r.rotationCtor.newInstance());
            markers.add(r.markerWrapperCtor.newInstance(markerView, null));
        }
        return markers;
    }

    private static final class BitmapCreator implements InvocationHandler {
        private final String icon;
        private final int size;

        BitmapCreator(String icon, int size) { this.icon = icon; this.size = size; }

        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            if ("invoke".equals(name)) {
                Context context = args != null && args.length > 0 && args[0] instanceof Context
                        ? (Context) args[0] : null;
                Bitmap source = normalizedIcon(context, icon, size);
                Bitmap rendered = source.copy(Bitmap.Config.ARGB_8888, false);
                Log.d(TAG, "bitmap rendered=" + icon + " "
                        + rendered.getWidth() + "x" + rendered.getHeight());
                return rendered;
            }
            if ("hashCode".equals(name)) return Integer.valueOf(31 * icon.hashCode() + size);
            if ("equals".equals(name)) return Boolean.valueOf(args != null && args.length > 0
                    && proxy == args[0]);
            if ("toString".equals(name)) return "PointBitmapCreator(" + icon + "," + size + ")";
            return null;
        }
    }

    private static Bitmap normalizedIcon(Context context, String icon, int size) {
        if (context == null) return Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        synchronized (normalizedIcons) {
            String cacheKey = icon + ":" + size;
            Bitmap cached = normalizedIcons.get(cacheKey);
            if (cached != null && !cached.isRecycled()) return cached;
            Bitmap source = Signs.alertIcon(context, icon);
            if (source == null || source.isRecycled()) source = Signs.pin(context, "bigpin_hazard");
            Bitmap output = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            output.setPremultiplied(true);
            if (source != null && !source.isRecycled()) {
                float scale = Math.min((float) size / source.getWidth(),
                        (float) size / source.getHeight());
                float width = source.getWidth() * scale;
                float height = source.getHeight() * scale;
                float left = (size - width) * 0.5f;
                float top = (size - height) * 0.5f;
                Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
                new Canvas(output).drawBitmap(source, null,
                        new android.graphics.RectF(left, top, left + width, top + height), paint);
            }
            normalizedIcons.put(cacheKey, output);
            return output;
        }
    }

    private static String rawIcon(PointNoticeDatabase.Notice notice) {
        if ((notice.type == 12 || notice.type == 13) && notice.hasValueKmh) {
            return "speeddrop_" + notice.valueKmh;
        }
        return "wme_" + notice.type;
    }

    private static double signedAngle(double heading, double target) {
        double difference = normalize(target) - normalize(heading);
        if (difference > 180.0) difference -= 360.0;
        if (difference <= -180.0) difference += 360.0;
        return difference;
    }

    private static double normalize(double degrees) {
        double result = degrees % 360.0;
        return result < 0.0 ? result + 360.0 : result;
    }

    private static double bearing(double lat1, double lon1, double lat2, double lon2) {
        double phi1 = Math.toRadians(lat1);
        double phi2 = Math.toRadians(lat2);
        double lambda = Math.toRadians(lon2 - lon1);
        double y = Math.sin(lambda) * Math.cos(phi2);
        double x = Math.cos(phi1) * Math.sin(phi2)
                - Math.sin(phi1) * Math.cos(phi2) * Math.cos(lambda);
        return normalize(Math.toDegrees(Math.atan2(y, x)));
    }

    private static double distanceM(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * EARTH_RADIUS_M * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    private static final class MapPoint {
        final String id;
        final int type;
        final double latitude;
        final double longitude;
        final String icon;

        MapPoint(String id, int type, double latitude, double longitude, String icon) {
            this.id = id;
            this.type = type;
            this.latitude = latitude;
            this.longitude = longitude;
            this.icon = icon;
        }
    }

    private static final class DistancePoint {
        final MapPoint point;
        final double distanceM;
        DistancePoint(MapPoint point, double distanceM) {
            this.point = point;
            this.distanceM = distanceM;
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static final class Reflection {
        final ClassLoader loader;
        final Class<?> mapContentClass;
        final Class<?> function1Class;
        final Constructor<?> coordinateCtor;
        final Constructor<?> bitmapRenderableCtor;
        final Constructor<?> markerViewCtor;
        final Constructor<?> markerWrapperCtor;
        final Constructor<?> mapContentCtor;
        final Constructor<?> rotationCtor;
        final Object centerAlignment;
        final Object poiPriority;
        final Object zoomRange;
        final Method routes;
        final Method events;
        final Method markers;
        final Method polylines;
        final Method polygons;
        final Method additional;
        final Method navigation;
        final Method scheme;

        Reflection(ClassLoader loader) throws Exception {
            this.loader = loader;
            // Waze 5.27.90.900 contract, mapped from 5.24 through the marker-view constructor descriptor
            // (map.ap(coordinate, dn, ad, ai, en, F, Point, an, ag, ah)) and the map-content constructor.
            Class<?> coordinate = Class.forName("com.waze.shared_infra.h.b", false, loader);
            Class<?> gasRenderable = Class.forName("com.waze.map.dn", false, loader);
            Class<?> alignment = Class.forName("com.waze.map.ad", false, loader);
            Class<?> priority = Class.forName("com.waze.map.ai", false, loader);
            Class<?> zoom = Class.forName("com.waze.map.b.en", false, loader);
            Class<?> showAnimation = Class.forName("com.waze.map.an", false, loader);
            Class<?> hitBox = Class.forName("com.waze.map.ag", false, loader);
            Class<?> rotation = Class.forName("com.waze.map.ah", false, loader);
            Class<?> markerView = Class.forName("com.waze.map.ap", false, loader);
            Class<?> markerWrapper = Class.forName("com.waze.native_managers.b", false, loader);
            Class<?> markerAction = Class.forName("com.waze.google_assistant.ac", false, loader);
            mapContentClass = Class.forName("com.waze.map.b.be", false, loader);
            Class<?> additionalClass = Class.forName("com.waze.map.b.bv", false, loader);
            Class<?> navigationClass = Class.forName("com.waze.map.b.di", false, loader);
            Class<?> schemeClass = Class.forName("com.waze.map.b.bd", false, loader);
            function1Class = Class.forName("g.h.a.l", false, loader);
            Class<?> bitmapRenderable = Class.forName("com.waze.map.aj", false, loader);

            coordinateCtor = coordinate.getConstructor(double.class, double.class);
            bitmapRenderableCtor = bitmapRenderable.getConstructor(function1Class);
            markerViewCtor = markerView.getConstructor(coordinate, gasRenderable, alignment,
                    priority, zoom, float.class, android.graphics.Point.class,
                    showAnimation, hitBox, rotation);
            rotationCtor = rotation.getConstructor();
            markerWrapperCtor = markerWrapper.getConstructor(markerView, markerAction);
            mapContentCtor = mapContentClass.getConstructor(List.class, List.class, List.class,
                    List.class, List.class, additionalClass, navigationClass, schemeClass);
            centerAlignment = Enum.valueOf((Class<? extends Enum>) alignment, "CENTER");
            // Alerts must stay above ordinary POIs and route paint. POIS may be culled by Waze's
            // density/zoom policy even though the marker is present in MapContentRequest.
            poiPriority = Enum.valueOf((Class<? extends Enum>) priority, "ALERTS");
            zoomRange = zoom.getConstructor(float.class, float.class).newInstance(0.0f, 1.0f);

            routes = mapContentClass.getMethod("h");
            events = mapContentClass.getMethod("d");
            markers = mapContentClass.getMethod("e");
            polylines = mapContentClass.getMethod("g");
            polygons = mapContentClass.getMethod("f");
            additional = mapContentClass.getMethod("b");
            navigation = mapContentClass.getMethod("c");
            scheme = mapContentClass.getMethod("a");
        }
    }
}
