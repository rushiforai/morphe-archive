package app.fakh.extension.muslimpro;

import java.lang.reflect.Field;
import java.util.AbstractCollection;

/** Keeps the Today carousel to the cards that are not ads or Premium upsells. */
public final class Carousel {
    private Carousel() {
    }

    /** Drop-in for `AbstractCollection.add` in the code that builds the Today carousel; skips the ad and upsell cards. */
    public static boolean add(AbstractCollection<Object> list, Object item) {
        return !isUpsell(item) && list.add(item);
    }

    /** True for a carousel item whose type enum is the sponsor promo or one of the Premium cards. */
    private static boolean isUpsell(Object item) {
        for (Field field : item.getClass().getDeclaredFields()) {
            if (!field.getType().isEnum()) continue;
            try {
                field.setAccessible(true);
                Object type = field.get(item);
                if (type == null) return false;
                String name = ((Enum<?>) type).name();
                return name.equals("Promo") || name.equals("Premium") || name.equals("FreePremium") || name.equals("AdCount");
            } catch (ReflectiveOperationException | RuntimeException e) {
                return false;
            }
        }
        return false;
    }
}
