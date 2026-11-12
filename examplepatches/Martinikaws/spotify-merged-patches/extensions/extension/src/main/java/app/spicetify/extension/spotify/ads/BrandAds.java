package app.spicetify.extension.spotify.ads;

import app.spicetify.extension.spotify.settings.PatchSettings;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public final class BrandAds {
    private BrandAds() {}

    public static List<?> home(List<?> sections) {
        return filter(sections, "com.spotify.casita.v1.resolved.Section", "featureTypeCase_", 20, 21);
    }

    public static List<?> browse(List<?> sections) {
        return filter(sections, "com.spotify.browsita.v1.resolved.Section", "sectionTypeCase_", 6, 6);
    }

    private static List<?> filter(List<?> sections, String type, String discriminator, int first, int second) {
        if (!PatchSettings.hideBrandAdsEnabled() || sections == null || sections.isEmpty()) return sections;
        try {
            Object initial = sections.get(0);
            if (initial == null || !initial.getClass().getName().equals(type)) return sections;
            Class<?> sectionType = initial.getClass();
            Field field = sectionType.getDeclaredField(discriminator);
            field.setAccessible(true);
            ArrayList<Object> filtered = null;
            for (int index = 0; index < sections.size(); index++) {
                Object section = sections.get(index);
                if (section == null || section.getClass() != sectionType) return sections;
                int kind = field.getInt(section);
                if (kind == first || kind == second) {
                    if (filtered == null) filtered = new ArrayList<>(sections.subList(0, index));
                } else if (filtered != null) {
                    filtered.add(section);
                }
            }
            return filtered == null ? sections : filtered;
        } catch (ReflectiveOperationException | SecurityException | IllegalArgumentException changedModel) {
            return sections;
        }
    }
}
