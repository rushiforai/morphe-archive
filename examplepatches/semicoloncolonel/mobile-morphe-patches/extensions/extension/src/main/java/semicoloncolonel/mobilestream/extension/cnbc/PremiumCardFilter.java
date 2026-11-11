package semicoloncolonel.mobilestream.extension.cnbc;

import java.util.List;

/**
 * CNBC "Hide premium promotions": a show's video page lists a "Latest
 * Episodes" heading and, for a viewer without a subscription, a "Premium
 * Content" card that asks them to subscribe. The patch passes each item the
 * page adds through {@link #add}, which drops that card and the heading
 * above it. The card that asks to sign in with a TV provider stays.
 */
@SuppressWarnings("unused")
public final class PremiumCardFilter {
    private PremiumCardFilter() {
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static boolean add(List list, Object item) {
        if (isPremiumCard(item)) {
            if (!list.isEmpty() && list.get(list.size() - 1).getClass().getName().endsWith("VodListItem$Header")) {
                list.remove(list.size() - 1);
            }
            return true;
        }
        return list.add(item);
    }

    private static boolean isPremiumCard(Object item) {
        if (item == null || !item.getClass().getName().endsWith("VodListItem$CtaCard")) return false;
        try {
            for (java.lang.reflect.Field field : item.getClass().getDeclaredFields()) {
                if (!field.getType().isEnum()) continue;
                field.setAccessible(true);
                Object type = field.get(item);
                return type != null && "PREMIUM".equals(((Enum<?>) type).name());
            }
        } catch (Throwable ignored) {
        }
        return false;
    }
}
