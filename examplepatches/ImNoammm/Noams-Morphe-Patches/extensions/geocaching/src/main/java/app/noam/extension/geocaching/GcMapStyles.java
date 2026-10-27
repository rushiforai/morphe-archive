package app.noam.extension.geocaching;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Map layers for the app's own map type picker, all keyless: the Geocaching map for Trails, and
 * raster tiles for Street, Satellite, Terrain and Hybrid. The raster styles borrow the Geocaching
 * font source so cache markers and cluster counts draw the same on every layer.
 */
public final class GcMapStyles {
    private static final String GEOCACHING = "https://maptiles.geocaching.com/vector/style.json";
    private static final String GLYPHS = "https://maptiles.geocaching.com/fonts/{fontstack}/{range}.pbf";
    private static final String ESRI = "https://server.arcgisonline.com/ArcGIS/rest/services/";

    // MapType ids as the app stores them (UserMapPrefs.PREFERRED_MAP_TYPE).
    private static final int STREET = 1, SATELLITE = 2, TERRAIN = 3, HYBRID = 4;

    private GcMapStyles() {}

    /** Style for the map type picked in the app's map type picker. */
    public static String styleUri() {
        if (!GcFeatures.mapLayers()) return GEOCACHING;
        try {
            int type = Utils.context().getSharedPreferences("UserMapPrefs.NAMESPACE", Context.MODE_PRIVATE)
                .getInt("UserMapPrefs.PREFERRED_MAP_TYPE", 5);
            switch (type) {
                case STREET:
                    return raster("street", "© OpenStreetMap contributors", 19,
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png");
                case SATELLITE:
                    return raster("satellite", "© Esri, Maxar, Earthstar Geographics", 19,
                        ESRI + "World_Imagery/MapServer/tile/{z}/{y}/{x}");
                case TERRAIN:
                    // OpenTopoMap stops at 17 and answers deeper zooms with a "max zoom" placeholder tile.
                    return raster("terrain", "© OpenStreetMap contributors, SRTM | © OpenTopoMap (CC-BY-SA)", 17,
                        "https://a.tile.opentopomap.org/{z}/{x}/{y}.png",
                        "https://b.tile.opentopomap.org/{z}/{x}/{y}.png",
                        "https://c.tile.opentopomap.org/{z}/{x}/{y}.png");
                case HYBRID:
                    return raster("hybrid", "© Esri, Maxar, Earthstar Geographics", 19,
                        ESRI + "World_Imagery/MapServer/tile/{z}/{y}/{x}",
                        null,
                        ESRI + "Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}");
                default:
                    return GEOCACHING;
            }
        } catch (Throwable t) {
            Utils.logError("Map style unavailable, using the Geocaching map", t);
            return GEOCACHING;
        }
    }

    /** The layer actually picked, for the picker's selected item (the app itself is always told Trails). */
    public static Object selectedType() {
        try {
            int id = Utils.context().getSharedPreferences("UserMapPrefs.NAMESPACE", Context.MODE_PRIVATE)
                .getInt("UserMapPrefs.PREFERRED_MAP_TYPE", 5);
            Class<?> mapType = Class.forName("com.groundspeak.geocaching.intro.map.type.MapType");
            java.lang.reflect.Field idField = mapType.getDeclaredField("A");
            idField.setAccessible(true);
            Object trails = null;
            for (java.lang.reflect.Field f : mapType.getDeclaredFields()) {
                if (f.getType() != mapType || !java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object type = f.get(null);
                int typeId = idField.getInt(type);
                if (typeId == id) return type;
                if (typeId == 5) trails = type;
            }
            return trails;
        } catch (Throwable t) {
            Utils.logError("Picked map layer unavailable", t);
            return null;
        }
    }

    /** After a pick in the map type picker: rebuild the map screen so it loads the new layer. */
    public static void reloadMap(Object fragment) {
        try {
            android.app.Activity activity = (android.app.Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (activity != null) activity.recreate();
        } catch (Throwable t) {
            Utils.logError("Map reload failed", t);
        }
    }

    /** Writes a raster style (base tiles, optionally a label overlay after a null) and returns its file:// URI. */
    private static String raster(String name, String attribution, int maxZoom, String... tiles) throws Exception {
        JSONArray base = new JSONArray(), overlay = new JSONArray();
        JSONArray target = base;
        for (String tile : tiles) {
            if (tile == null) {
                target = overlay;
            } else {
                target.put(tile);
            }
        }
        JSONObject sources = new JSONObject().put("base", source(base, attribution, maxZoom));
        JSONArray layers = new JSONArray().put(new JSONObject().put("id", "base").put("type", "raster").put("source", "base"));
        if (overlay.length() > 0) {
            sources.put("labels", source(overlay, attribution, maxZoom));
            layers.put(new JSONObject().put("id", "labels").put("type", "raster").put("source", "labels"));
        }
        JSONObject style = new JSONObject().put("version", 8).put("name", name).put("glyphs", GLYPHS)
            .put("sources", sources).put("layers", layers);

        File dir = new File(Utils.context().getFilesDir(), "map_styles");
        if (!dir.exists() && !dir.mkdirs()) throw new IllegalStateException("No style folder");
        File file = new File(dir, name + ".json");
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(style.toString().getBytes(StandardCharsets.UTF_8));
        }
        return "file://" + file.getAbsolutePath();
    }

    private static JSONObject source(JSONArray tiles, String attribution, int maxZoom) throws Exception {
        return new JSONObject().put("type", "raster").put("tiles", tiles).put("tileSize", 256)
            .put("maxzoom", maxZoom).put("attribution", attribution);
    }
}
