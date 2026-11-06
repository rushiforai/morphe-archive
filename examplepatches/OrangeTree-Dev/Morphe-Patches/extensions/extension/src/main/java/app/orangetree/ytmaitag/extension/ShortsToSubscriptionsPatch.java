package app.orangetree.ytmaitag.extension;

import android.annotation.SuppressLint;
import android.app.Application;
import android.util.Log;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Replaces the Shorts button of the YouTube navigation bar with a Subscriptions button.
 * The navigation bar items come from the server, so the list is changed when it is stored.
 */
@SuppressWarnings("unused")
public final class ShortsToSubscriptionsPatch {
    private static final String TAG = "OrangeTreeShortsToSubs";

    private static final String SHORTS_BROWSE_ID = "FEshorts";
    private static final String SUBSCRIPTIONS_BROWSE_ID = "FEsubscriptions";

    // Icon types (YTIconType).
    private static final int TAB_SHORTS_CAIRO = 1157;
    private static final int TAB_SUBSCRIPTIONS_CAIRO = 1155;
    private static final int PIVOT_SUBSCRIPTIONS = 408;

    // Fields of PivotBarItemRenderer.
    private static final int FIELD_PIVOT_IDENTIFIER = 1;
    private static final int FIELD_ICON = 5;
    // Field of Icon.
    private static final int FIELD_ICON_TYPE = 1;

    /**
     * Added to the navigation bar item class during patching.
     */
    public interface PivotBarItem {
        /**
         * @return The serialized PivotBarItemRenderer proto, or null if the item is a different renderer.
         */
        byte[] orangetree_getPivotBarItemRendererBytes();
    }

    /**
     * Injection point.
     *
     * @param items Navigation bar items.
     * @return The items with Shorts replaced by Subscriptions, or null if nothing changed.
     */
    public static List<Object> swapShortsWithSubscriptions(List<Object> items) {
        if (items == null || items.isEmpty()) return null;

        try {
            int shortsIndex = -1;
            int shortsIconType = 0;
            boolean hasSubscriptions = false;

            for (int i = 0, size = items.size(); i < size; i++) {
                byte[] renderer = getRendererBytes(items.get(i));
                if (renderer == null) continue;

                String pivotIdentifier = readString(renderer, FIELD_PIVOT_IDENTIFIER);
                if (SHORTS_BROWSE_ID.equals(pivotIdentifier)) {
                    shortsIndex = i;
                    byte[] icon = readBytes(renderer, FIELD_ICON);
                    shortsIconType = icon == null ? 0 : (int) readVarintField(icon, FIELD_ICON_TYPE);
                } else if (SUBSCRIPTIONS_BROWSE_ID.equals(pivotIdentifier)) {
                    hasSubscriptions = true;
                }
            }

            if (shortsIndex < 0) return null;

            List<Object> newItems = new ArrayList<>(items);
            if (hasSubscriptions) {
                // Subscriptions is already in the bar, so Shorts is only removed.
                newItems.remove(shortsIndex);
                return newItems;
            }

            int iconType = shortsIconType == TAB_SHORTS_CAIRO
                    ? TAB_SUBSCRIPTIONS_CAIRO
                    : PIVOT_SUBSCRIPTIONS;
            Object subscriptions = createSubscriptionsItem(
                    SUBSCRIPTIONS_BROWSE_ID, getSubscriptionsLabel(), iconType);
            if (subscriptions == null) {
                Log.w(TAG, "Could not create the Subscriptions button");
                return null;
            }

            newItems.set(shortsIndex, subscriptions);
            return newItems;
        } catch (Exception ex) {
            Log.e(TAG, "swapShortsWithSubscriptions failure", ex);
        }
        return null;
    }

    /**
     * Method body is replaced during patching.
     *
     * @return The navigation bar item, or null.
     */
    private static Object createSubscriptionsItem(String browseId, String label, int iconType) {
        return null;
    }

    private static byte[] getRendererBytes(Object item) {
        if (item instanceof PivotBarItem) {
            return ((PivotBarItem) item).orangetree_getPivotBarItemRendererBytes();
        }
        return null;
    }

    @SuppressLint("DiscouragedApi")
    private static String getSubscriptionsLabel() {
        try {
            @SuppressLint("PrivateApi")
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app != null) {
                int id = app.getResources().getIdentifier("subscriptions", "string", app.getPackageName());
                if (id != 0) return app.getString(id);
            }
        } catch (Exception ex) {
            Log.w(TAG, "Could not read the Subscriptions label", ex);
        }
        return "Subscriptions";
    }

    // region Minimal protobuf wire format reader.

    private static byte[] readBytes(byte[] data, int fieldNumber) {
        return new ProtoReader(data).findBytes(fieldNumber);
    }

    private static String readString(byte[] data, int fieldNumber) {
        byte[] value = readBytes(data, fieldNumber);
        return value == null ? null : new String(value, StandardCharsets.UTF_8);
    }

    private static long readVarintField(byte[] data, int fieldNumber) {
        return new ProtoReader(data).findVarint(fieldNumber);
    }

    private static final class ProtoReader {
        private final byte[] data;
        private int pos;

        ProtoReader(byte[] data) {
            this.data = data;
        }

        private long readVarint() {
            long result = 0;
            for (int shift = 0; pos < data.length && shift < 64; shift += 7) {
                byte b = data[pos++];
                result |= (long) (b & 0x7F) << shift;
                if ((b & 0x80) == 0) return result;
            }
            throw new IllegalArgumentException("Malformed varint");
        }

        /**
         * @return The first length delimited field with the number, or null.
         */
        byte[] findBytes(int fieldNumber) {
            while (pos < data.length) {
                long tag = readVarint();
                int wireType = (int) (tag & 7);
                if (wireType == 2) {
                    int length = (int) readVarint();
                    if (length < 0 || length > data.length - pos) return null;
                    if ((int) (tag >>> 3) == fieldNumber) {
                        byte[] value = new byte[length];
                        System.arraycopy(data, pos, value, 0, length);
                        return value;
                    }
                    pos += length;
                } else if (!skip(wireType)) {
                    return null;
                }
            }
            return null;
        }

        /**
         * @return The first varint field with the number, or 0.
         */
        long findVarint(int fieldNumber) {
            while (pos < data.length) {
                long tag = readVarint();
                int wireType = (int) (tag & 7);
                if (wireType == 0 && (int) (tag >>> 3) == fieldNumber) {
                    return readVarint();
                }
                if (wireType == 2) {
                    pos += (int) readVarint();
                } else if (!skip(wireType)) {
                    return 0;
                }
            }
            return 0;
        }

        private boolean skip(int wireType) {
            switch (wireType) {
                case 0:
                    readVarint();
                    return true;
                case 1:
                    pos += 8;
                    return true;
                case 5:
                    pos += 4;
                    return true;
                default:
                    return false;
            }
        }
    }

    // endregion
}
