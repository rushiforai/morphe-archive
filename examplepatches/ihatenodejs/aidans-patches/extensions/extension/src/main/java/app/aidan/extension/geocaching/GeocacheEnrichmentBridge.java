package app.aidan.extension.geocaching;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.webkit.CookieManager;
import android.util.Log;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.TextView;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class GeocacheEnrichmentBridge {
    private static final String TAG = "GeocacheEnrichment";

    private static final Map<String, Object> sRememberedLiteCaches = new ConcurrentHashMap<>();
    private static final Map<String, Object> sEnrichedCaches = new ConcurrentHashMap<>();
    private static volatile Object sY82 = null;
    private static final Set<String> sPmoCacheCodes = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Pattern PATTERN_PMO_DESC_PREFIX =
            Pattern.compile("^(\\s*Premium\\s+Member\\s+Only\\s+Cache\\b[.:]?)\\s*(.*)$",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    private static final Pattern PATTERN_GC_CODE =
            Pattern.compile("^GC[0-9A-Z]+$");
    private static final Pattern PATTERN_PMO_FLAG =
            Pattern.compile("window\\.isCachePMO\\s*=\\s*['\"]Yes['\"]", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_PMO_ELEMENT =
            Pattern.compile("class=[\"'][^\"']*premium-upgrade-widget[^\"']*[\"']|content=[\"']PMO Cache Upsell[\"']|cache_pmo\\.aspx",
                    Pattern.CASE_INSENSITIVE);

    private static final Pattern PATTERN_OWNER =
            Pattern.compile("A cache by <a[^>]*>(.*?)</a>", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_OWNER_PLAIN =
            Pattern.compile("A cache by\\s+<[^>]+>([^<\\r\\n]+)</|A cache by\\s+([^<\\r\\n]+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_SHORT_DESC =
            Pattern.compile("id=[\"']ctl00_ContentBody_ShortDescription[\"'][^>]*>(.*?)\\s*</span>\\s*</div>\\s*(?:<br\\s*/?>\\s*)?(?:<div[^>]*>\\s*)?<span[^>]*id=[\"']ctl00_ContentBody_LongDescription[\"']",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_SHORT_DESC_FALLBACK =
            Pattern.compile("id=[\"']ctl00_ContentBody_ShortDescription[\"'][^>]*>(.*?)\\s*</span>\\s*</div>",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_LONG_DESC =
            Pattern.compile("id=[\"']ctl00_ContentBody_LongDescription[\"'][^>]*>(.*?)\\s*</span>\\s*</div>\\s*(?=<[^>]*id=[\"'](?:ctl00_ContentBody_hints|div_hint|ctl00_ContentBody_Waypoints)[\"']|<[^>]*class=[\"'][^\"']*CacheDetailNavigation)",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_LONG_DESC_FALLBACK =
            Pattern.compile("id=[\"']ctl00_ContentBody_LongDescription[\"'][^>]*>(.*?)\\s*</span>\\s*</div>",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_HINT =
            Pattern.compile("id=[\"']div_hint[\"'][^>]*>(.*?)</div>",
                    Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
    private static final Pattern PATTERN_NAME =
            Pattern.compile("id=[\"']ctl00_ContentBody_CacheName[\"'][^>]*>(.*?)</span>",
                    Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_META_OG_TITLE =
            Pattern.compile("<meta\\s+[^>]*(?:property|name)=[\"']og:title[\"'][^>]*content=[\"']([^\"']*)[\"']|<meta\\s+[^>]*content=[\"']([^\"']*)[\"'][^>]*(?:property|name)=[\"']og:title[\"']",
                    Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_META_OG_DESC =
            Pattern.compile("<meta\\s+[^>]*(?:property|name)=[\"']og:description[\"'][^>]*content=[\"']([^\"']*)[\"']|<meta\\s+[^>]*content=[\"']([^\"']*)[\"'][^>]*(?:property|name)=[\"']og:description[\"']",
                    Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_TITLE_TAG =
            Pattern.compile("<title[^>]*>\\s*(?:GC[0-9A-Z]+\\s+)?([^(<]+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_SPAN_DIFF =
            Pattern.compile("class=[\"']span__title[\"']>Difficulty</span>\\s*<span>([0-9.]+)</span>", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_FALLBACK_DIFF =
            Pattern.compile("difficulty\\s*(?:of|is)?\\s*([1-5](?:\\.[05])?)", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_SPAN_TERR =
            Pattern.compile("class=[\"']span__title[\"']>Terrain</span>\\s*<span>([0-9.]+)</span>", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_FALLBACK_TERR =
            Pattern.compile("terrain\\s*(?:of|is)?\\s*([1-5](?:\\.[05])?)", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_CACHE_TYPE =
            Pattern.compile("(?:cacheTypeId\\s*=\\s*|types/|types\\.svg#icon-|wpttypes/)(\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_SIZE =
            Pattern.compile("class=[\"']span__title[\"']>Size</span>\\s*<span>([a-zA-Z]+)</span>|container/([a-zA-Z]+)\\.gif|Size\\s*:\\s*([a-zA-Z]+)|(?:A|a)\\s+([a-zA-Z]+)\\s+size\\s+geocache", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_FAVORITES =
            Pattern.compile("class=[\"']span__title[\"']>Favorite Points</span>\\s*<span>(\\d+)</span>", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_MAP_LAT_LNG =
            Pattern.compile("(?:mapLatLng\\s*=\\s*\\{[^}]*\"lat\":\\s*([-\\d.]+)[^}]*\"lng\":\\s*([-\\d.]+)|data-lat=[\"']([-\\d.]+)[\"'][^>]*data-lng=[\"']([-\\d.]+)[\"'])", Pattern.CASE_INSENSITIVE);
    private static final Pattern PATTERN_COORD_TEXT =
            Pattern.compile("([NS])\\s*(\\d+)[°\\s]+([\\d.]+)\\s+([EW])\\s*(\\d+)[°\\s]+([\\d.]+)", Pattern.CASE_INSENSITIVE);

    private GeocacheEnrichmentBridge() {
    }

    /**
     * Called when a LiteGeocache is converted to a LegacyGeocache in LegacyGeocacheRepo.loadGeocache.
     * Caches the in-memory representation so that fallback enrichment can use its exact coordinates,
     * difficulty, terrain, attributes, and size without re-querying SQLite.
     */
    public static void rememberLiteGeocache(Object legacyGeocache) {
        if (legacyGeocache == null) {
            return;
        }
        try {
            legacyGeocache = sanitizeLoadedCache(legacyGeocache);
            if (legacyGeocache == null) {
                return;
            }
            Field codeField = legacyGeocache.getClass().getField("code");
            String code = (String) codeField.get(legacyGeocache);
            if (code != null && !code.isEmpty()) {
                sRememberedLiteCaches.put(code.toUpperCase(), legacyGeocache);
            }
            if (sY82 != null) {
                cleanPoisonedCaches(sY82);
            }
        } catch (Throwable t) {
            Log.d(TAG, "rememberLiteGeocache error: " + t);
        }
    }

    /**
     * Intercepts fetchLegacyCacheFromServer failure in LegacyGeocacheRepo$fetchLegacyCacheFromServer$2.
     * When basic accounts get HTTP 403 Forbidden for traditional caches with D > 1.5 / T > 1.5 (or
     * non-traditional caches), scrapes the public webpage (where non-PMO cache descriptions and hints
     * are freely accessible) and constructs an enriched LegacyGeocache wrapped in Success (xk9).
     */
    public static Object onFetchFailed(Object suspendLambda, Object failure) {
        if (suspendLambda == null) {
            return failure;
        }
        try {
            if (!isForbiddenFailure(failure)) {
                return failure;
            }

            Class<?> lambdaClass = suspendLambda.getClass();
            Field nRepoField = lambdaClass.getField("N");
            Field mCodeField = lambdaClass.getField("M");
            Object repo = nRepoField.get(suspendLambda);
            String referenceCode = (String) mCodeField.get(suspendLambda);

            if (referenceCode == null || referenceCode.isEmpty()) {
                return failure;
            }
            String upperCode = referenceCode.toUpperCase();
            if (!PATTERN_GC_CODE.matcher(upperCode).matches()) {
                Log.w(TAG, "Invalid GC code format: " + referenceCode);
                return failure;
            }

            // Extract any logs or waypoints that succeeded in the parallel coroutine calls
            // In fetchLegacyCacheFromServer$2: H = logsCall, I = userWaypointsCall, J = additionalWaypointsCall
            Object logsObj = getFieldOrNull(lambdaClass, suspendLambda, "H");
            Object userWptObj = getFieldOrNull(lambdaClass, suspendLambda, "I");
            Object addWptObj = getFieldOrNull(lambdaClass, suspendLambda, "J");

            Object enriched = enrichGeocache(repo, upperCode, logsObj, addWptObj, userWptObj);
            if (enriched != null) {
                Class<?> xk9Class = Class.forName("xk9");
                Constructor<?> ctor = xk9Class.getDeclaredConstructor(Object.class);
                return ctor.newInstance(enriched);
            }
        } catch (Throwable t) {
            Log.e(TAG, "onFetchFailed enrichment failed", t);
        }
        return failure;
    }

    /**
     * Overload for direct repo + referenceCode call.
     */
    public static Object onFetchFailed(Object repo, String referenceCode, Object failure) {
        if (referenceCode == null || referenceCode.isEmpty() || repo == null) {
            return failure;
        }
        try {
            if (!isForbiddenFailure(failure)) {
                return failure;
            }
            String upperCode = referenceCode.toUpperCase();
            if (!PATTERN_GC_CODE.matcher(upperCode).matches()) {
                Log.w(TAG, "Invalid GC code format: " + referenceCode);
                return failure;
            }
            Object enriched = enrichGeocache(repo, upperCode, null, null, null);
            if (enriched != null) {
                Class<?> xk9Class = Class.forName("xk9");
                Constructor<?> ctor = xk9Class.getDeclaredConstructor(Object.class);
                return ctor.newInstance(enriched);
            }
        } catch (Throwable t) {
            Log.e(TAG, "onFetchFailed enrichment failed for " + referenceCode, t);
        }
        return failure;
    }

    /**
     * Sanitizes a LegacyGeocache loaded from y82 disk cache. If the cached object is missing
     * essential required fields (such as a null name or null cacheType, which can occur from
     * corrupted or incomplete previous writes), rejects it by returning null so the repository
     * falls back to the intact LiteGeocache database record.
     */
    public static Object sanitizeLoadedCache(Object legacyGeocache) {
        if (legacyGeocache == null) {
            return null;
        }
        try {
            Field nameField = legacyGeocache.getClass().getField("name");
            Object name = nameField.get(legacyGeocache);
            if (name == null || ((String) name).isEmpty()) {
                Log.w(TAG, "sanitizeLoadedCache: rejecting corrupted cache with null/empty name");
                cleanPoisonedFromCacheObject(legacyGeocache);
                return null;
            }
            Field cacheTypeField = legacyGeocache.getClass().getField("cacheType");
            if (cacheTypeField.get(legacyGeocache) == null) {
                Log.w(TAG, "sanitizeLoadedCache: rejecting corrupted cache with null cacheType");
                cleanPoisonedFromCacheObject(legacyGeocache);
                return null;
            }
            Field containerTypeField = legacyGeocache.getClass().getField("containerType");
            Object containerTypeObj = containerTypeField.get(legacyGeocache);
            if (containerTypeObj == null) {
                Log.w(TAG, "sanitizeLoadedCache: rejecting corrupted cache with null containerType");
                cleanPoisonedFromCacheObject(legacyGeocache);
                return null;
            }
            int cId = containerTypeObj.getClass().getField("containerTypeId").getInt(containerTypeObj);
            if (cId <= 0) {
                Log.w(TAG, "sanitizeLoadedCache: rejecting corrupted cache with invalid containerTypeId=" + cId);
                cleanPoisonedFromCacheObject(legacyGeocache);
                return null;
            }
            Field ownerField = legacyGeocache.getClass().getField("owner");
            Object owner = ownerField.get(legacyGeocache);
            if (owner != null) {
                Field usernameField = owner.getClass().getField("username");
                Object username = usernameField.get(owner);
                if (username == null || ((String) username).isEmpty()) {
                    Log.w(TAG, "sanitizeLoadedCache: rejecting corrupted cache with null owner username");
                    cleanPoisonedFromCacheObject(legacyGeocache);
                    return null;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "sanitizeLoadedCache check error", t);
        }

        try {
            Field codeField = legacyGeocache.getClass().getField("code");
            String code = (String) codeField.get(legacyGeocache);
            if (code != null) {
                Field shortDescField = legacyGeocache.getClass().getField("shortDescription");
                Object sd = shortDescField.get(legacyGeocache);
                if (sd instanceof String && ((String) sd).contains("Premium Member Only")) {
                    sPmoCacheCodes.add(code.toUpperCase());
                }
                Field longDescField = legacyGeocache.getClass().getField("longDescription");
                Object ld = longDescField.get(legacyGeocache);
                if (ld instanceof String) {
                    String formatted = formatPmoDescription((String) ld);
                    if (!formatted.equals(ld)) {
                        longDescField.setAccessible(true);
                        longDescField.set(legacyGeocache, formatted);
                        sPmoCacheCodes.add(code.toUpperCase());
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return legacyGeocache;
    }

    private static void cleanPoisonedFromCacheObject(Object legacyGeocache) {
        try {
            Field codeField = legacyGeocache.getClass().getField("code");
            String code = (String) codeField.get(legacyGeocache);
            if (sY82 != null) {
                cleanPoisonedCache(sY82, code);
            }
        } catch (Throwable ignored) {
        }
    }

    private static Object getFieldOrNull(Class<?> clazz, Object target, String name) {
        try {
            Field f = clazz.getField(name);
            return f.get(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isForbiddenFailure(Object failure) {
        if (failure == null) {
            return false;
        }
        try {
            Class<?> clazz = failure.getClass();
            Field aField = clazz.getField("a");
            Object err = aField.get(failure);
            if (err != null) {
                String errName = err.getClass().getName();
                if (errName.endsWith("$e$e") || errName.endsWith("$e$f") || err.toString().contains("Forbidden")) {
                    return true;
                }
            }
        } catch (Throwable t) {
            String s = failure.toString();
            return s != null && s.contains("Forbidden");
        }
        return false;
    }

    public static Object enrichGeocache(Object repo, String code, Object logsResult, Object addWptResult, Object userWptResult) {
        if (code == null || !PATTERN_GC_CODE.matcher(code).matches()) {
            Log.w(TAG, "enrichGeocache rejected invalid code: " + code);
            return null;
        }
        Object cached = sEnrichedCaches.get(code);
        if (cached != null) {
            return cached;
        }

        // 1. Look for base LegacyGeocache (from memory or DB)
        Object baseCache = sRememberedLiteCaches.get(code);
        if (baseCache != null) {
            baseCache = sanitizeLoadedCache(baseCache);
        }
        Object y82 = null;
        if (repo != null) {
            try {
                Field aField = repo.getClass().getField("a"); // Ly82;
                y82 = aField.get(repo);
                if (y82 != null) {
                    sY82 = y82;
                    cleanPoisonedCaches(y82);
                    if (baseCache == null) {
                        Method pMethod = y82.getClass().getMethod("p", String.class);
                        Object candidate = pMethod.invoke(y82, code);
                        baseCache = sanitizeLoadedCache(candidate);
                    }
                }
            } catch (Throwable ignored) {
            }
        }

        if (baseCache == null && repo != null) {
            baseCache = queryLiteGeocacheFromDb(repo, code);
            baseCache = sanitizeLoadedCache(baseCache);
        }

        // 2. Fetch and scrape public cache page
        ScrapedData scraped = scrapePublicCachePage(code);
        if (scraped == null) {
            Log.w(TAG, "Public cache enrichment unavailable for " + code);
            return null;
        }

        try {
            Object enriched;
            if (baseCache != null) {
                enriched = createEnrichedCopy(baseCache, scraped, logsResult, addWptResult, userWptResult);
            } else {
                enriched = createLegacyGeocacheFromScraped(scraped);
            }

            if (enriched != null) {
                if (y82 != null) {
                    saveEnrichedCacheToDb(y82, enriched);
                }
                sEnrichedCaches.put(code, enriched);
                return enriched;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to build enriched LegacyGeocache for " + code, t);
        }
        return null;
    }

    private static Object createEnrichedCopy(Object origCache, ScrapedData scraped, Object logsResult, Object addWptResult, Object userWptResult) throws Exception {
        Class<?> builderClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Builder");
        Object builder = builderClass.getDeclaredConstructor().newInstance();
        Class<?> cacheClass = origCache.getClass();

        copyField(cacheClass, origCache, builderClass, builder, "code", "c");
        copyField(cacheClass, origCache, builderClass, builder, "name", "x");
        copyField(cacheClass, origCache, builderClass, builder, "cacheType", "b");
        copyField(cacheClass, origCache, builderClass, builder, "containerType", "d");
        copyField(cacheClass, origCache, builderClass, builder, "dateCreated", "e");
        copyField(cacheClass, origCache, builderClass, builder, "dateLastUpdate", "f");
        copyField(cacheClass, origCache, builderClass, builder, "dateLastVisited", "g");
        copyField(cacheClass, origCache, builderClass, builder, "difficulty", "h");
        copyField(cacheClass, origCache, builderClass, builder, "favoritePoints", "j");
        copyField(cacheClass, origCache, builderClass, builder, "guid", "k");
        copyField(cacheClass, origCache, builderClass, builder, "hasBeenFavoritedByUser", "l");
        copyField(cacheClass, origCache, builderClass, builder, "isUnlockedForUser", "m");
        copyField(cacheClass, origCache, builderClass, builder, "id", "n");
        copyField(cacheClass, origCache, builderClass, builder, "isLocked", "o");
        builderClass.getField("p").set(builder, false); // Always false for local enrichment
        boolean isPublished = cacheClass.getField("isPublished").getBoolean(origCache);
        boolean available = cacheClass.getField("available").getBoolean(origCache);
        builderClass.getField("q").setBoolean(builder, isPublished);
        builderClass.getField("r").setBoolean(builder, available);
        copyField(cacheClass, origCache, builderClass, builder, "isHighlyFavorited", "s");
        copyField(cacheClass, origCache, builderClass, builder, "latitude", "t");
        copyField(cacheClass, origCache, builderClass, builder, "longitude", "w");
        copyField(cacheClass, origCache, builderClass, builder, "publishDateUtc", "z");
        copyField(cacheClass, origCache, builderClass, builder, "terrain", "C");
        copyField(cacheClass, origCache, builderClass, builder, "trackableCount", "D");
        copyField(cacheClass, origCache, builderClass, builder, "eventStartDateUtc", "E");
        copyField(cacheClass, origCache, builderClass, builder, "eventEndDateUtc", "F");
        copyField(cacheClass, origCache, builderClass, builder, "cacheTimeZone", "G");
        copyField(cacheClass, origCache, builderClass, builder, "utcPlaceDate", "H");
        copyField(cacheClass, origCache, builderClass, builder, "owner", "I");
        copyField(cacheClass, origCache, builderClass, builder, "lastModified", "J");
        copyField(cacheClass, origCache, builderClass, builder, "geoTourInfo", "R");
        copyField(cacheClass, origCache, builderClass, builder, "draftGuid", "L");
        copyField(cacheClass, origCache, builderClass, builder, "foundDate", "S");
        copyField(cacheClass, origCache, builderClass, builder, "dnfDate", "T");
        copyField(cacheClass, origCache, builderClass, builder, "willAttendDate", "U");
        copyField(cacheClass, origCache, builderClass, builder, "attributes", "Q");
        copyField(cacheClass, origCache, builderClass, builder, "a", "V");
        copyField(cacheClass, origCache, builderClass, builder, "unpublishedState", "W");
        copyField(cacheClass, origCache, builderClass, builder, "hasUncollectedShareable", "X");

        // Copy collections
        copyListField(cacheClass, origCache, builderClass, builder, "geocacheLogs", "M");
        copyListField(cacheClass, origCache, builderClass, builder, "additionalWaypoints", "N");
        copyListField(cacheClass, origCache, builderClass, builder, "userWaypoints", "O");
        copyListField(cacheClass, origCache, builderClass, builder, "images", "P");

        // If parallel coroutine logs or waypoints succeeded, add them
        extractAndAppendResultList(logsResult, builderClass, builder, "M");
        extractAndAppendResultList(addWptResult, builderClass, builder, "N");
        extractAndAppendResultList(userWptResult, builderClass, builder, "O");

        // Overwrite enriched fields from webpage
        builderClass.getField("K").set(builder, false); // isLite = false
        builderClass.getField("p").set(builder, false); // isPremium = false
        builderClass.getField("v").set(builder, Boolean.TRUE); // longDescriptionIsHtml
        builderClass.getField("B").set(builder, Boolean.TRUE); // shortDescriptionIsHtml

        String placedBy = (scraped != null && scraped.placedBy != null && !scraped.placedBy.isEmpty())
                ? scraped.placedBy
                : (String) cacheClass.getField("placedBy").get(origCache);
        builderClass.getField("y").set(builder, placedBy != null ? placedBy : "");

        String shortDesc = (scraped != null && scraped.shortDescription != null && !scraped.shortDescription.isEmpty())
                ? scraped.shortDescription
                : (scraped != null && scraped.isPmo ? "Premium Member Only Cache" : "");
        builderClass.getField("A").set(builder, shortDesc);

        String longDesc = (scraped != null && scraped.longDescription != null && !scraped.longDescription.isEmpty())
                ? scraped.longDescription
                : (scraped != null && scraped.isPmo ? "This is a Premium Member Only geocache. Basic cache information (coordinates, size, difficulty, terrain, owner) is unlocked by Local Premium." : "");
        builderClass.getField("u").set(builder, longDesc);

        String hints = (scraped != null && scraped.encodedHints != null && !scraped.encodedHints.isEmpty())
                ? scraped.encodedHints
                : (scraped != null && scraped.isPmo ? "Hints unavailable for Premium Member Only caches." : "");
        builderClass.getField("i").set(builder, hints);

        if (scraped != null && scraped.favoritePoints > 0) {
            builderClass.getField("j").set(builder, scraped.favoritePoints);
        }
        if (scraped != null && scraped.difficulty > 0) {
            builderClass.getField("h").set(builder, (double) scraped.difficulty);
        }
        if (scraped != null && scraped.terrain > 0) {
            builderClass.getField("C").set(builder, (double) scraped.terrain);
        }
        Object utcDate = cacheClass.getField("utcPlaceDate").get(origCache);
        if (utcDate == null) {
            builderClass.getField("H").set(builder, new Date());
        }
        Object createdDate = cacheClass.getField("dateCreated").get(origCache);
        if (createdDate == null) {
            builderClass.getField("e").set(builder, new Date());
        }
        // Ensure name is never null or empty
        String name = (String) cacheClass.getField("name").get(origCache);
        if (name == null || name.isEmpty()) {
            name = (scraped.name != null && !scraped.name.isEmpty()) ? scraped.name : (String) cacheClass.getField("code").get(origCache);
        }
        builderClass.getField("x").set(builder, name != null ? name : "");

        // Ensure cacheType is non-null
        Object cacheType = cacheClass.getField("cacheType").get(origCache);
        if (cacheType == null) {
            int cTypeId = (scraped != null && scraped.cacheTypeId > 0) ? scraped.cacheTypeId : 2;
            try {
                Class<?> cacheTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$CacheType");
                cacheType = cacheTypeClass.getDeclaredConstructor(String.class, int.class, String.class)
                        .newInstance("", cTypeId, "");
                builderClass.getField("b").set(builder, cacheType);
            } catch (Throwable ignored) {
            }
        }

        // Ensure containerType has valid ID > 0
        Object containerType = cacheClass.getField("containerType").get(origCache);
        int cTypeId = 0;
        if (containerType != null) {
            try {
                cTypeId = containerType.getClass().getField("containerTypeId").getInt(containerType);
            } catch (Throwable ignored) {
            }
        }
        if (cTypeId <= 0 && scraped != null && scraped.containerTypeId > 0) {
            cTypeId = scraped.containerTypeId;
        }
        if (cTypeId <= 0) {
            cTypeId = 1; // Default Not chosen - NEVER 0!
        }
        try {
            Class<?> containerTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$ContainerType");
            Object fixedContainerType = containerTypeClass.getDeclaredConstructor(int.class, String.class)
                    .newInstance(cTypeId, "");
            builderClass.getField("d").set(builder, fixedContainerType);
        } catch (Throwable ignored) {
        }
        // Ensure owner is non-null and owner.username is non-null
        Object owner = cacheClass.getField("owner").get(origCache);
        boolean validOwner = false;
        if (owner != null) {
            try {
                Object u = owner.getClass().getField("username").get(owner);
                if (u instanceof String && !((String) u).isEmpty()) {
                    validOwner = true;
                }
            } catch (Throwable ignored) {
            }
        }
        if (!validOwner) {
            try {
                Class<?> ownerClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Owner");
                String finalUsername = (placedBy != null && !placedBy.isEmpty()) ? placedBy : "Geocacher";
                Object newOwner;
                try {
                    newOwner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class, String.class)
                            .newInstance(finalUsername, "", "", "");
                } catch (NoSuchMethodException e) {
                    newOwner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class)
                            .newInstance(finalUsername, "", "");
                }
                builderClass.getField("I").set(builder, newOwner);
            } catch (Throwable ignored) {
            }
        }

        return cacheClass.getDeclaredConstructor(builderClass).newInstance(builder);
    }

    private static void copyField(Class<?> srcClass, Object src, Class<?> dstClass, Object dst, String srcField, String dstField) {
        try {
            Field s = srcClass.getField(srcField);
            Field d = dstClass.getField(dstField);
            d.set(dst, s.get(src));
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void copyListField(Class<?> srcClass, Object src, Class<?> dstClass, Object dst, String srcField, String dstField) {
        try {
            Field s = srcClass.getField(srcField);
            Field d = dstClass.getField(dstField);
            List srcList = (List) s.get(src);
            List dstList = (List) d.get(dst);
            if (srcList != null && dstList != null && dstList.isEmpty()) {
                dstList.addAll(srcList);
            }
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void extractAndAppendResultList(Object resultWrapper, Class<?> builderClass, Object builder, String dstField) {
        if (resultWrapper == null) return;
        try {
            Class<?> xk9Class = Class.forName("xk9");
            if (xk9Class.isInstance(resultWrapper)) {
                Field aField = xk9Class.getField("a");
                Object content = aField.get(resultWrapper);
                List listToAdd = null;
                if (content instanceof List) {
                    listToAdd = (List) content;
                } else if (content != null) {
                    Field subA = content.getClass().getField("a");
                    Object subObj = subA.get(content);
                    if (subObj instanceof List) {
                        listToAdd = (List) subObj;
                    }
                }
                if (listToAdd != null && !listToAdd.isEmpty()) {
                    Field dField = builderClass.getField(dstField);
                    List dstList = (List) dField.get(builder);
                    if (dstList != null) {
                        dstList.addAll(listToAdd);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void bindCacheSummaryWarning(View itemView, Object data) {
        if (itemView == null) return;
        try {
            View warningContainer = itemView.findViewWithTag("pmo_warning_container");
            if (warningContainer == null) {
                int resId = itemView.getResources().getIdentifier("pmo_warning_container", "id", itemView.getContext().getPackageName());
                if (resId != 0) {
                    warningContainer = itemView.findViewById(resId);
                }
            }
            if (warningContainer == null) return;

            String code = null;
            boolean isPmo = false;
            if (data != null) {
                try {
                    Field stubField = data.getClass().getField("a");
                    Object stub = stubField.get(data);
                    if (stub != null) {
                        try {
                            Field codeField = stub.getClass().getField("code");
                            Object c = codeField.get(stub);
                            if (c instanceof String) {
                                code = (String) c;
                            }
                        } catch (Throwable ignored) {
                        }
                        try {
                            Field premiumField = stub.getClass().getField("premium");
                            isPmo = premiumField.getBoolean(stub);
                        } catch (Throwable ignored) {
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Failed to resolve cache premium status for warning banner", t);
                }
            }
            if (code == null) {
                int codeResId = itemView.getResources().getIdentifier("textview_summary_cachecode", "id", itemView.getContext().getPackageName());
                if (codeResId != 0) {
                    View codeView = itemView.findViewById(codeResId);
                    if (codeView instanceof TextView) {
                        CharSequence txt = ((TextView) codeView).getText();
                        if (txt != null) {
                            code = txt.toString().trim();
                        }
                    }
                }
            }

            if (!isPmo && code != null) {
                isPmo = isCachePmo(code);
            }

            Log.i(TAG, "bindCacheSummaryWarning: code=" + code + ", isPmo=" + isPmo);
            if (!isPmo) {
                warningContainer.setVisibility(View.GONE);
                return;
            }

            warningContainer.setVisibility(View.VISIBLE);

            Context context = itemView.getContext();
            boolean isDark = isDarkMode(context);
            float density = context.getResources().getDisplayMetrics().density;

            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(8f * density);
            int strokeWidth = Math.max(1, Math.round(1f * density));

            if (isDark) {
                bg.setColor(Color.parseColor("#332211"));
                bg.setStroke(strokeWidth, Color.parseColor("#885522"));
            } else {
                bg.setColor(Color.parseColor("#FFF3E0"));
                bg.setStroke(strokeWidth, Color.parseColor("#FFB74D"));
            }
            warningContainer.setBackground(bg);

            View textView = warningContainer.findViewWithTag("pmo_warning_text");
            if (textView == null) {
                int textResId = itemView.getResources().getIdentifier("pmo_warning_text", "id", itemView.getContext().getPackageName());
                if (textResId != 0) {
                    textView = warningContainer.findViewById(textResId);
                }
            }
            if (textView instanceof TextView) {
                ((TextView) textView).setTextColor(
                        isDark ? Color.parseColor("#FFA726") : Color.parseColor("#B54B00")
                );
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to bind cache summary warning", t);
        }
    }

    public static boolean isCachePmo(String code) {
        if (code == null || code.isEmpty()) return false;
        String upper = code.toUpperCase();
        if (sPmoCacheCodes.contains(upper)) return true;
        Object enriched = sEnrichedCaches.get(upper);
        if (enriched != null) {
            try {
                Field shortDescField = enriched.getClass().getField("shortDescription");
                String sd = (String) shortDescField.get(enriched);
                if (sd != null && sd.contains("Premium Member Only")) {
                    sPmoCacheCodes.add(upper);
                    return true;
                }
                Field longDescField = enriched.getClass().getField("longDescription");
                String ld = (String) longDescField.get(enriched);
                if (ld != null && ld.contains("Premium Member Only")) {
                    sPmoCacheCodes.add(upper);
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        Object lite = sRememberedLiteCaches.get(upper);
        if (lite != null) {
            try {
                Field shortDescField = lite.getClass().getField("shortDescription");
                String sd = (String) shortDescField.get(lite);
                if (sd != null && sd.contains("Premium Member Only")) {
                    sPmoCacheCodes.add(upper);
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        if (sY82 != null) {
            try {
                SQLiteDatabase db = getDatabaseFromY82(sY82);
                if (db != null && db.isOpen()) {
                    Cursor c = db.rawQuery("SELECT ShortDescription, LongDescription FROM Geocache WHERE Code = ?", new String[]{upper});
                    if (c != null) {
                        try {
                            if (c.moveToFirst()) {
                                String sd = c.getString(0);
                                String ld = c.getString(1);
                                if ((sd != null && sd.contains("Premium Member Only")) ||
                                        (ld != null && ld.contains("Premium Member Only"))) {
                                    sPmoCacheCodes.add(upper);
                                    return true;
                                }
                            }
                        } finally {
                            c.close();
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static String formatPmoDescription(String desc) {
        if (desc == null || desc.isEmpty()) return desc;
        Matcher m = PATTERN_PMO_DESC_PREFIX.matcher(desc);
        if (m.find()) {
            String prefix = m.group(1).trim();
            String rest = m.group(2).trim();
            if (!rest.isEmpty() && !desc.contains("<br") && !desc.contains("\n\n")) {
                return prefix + "<br/><br/>\n\n" + rest;
            }
        }
        return desc;
    }

    private static boolean isDarkMode(Context context) {
        try {
            int nightMode = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return nightMode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object createLegacyGeocacheFromScraped(ScrapedData scraped) throws Exception {
        Class<?> builderClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Builder");
        Object builder = builderClass.getDeclaredConstructor().newInstance();
        Class<?> cacheClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache");

        builderClass.getField("c").set(builder, scraped.code);
        String name = (scraped.name != null && !scraped.name.isEmpty()) ? scraped.name : scraped.code;
        builderClass.getField("x").set(builder, name);
        String placedBy = scraped.placedBy != null ? scraped.placedBy : "";
        builderClass.getField("y").set(builder, placedBy);
        builderClass.getField("A").set(builder, scraped.shortDescription != null ? scraped.shortDescription : "");
        builderClass.getField("u").set(builder, scraped.longDescription != null ? scraped.longDescription : "");
        builderClass.getField("i").set(builder, scraped.encodedHints != null ? scraped.encodedHints : "");
        builderClass.getField("h").set(builder, scraped.difficulty > 0 ? (double) scraped.difficulty : 1.0);
        builderClass.getField("C").set(builder, scraped.terrain > 0 ? (double) scraped.terrain : 1.0);
        builderClass.getField("j").set(builder, scraped.favoritePoints);
        builderClass.getField("K").set(builder, false); // isLite = false
        builderClass.getField("p").set(builder, false); // isPremium = false
        builderClass.getField("r").set(builder, true);  // available = true
        builderClass.getField("q").set(builder, true);  // isPublished = true
        builderClass.getField("o").set(builder, false); // isLocked = false
        builderClass.getField("v").set(builder, Boolean.TRUE); // longDescriptionIsHtml
        builderClass.getField("B").set(builder, Boolean.TRUE); // shortDescriptionIsHtml
        builderClass.getField("t").set(builder, scraped.latitude);
        builderClass.getField("w").set(builder, scraped.longitude);

        Date placeDate = new Date();
        builderClass.getField("H").set(builder, placeDate); // utcPlaceDate - MUST BE NON-NULL!
        builderClass.getField("e").set(builder, placeDate); // dateCreated
        builderClass.getField("f").set(builder, placeDate); // dateLastUpdate
        // Build LatLng
        try {
            Class<?> latLngClass = Class.forName("com.google.android.gms.maps.model.LatLng");
            Object latLng = latLngClass.getDeclaredConstructor(double.class, double.class)
                    .newInstance(scraped.latitude, scraped.longitude);
            builderClass.getField("V").set(builder, latLng);
        } catch (Throwable ignored) {
        }

        // Build CacheType
        try {
            Class<?> cacheTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$CacheType");
            int cTypeId = scraped.cacheTypeId > 0 ? scraped.cacheTypeId : 2;
            Object cacheTypeObj = cacheTypeClass.getDeclaredConstructor(String.class, int.class, String.class)
                    .newInstance("", cTypeId, "");
            builderClass.getField("b").set(builder, cacheTypeObj);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create CacheType", t);
        }

        // Build ContainerType
        try {
            Class<?> containerTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$ContainerType");
            int containerId = scraped.containerTypeId > 0 ? scraped.containerTypeId : 1;
            Object containerTypeObj = containerTypeClass.getDeclaredConstructor(int.class, String.class)
                    .newInstance(containerId, "");
            builderClass.getField("d").set(builder, containerTypeObj);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create ContainerType", t);
        }
        // Build Owner
        try {
            Class<?> ownerClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Owner");
            String finalUsername = !placedBy.isEmpty() ? placedBy : "Geocacher";
            Object owner;
            try {
                owner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class, String.class)
                        .newInstance(finalUsername, "", "", "");
            } catch (NoSuchMethodException e) {
                owner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class)
                        .newInstance(finalUsername, "", "");
            }
            builderClass.getField("I").set(builder, owner);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create Owner", t);
        }

        return cacheClass.getDeclaredConstructor(builderClass).newInstance(builder);
    }

    private static Object queryLiteGeocacheFromDb(Object repo, String code) {
        try {
            Field fField = repo.getClass().getField("f"); // com.groundspeak.geocaching.intro.geocache.a
            Object geocacheA = fField.get(repo);
            Field dbField = geocacheA.getClass().getField("a"); // GeoDatabase
            Object geoDb = dbField.get(geocacheA);

            Method iMethod = geoDb.getClass().getMethod("i");
            Object helper = iMethod.invoke(geoDb);
            Method k0Method = helper.getClass().getMethod("k0");
            Object sdb = k0Method.invoke(helper);
            Field rawDbField = sdb.getClass().getDeclaredField("A");
            rawDbField.setAccessible(true);
            SQLiteDatabase db = (SQLiteDatabase) rawDbField.get(sdb);

            Cursor cursor = db.rawQuery("SELECT * FROM lite_geocaches WHERE refCode = ?", new String[]{code});
            if (cursor != null) {
                try {
                    if (cursor.moveToFirst()) {
                        return buildLegacyCacheFromLiteCursor(cursor);
                    }
                } finally {
                    cursor.close();
                }
            }
        } catch (Throwable t) {
            Log.d(TAG, "queryLiteGeocacheFromDb error: " + t);
        }
        return null;
    }

    private static Object buildLegacyCacheFromLiteCursor(Cursor cursor) throws Exception {
        Class<?> builderClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Builder");
        Object builder = builderClass.getDeclaredConstructor().newInstance();
        Class<?> cacheClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache");

        String refCode = getCursorString(cursor, "refCode");
        String name = getCursorString(cursor, "name");
        if (name == null || name.isEmpty()) {
            name = refCode;
        }
        double diff = getCursorDouble(cursor, "difficulty");
        double terr = getCursorDouble(cursor, "terrain");
        int fav = getCursorInt(cursor, "favoritePoints");
        int track = getCursorInt(cursor, "trackableCount");
        long placedDate = getCursorLong(cursor, "placedDate");
        int cacheType = getCursorInt(cursor, "cacheType");
        int containerType = getCursorInt(cursor, "containerType");
        double lat = getCursorDouble(cursor, "latitude");
        double lng = getCursorDouble(cursor, "longitude");
        String placedBy = getCursorString(cursor, "placedBy");
        String ownerUsername = getCursorString(cursor, "owner_username");
        String ownerRefCode = getCursorString(cursor, "owner_referenceCode");

        builderClass.getField("c").set(builder, refCode);
        builderClass.getField("x").set(builder, name);
        builderClass.getField("h").set(builder, diff > 0 ? diff : 1.0);
        builderClass.getField("C").set(builder, terr > 0 ? terr : 1.0);
        builderClass.getField("j").set(builder, fav);
        builderClass.getField("D").set(builder, track);
        builderClass.getField("t").set(builder, lat);
        builderClass.getField("w").set(builder, lng);
        builderClass.getField("y").set(builder, placedBy != null && !placedBy.isEmpty() ? placedBy : (ownerUsername != null ? ownerUsername : ""));
        if (placedDate > 0) {
            Date d = new Date(placedDate);
            builderClass.getField("e").set(builder, d);
            builderClass.getField("H").set(builder, d);
        }
        builderClass.getField("r").set(builder, true);
        builderClass.getField("q").set(builder, true);
        builderClass.getField("p").set(builder, false);
        builderClass.getField("K").set(builder, false);
        // Build CacheType
        try {
            Class<?> cacheTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$CacheType");
            Object cacheTypeObj = cacheTypeClass.getDeclaredConstructor(String.class, int.class, String.class)
                    .newInstance("", cacheType > 0 ? cacheType : 2, "");
            builderClass.getField("b").set(builder, cacheTypeObj);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create CacheType", t);
        }

        // Build ContainerType
        try {
            Class<?> containerTypeClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$ContainerType");
            int cId = containerType > 0 ? containerType : 1;
            Object containerTypeObj = containerTypeClass.getDeclaredConstructor(int.class, String.class)
                    .newInstance(cId, "");
            builderClass.getField("d").set(builder, containerTypeObj);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create ContainerType", t);
        }

        // Build LatLng
        try {
            Class<?> latLngClass = Class.forName("com.google.android.gms.maps.model.LatLng");
            Object latLng = latLngClass.getDeclaredConstructor(double.class, double.class).newInstance(lat, lng);
            builderClass.getField("V").set(builder, latLng);
        } catch (Throwable ignored) {
        }

        // Build Owner
        try {
            Class<?> ownerClass = Class.forName("com.groundspeak.geocaching.intro.types.LegacyGeocache$Owner");
            String finalUsername = (ownerUsername != null && !ownerUsername.isEmpty())
                    ? ownerUsername
                    : (placedBy != null && !placedBy.isEmpty() ? placedBy : "Geocacher");
            Object owner;
            try {
                owner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class, String.class)
                        .newInstance(finalUsername, "", "", ownerRefCode != null ? ownerRefCode : "");
            } catch (NoSuchMethodException e) {
                owner = ownerClass.getDeclaredConstructor(String.class, String.class, String.class)
                        .newInstance(finalUsername, "", "");
            }
            builderClass.getField("I").set(builder, owner);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create Owner", t);
        }

        return cacheClass.getDeclaredConstructor(builderClass).newInstance(builder);
    }

    private static String getCursorString(Cursor c, String col) {
        int idx = c.getColumnIndex(col);
        return idx >= 0 ? c.getString(idx) : null;
    }

    private static double getCursorDouble(Cursor c, String col) {
        int idx = c.getColumnIndex(col);
        return idx >= 0 ? c.getDouble(idx) : 0.0;
    }

    private static int getCursorInt(Cursor c, String col) {
        int idx = c.getColumnIndex(col);
        return idx >= 0 ? c.getInt(idx) : 0;
    }

    private static long getCursorLong(Cursor c, String col) {
        int idx = c.getColumnIndex(col);
        return idx >= 0 ? c.getLong(idx) : 0L;
    }

    private static void saveEnrichedCacheToDb(Object y82, Object enriched) {
        if (y82 == null || enriched == null) return;
        try {
            SQLiteDatabase db = getDatabaseFromY82(y82);
            if (db == null || db.isReadOnly()) return;

            Class<?> clazz = enriched.getClass();
            String code = (String) clazz.getField("code").get(enriched);
            if (code == null || code.isEmpty()) return;

            String name = (String) clazz.getField("name").get(enriched);
            if (name == null || name.isEmpty()) {
                name = code;
            }
            double diff = clazz.getField("difficulty").getDouble(enriched);
            double terr = clazz.getField("terrain").getDouble(enriched);
            int fav = clazz.getField("favoritePoints").getInt(enriched);
            int track = clazz.getField("trackableCount").getInt(enriched);
            double lat = clazz.getField("latitude").getDouble(enriched);
            double lng = clazz.getField("longitude").getDouble(enriched);
            String placedBy = (String) clazz.getField("placedBy").get(enriched);
            String shortDesc = (String) clazz.getField("shortDescription").get(enriched);
            String longDesc = (String) clazz.getField("longDescription").get(enriched);
            String hints = (String) clazz.getField("encodedHints").get(enriched);

            Object cacheTypeObj = clazz.getField("cacheType").get(enriched);
            int cacheTypeId = 2; // Default Traditional
            if (cacheTypeObj != null) {
                try {
                    cacheTypeId = cacheTypeObj.getClass().getField("geocacheTypeId").getInt(cacheTypeObj);
                } catch (Throwable ignored) {
                }
            }

            Object containerTypeObj = clazz.getField("containerType").get(enriched);
            int containerTypeId = 1; // Default 1 (Not chosen)
            if (containerTypeObj != null) {
                try {
                    int cid = containerTypeObj.getClass().getField("containerTypeId").getInt(containerTypeObj);
                    if (cid > 0) {
                        containerTypeId = cid;
                    }
                } catch (Throwable ignored) {
                }
            }
            Object ownerObj = clazz.getField("owner").get(enriched);
            String ownerName = placedBy != null ? placedBy : "";
            String ownerGuid = "";
            String ownerRefCode = "";
            String ownerAvatarUrl = "";
            if (ownerObj != null) {
                try {
                    String u = (String) ownerObj.getClass().getField("username").get(ownerObj);
                    if (u != null && !u.isEmpty()) ownerName = u;
                    String g = (String) ownerObj.getClass().getField("publicGuid").get(ownerObj);
                    if (g != null) ownerGuid = g;
                    String r = (String) ownerObj.getClass().getField("refCode").get(ownerObj);
                    if (r != null) ownerRefCode = r;
                    String a = (String) ownerObj.getClass().getField("avatarUrl").get(ownerObj);
                    if (a != null) ownerAvatarUrl = a;
                } catch (Throwable ignored) {
                }
            }

            ContentValues cv = new ContentValues();
            cv.put("Code", code);
            cv.put("Name", name);
            cv.put("Difficulty", diff > 0 ? diff : 1.0);
            cv.put("Terrain", terr > 0 ? terr : 1.0);
            cv.put("FavoritePoints", fav);
            cv.put("TrackableCount", track);
            cv.put("Latitude", lat);
            cv.put("Longitude", lng);
            cv.put("PlacedBy", placedBy != null ? placedBy : ownerName);
            cv.put("CacheTypeID", cacheTypeId);
            cv.put("ContainerTypeId", containerTypeId);
            cv.put("OwnerName", ownerName);
            cv.put("OwnerGuid", ownerGuid);
            cv.put("OwnerRefCode", ownerRefCode);
            cv.put("OwnerAvatarUrl", ownerAvatarUrl);
            cv.put("ShortDescription", shortDesc != null ? shortDesc : "");
            cv.put("ShortDescriptionIsHtml", 1);
            cv.put("LongDescription", longDesc != null ? longDesc : "");
            cv.put("LongDescriptionIsHtml", 1);
            cv.put("EncodedHints", hints != null ? hints : "");
            cv.put("IsLite", 0);
            boolean available = clazz.getField("available").getBoolean(enriched);
            boolean isPublished = clazz.getField("isPublished").getBoolean(enriched);
            cv.put("Available", available ? 1 : 0);
            cv.put("Published", isPublished ? 1 : 0);
            cv.put("IsPremium", 0);
            cv.put("IsLocked", 0);
            cv.put("LastModified", System.currentTimeMillis());

            int rowsUpdated = db.update("Geocache", cv, "Code = ?", new String[]{code});
            if (rowsUpdated <= 0) {
                db.insertWithOnConflict("Geocache", null, cv, SQLiteDatabase.CONFLICT_REPLACE);
            }

            // Also clean up any poisoned rows
            db.delete("Geocache", "Name IS NULL OR Name = '' OR ContainerTypeId <= 0", null);
            Log.i(TAG, "Successfully persisted fully enriched cache " + code + " into Geocache table");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to persist enriched cache into y82", t);
        }
    }

    public static void cleanPoisonedCaches(Object y82) {
        if (y82 == null) return;
        try {
            SQLiteDatabase db = getDatabaseFromY82(y82);
            if (db != null && !db.isReadOnly()) {
                int count = db.delete("Geocache", "Name IS NULL OR Name = '' OR ContainerTypeId <= 0", null);
                if (count > 0) {
                    Log.i(TAG, "Cleaned " + count + " poisoned cache rows from Geocache table");
                }
            }
        } catch (Throwable t) {
            Log.d(TAG, "cleanPoisonedCaches error: " + t);
        }
    }

    public static void cleanPoisonedCache(Object y82, String code) {
        if (y82 == null) return;
        try {
            SQLiteDatabase db = getDatabaseFromY82(y82);
            if (db != null && !db.isReadOnly()) {
                if (code != null && !code.isEmpty()) {
                    db.delete("Geocache", "Code = ? AND (Name IS NULL OR Name = '' OR ContainerTypeId <= 0)", new String[]{code});
                }
                db.delete("Geocache", "Name IS NULL OR Name = '' OR ContainerTypeId <= 0", null);
            }
        } catch (Throwable t) {
            Log.d(TAG, "cleanPoisonedCache error: " + t);
        }
    }

    private static SQLiteDatabase getDatabaseFromY82(Object y82) {
        if (y82 == null) return null;
        try {
            if (y82 instanceof SQLiteOpenHelper) {
                return ((SQLiteOpenHelper) y82).getWritableDatabase();
            }
            Method getDbMethod = y82.getClass().getMethod("getWritableDatabase");
            return (SQLiteDatabase) getDbMethod.invoke(y82);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to get database from y82", t);
            return null;
        }
    }

    private static ScrapedData scrapePublicCachePage(String code) {
        if (code == null || !PATTERN_GC_CODE.matcher(code).matches()) {
            Log.w(TAG, "Invalid GC code format for scraping: " + code);
            return null;
        }
        HttpURLConnection conn = null;
        try {
            URL currentUrl = new URL("https://www.geocaching.com/geocache/" + code);
            int redirects = 0;
            int respCode = 0;
            while (redirects < 5) {
                conn = (HttpURLConnection) currentUrl.openConnection();
                conn.setRequestMethod("GET");
                conn.setConnectTimeout(8000);
                conn.setReadTimeout(8000);
                conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14; Mobile; rv:128.0) Gecko/128.0 Firefox/128.0");
                try {
                    String cookie = CookieManager.getInstance().getCookie("https://www.geocaching.com");
                    if (cookie != null && !cookie.isEmpty()) {
                        conn.setRequestProperty("Cookie", cookie);
                    }
                } catch (Throwable ignored) {
                }
                conn.setInstanceFollowRedirects(true);
                respCode = conn.getResponseCode();
                if (respCode >= 300 && respCode < 400) {
                    String location = conn.getHeaderField("Location");
                    if (location != null && !location.isEmpty()) {
                        currentUrl = new URL(currentUrl, location);
                        conn.disconnect();
                        conn = null;
                        redirects++;
                        continue;
                    }
                }
                break;
            }

            if (respCode != 200 || conn == null) {
                Log.w(TAG, "Public cache page returned HTTP " + respCode + " for " + code);
                return null;
            }
            InputStream in = conn.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
            }
            reader.close();
            String html = sb.toString();
            boolean isPmo = PATTERN_PMO_FLAG.matcher(html).find() || PATTERN_PMO_ELEMENT.matcher(html).find();

            ScrapedData data = new ScrapedData();
            data.code = code;
            data.isPmo = isPmo;

            Matcher mOwner = PATTERN_OWNER.matcher(html);
            if (mOwner.find()) {
                data.placedBy = unescapeHtml(mOwner.group(1).trim());
            } else {
                Matcher mOwnerPlain = PATTERN_OWNER_PLAIN.matcher(html);
                if (mOwnerPlain.find()) {
                    String o = mOwnerPlain.group(1) != null ? mOwnerPlain.group(1) : mOwnerPlain.group(2);
                    data.placedBy = unescapeHtml(o.trim());
                }
            }

            Matcher mName = PATTERN_NAME.matcher(html);
            if (mName.find()) {
                data.name = unescapeHtml(mName.group(1).trim());
            } else {
                Matcher mOgTitle = PATTERN_META_OG_TITLE.matcher(html);
                if (mOgTitle.find()) {
                    String t = mOgTitle.group(1) != null ? mOgTitle.group(1) : mOgTitle.group(2);
                    data.name = unescapeHtml(t.trim());
                } else {
                    Matcher mTitleTag = PATTERN_TITLE_TAG.matcher(html);
                    if (mTitleTag.find()) {
                        data.name = unescapeHtml(mTitleTag.group(1).trim());
                    }
                }
            }

            Matcher mDiffSpan = PATTERN_SPAN_DIFF.matcher(html);
            if (mDiffSpan.find()) {
                try {
                    data.difficulty = Float.parseFloat(mDiffSpan.group(1));
                } catch (Throwable ignored) {
                }
            } else {
                Matcher mDiffFallback = PATTERN_FALLBACK_DIFF.matcher(html);
                if (mDiffFallback.find()) {
                    try {
                        data.difficulty = Float.parseFloat(mDiffFallback.group(1));
                    } catch (Throwable ignored) {
                    }
                }
            }

            Matcher mTerrSpan = PATTERN_SPAN_TERR.matcher(html);
            if (mTerrSpan.find()) {
                try {
                    data.terrain = Float.parseFloat(mTerrSpan.group(1));
                } catch (Throwable ignored) {
                }
            } else {
                Matcher mTerrFallback = PATTERN_FALLBACK_TERR.matcher(html);
                if (mTerrFallback.find()) {
                    try {
                        data.terrain = Float.parseFloat(mTerrFallback.group(1));
                    } catch (Throwable ignored) {
                    }
                }
            }

            Matcher mCacheType = PATTERN_CACHE_TYPE.matcher(html);
            if (mCacheType.find()) {
                try {
                    data.cacheTypeId = Integer.parseInt(mCacheType.group(1));
                } catch (Throwable ignored) {
                }
            }
            if (data.cacheTypeId <= 0) {
                data.cacheTypeId = 2; // Default Traditional
            }

            Matcher mSize = PATTERN_SIZE.matcher(html);
            if (mSize.find()) {
                String sizeStr = null;
                for (int g = 1; g <= mSize.groupCount(); g++) {
                    if (mSize.group(g) != null) {
                        sizeStr = mSize.group(g).toLowerCase();
                        break;
                    }
                }
                if (sizeStr != null) {
                    if (sizeStr.contains("micro")) data.containerTypeId = 2;
                    else if (sizeStr.contains("small")) data.containerTypeId = 8;
                    else if (sizeStr.contains("regular")) data.containerTypeId = 3;
                    else if (sizeStr.contains("large")) data.containerTypeId = 4;
                    else if (sizeStr.contains("virtual")) data.containerTypeId = 5;
                    else if (sizeStr.contains("other")) data.containerTypeId = 6;
                }
            }
            if (data.containerTypeId <= 0) {
                data.containerTypeId = 1; // Default Not chosen - NEVER 0!
            }

            Matcher mFav = PATTERN_FAVORITES.matcher(html);
            if (mFav.find()) {
                try {
                    data.favoritePoints = Integer.parseInt(mFav.group(1));
                } catch (Throwable ignored) {
                }
            }

            Matcher mShort = PATTERN_SHORT_DESC.matcher(html);
            if (mShort.find()) {
                data.shortDescription = mShort.group(1).trim();
            } else {
                Matcher mShortFallback = PATTERN_SHORT_DESC_FALLBACK.matcher(html);
                data.shortDescription = mShortFallback.find() ? mShortFallback.group(1).trim() : "";
            }

            Matcher mLong = PATTERN_LONG_DESC.matcher(html);
            if (mLong.find()) {
                data.longDescription = mLong.group(1).trim();
            } else {
                Matcher mLongFallback = PATTERN_LONG_DESC_FALLBACK.matcher(html);
                if (mLongFallback.find()) {
                    data.longDescription = mLongFallback.group(1).trim();
                } else if (isPmo) {
                    Matcher mOgDesc = PATTERN_META_OG_DESC.matcher(html);
                    if (mOgDesc.find()) {
                        String desc = mOgDesc.group(1) != null ? mOgDesc.group(1) : mOgDesc.group(2);
                        data.longDescription = formatPmoDescription(unescapeHtml(desc.trim()));
                    } else {
                        data.longDescription = "Premium Member Only geocache. Basic metadata unlocked via Local Premium.";
                    }
                } else {
                    data.longDescription = "";
                }
            }
            if (isPmo && (data.shortDescription == null || data.shortDescription.isEmpty())) {
                data.shortDescription = "Premium Member Only Cache";
            }

            Matcher mHint = PATTERN_HINT.matcher(html);
            if (mHint.find()) {
                data.encodedHints = cleanHint(mHint.group(1));
            } else {
                data.encodedHints = isPmo ? "Hints unavailable for Premium Member Only caches." : "";
            }

            Matcher mMapLatLng = PATTERN_MAP_LAT_LNG.matcher(html);
            if (mMapLatLng.find()) {
                try {
                    String latStr = mMapLatLng.group(1) != null ? mMapLatLng.group(1) : mMapLatLng.group(3);
                    String lngStr = mMapLatLng.group(2) != null ? mMapLatLng.group(2) : mMapLatLng.group(4);
                    data.latitude = Double.parseDouble(latStr);
                    data.longitude = Double.parseDouble(lngStr);
                } catch (Throwable ignored) {
                }
            } else {
                Matcher mCoordText = PATTERN_COORD_TEXT.matcher(html);
                if (mCoordText.find()) {
                    try {
                        String ns = mCoordText.group(1).toUpperCase();
                        double latDeg = Double.parseDouble(mCoordText.group(2));
                        double latMin = Double.parseDouble(mCoordText.group(3));
                        double lat = latDeg + (latMin / 60.0);
                        if ("S".equals(ns)) lat = -lat;

                        String ew = mCoordText.group(4).toUpperCase();
                        double lngDeg = Double.parseDouble(mCoordText.group(5));
                        double lngMin = Double.parseDouble(mCoordText.group(6));
                        double lng = lngDeg + (lngMin / 60.0);
                        if ("W".equals(ew)) lng = -lng;

                        data.latitude = lat;
                        data.longitude = lng;
                    } catch (Throwable ignored) {
                    }
                }
            }

            if (data.isPmo && code != null) {
                sPmoCacheCodes.add(code.toUpperCase());
            }
            return data;
        } catch (Throwable t) {
            Log.e(TAG, "Error scraping geocache " + code, t);
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static String cleanHint(String rawHint) {
        if (rawHint == null || rawHint.isEmpty()) {
            return "";
        }
        // Normalize literal and escaped <br> tags to line breaks before stripping remaining tags
        String hint = rawHint.replaceAll("(?i)<br\\s*/?>|&lt;br\\s*/?&gt;", "\n");
        // Remove any other HTML tags
        hint = hint.replaceAll("<[^>]+>", "");
        // Unescape HTML entities
        hint = unescapeHtml(hint);
        // Normalize carriage returns and trim
        hint = hint.replace("\r\n", "\n").replace('\r', '\n');
        return hint.trim();
    }

    private static String unescapeHtml(String input) {
        if (input == null || input.isEmpty()) {
            return "";
        }
        String s = input.replace("&amp;", "&")
                .replace("&quot;", "\"")
                .replace("&apos;", "'")
                .replace("&#39;", "'")
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&nbsp;", " ");
        if (s.contains("&#")) {
            Matcher m = Pattern.compile("&#(\\d+);").matcher(s);
            StringBuffer sb = new StringBuffer();
            while (m.find()) {
                try {
                    int codePoint = Integer.parseInt(m.group(1));
                    m.appendReplacement(sb, Matcher.quoteReplacement(new String(Character.toChars(codePoint))));
                } catch (Exception e) {
                    m.appendReplacement(sb, m.group(0));
                }
            }
            m.appendTail(sb);
            s = sb.toString();
        }
        return s;
    }

    private static final class ScrapedData {
        String code;
        String name;
        String placedBy;
        String shortDescription;
        String longDescription;
        String encodedHints;
        float difficulty;
        float terrain;
        int cacheTypeId;
        int containerTypeId;
        int favoritePoints;
        double latitude;
        double longitude;
        boolean isPmo;
}
}
