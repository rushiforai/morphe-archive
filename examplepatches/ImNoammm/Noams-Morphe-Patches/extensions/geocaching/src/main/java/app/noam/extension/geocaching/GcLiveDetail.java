package app.noam.extension.geocaching;

import org.json.JSONObject;

import java.lang.reflect.Constructor;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Cache details from the cache's geocaching.com page. The page patterns are c:geo's
 * (connector/gc/GCConstants.java).
 */
public final class GcLiveDetail {
    private static final String PKG = "com.groundspeak.geocaching.intro.network.api.geocaches";

    private static final Pattern PATTERN_NAME = Pattern.compile(
        "<span id=\"ctl00_ContentBody_CacheName\".*?>(.*?)</span>",
        Pattern.DOTALL);
    private static final Pattern PATTERN_DESC = Pattern.compile(
        "<span [^>]*id=\"ctl00_ContentBody_LongDescription\"[^>]*>(.*?)</span>\\s*</div>\\s*<(p|div) id=\"ctl00_ContentBody",
        Pattern.DOTALL);
    private static final Pattern PATTERN_SHORTDESC = Pattern.compile(
        "<span [^>]*id=\"ctl00_ContentBody_ShortDescription\"[^>]*>(.*?)</span>\\s*</div>",
        Pattern.DOTALL);
    private static final Pattern PATTERN_HINT = Pattern.compile(
        "<div id=\"div_hint\"[^>]*>(.*?)</div>",
        Pattern.DOTALL);

    private GcLiveDetail() {}

    private static final long FRESH_MS = 15 * 60 * 1000;
    /** Caches built recently, so the description and reopening a cache don't fetch the page again. */
    private static final java.util.Map<String, Object[]> RECENT = java.util.Collections.synchronizedMap(
        new java.util.LinkedHashMap<String, Object[]>(64, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(java.util.Map.Entry<String, Object[]> eldest) {
                return size() > 100;
            }
        });

    /** A log was posted or deleted: rebuild caches (found status, logs) instead of reusing them. */
    public static void forgetRecent() {
        RECENT.clear();
        GcLiveSearch.forgetRecent();
        GcUserStats.forgetFinds();
    }

    /** The app's result wrapper: success with the cache, or "offline" when it can't be built. */
    public static Object fetch(String code) {
        Object[] recent = RECENT.get(code);
        Object cache = recent != null && (System.currentTimeMillis() - (long) recent[1] < FRESH_MS
            || !GcOfflineListUi.isOnline()) ? recent[0] : null;
        if (cache == null) {
            cache = build(code);
            if (cache != null) RECENT.put(code, new Object[]{cache, System.currentTimeMillis()});
        }
        if (cache == null) return Utils.offlineFailure();
        try {
            return Class.forName("xk9").getDeclaredConstructor(Object.class).newInstance(cache);
        } catch (Throwable t) {
            Utils.logError("Result wrapper unavailable", t);
            return Utils.offlineFailure();
        }
    }

