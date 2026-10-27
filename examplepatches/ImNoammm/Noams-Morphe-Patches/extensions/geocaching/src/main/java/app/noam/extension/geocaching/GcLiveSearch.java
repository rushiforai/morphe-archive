package app.noam.extension.geocaching;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Map search through geocaching.com's own web search (/api/proxy/web/search/v2), the one c:geo uses. */
public final class GcLiveSearch {
    private static final String PKG = "com.groundspeak.geocaching.intro.network.api.geocaches";

    /** Search results by cache code, so the cache detail can reuse their typed fields. */
    private static final java.util.Map<String, JSONObject> RESULT_CACHE =
        java.util.Collections.synchronizedMap(new java.util.LinkedHashMap<String, JSONObject>(256, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(java.util.Map.Entry<String, JSONObject> eldest) {
                return size() > 500;
            }
        });

    static JSONObject cachedResult(String code) {
        return RESULT_CACHE.get(code);
    }

    private GcLiveSearch() {}

    /**
     * The app's suspend search, called on the main thread: returns COROUTINE_SUSPENDED and resumes the
     * continuation with an xk9 result off-thread.
     */
    public static Object searchAsync(Object searchParams, Object continuation) {
        Object recent = recentResult(searchParams);
        if (recent != null) {
            try {
                return wrapResult(recent);
            } catch (Throwable t) {
                Utils.logError("Cached map result unusable", t);
            }
        }
        new Thread(() -> {
            Object wrapped;
            try {
                wrapped = wrapResult(searchBlocking(searchParams));
            } catch (Throwable t) {
                Utils.logError("searchAsync failed", t);
                try {
                    wrapped = wrapResult(emptyModel());
                } catch (Throwable t2) {
                    Utils.logError("searchAsync fallback failed", t2);
                    return;
                }
            }
            try {
                // resumeWith is Continuation.resumeWith(Object); call it reflectively so we never
                // reference kotlin.coroutines.Continuation by name (R8 may hide it).
                continuation.getClass().getMethod("resumeWith", Object.class).invoke(continuation, wrapped);
            } catch (Throwable t) {
                Utils.logError("searchAsync resume failed", t);
            }
        }).start();
        return coroutineSuspended();
    }

    /** Coming back to the map re-asks for the same area; answer from memory instead of reloading. */
    private static final long RECENT_MS = 15 * 60 * 1000;
    private static final double RECENT_METERS = 1000;
    private static volatile Object recentModel;
    private static volatile String recentKey;
    private static volatile double[] recentOrigin;
    private static volatile long recentAt;

