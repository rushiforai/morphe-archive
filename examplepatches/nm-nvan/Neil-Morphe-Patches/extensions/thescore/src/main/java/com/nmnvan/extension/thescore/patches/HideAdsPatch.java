package com.nmnvan.extension.thescore.patches;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@SuppressWarnings("unused")
public final class HideAdsPatch {

    /**
     * Unique id prefixes of ad list items (BigBoxAdItem, BannerAdItem, TeadsAdItem).
     */
    private static final String[] AD_UNIQUE_ID_PREFIXES = {"BIGBOXAD-", "BANNERAD-", "TeadsAd-"};

    /**
     * NativeAdItem has a dynamic unique id, so it is recognised by its data class toString().
     */
    private static final String NATIVE_AD_TO_STRING_PREFIX = "NativeAdItem(";

    /**
     * What we know about an adapter item class, computed once per class.
     */
    private static final class ItemClassInfo {
        /** getUniqueId(), or null if the class has none. */
        final Method uniqueIdMethod;
        final boolean isNativeAd;

        ItemClassInfo(Method uniqueIdMethod, boolean isNativeAd) {
            this.uniqueIdMethod = uniqueIdMethod;
            this.isNativeAd = isNativeAd;
        }
    }

    private static final ConcurrentHashMap<Class<?>, ItemClassInfo> classInfos = new ConcurrentHashMap<>();

    /**
     * Injection point: ListAdapter.setData(List).
     *
     * @return the same list if it has no ads, otherwise a copy without ad items.
     */
    public static List<?> filterListAds(List<?> items) {
        if (items == null || items.isEmpty()) return items;

        try {
            ArrayList<Object> filtered = null;
            for (int i = 0, size = items.size(); i < size; i++) {
                Object item = items.get(i);
                if (isAd(item)) {
                    if (filtered == null) {
                        filtered = new ArrayList<>(items.subList(0, i));
                    }
                } else if (filtered != null) {
                    filtered.add(item);
                }
            }
            return filtered == null ? items : filtered;
        } catch (Exception ex) {
            // Never break a list screen because of filtering.
            return items;
        }
    }

    private static boolean isAd(Object item) {
        if (item == null) return false;

        ItemClassInfo info = getClassInfo(item);
        if (info.isNativeAd) return true;
        if (info.uniqueIdMethod == null) return false;

        String uniqueId;
        try {
            uniqueId = (String) info.uniqueIdMethod.invoke(item);
        } catch (Exception e) {
            return false;
        }
        if (uniqueId == null) return false;

        for (String prefix : AD_UNIQUE_ID_PREFIXES) {
            if (uniqueId.startsWith(prefix)) return true;
        }
        return false;
    }

    private static ItemClassInfo getClassInfo(Object item) {
        Class<?> clazz = item.getClass();
        ItemClassInfo info = classInfos.get(clazz);
        if (info != null) return info;

        Method uniqueIdMethod;
        try {
            uniqueIdMethod = clazz.getMethod("getUniqueId");
            if (uniqueIdMethod.getReturnType() != String.class) uniqueIdMethod = null;
        } catch (NoSuchMethodException e) {
            uniqueIdMethod = null;
        }

        // Obfuscated app classes live in the default package; only those can be NativeAdItem.
        boolean isNativeAd = clazz.getName().indexOf('.') < 0
                && String.valueOf(item).startsWith(NATIVE_AD_TO_STRING_PREFIX);

        info = new ItemClassInfo(uniqueIdMethod, isNativeAd);
        classInfos.put(clazz, info);
        return info;
    }
}
