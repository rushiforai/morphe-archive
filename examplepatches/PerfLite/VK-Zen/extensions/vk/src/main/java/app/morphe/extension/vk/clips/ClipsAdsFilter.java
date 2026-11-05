package app.morphe.extension.vk.clips;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class ClipsAdsFilter {
    private static final String TAG = "MorpheClipsAds";

    /**
     * Filters list of FeedItems in clips feed reducer (cbu.i).
     */
    public static List<?> filterFeedItems(List<?> items) {
        if (items == null) return null;
        ArrayList<Object> result = new ArrayList<>(items.size());
        for (Object item : items) {
            if (item == null || isClipAd(item)) {
                continue;
            }
            result.add(item);
        }
        return result;
    }

    /**
     * Filters list submitted to AsyncListDiffer if it is a clips feed list.
     */
    public static List<?> filterIfClipFeed(List<?> list) {
        if (list == null || list.isEmpty()) return list;
        try {
            Object first = list.get(0);
            if (first != null) {
                String name = first.getClass().getName();
                if (name.contains("clips") || name.contains("FeedItem") || isFeedItem(first)) {
                    return filterFeedItems(list);
                }
            }
        } catch (Throwable ignored) {}
        return list;
    }

    private static boolean isFeedItem(Object item) {
        if (item == null) return false;
        for (Class<?> iface : item.getClass().getInterfaces()) {
            if (iface.getName().endsWith("FeedItem")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Guards ClipsOwnerSwipePagerAdapter$a.onInserted against IndexOutOfBoundsException.
     * In VK 8.201, DiffUtil callback may notify onInserted(position, count) before or when
     * differ.currentList is out of sync (position + count > list.size()).
     * Accessing differ.currentList[i] throws IndexOutOfBoundsException and crashes the app.
     */
    public static boolean shouldHandleOnInserted(Object callback, int position, int count) {
        if (position < 0 || count <= 0) return false;
        try {
            Object adapter = getAdapterFromCallback(callback);
            List<?> list = getCurrentListFromAdapter(adapter);
            if (list != null) {
                int size = list.size();
                if (position >= size || (position + count) > size) {
                    Log.w(TAG, "Prevented IndexOutOfBoundsException in onInserted: position="
                            + position + ", count=" + count + ", currentList.size=" + size);
                    return false;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in shouldHandleOnInserted guard", t);
        }
        return true;
    }

    /**
     * Guards ClipsOwnerSwipePagerAdapter$a.onChanged against IndexOutOfBoundsException.
     */
    public static boolean shouldHandleOnChanged(Object callback, int position, int count) {
        if (position < 0 || count <= 0) return false;
        try {
            Object adapter = getAdapterFromCallback(callback);
            List<?> list = getCurrentListFromAdapter(adapter);
            if (list != null) {
                int size = list.size();
                if (position >= size || (position + count) > size) {
                    Log.w(TAG, "Prevented IndexOutOfBoundsException in onChanged: position="
                            + position + ", count=" + count + ", currentList.size=" + size);
                    return false;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in shouldHandleOnChanged guard", t);
        }
        return true;
    }

    /**
     * Guards ClipsOwnerSwipePagerAdapter$a.onRemoved against IndexOutOfBoundsException.
     */
    public static boolean shouldHandleOnRemoved(Object callback, int position, int count) {
        if (position < 0 || count <= 0) return false;
        try {
            Object adapter = getAdapterFromCallback(callback);
            if (adapter == null) return true;

            List<?> list = getFragmentListFromAdapter(adapter);
            if (list != null) {
                int size = list.size();
                if (position >= size || (position + count) > size) {
                    Log.w(TAG, "Prevented IndexOutOfBoundsException in onRemoved: position="
                            + position + ", count=" + count + ", fragmentList.size=" + size);
                    return false;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in shouldHandleOnRemoved guard", t);
        }
        return true;
    }

    /**
     * Guards ClipsOwnerSwipePagerAdapter$a.onMoved against IndexOutOfBoundsException.
     */
    public static boolean shouldHandleOnMoved(Object callback, int fromPosition, int toPosition) {
        if (fromPosition < 0 || toPosition < 0) return false;
        try {
            Object adapter = getAdapterFromCallback(callback);
            if (adapter == null) return true;

            List<?> list = getFragmentListFromAdapter(adapter);
            if (list != null) {
                int size = list.size();
                if (fromPosition >= size || toPosition >= size) {
                    Log.w(TAG, "Prevented IndexOutOfBoundsException in onMoved: from="
                            + fromPosition + ", to=" + toPosition + ", fragmentList.size=" + size);
                    return false;
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in shouldHandleOnMoved guard", t);
        }
        return true;
    }

    /**
     * Safely removes item at position from UiTrackingFragmentStateAdapter's internal list.
     * Prevents IndexOutOfBoundsException when position >= list.size().
     */
    public static void safeRemoveItem(Object adapter, int position) {
        if (adapter == null || position < 0) return;
        try {
            Class<?> clazz = adapter.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    if (List.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object val = f.get(adapter);
                        if (val instanceof List) {
                            List<?> list = (List<?>) val;
                            if (position < list.size()) {
                                list.remove(position);
                            } else {
                                Log.w(TAG, "Prevented IndexOutOfBoundsException in safeRemoveItem: position="
                                        + position + ", list.size=" + list.size());
                            }
                            return;
                        }
                    }
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in safeRemoveItem", t);
        }
    }

    private static List<?> getFragmentListFromAdapter(Object adapter) {
        if (adapter == null) return null;
        try {
            Class<?> clazz = adapter.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    if (List.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object val = f.get(adapter);
                        if (val instanceof List) {
                            return (List<?>) val;
                        }
                    }
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static Object getAdapterFromCallback(Object callback) {
        if (callback == null) return null;
        try {
            // First try direct field 'b'
            try {
                Field f = callback.getClass().getDeclaredField("b");
                f.setAccessible(true);
                Object val = f.get(callback);
                if (val != null) return val;
            } catch (Throwable ignored) {}

            // Fallback: search declared fields for RecyclerView.Adapter
            for (Field f : callback.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object val = f.get(callback);
                if (val != null) {
                    Class<?> c = val.getClass();
                    while (c != null && c != Object.class) {
                        if (c.getName().endsWith("RecyclerView$Adapter")
                                || c.getName().contains("Adapter")) {
                            return val;
                        }
                        c = c.getSuperclass();
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static List<?> getCurrentListFromAdapter(Object adapter) {
        if (adapter == null) return null;
        try {
            Class<?> clazz = adapter.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object differ = f.get(adapter);
                    if (differ == null) continue;

                    String typeName = f.getType().getName();
                    String differClassName = differ.getClass().getName();
                    if (typeName.contains("AsyncListDiffer")
                            || typeName.endsWith(".d")
                            || differClassName.contains("AsyncListDiffer")
                            || differClassName.endsWith(".d")) {
                        // 1. Try getCurrentList()
                        try {
                            Method m = differ.getClass().getMethod("getCurrentList");
                            Object res = m.invoke(differ);
                            if (res instanceof List) {
                                return (List<?>) res;
                            }
                        } catch (Throwable ignored) {}

                        // 2. Try List fields on differ (mReadOnlyList / f)
                        for (Field df : differ.getClass().getDeclaredFields()) {
                            if (List.class.isAssignableFrom(df.getType())) {
                                df.setAccessible(true);
                                Object l = df.get(differ);
                                if (l instanceof List) {
                                    return (List<?>) l;
                                }
                            }
                        }
                    }
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}
        return null;
    }

    /**
     * Determines whether an item is an advertisement in clips.
     */
    public static boolean isClipAd(Object item) {
        if (item == null) return false;

        String className = item.getClass().getName();

        // 1. Direct class name checks for known clips ad classes
        if (className.endsWith(".FeedItem$a") // Video clip ads
                || className.endsWith(".FeedItem$h") // Market ads
                || className.endsWith(".FeedItem$k") // Static ads
                || className.endsWith(".FeedItem$b") // Ads controls
                || className.endsWith(".ubu") // Shops grid block
                || className.endsWith(".tbu")) { // NPS condition popup
            return true;
        }

        // Substring check for ad class names
        if (className.contains("MarketAds")
                || className.contains("ShopsGrid")
                || className.contains("AdsControls")
                || className.contains("StaticAds")
                || className.contains("ClipProductAttach")
                || className.contains("ShopsMoreBadge")) {
            return true;
        }

        // 2. Check marker interfaces (FeedItem.c or FeedItem.b)
        try {
            for (Class<?> iface : item.getClass().getInterfaces()) {
                String ifaceName = iface.getName();
                if (ifaceName.endsWith("FeedItem$c") || ifaceName.endsWith("FeedItem$b")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}

        // 3. Check k4() method on FeedItem
        try {
            Method mK4 = item.getClass().getMethod("k4");
            Object res = mK4.invoke(item);
            if (Boolean.TRUE.equals(res)) {
                return true;
            }
        } catch (Throwable ignored) {}

        // 4. Check associated video for ad info (b1() != null or p1() != null)
        if (hasAdVideo(item)) {
            return true;
        }

        // 5. Inspect string representation for ad markers
        try {
            String repr = item.toString().toLowerCase();
            if (repr.contains("videoadinfo")
                    || repr.contains("ordadsinfo")
                    || repr.contains("is_ad=true")
                    || repr.contains("isad=true")
                    || repr.contains("market_ads")
                    || repr.contains("static_ads")
                    || repr.contains("shops_grid_block")) {
                return true;
            }
        } catch (Throwable ignored) {}

        return false;
    }

    private static boolean hasAdVideo(Object item) {
        try {
            Class<?> clazz = item.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(item);
                    if (val == null) continue;
                    String valClass = val.getClass().getName();
                    if (valClass.contains("SdkClipVideoFile") || valClass.contains("SdkVideoFile") || valClass.contains("VideoFile")) {
                        // Check b1() (SdkVideoAdInfo)
                        try {
                            Method mB1 = val.getClass().getMethod("b1");
                            if (mB1.invoke(val) != null) {
                                return true;
                            }
                        } catch (Throwable ignored) {}

                        // Check p1() (SdkOrdAdsInfo)
                        try {
                            Method mP1 = val.getClass().getMethod("p1");
                            if (mP1.invoke(val) != null) {
                                return true;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}
        return false;
    }
}