    private static Object recentResult(Object searchParams) {
        try {
            double[] origin = extractOrigin(searchParams);
            if (origin == null || recentModel == null || recentOrigin == null) return null;
            if (System.currentTimeMillis() - recentAt > RECENT_MS) return null;
            if (!searchKey(searchParams).equals(recentKey)) return null;
            if (distanceMeters(origin, recentOrigin) > RECENT_METERS) return null;
            return recentModel;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Drops the reused map result, e.g. after a log changed a cache's found status. */
    static void forgetRecent() {
        recentModel = null;
    }

    private static void remember(Object searchParams, double[] origin, Object model) {
        recentKey = searchKey(searchParams);
        recentOrigin = origin;
        recentModel = model;
        recentAt = System.currentTimeMillis();
    }

    /** Everything about a search except where it is centered. */
    private static String searchKey(Object searchParams) {
        return String.valueOf(searchParams).replaceFirst("type=Coord\\(coordinate=Coordinate\\([^)]*\\)\\)", "");
    }

    private static double distanceMeters(double[] a, double[] b) {
        double lat = Math.toRadians((a[0] + b[0]) / 2);
        double dy = (a[0] - b[0]) * 111_320;
        double dx = (a[1] - b[1]) * 111_320 * Math.cos(lat);
        return Math.sqrt(dx * dx + dy * dy);
    }

    /** The COROUTINE_SUSPENDED sentinel, resolved at runtime (the IntrinsicsKt facade is R8-stripped). */
    private static Object coroutineSuspended() {
        try {
            Class<?> cls = Class.forName("kotlin.coroutines.intrinsics.CoroutineSingletons");
            for (Object c : cls.getEnumConstants()) {
                if (((Enum<?>) c).name().equals("COROUTINE_SUSPENDED")) return c;
            }
        } catch (Throwable t) {
            Utils.logError("COROUTINE_SUSPENDED lookup failed", t);
        }
        return null;
    }

    /** Wraps the model in the app's xk9 success-result type (yk9). */
    private static Object wrapResult(Object model) throws Exception {
        return Class.forName("xk9").getDeclaredConstructor(Object.class).newInstance(model);
    }

    private static Object searchBlocking(Object searchParams) {
        try {
            double[] origin = extractOrigin(searchParams);
            if (origin == null) return emptyModel();
            Filter filter = new Filter(searchParams);

            JSONArray results = null;
            try {
                if (GcOfflineListUi.isOnline() && GcLiveSession.ensureSession()) {
                    String bearer = GcLiveSession.ensureToken();
                    if (bearer != null) {
                        String url = "https://www.geocaching.com/api/proxy/web/search/v2"
                            + "?origin=" + origin[0] + "," + origin[1] + filter.query()
                            + "&take=500&skip=0&sort=distance&asc=true&app=geocaching-morphe";
                        results = new JSONObject(GcLiveSession.getWithAuth(url, bearer)).optJSONArray("results");
                    }
                }
            } catch (Throwable t) {
                Utils.logError("Live search failed, using caches kept on the device", t);
            }

            boolean live = results != null;
            List<JSONObject> found = new ArrayList<>();
            if (live) {
                if (GcFeatures.offlineMapCaches()) GcMapCache.store(results);
                for (int i = 0; i < results.length(); i++) found.add(results.getJSONObject(i));
            } else {
                if (GcFeatures.offlineMapCaches()) found = GcMapCache.nearest(origin, 3000);
            }

            ArrayList<Object> liteGeocaches = new ArrayList<>();
            for (JSONObject r : found) {
                if (liteGeocaches.size() >= 500) break;
                if (!filter.accepts(r)) continue;
                String code = r.optString("code", null);
                if (code != null) RESULT_CACHE.put(code, r);
                Object lite = buildLiteGeocache(r);
                if (lite != null) liteGeocaches.add(lite);
            }

            Object center = newCoordinate(origin[0], origin[1]);
            Utils.log("Map search: " + liteGeocaches.size() + (live ? " results from geocaching.com" : " results kept on the device"));
            Object model = newGeocacheSearchModel(liteGeocaches, center);
            if (live) remember(searchParams, origin, model);
            return model;
        } catch (Throwable t) {
            Utils.logError("Map search failed", t);
            return emptyModel();
        }
    }

    /**
     * The map filter (GeocacheSearchParams, ce4). Sent to the web search with c:geo's parameter
     * names, then checked again per result: the site ignores hide-found / hide-owned for Basic
     * members, and a D/T selection is a set of values while the site only takes a range.
     */
    private static final class Filter {
        final java.util.Set<Integer> types, attributes, sizes;
        final java.util.Set<Double> difficulties, terrains;
        final boolean hideFound, hideOwned, trackablesOnly, emptySquaresOnly;
        final int minFavorites;
        final String myCode;
        int[] myGrid;

        Filter(Object params) {
            types = ids(field(params, "b"));
            attributes = ids(field(params, "c"));
            difficulties = ratings(field(params, "d"));
            terrains = ratings(field(params, "e"));
            sizes = ids(field(params, "f"));
            hideFound = Boolean.TRUE.equals(field(params, "g"));
            hideOwned = Boolean.TRUE.equals(field(params, "h"));
            trackablesOnly = Boolean.TRUE.equals(field(params, "k"));
            emptySquaresOnly = Boolean.TRUE.equals(field(params, "j"));
            if (emptySquaresOnly) {
                try {
                    myGrid = GcUserStats.foundGrid();
                } catch (Throwable t) {
                    Utils.logError("D/T grid unavailable for empty-squares filter", t);
                }
            }
            Object favorites = field(params, "m");
            minFavorites = favorites instanceof Integer ? (Integer) favorites : 0;
            String code = null;
            if (hideOwned) {
                try {
                    code = GcUserStats.currentReferenceCode();
                } catch (Throwable t) {
                    Utils.logError("Own reference code unavailable", t);
                }
            }
            myCode = code;
            Utils.log("Map filter: " + params);
        }

        private static Object field(Object params, String name) {
            try {
                return params == null ? null : getField(params, name);
            } catch (Throwable t) {
                return null;
            }
        }

        String query() {
            StringBuilder q = new StringBuilder();
            if (!types.isEmpty()) q.append("&ct=").append(join(types));
            if (!sizes.isEmpty()) q.append("&cs=").append(join(sizes));
            if (!attributes.isEmpty()) q.append("&att=").append(join(attributes));
            if (!difficulties.isEmpty()) q.append("&d=").append(range(difficulties));
            if (!terrains.isEmpty()) q.append("&t=").append(range(terrains));
            if (minFavorites > 0) q.append("&fp=").append(minFavorites);
            if (hideFound) q.append("&hf=1");
            if (hideOwned) q.append("&ho=1");
            if (myGrid != null) {
                StringBuilder missing = new StringBuilder();
                for (int i = 0; i < 81; i++) {
                    if (myGrid[i] > 0) continue;
                    if (missing.length() > 0) missing.append("%2C");
                    missing.append(1 + (i / 9) * 0.5).append('-').append(1 + (i % 9) * 0.5);
                }
                q.append("&m=").append(missing);
            }
            return q.toString();
        }

        boolean accepts(JSONObject r) {
            if (!types.isEmpty() && !types.contains(r.optInt("geocacheType", -1))) return false;
            if (!sizes.isEmpty() && !sizes.contains(r.optInt("containerType", -1))) return false;
            if (!difficulties.isEmpty() && !difficulties.contains(r.optDouble("difficulty", -1))) return false;
            if (!terrains.isEmpty() && !terrains.contains(r.optDouble("terrain", -1))) return false;
            if (r.optInt("favoritePoints", 0) < minFavorites) return false;
            if (trackablesOnly && r.optInt("trackableCount", 0) <= 0) return false;
            if (myGrid != null) {
                double d = r.optDouble("difficulty", 0), t = r.optDouble("terrain", 0);
                if (d < 1 || t < 1 || myGrid[(int) Math.round((d - 1) * 2) * 9 + (int) Math.round((t - 1) * 2)] > 0) return false;
            }
            if (hideFound && r.optBoolean("userFound", false)) return false;
            if (hideOwned && myCode != null) {
                JSONObject owner = r.optJSONObject("owner");
                if (owner != null && myCode.equalsIgnoreCase(owner.optString("code", ""))) return false;
            }
            return true;
        }

        private static String join(java.util.Set<?> values) {
            StringBuilder sb = new StringBuilder();
            for (Object v : values) {
                if (sb.length() > 0) sb.append(',');
                sb.append(v);
            }
            return sb.toString();
        }

        private static String range(java.util.Set<Double> values) {
            return Collections.min(values) + "-" + Collections.max(values);
        }

        /** Numbers as-is; the app's model types (GeocacheType, CacheSize, Attribute) keep their id in A. */
        private static java.util.Set<Integer> ids(Object list) {
            java.util.Set<Integer> out = new java.util.TreeSet<>();
            if (!(list instanceof Iterable)) return out;
            for (Object o : (Iterable<?>) list) {
                if (o instanceof Number) {
                    out.add(((Number) o).intValue());
                } else if (o != null) {
                    try {
                        out.add((Integer) getField(o, "A"));
                    } catch (Throwable t) {
                        Utils.log("Unknown filter value " + o.getClass().getName() + " " + o);
                    }
                }
            }
            return out;
        }

        private static java.util.Set<Double> ratings(Object holder) {
            java.util.Set<Double> out = new java.util.TreeSet<>();
            Object list = holder;
            if (holder != null && !(holder instanceof Iterable)) {
                try {
                    list = getField(holder, "a");
                } catch (Throwable t) {
                    return out;
                }
            }
            if (!(list instanceof Iterable)) return out;
            for (Object o : (Iterable<?>) list) {
                if (o instanceof Number) {
                    out.add(((Number) o).doubleValue());
                } else if (o != null) {
                    try {
                        out.add(Double.parseDouble(o.toString()));
                    } catch (NumberFormatException e) {
                        Utils.log("Unknown rating value " + o.getClass().getName() + " " + o);
                    }
                }
            }
            return out;
        }
    }

    /** Reads the GeocacheSearchParams -> kk6 location field; only the Coordinate-based variant (ik6) is handled. */
    private static double[] extractOrigin(Object searchParams) throws Exception {
        Object location = getField(searchParams, "a");
        if (location == null || !location.getClass().getSimpleName().equals("ik6")) return null;
        Object coordinate = getField(location, "a");
        if (coordinate == null) return null;
        double lat = (double) getField(coordinate, "a");
        double lon = (double) getField(coordinate, "b");
        return new double[]{lat, lon};
    }

    private static Object buildLiteGeocache(JSONObject r) {
        try {
            String code = r.getString("code");
            String name = r.optString("name", code);
            float difficulty = (float) r.optDouble("difficulty", 1.0);
            float terrain = (float) r.optDouble("terrain", 1.0);
            int favoritePoints = r.optInt("favoritePoints", 0);
            int trackableCount = r.optInt("trackableCount", 0);
            String placedDate = r.optString("placedDate", null);
            String lastFoundDate = r.optString("lastFoundDate", null);
            int typeId = r.optInt("geocacheType", 2);
            int containerTypeId = r.optInt("containerType", 8);
            boolean premiumOnly = r.optBoolean("premiumOnly", false);

            JSONObject ownerJson = r.optJSONObject("owner");
            String ownerCode = ownerJson != null ? ownerJson.optString("code", "") : "";
            String ownerUsername = ownerJson != null ? ownerJson.optString("username", "") : "";

            JSONObject posted = r.optJSONObject("postedCoordinates");
            double lat = posted != null ? posted.optDouble("latitude", 0) : 0;
            double lon = posted != null ? posted.optDouble("longitude", 0) : 0;

            // Your found date (from the app's own finds list) makes found caches show as found.
            String found = GcUserStats.foundDate(code);
            Object callerSpecific = found == null
                ? newInstance(PKG + ".LiteGeocache$GeocacheUserDataSummary",
                    new Class<?>[]{boolean.class, boolean.class}, false, true)
                : newInstance(PKG + ".LiteGeocache$GeocacheUserDataSummary",
                    new Class<?>[]{int.class, Class.forName(PKG + ".Coordinate"), String.class, String.class, boolean.class, boolean.class},
                    25, null, found, null, false, true);
            Object status = newInstance(PKG + ".LiteGeocache$GeocacheStatus",
                new Class<?>[]{boolean.class, boolean.class, boolean.class, boolean.class, boolean.class, boolean.class},
                false, false, premiumOnly, true, true, false);
            Object coordinate = newCoordinate(lat, lon);
            Object owner = newInstance(PKG + ".LiteGeocache$GeocacheOwnerSummary",
                new Class<?>[]{String.class, String.class}, ownerCode, ownerUsername);

            return newInstance(PKG + ".LiteGeocache",
                new Class<?>[]{
                    String.class, String.class, float.class, float.class, int.class, int.class,
                    String.class, String.class, String.class, String.class, int.class, int.class,
                    Class.forName(PKG + ".LiteGeocache$GeocacheUserDataSummary"),
                    Class.forName(PKG + ".LiteGeocache$GeocacheStatus"),
                    Class.forName(PKG + ".Coordinate"),
                    Class.forName(PKG + ".LiteGeocache$GeocacheOwnerSummary"),
                    Class.forName(PKG + ".LiteGeocache$GeoTourInfo"),
                },
                code, name, difficulty, terrain, favoritePoints, trackableCount,
                placedDate, null, lastFoundDate, ownerUsername, typeId, containerTypeId,
                callerSpecific, status, coordinate, owner, null);
        } catch (Throwable t) {
            Utils.logError("buildLiteGeocache failed", t);
            return null;
        }
    }

    private static Object newCoordinate(double lat, double lon) throws Exception {
        return newInstance(PKG + ".Coordinate", new Class<?>[]{double.class, double.class}, lat, lon);
    }

    private static Object newGeocacheSearchModel(ArrayList<Object> liteGeocaches, Object center) throws Exception {
        return newInstance(PKG + ".GeocacheSearchModel",
            new Class<?>[]{ArrayList.class, java.util.List.class, Class.forName(PKG + ".Coordinate")},
            liteGeocaches, Collections.emptyList(), center);
    }

    private static Object emptyModel() {
        try {
            return newGeocacheSearchModel(new ArrayList<>(), newCoordinate(0, 0));
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object newInstance(String className, Class<?>[] paramTypes, Object... args) throws Exception {
        Class<?> clazz = Class.forName(className);
        Constructor<?> ctor = clazz.getDeclaredConstructor(paramTypes);
        ctor.setAccessible(true);
        return ctor.newInstance(args);
    }

    private static Object getField(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }
}