    /**
     * Called as the log screen opens. geocaching.com refuses logs and drafts on Premium-only caches from
     * Basic members (the app's own API answers 403 for those caches), so say so before anything is typed.
     */
    public static void warnIfLogRefused(android.app.Activity activity) {
        String code = activity.getIntent().getStringExtra("LogGeocacheActivity.CACHE_CODE");
        if (code == null || !GcOfflineListUi.isOnline()) return;
        new Thread(() -> {
            try {
                if (GcUserStats.apiStatus("/mobile/v1/geocaches/" + code) != 403) return;
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    Utils.showDialog(activity, "Premium-only cache",
                        "geocaching.com only saves logs and drafts on Premium-only caches for Premium members, "
                            + "so a log or draft written here won't reach your account.",
                        null, null, "OK", null, null, null);
                });
            } catch (Throwable t) {
                Utils.logError("Log check for " + code + " failed", t);
            }
        }).start();
    }

    private static Object build(String code) {
        try {
            JSONObject saved = GcOfflineStore.load(code);
            // Automatic copies are only for offline use; online, the cache page is read fresh.
            if (saved != null && saved.optBoolean("auto", false) && GcOfflineListUi.isOnline()) saved = null;
            String page = null;
            if (saved == null) {
                if (GcOfflineListUi.isOnline() && GcLiveSession.ensureSession()) {
                    page = GcLiveSession.get("https://www.geocaching.com/geocache/" + code);
                } else if (GcLiveSearch.cachedResult(code) == null) {
                    return null;
                }
            }
            if (saved != null && saved.optString("ownerGuid", "").isEmpty() && GcOfflineListUi.isOnline()) {
                try {
                    if (GcLiveSession.ensureSession())
                        page = GcLiveSession.get("https://www.geocaching.com/geocache/" + code);
                } catch (Exception e) {
                    Utils.logError("Could not refresh saved cache owner", e);
                }
            }
            boolean locked = saved != null ? saved.optBoolean("premiumOnly")
                : page != null && page.contains("class=\"illustration lock-icon\"");

            JSONObject cached = GcLiveSearch.cachedResult(code);
            String name = saved != null ? saved.optString("name", code) : firstGroup(PATTERN_NAME, page);
            if (name == null) name = cached != null ? cached.optString("name", code) : code;
            name = GcOfflineStore.decode(name);

            double difficulty = saved != null ? saved.optDouble("difficulty", 0)
                : cached != null ? cached.optDouble("difficulty", 0) : 0;
            if (difficulty <= 0 && page != null) difficulty = GcOfflineStore.pageDifficulty(page);
            if (difficulty <= 0) difficulty = 1.0;
            double terrain = saved != null ? saved.optDouble("terrain", 0)
                : cached != null ? cached.optDouble("terrain", 0) : 0;
            if (terrain <= 0 && page != null) terrain = GcOfflineStore.pageTerrain(page);
            if (terrain <= 0) terrain = 1.0;

            int favoritePoints = saved != null ? saved.optInt("favoritePoints", 0)
                : cached != null ? cached.optInt("favoritePoints", 0) : 0;
            int trackableCount = saved != null ? saved.optInt("trackableCount", 0)
                : cached != null ? cached.optInt("trackableCount", 0) : 0;
            int typeId = saved != null ? saved.optInt("geocacheType", 2)
                : cached != null ? cached.optInt("geocacheType", 2) : 2;
            int containerTypeId = saved != null ? saved.optInt("containerType", 0)
                : cached != null ? cached.optInt("containerType", 0) : 0;
            if (containerTypeId <= 0 && page != null) containerTypeId = GcOfflineStore.pageSize(page);
            if (containerTypeId <= 0) containerTypeId = 8;
            boolean premiumOnly = locked || (saved == null && cached != null && cached.optBoolean("premiumOnly", false));

            String ownerGuid = "", ownerCode = "", ownerUsername = "";
            double lat = 0, lon = 0;
            String placedDate = "";
            if (saved != null) {
                ownerGuid = saved.optString("ownerGuid", "");
                ownerCode = saved.optString("ownerCode", "");
                ownerUsername = saved.optString("owner", "");
                lat = saved.optDouble("latitude", 0);
                lon = saved.optDouble("longitude", 0);
                placedDate = saved.optString("placedDate", "");
            } else if (cached != null) {
                JSONObject ownerJson = cached.optJSONObject("owner");
                if (ownerJson != null) {
                    ownerGuid = ownerJson.optString("guid", "");
                    ownerCode = ownerJson.optString("code", "");
                    ownerUsername = ownerJson.optString("username", "");
                }
                JSONObject posted = cached.optJSONObject("postedCoordinates");
                if (posted != null) {
                    lat = posted.optDouble("latitude", 0);
                    lon = posted.optDouble("longitude", 0);
                }
                placedDate = cached.optString("placedDate", "");
            }
            if (cached != null) {
                JSONObject ownerJson = cached.optJSONObject("owner");
                if (ownerJson != null) {
                    if (ownerGuid.isEmpty()) ownerGuid = ownerJson.optString("guid", "");
                    if (ownerCode.isEmpty()) ownerCode = ownerJson.optString("code", "");
                    if (ownerUsername.isEmpty()) ownerUsername = ownerJson.optString("username", "");
                }
                JSONObject posted = cached.optJSONObject("postedCoordinates");
                if (posted != null && (lat == 0 || lon == 0)) {
                    lat = posted.optDouble("latitude", 0);
                    lon = posted.optDouble("longitude", 0);
                }
                if (placedDate.isEmpty()) placedDate = cached.optString("placedDate", "");
            }
            if (page != null) {
                String pageGuid = GcOfflineStore.pageOwnerGuid(page);
                String pageOwner = GcOfflineStore.pageOwnerName(page);
                if (!pageGuid.isEmpty()) ownerGuid = pageGuid;
                if (!pageOwner.isEmpty()) ownerUsername = pageOwner;
                if (lat == 0 || lon == 0) {
                    double[] pageCoords = GcOfflineStore.pageCoordinates(page);
                    if (pageCoords != null) { lat = pageCoords[0]; lon = pageCoords[1]; }
                }
                if (placedDate.isEmpty()) placedDate = GcOfflineStore.pagePlacedDate(page);
            }

            String longDescription = saved != null ? saved.optString("longDescription", "") : nullToEmpty(firstGroup(PATTERN_DESC, page));
            String shortDescription = saved != null ? saved.optString("shortDescription", "") : nullToEmpty(firstGroup(PATTERN_SHORTDESC, page));
            String hint = saved != null ? saved.optString("hint", "") : nullToEmpty(firstGroup(PATTERN_HINT, page));
            if (hint != null && saved == null) hint = GcOfflineStore.decodeHint(hint);
            if (hint != null && saved != null && !saved.optBoolean("hintDecoded", false))
                hint = GcOfflineStore.decodeHint(hint);

            Object stats = newInstance("k14",
                new Class<?>[]{float.class, int.class, int.class, float.class},
                (float) difficulty, favoritePoints, trackableCount, (float) terrain);
            Object callerSpecific = newInstance("qq0",
                new Class<?>[]{String.class, String.class, String.class, Class.forName(PKG + ".Coordinate"),
                    boolean.class, boolean.class, Class.forName("dd4")},
                GcUserStats.foundDate(code), null, null, null, false, true, null);
            Object status = newInstance(PKG + ".LiteGeocache$GeocacheStatus",
                new Class<?>[]{boolean.class, boolean.class, boolean.class, boolean.class, boolean.class, boolean.class},
                false, false, premiumOnly, true, true, false);
            Object coordinate = newInstance(PKG + ".Coordinate", new Class<?>[]{double.class, double.class}, lat, lon);
            Object owner = newInstance(PKG + ".GeocacheOwner",
                new Class<?>[]{String.class, String.class, String.class, String.class},
                ownerGuid, ownerCode, ownerUsername, "");
            Object dates = newInstance("j14",
                new Class<?>[]{String.class, String.class, String.class, String.class, String.class},
                null, null, placedDate.isEmpty() ? null : placedDate, null, null);

            Object result = newInstance(PKG + ".a",
                new Class<?>[]{
                    String.class, String.class, Class.forName("k14"), String.class,
                    java.util.ArrayList.class, int.class, int.class,
                    Class.forName("qq0"),
                    Class.forName(PKG + ".GeocacheOwner"), String.class,
                    Class.forName(PKG + ".LiteGeocache$GeocacheStatus"), Class.forName(PKG + ".Coordinate"),
                    String.class, String.class, String.class,
                    Class.forName("j14"),
                    Class.forName(PKG + ".GeoTourSummary"), java.util.List.class,
                    Integer.class, Boolean.class, String.class,
                },
                code, name, stats, "UTC", new java.util.ArrayList<>(), typeId, containerTypeId,
                callerSpecific, owner, ownerUsername, status, coordinate,
                shortDescription, longDescription, hint, dates, null, new java.util.ArrayList<>(),
                null, null, null);

            if (saved == null && page != null && GcFeatures.offlineCacheCopies()) GcOfflineStore.remember(code, page);
            Utils.log("Full fetch " + code + (saved != null ? " from local list" : " from geocaching.com")
                + " (locked=" + locked + ", lat=" + lat + ", lon=" + lon + ")");
            return result;
        } catch (Throwable t) {
            Utils.logError("Full fetch failed for " + code, t);
            return null;
        }
    }

    private static Object newInstance(String className, Class<?>[] paramTypes, Object... args) throws Exception {
        Class<?> clazz = Class.forName(className);
        Constructor<?> ctor = clazz.getDeclaredConstructor(paramTypes);
        ctor.setAccessible(true);
        return ctor.newInstance(args);
    }

    private static String nullToEmpty(String s) {
        return s == null ? "" : s;
    }

    private static String firstGroup(Pattern pattern, String page) {
        if (page == null) return null;
        Matcher matcher = pattern.matcher(page);
        return matcher.find() ? matcher.group(1) : null;
    }
}
