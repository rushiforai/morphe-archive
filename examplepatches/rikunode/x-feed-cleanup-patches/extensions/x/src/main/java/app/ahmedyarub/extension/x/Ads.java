package app.ahmedyarub.extension.x;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.Logger;

/**
 * Drops promoted items from timelines.
 *
 * A promoted post, account or ad carries the timeline's promoted metadata directly; a promoted
 * trend carries it on the trend it wraps. An organic item has none. The metadata class is
 * obfuscated, so the patch writes its name in, and where each item class keeps it is worked out
 * once per class.
 */
@SuppressWarnings("unused")
public final class Ads {

    /** The promoted metadata class. Rewritten by Remove Ads. */
    private static String promotedMetadataClass() {
        return "";
    }

    /** How to reach an item class's promoted metadata: one field, or a field of a field. */
    private static final class Path {
        final Field outer;
        final Field inner;
        final boolean alwaysAd;

        Path(Field outer, Field inner, boolean alwaysAd) {
            this.outer = outer;
            this.inner = inner;
            this.alwaysAd = alwaysAd;
        }

        Object read(Object item) throws IllegalAccessException {
            Object value = outer.get(item);
            return inner == null || value == null ? value : inner.get(value);
        }
    }

    /** A class with no promoted metadata anywhere. */
    private static final Path NONE = new Path(null, null, false);

    private static volatile Class<?> promotedMetadata;
    private static final Map<Class<?>, Path> PATHS = new ConcurrentHashMap<>();

    /** If a timeline item is promoted. */
    public static boolean isPromoted(Object item) {
        if (item == null) return false;

        try {
            Path path = PATHS.computeIfAbsent(item.getClass(), itemClass -> pathOf(itemClass, item));
            if (path == NONE) return false;
            return path.alwaysAd || path.read(item) != null;
        } catch (Exception ex) {
            Logger.printException(() -> "isPromoted failure", ex);
            return false;
        }
    }


    private static Path pathOf(Class<?> itemClass, Object sample) {
        try {
            // Programmatic (Google) ads are ads whatever their metadata says.
            if (String.valueOf(sample).startsWith("UrtTimelineRtbImageAd(")) return new Path(null, null, true);

            Class<?> metadata = promotedMetadata;
            if (metadata == null) {
                metadata = Class.forName(promotedMetadataClass(), false, itemClass.getClassLoader());
                promotedMetadata = metadata;
            }

            Field direct = fieldOfType(itemClass, metadata);
            if (direct != null) return new Path(direct, null, false);

            for (Field outer : itemClass.getDeclaredFields()) {
                if (Modifier.isStatic(outer.getModifiers()) || outer.getType().isPrimitive()) continue;
                if (!outer.getType().getName().startsWith("com.x.models.")) continue;

                Field inner = fieldOfType(outer.getType(), metadata);
                if (inner != null) {
                    outer.setAccessible(true);
                    return new Path(outer, inner, false);
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not find the promoted metadata of " + itemClass.getName(), ex);
        }
        return NONE;
    }

    private static Field fieldOfType(Class<?> owner, Class<?> type) {
        for (Field field : owner.getDeclaredFields()) {
            if (field.getType() == type && !Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                return field;
            }
        }
        return null;
    }
}
