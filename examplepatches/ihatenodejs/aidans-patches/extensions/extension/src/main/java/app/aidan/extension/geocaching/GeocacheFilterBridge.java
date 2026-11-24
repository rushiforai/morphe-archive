package app.aidan.extension.geocaching;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class GeocacheFilterBridge {
    private static final String TAG = "GeocacheFilterBridge";

    private static volatile List sMasterMapItems = Collections.emptyList();

    private GeocacheFilterBridge() {
    }

    /**
     * Sanitizes the filter preferences model (so3) built by FilterPreferences.h (to3.h).
     */
    public static Object sanitizeFilterModel(Object filterModel) {
        if (filterModel == null) {
            return null;
        }
        try {
            Class<?> clazz = filterModel.getClass();

            // Field f: hideMyFinds (Boolean)
            setNullIfFalse(clazz, filterModel, "f");
            // Field g: hideMyCaches (Boolean)
            setNullIfFalse(clazz, filterModel, "g");
            // Field h: emptyGridsOnly (Boolean)
            setNullIfFalse(clazz, filterModel, "h");
            // Field i: containsTrackablesOnly (Boolean)
            setNullIfFalse(clazz, filterModel, "i");
            // Field j: hasShareableItem (Boolean)
            setNullIfFalse(clazz, filterModel, "j");

            // Field k: minFavorites (Integer) -> null if <= 0
            Field kField = getDeclaredField(clazz, "k");
            if (kField != null) {
                Object val = kField.get(filterModel);
                if (val instanceof Number && ((Number) val).intValue() <= 0) {
                    kField.set(filterModel, null);
                }
            }

            // Field l: includeOwnedDisabledCaches (Boolean) -> always null for basic accounts
            Field lField = getDeclaredField(clazz, "l");
            if (lField != null) {
                lField.set(filterModel, null);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error sanitizing filterModel", t);
        }
        return filterModel;
    }

    /**
     * Updates the master list of all map items from the database/search and applies active filters.
     */
    public static synchronized List updateAndFilterMapItems(List items) {
        if (items != null && !items.isEmpty()) {
            sMasterMapItems = new ArrayList(items);
        }
        return filterMapItems(items);
    }

    /**
     * Reapplies active filters to the master list when filters change or when the map resumes.
     */
    public static synchronized List reapplyFilters(List currentList) {
        List source = (sMasterMapItems != null && !sMasterMapItems.isEmpty()) ? sMasterMapItems : currentList;
        return filterMapItems(source);
    }

    /**
     * Filters map items (MapItem / Luq8 / Ltq8) against the user's currently active filter criteria.
     */
    public static List filterMapItems(List items) {
        Object filterModel = getCurrentFilterModel();
        return filterMapItems(items, filterModel);
    }

    /**
     * Core filtering routine for map items against the given FilterModel (ck3).
     */
    public static List filterMapItems(List items, Object filterModel) {
        if (items == null || items.isEmpty() || filterModel == null) {
            return items;
        }

        try {
            // 1. CacheTypes filter (field a)
            List allTypesList = getListField(filterModel, "a");
            List<Integer> activeTypeIds = extractActiveIds(allTypesList);

            // 2. CacheSizes filter (field e)
            List allSizesList = getListField(filterModel, "e");
            List<Integer> activeSizeIds = extractActiveIds(allSizesList);

            // 3. Difficulty ratings (field c -> fk7.a)
            List<Float> activeDifficulties = extractFloatList(filterModel, "c");

            // 4. Terrain ratings (field d -> fk7.a)
            List<Float> activeTerrains = extractFloatList(filterModel, "d");

            // 5. Min favorites (field k)
            Integer minFavPoints = (Integer) getFieldValue(filterModel, "k");

            // 6. Hide my finds (field f)
            Boolean hideMyFinds = (Boolean) getFieldValue(filterModel, "f");

            // 7. Hide my caches (field g)
            Boolean hideMyCaches = (Boolean) getFieldValue(filterModel, "g");
            String username = (Boolean.TRUE.equals(hideMyCaches)) ? getCurrentUsername() : null;

            // Check if any filters are active
            boolean hasTypeFilter = activeTypeIds != null && allTypesList != null &&
                activeTypeIds.size() < allTypesList.size() && !activeTypeIds.isEmpty();
            boolean hasSizeFilter = activeSizeIds != null && allSizesList != null &&
                activeSizeIds.size() < allSizesList.size() && !activeSizeIds.isEmpty();
            boolean hasDiffFilter = activeDifficulties != null && !activeDifficulties.isEmpty() &&
                activeDifficulties.size() < 9;
            boolean hasTerrainFilter = activeTerrains != null && !activeTerrains.isEmpty() &&
                activeTerrains.size() < 9;
            boolean hasFavFilter = minFavPoints != null && minFavPoints.intValue() > 0;
            boolean hasFindsFilter = Boolean.TRUE.equals(hideMyFinds);
            boolean hasOwnFilter = Boolean.TRUE.equals(hideMyCaches) && username != null;

            if (!hasTypeFilter && !hasSizeFilter && !hasDiffFilter && !hasTerrainFilter &&
                !hasFavFilter && !hasFindsFilter && !hasOwnFilter) {
                return items;
            }

            ArrayList filtered = new ArrayList(items.size());
            for (Object item : items) {
                if (item == null) continue;
                if (matchesFilter(item, hasTypeFilter, activeTypeIds,
                                  hasSizeFilter, activeSizeIds,
                                  hasDiffFilter, activeDifficulties,
                                  hasTerrainFilter, activeTerrains,
                                  hasFavFilter, minFavPoints,
                                  hasFindsFilter, hasOwnFilter, username)) {
                    filtered.add(item);
                }
            }
            Log.i(TAG, "Locally filtered " + items.size() + " items -> " + filtered.size() +
                " remaining (activeTypes=" + (hasTypeFilter ? activeTypeIds : "ALL") +
                ", hasDiff=" + hasDiffFilter + ", hasTerrain=" + hasTerrainFilter +
                ", hasSize=" + hasSizeFilter + ")");
            return filtered;
        } catch (Throwable t) {
            Log.e(TAG, "Error in filterMapItems", t);
            return items;
        }
    }


    private static boolean matchesFilter(Object item,
                                         boolean hasTypeFilter, List<Integer> activeTypeIds,
                                         boolean hasSizeFilter, List<Integer> activeSizeIds,
                                         boolean hasDiffFilter, List<Float> activeDifficulties,
                                         boolean hasTerrainFilter, List<Float> activeTerrains,
                                         boolean hasFavFilter, Integer minFavPoints,
                                         boolean hasFindsFilter, boolean hasOwnFilter, String username) {
        String className = item.getClass().getName();

        // 1. Handle Adventure (Ltq8)
        if (className.endsWith("tq8")) {
            if (hasTypeFilter) {
                // Adventure Lab cache typeId is 1304 (or LAB = -1)
                if (!activeTypeIds.contains(1304) && !activeTypeIds.contains(-1)) {
                    return false;
                }
            }
            // Adventures have no container size, difficulty, terrain, or favorite points
            if (hasSizeFilter || hasDiffFilter || hasTerrainFilter || hasFavFilter) {
                return false;
            }
            return true;
        }

        // 2. Handle MapItem (Luq8 -> gf6 -> Lif6) or direct Lif6 / LiteGeocache
        Object target = item;
        Object gf6Obj = null;
        if (className.endsWith("uq8")) {
            target = getFieldValue(item, "a"); // gf6
        }
        if (target != null && target.getClass().getName().endsWith("f6")) {
            gf6Obj = target;
            target = getFieldValue(target, "a"); // Lif6
        }

        if (target == null) {
            return true;
        }

        int typeId = -1;
        int sizeId = -1;
        float diff = -1f;
        float terrain = -1f;
        int favs = 0;
        boolean isFound = false;
        String ownerName = null;

        // Resolve typeId:
        // - In Lif6: field 'l' is CacheType enum, its field 'A' is int typeId
        // - In LiteGeocache: field 'l' is primitive int typeId
        Object typeObj = getFieldValue(target, "l");
        if (typeObj instanceof Number) {
            typeId = ((Number) typeObj).intValue();
        } else if (typeObj != null) {
            typeId = getIntProperty(typeObj, "A", "getId");
        }
        if (typeId == -1) {
            typeId = getIntProperty(target, "typeId", "getTypeId");
        }

        // Resolve sizeId:
        // - In Lif6: field 'm' is CacheSize enum, its field 'A' is int containerTypeId
        // - In LiteGeocache: field 'm' is primitive int containerTypeId
        Object sizeObj = getFieldValue(target, "m");
        if (sizeObj instanceof Number) {
            sizeId = ((Number) sizeObj).intValue();
        } else if (sizeObj != null) {
            sizeId = getIntProperty(sizeObj, "A", "getId");
        }
        if (sizeId == -1) {
            sizeId = getIntProperty(target, "containerTypeId", "getContainerTypeId");
        }

        // Resolve difficulty: field 'c' in both Lif6 and LiteGeocache
        diff = getFloatProperty(target, "c", "getDifficulty");

        // Resolve terrain: field 'd' in both Lif6 and LiteGeocache
        terrain = getFloatProperty(target, "d", "getTerrain");

        // Resolve favoritePoints: field 'e' in both Lif6 and LiteGeocache
        favs = getIntProperty(target, "e", "getFavoritePoints");

        // Resolve find status:
        // - In gf6: field 'b' is i4c, field 'c' is foundDate (Long)
        // - In LiteGeocache: field 'n' is userData, field 'a' is foundDate
        if (gf6Obj != null) {
            Object i4cObj = getFieldValue(gf6Obj, "b");
            if (i4cObj != null && getFieldValue(i4cObj, "c") != null) {
                isFound = true;
            }
        } else {
            Object userData = getFieldValue(target, "n");
            if (userData != null && getFieldValue(userData, "a") != null) {
                isFound = true;
            }
        }

        // Resolve owner:
        // - In Lif6: field 'p' is ownerSummary, field 'a' is username
        // - In LiteGeocache: field 'q' is ownerSummary, field 'a' is username
        Object ownerSummary = getFieldValue(target, "p");
        if (ownerSummary == null) {
            ownerSummary = getFieldValue(target, "q");
        }
        if (ownerSummary != null) {
            ownerName = (String) getFieldValue(ownerSummary, "a");
        }

        // Apply filters
        if (hasTypeFilter && !activeTypeIds.contains(typeId)) {
            return false;
        }
        if (hasSizeFilter && (sizeId == -1 || !activeSizeIds.contains(sizeId))) {
            return false;
        }
        if (hasDiffFilter && (diff <= 0f || !containsFloat(activeDifficulties, diff))) {
            return false;
        }
        if (hasTerrainFilter && (terrain <= 0f || !containsFloat(activeTerrains, terrain))) {
            return false;
        }
        if (hasFavFilter && favs < minFavPoints.intValue()) {
            return false;
        }
        if (hasFindsFilter && isFound) {
            return false;
        }
        if (hasOwnFilter && ownerName != null && ownerName.equalsIgnoreCase(username)) {
            return false;
        }

        return true;
    }

    private static Object getApplicationInstance() {
        try {
            Class<?> appClass = Class.forName("com.groundspeak.geocaching.intro.GeoApplication");
            Field instanceField = appClass.getDeclaredField("R");
            instanceField.setAccessible(true);
            return instanceField.get(null);
        } catch (Throwable t) {
            Log.e(TAG, "Error resolving GeoApplication instance", t);
            return null;
        }
    }

    public static Object getCurrentFilterModel() {
        try {
            Object appInstance = getApplicationInstance();
            if (appInstance != null) {
                Class<?> appClass = appInstance.getClass();
                Field prefsField = appClass.getDeclaredField("E");
                prefsField.setAccessible(true);
                Object filterPrefs = prefsField.get(appInstance);
                if (filterPrefs != null) {
                    Method hMethod = filterPrefs.getClass().getMethod("h");
                    return hMethod.invoke(filterPrefs);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error getting current FilterModel", t);
        }
        return null;
    }

    public static String getCurrentUsername() {
        try {
            Object appInstance = getApplicationInstance();
            if (appInstance != null) {
                Class<?> appClass = appInstance.getClass();
                Field userField = appClass.getDeclaredField("C");
                userField.setAccessible(true);
                Object userSession = userField.get(appInstance);
                if (userSession != null) {
                    Field nameField = userSession.getClass().getDeclaredField("w");
                    nameField.setAccessible(true);
                    return (String) nameField.get(userSession);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean containsFloat(List<Float> list, float target) {
        for (Float val : list) {
            if (val != null && Math.abs(val - target) < 0.01f) {
                return true;
            }
        }
        return false;
    }

    private static List<Integer> extractActiveIds(List swList) {
        if (swList == null || swList.isEmpty()) {
            return null;
        }
        List<Integer> result = new ArrayList<Integer>();
        for (Object item : swList) {
            if (item == null) continue;
            try {
                Field bField = item.getClass().getDeclaredField("b");
                bField.setAccessible(true);
                if (Boolean.TRUE.equals(bField.get(item))) {
                    Field aField = item.getClass().getDeclaredField("a");
                    aField.setAccessible(true);
                    Object enumVal = aField.get(item);
                    if (enumVal != null) {
                        Field idField = enumVal.getClass().getDeclaredField("A");
                        idField.setAccessible(true);
                        Object idObj = idField.get(enumVal);
                        if (idObj instanceof Number) {
                            result.add(((Number) idObj).intValue());
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return result;
    }

    private static List<Float> extractFloatList(Object filterModel, String fieldName) {
        try {
            Object fk7Obj = getFieldValue(filterModel, fieldName);
            if (fk7Obj != null) {
                Object listObj = getFieldValue(fk7Obj, "a");
                if (listObj instanceof List) {
                    return (List<Float>) listObj;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static int getIntProperty(Object obj, String fieldName, String methodName) {
        if (obj == null) return -1;
        try {
            Field f = obj.getClass().getDeclaredField(fieldName);
            f.setAccessible(true);
            Object val = f.get(obj);
            if (val instanceof Number) {
                return ((Number) val).intValue();
            }
        } catch (Throwable ignored) {
        }
        try {
            Method m = obj.getClass().getDeclaredMethod(methodName);
            m.setAccessible(true);
            Object val = m.invoke(obj);
            if (val instanceof Number) {
                return ((Number) val).intValue();
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    private static float getFloatProperty(Object obj, String fieldName, String methodName) {
        if (obj == null) return -1f;
        try {
            Field f = obj.getClass().getDeclaredField(fieldName);
            f.setAccessible(true);
            Object val = f.get(obj);
            if (val instanceof Number) {
                return ((Number) val).floatValue();
            }
        } catch (Throwable ignored) {
        }
        try {
            Method m = obj.getClass().getDeclaredMethod(methodName);
            m.setAccessible(true);
            Object val = m.invoke(obj);
            if (val instanceof Number) {
                return ((Number) val).floatValue();
            }
        } catch (Throwable ignored) {
        }
        return -1f;
    }

    private static List getListField(Object target, String fieldName) {
        Object val = getFieldValue(target, fieldName);
        return (val instanceof List) ? (List) val : null;
    }

    private static Object getFieldValue(Object target, String fieldName) {
        if (target == null) return null;
        try {
            Field f = target.getClass().getDeclaredField(fieldName);
            f.setAccessible(true);
            return f.get(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void setNullIfFalse(Class<?> clazz, Object target, String fieldName) {
        Field f = getDeclaredField(clazz, fieldName);
        if (f != null) {
            try {
                Object val = f.get(target);
                if (Boolean.FALSE.equals(val)) {
                    f.set(target, null);
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static Field getDeclaredField(Class<?> clazz, String fieldName) {
        try {
            Field f = clazz.getDeclaredField(fieldName);
            f.setAccessible(true);
            return f;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
