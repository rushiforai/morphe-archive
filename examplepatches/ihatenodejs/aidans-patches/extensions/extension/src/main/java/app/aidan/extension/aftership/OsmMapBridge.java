package app.aidan.extension.aftership;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.graphics.Insets;
import android.widget.FrameLayout;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class OsmMapBridge {
    private static final String TAG = "AfterShipOsmBridge";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private OsmMapBridge() {
    }

    /**
     * Updates the shipment map with zoom buttons hidden; see {@link #updateMap(Object, boolean)}.
     */
    public static void updateMap(final Object fragmentObj) {
        updateMap(fragmentObj, false);
    }

    /**
     * Updates the map from an AfterShip tracking fragment, ignoring a null fragment.
     * Call on the UI thread: an existing root view is updated immediately; if the root
     * is unavailable, one attempt is posted to the main thread.
     *
     * @param showZoomButtons whether to display the map's plus and minus controls
     */
    public static void updateMap(final Object fragmentObj, final boolean showZoomButtons) {
        if (fragmentObj == null) {
            return;
        }

        View rootView = resolveRootView(fragmentObj);
        if (rootView == null) {
            MAIN_HANDLER.post(new Runnable() {
                @Override
                public void run() {
                    updateMapInternal(fragmentObj, showZoomButtons);
                }
            });
            return;
        }

        updateMapInternal(fragmentObj, showZoomButtons);
    }

    /**
     * Renders available checkpoints and schedules a second render after layout.
     * An empty route hides the map and shows the native placeholders; missing views
     * or a missing view model leave the UI as is. Exceptions during the immediate
     * update are suppressed; exceptions from the posted render are not caught here.
     */
    private static void updateMapInternal(final Object fragmentObj, final boolean showZoomButtons) {
        try {
            final View rootView = resolveRootView(fragmentObj);
            if (rootView == null) {
                return;
            }

            Context context = rootView.getContext();
            ViewGroup container = findTrackingMapContainer(rootView);
            if (container == null) {
                Log.w(TAG, "tracking_map_container not found in root view hierarchy");
                return;
            }

            View defaultImg = findViewByIdName(rootView, "tracking_map_default_img");
            View tipsTv = findViewByIdName(rootView, "tracking_map_tips_tv");

            Object viewModel = resolveViewModel(fragmentObj);
            if (viewModel == null) {
                Log.w(TAG, "ViewModel not found on fragment");
                return;
            }

            List<double[]> coordinates = extractCoordinatesFromViewModel(viewModel);
            Log.d(TAG, "Extracted " + coordinates.size() + " coordinates for OSM map");

            if (coordinates.isEmpty()) {
                if (defaultImg != null) {
                    defaultImg.setVisibility(View.VISIBLE);
                }
                if (tipsTv != null) {
                    tipsTv.setVisibility(View.VISIBLE);
                }
                OsmMapView existingMap = findOsmMapView(container);
                if (existingMap != null) {
                    existingMap.setVisibility(View.GONE);
                }
                return;
            }

            if (defaultImg != null) {
                defaultImg.setVisibility(View.GONE);
            }
            if (tipsTv != null) {
                tipsTv.setVisibility(View.GONE);
            }

            int color = resolveColor(viewModel);
            int bottomOffset = resolveBottomOffset(viewModel);
            int topOffsetCss = resolveTopOffsetCss(rootView, container);
            int leftOffsetCss = resolveLeftOffsetCss(rootView, container);

            final OsmMapView osmMapView = getOrCreateOsmMapView(container, context);
            osmMapView.setVisibility(View.VISIBLE);
            osmMapView.renderRoute(coordinates, color, topOffsetCss, leftOffsetCss, bottomOffset, showZoomButtons);

            // Re-measure after layout in case toolbar measurements were still pending
            rootView.post(new Runnable() {
                @Override
                public void run() {
                    int updatedTopOffsetCss = resolveTopOffsetCss(rootView, container);
                    int updatedLeftOffsetCss = resolveLeftOffsetCss(rootView, container);
                    Object vm = resolveViewModel(fragmentObj);
                    if (vm != null) {
                        List<double[]> coords = extractCoordinatesFromViewModel(vm);
                        int c = resolveColor(vm);
                        int b = resolveBottomOffset(vm);
                        osmMapView.renderRoute(coords, c, updatedTopOffsetCss, updatedLeftOffsetCss, b, showZoomButtons);
                    }
                }
            });

        } catch (Exception e) {
            Log.e(TAG, "Error updating OSM map bridge", e);
        }
    }

    /**
     * Returns top clearance in CSS pixels, including 16 density-independent pixels
     * below the toolbar. Falls back to status-bar and action-bar heights when the
     * toolbar is unmeasured, or to 120 for a null root.
     */
    private static int resolveTopOffsetCss(View rootView, ViewGroup container) {
        if (rootView == null) return 120;
        Resources res = rootView.getResources();
        float density = res.getDisplayMetrics().density;
        if (density <= 0) density = 1.0f;

        int topOffsetPx = 0;

        // 1. Try finding the actual toolbar background card or toolbar in the window hierarchy
        View root = rootView.getRootView();
        View toolbar = findViewByIdName(root, "tracking_detail_toolbar_bg_view");
        if (toolbar == null) {
            toolbar = findViewByIdName(root, "tracking_detail_toolbar_rl");
        }
        if (toolbar == null) {
            toolbar = findViewByIdName(root, "tracking_detail_toolbar");
        }
        if (toolbar == null) {
            toolbar = findViewByIdName(root, "layout_tracking_detail_title");
        }

        if (toolbar != null && toolbar.getHeight() > 0) {
            int[] loc = new int[2];
            toolbar.getLocationOnScreen(loc);
            int containerTop = 0;
            if (container != null) {
                int[] cLoc = new int[2];
                container.getLocationOnScreen(cLoc);
                containerTop = cLoc[1];
            }
            int relBottomPx = (loc[1] - containerTop) + toolbar.getHeight();
            if (relBottomPx > 0) {
                topOffsetPx = relBottomPx;
            }
        }

        // 2. Fallback: derive from status bar height + 56dp action bar
        if (topOffsetPx <= 0) {
            int statusBarHeight = 0;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && rootView.getRootWindowInsets() != null) {
                Insets insets = rootView.getRootWindowInsets().getInsetsIgnoringVisibility(
                        WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()
                );
                statusBarHeight = insets.top;
            }
            if (statusBarHeight <= 0) {
                int resourceId = res.getIdentifier("status_bar_height", "dimen", "android");
                if (resourceId > 0) {
                    statusBarHeight = res.getDimensionPixelSize(resourceId);
                } else {
                    statusBarHeight = (int) (36 * density);
                }
            }
            int toolbarHeight = (int) (56 * density);
            topOffsetPx = statusBarHeight + toolbarHeight;
        }

        // Add 16dp clearance below toolbar
        topOffsetPx += (int) (16 * density);

        return (int) (topOffsetPx / density);
    }

    /**
     * Returns left clearance in CSS pixels matching the black title bar
     * (tracking_detail_toolbar_bg_view), relative to the tracking map container.
     * Falls back to 16 density-independent pixels.
     */
    private static int resolveLeftOffsetCss(View rootView, ViewGroup container) {
        if (rootView == null) return 16;
        Resources res = rootView.getResources();
        float density = res.getDisplayMetrics().density;
        if (density <= 0) density = 1.0f;

        View root = rootView.getRootView();
        View titleBar = findViewByIdName(root, "tracking_detail_toolbar_bg_view");
        if (titleBar == null) {
            titleBar = findViewByIdName(root, "tracking_detail_back_view");
        }
        if (titleBar == null) {
            titleBar = findViewByIdName(root, "tracking_detail_toolbar_rl");
        }
        if (titleBar == null) {
            titleBar = findViewByIdName(root, "tracking_detail_toolbar");
        }

        if (titleBar != null && titleBar.getWidth() > 0) {
            int[] barLoc = new int[2];
            titleBar.getLocationOnScreen(barLoc);
            int containerLeft = 0;
            if (container != null) {
                int[] cLoc = new int[2];
                container.getLocationOnScreen(cLoc);
                containerLeft = cLoc[0];
            }
            int relLeftPx = barLoc[0] - containerLeft;
            if (relLeftPx > 0) {
                return Math.round(relLeftPx / density);
            }
        }

        return 16;
    }

    /**
     * Returns the fragment's view, falling back to a View found in its declared fields
     * or one level of nested fields. Returns null for a null fragment or no readable
     * view; exceptions while invoking or reading individual candidates are ignored.
     */
    private static View resolveRootView(Object fragmentObj) {
        if (fragmentObj == null) return null;
        try {
            Method getViewMethod = fragmentObj.getClass().getMethod("getView");
            View v = (View) getViewMethod.invoke(fragmentObj);
            if (v != null) {
                return v;
            }
        } catch (Exception ignored) {
        }

        for (Field f : fragmentObj.getClass().getDeclaredFields()) {
            try {
                f.setAccessible(true);
                Object val = f.get(fragmentObj);
                if (val instanceof View) {
                    return (View) val;
                }
                if (val != null) {
                    for (Field bf : val.getClass().getDeclaredFields()) {
                        bf.setAccessible(true);
                        Object bval = bf.get(val);
                        if (bval instanceof View) {
                            return (View) bval;
                        }
                    }
                }
            } catch (Exception ignored) {
            }
        }
        return null;
    }

    /**
     * Finds the tracking map container by resource name, falling back to a descendant
     * FrameLayout search. Returns null if no matching container exists.
     */
    private static ViewGroup findTrackingMapContainer(View root) {
        View v = findViewByIdName(root, "tracking_map_container");
        if (v instanceof ViewGroup) {
            return (ViewGroup) v;
        }
        if (root instanceof ViewGroup) {
            return findViewGroupByCriteria((ViewGroup) root);
        }
        return null;
    }

    /**
     * Returns the first descendant FrameLayout named tracking_map_container in depth-first
     * order, or null. Unresolvable resource names are ignored.
     */
    private static ViewGroup findViewGroupByCriteria(ViewGroup root) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (child instanceof FrameLayout) {
                int id = child.getId();
                if (id != View.NO_ID) {
                    try {
                        String name = root.getResources().getResourceEntryName(id);
                        if ("tracking_map_container".equals(name)) {
                            return (ViewGroup) child;
                        }
                    } catch (Exception ignored) {
                    }
                }
            }
            if (child instanceof ViewGroup) {
                ViewGroup res = findViewGroupByCriteria((ViewGroup) child);
                if (res != null) {
                    return res;
                }
            }
        }
        return null;
    }

    /**
     * Finds a view by its resource entry name, including the root and its descendants.
     * Returns null for a null root or no match; resource lookup failures are ignored.
     */
    private static View findViewByIdName(View root, String name) {
        if (root == null) return null;
        try {
            Resources res = root.getResources();
            int id = res.getIdentifier(name, "id", root.getContext().getPackageName());
            if (id != 0) {
                View target = root.findViewById(id);
                if (target != null) return target;
            }
        } catch (Exception ignored) {
        }

        if (root.getId() != View.NO_ID) {
            try {
                String entry = root.getResources().getResourceEntryName(root.getId());
                if (name.equals(entry)) return root;
            } catch (Exception ignored) {
            }
        }

        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View v = findViewByIdName(vg.getChildAt(i), name);
                if (v != null) return v;
            }
        }
        return null;
    }

    /**
     * Returns the result of the fragment's a3 method, or tries declared no-argument
     * methods returning a TrackingMapViewModel if that call fails. Returns null if no
     * candidate succeeds; invocation exceptions are ignored.
     */
    private static Object resolveViewModel(Object fragmentObj) {
        try {
            Method m = fragmentObj.getClass().getMethod("a3");
            return m.invoke(fragmentObj);
        } catch (Exception ignored) {
        }

        for (Method m : fragmentObj.getClass().getDeclaredMethods()) {
            if (m.getParameterTypes().length == 0 && m.getReturnType().getName().contains("TrackingMapViewModel")) {
                try {
                    m.setAccessible(true);
                    return m.invoke(fragmentObj);
                } catch (Exception ignored) {
                }
            }
        }
        return null;
    }

    /**
     * Returns the view model's route color, or RGB 0x5B7BFE if retrieval fails.
     */
    private static int resolveColor(Object viewModel) {
        try {
            Method eMethod = viewModel.getClass().getMethod("e");
            return (Integer) eMethod.invoke(viewModel);
        } catch (Exception ignored) {
        }
        return 0x5B7BFE;
    }

    /**
     * Returns the first readable declared int field between 1 and 1999, or 120.
     * The map treats this heuristic bottom clearance as CSS pixels without conversion.
     */
    private static int resolveBottomOffset(Object viewModel) {
        for (Field f : viewModel.getClass().getDeclaredFields()) {
            if (f.getType() == int.class) {
                try {
                    f.setAccessible(true);
                    int val = f.getInt(viewModel);
                    if (val > 0 && val < 2000) {
                        return val;
                    }
                } catch (Exception ignored) {
                }
            }
        }
        return 120;
    }

    /**
     * Returns the first direct OsmMapView child, or null if absent.
     */
    private static OsmMapView findOsmMapView(ViewGroup container) {
        for (int i = 0; i < container.getChildCount(); i++) {
            View child = container.getChildAt(i);
            if (child instanceof OsmMapView) {
                return (OsmMapView) child;
            }
        }
        return null;
    }

    /**
     * Reuses the first direct map child or adds a new map sized to fill the container.
     * Creating a map starts loading its web content.
     */
    private static OsmMapView getOrCreateOsmMapView(ViewGroup container, Context context) {
        OsmMapView osmMapView = findOsmMapView(container);
        if (osmMapView != null) {
            return osmMapView;
        }
        osmMapView = new OsmMapView(context);
        container.addView(osmMapView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        return osmMapView;
    }

    /**
     * Returns readable latitude/longitude pairs in checkpoint-list order, skipping
     * null or unrecognized checkpoints. Extraction exceptions return the points
     * accumulated so far, which may be an empty list.
     */
    private static List<double[]> extractCoordinatesFromViewModel(Object viewModel) {
        List<double[]> result = new ArrayList<>();
        try {
            Method fMethod = viewModel.getClass().getMethod("f");
            List<?> list = (List<?>) fMethod.invoke(viewModel);
            if (list == null) return result;

            for (Object checkpoint : list) {
                if (checkpoint == null) continue;
                double[] pt = extractPointFromCheckpoint(checkpoint);
                if (pt != null) {
                    result.add(pt);
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed extracting coordinates from ViewModel", e);
        }
        return result;
    }

    /**
     * Resolves a latitude/longitude pair in degrees from a checkpoint or its nested
     * coordinate object using field identity and accessor methods, or returns null
     * if none is found. The returned array preserves the coordinate order as
     * latitude followed by longitude.
     */
    private static double[] extractPointFromCheckpoint(Object checkpoint) {
        if (checkpoint == null) {
            return null;
        }

        // 1. Direct resolution on checkpoint object
        double[] direct = extractPointFromObject(checkpoint);
        if (direct != null) {
            return direct;
        }

        // 2. Direct field lookup for AfterShip CheckPointEntity.G (geoEntity)
        try {
            Field gField = findFieldInHierarchy(checkpoint.getClass(), "G", "geoEntity", "geo", "coordinate", "location");
            if (gField != null) {
                gField.setAccessible(true);
                Object geoObj = gField.get(checkpoint);
                if (geoObj != null && geoObj != checkpoint) {
                    double[] pt = extractPointFromObject(geoObj);
                    if (pt != null) {
                        return pt;
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        // 3. Resolution on nested coordinate/location objects via accessors
        Class<?> current = checkpoint.getClass();
        while (current != null && current != Object.class) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getParameterTypes().length == 0 && !method.getReturnType().isPrimitive()
                        && method.getReturnType() != void.class) {
                    String name = method.getName().toLowerCase(Locale.ROOT);
                    if (name.contains("coord") || name.contains("geo") || name.contains("location") || name.contains("point")) {
                        try {
                            method.setAccessible(true);
                            Object nested = method.invoke(checkpoint);
                            if (nested != null && nested != checkpoint) {
                                double[] pt = extractPointFromObject(nested);
                                if (pt != null) {
                                    return pt;
                                }
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
            current = current.getSuperclass();
        }

        // 4. Resolution on nested candidate fields prioritized by naming
        current = checkpoint.getClass();
        while (current != null && current != Object.class) {
            for (Field field : current.getDeclaredFields()) {
                String name = field.getName().toLowerCase(Locale.ROOT);
                if (name.equals("g") || name.contains("coord") || name.contains("geo") || name.contains("location") || name.contains("point")) {
                    try {
                        field.setAccessible(true);
                        Object nested = field.get(checkpoint);
                        if (nested != null && nested != checkpoint && !nested.getClass().isPrimitive()
                                && !(nested instanceof String) && !(nested instanceof Number) && !(nested instanceof Boolean)) {
                            double[] pt = extractPointFromObject(nested);
                            if (pt != null) {
                                return pt;
                            }
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            current = current.getSuperclass();
        }

        // 5. Fallback: inspect any remaining non-primitive declared fields
        current = checkpoint.getClass();
        while (current != null && current != Object.class) {
            for (Field field : current.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object nested = field.get(checkpoint);
                    if (nested == null || nested == checkpoint || nested.getClass().isPrimitive()
                            || nested instanceof String || nested instanceof Number || nested instanceof Boolean) {
                        continue;
                    }
                    double[] pt = extractPointFromObject(nested);
                    if (pt != null) {
                        return pt;
                    }
                } catch (Throwable ignored) {
                }
            }
            current = current.getSuperclass();
        }

        // 6. Fallback: parse embedded GeoEntity from checkpoint.toString()
        try {
            double[] pt = extractPointFromToString(checkpoint.toString());
            if (pt != null) {
                return pt;
            }
        } catch (Throwable ignored) {
        }

        return null;
    }

    /**
     * Extracts a latitude/longitude pair directly from the given object's fields
     * or accessors matching latitude and longitude identities. Returns null if
     * either coordinate component cannot be resolved or is invalid.
     */
    private static double[] extractPointFromObject(Object obj) {
        if (obj == null || obj.getClass().isPrimitive() || obj instanceof String || obj instanceof Number || obj instanceof Boolean) {
            return null;
        }

        Double lat = resolveCoordinate(obj, true);
        Double lng = resolveCoordinate(obj, false);

        if (lat != null && lng != null) {
            return new double[]{lat, lng};
        }

        // Resolve AfterShip GeoEntity (e.g. Lu6/d where field a is latitude and b is longitude)
        if (isGeoEntity(obj)) {
            try {
                Field aField = findFieldInHierarchy(obj.getClass(), "a", "latitude", "lat");
                Field bField = findFieldInHierarchy(obj.getClass(), "b", "longitude", "lng");
                if (aField != null && bField != null) {
                    aField.setAccessible(true);
                    bField.setAccessible(true);
                    Double aVal = toDouble(aField.get(obj));
                    Double bVal = toDouble(bField.get(obj));
                    if (aVal != null && bVal != null && isValidCoordinate(aVal, true) && isValidCoordinate(bVal, false)) {
                        return new double[]{aVal, bVal};
                    }
                }
            } catch (Throwable ignored) {
            }

            double[] fromString = extractPointFromToString(obj.toString());
            if (fromString != null) {
                return fromString;
            }
        }

        return null;
    }

    private static boolean isGeoEntity(Object obj) {
        if (obj == null) return false;
        String name = obj.getClass().getName();
        if ("u6.d".equals(name) || name.endsWith(".GeoEntity") || "GeoEntity".equals(name)) {
            return true;
        }
        String str = obj.toString();
        return str.startsWith("GeoEntity(") || (str.contains("latitude=") && str.contains("longitude="));
    }

    private static double[] extractPointFromToString(String str) {
        if (str == null) return null;
        int latKey = str.indexOf("latitude=");
        if (latKey < 0) latKey = str.indexOf("lat=");
        int lngKey = str.indexOf("longitude=");
        if (lngKey < 0) lngKey = str.indexOf("lng=");
        if (lngKey < 0) lngKey = str.indexOf("lon=");

        if (latKey >= 0 && lngKey >= 0) {
            int latStart = str.indexOf('=', latKey) + 1;
            int latEnd = str.indexOf(',', latStart);
            if (latEnd < 0) latEnd = str.indexOf(')', latStart);

            int lngStart = str.indexOf('=', lngKey) + 1;
            int lngEnd = str.indexOf(',', lngStart);
            if (lngEnd < 0) lngEnd = str.indexOf(')', lngStart);

            if (latEnd > latStart && lngEnd > lngStart) {
                String latStr = str.substring(latStart, latEnd).trim();
                String lngStr = str.substring(lngStart, lngEnd).trim();
                Double lat = toDouble(latStr);
                Double lng = toDouble(lngStr);
                if (lat != null && lng != null && isValidCoordinate(lat, true) && isValidCoordinate(lng, false)) {
                    return new double[]{lat, lng};
                }
            }
        }
        return null;
    }

    private static Field findFieldInHierarchy(Class<?> clazz, String... candidateNames) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            for (String name : candidateNames) {
                try {
                    return current.getDeclaredField(name);
                } catch (NoSuchFieldException ignored) {
                }
            }
            current = current.getSuperclass();
        }
        return null;
    }

    /**
     * Resolves a single latitude or longitude coordinate value from the target object
     * using matching accessor methods followed by fields across its class hierarchy.
     */
    private static Double resolveCoordinate(Object target, boolean isLatitude) {
        if (target == null) {
            return null;
        }

        // 1. Try accessor methods in class hierarchy
        Class<?> current = target.getClass();
        while (current != null && current != Object.class) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getParameterTypes().length == 0 && method.getReturnType() != void.class) {
                    boolean matches = isLatitude ? isLatitudeMethodName(method.getName()) : isLongitudeMethodName(method.getName());
                    if (matches) {
                        try {
                            method.setAccessible(true);
                            Object val = method.invoke(target);
                            Double d = toDouble(val);
                            if (d != null && isValidCoordinate(d, isLatitude)) {
                                return d;
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                }
            }
            current = current.getSuperclass();
        }

        // 2. Try fields in class hierarchy
        current = target.getClass();
        while (current != null && current != Object.class) {
            for (Field field : current.getDeclaredFields()) {
                boolean matches = isLatitude ? isLatitudeFieldName(field.getName()) : isLongitudeFieldName(field.getName());
                if (matches) {
                    try {
                        field.setAccessible(true);
                        Object val = field.get(target);
                        Double d = toDouble(val);
                        if (d != null && isValidCoordinate(d, isLatitude)) {
                            return d;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            current = current.getSuperclass();
        }

        return null;
    }

    private static boolean isLatitudeMethodName(String name) {
        if (name == null) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.endsWith("latitude")
                || lower.equals("lat")
                || lower.equals("getlat")
                || lower.endsWith("_lat")
                || lower.endsWith("coordlat")
                || lower.endsWith("coordinatelat");
    }

    private static boolean isLongitudeMethodName(String name) {
        if (name == null) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.endsWith("longitude")
                || lower.endsWith("lng")
                || lower.equals("lon")
                || lower.equals("getlon")
                || lower.endsWith("_lon")
                || lower.endsWith("coordlon")
                || lower.endsWith("coordinatelon");
    }

    private static boolean isLatitudeFieldName(String name) {
        if (name == null) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.equals("lat")
                || lower.equals("mlat")
                || lower.endsWith("_lat")
                || lower.endsWith("$lat")
                || lower.endsWith(".lat")
                || lower.endsWith("coordlat")
                || lower.endsWith("coordinatelat")
                || lower.endsWith("latitude");
    }

    private static boolean isLongitudeFieldName(String name) {
        if (name == null) return false;
        String lower = name.toLowerCase(Locale.ROOT);
        return lower.endsWith("longitude")
                || lower.endsWith("lng")
                || lower.equals("lon")
                || lower.equals("mlon")
                || lower.endsWith("_lon")
                || lower.endsWith("$lon")
                || lower.endsWith(".lon")
                || lower.endsWith("coordlon")
                || lower.endsWith("coordinatelon");
    }

    private static Double toDouble(Object value) {
        if (value instanceof Number) {
            double d = ((Number) value).doubleValue();
            return (!Double.isNaN(d) && !Double.isInfinite(d)) ? d : null;
        }
        if (value instanceof CharSequence) {
            String s = value.toString().trim();
            if (!s.isEmpty()) {
                try {
                    double d = Double.parseDouble(s);
                    return (!Double.isNaN(d) && !Double.isInfinite(d)) ? d : null;
                } catch (NumberFormatException ignored) {
                }
            }
        }
        return null;
    }

    private static boolean isValidCoordinate(double val, boolean isLatitude) {
        if (Double.isNaN(val) || Double.isInfinite(val)) {
            return false;
        }
        return isLatitude ? (val >= -90.0 && val <= 90.0) : (val >= -180.0 && val <= 180.0);
    }
}
