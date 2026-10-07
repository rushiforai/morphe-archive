package app.twoeno.extension.spotify;

import java.util.Iterator;
import java.util.List;

import app.twoeno.extension.shared.Logger;
import app.twoeno.extension.shared.Reflection;

/**
 * Removes brand ad sections from the home and browse (search) pages.
 */
@SuppressWarnings("unused")
public final class HideAdSectionsPatch {
    /**
     * {@code Section.VIDEO_BRAND_AD_FIELD_NUMBER} and {@code Section.IMAGE_BRAND_AD_FIELD_NUMBER}
     * of the home page protobuf.
     */
    private static final int[] HOME_AD_FEATURE_TYPES = {20, 21};

    /**
     * {@code Section.BRAND_ADS_FIELD_NUMBER} of the browse page protobuf.
     */
    private static final int[] BROWSE_AD_SECTION_TYPES = {6};

    private HideAdSectionsPatch() {
    }

    private static boolean contains(int[] values, int value) {
        for (int v : values) {
            if (v == value) return true;
        }
        return false;
    }

    private static boolean isHomeAd(Object section) throws ReflectiveOperationException {
        if (contains(HOME_AD_FEATURE_TYPES, Reflection.getIntField(section, "featureTypeCase_"))) return true;

        Object featureType = Reflection.getField(section, "featureType_");
        if (featureType == null) return false;
        try {
            return Reflection.getField(featureType, "adMetadata_") != null;
        } catch (NoSuchFieldException ignored) {
            return false;
        }
    }

    /**
     * Injection point: return value of {@code HomeStructure.getSections()}.
     */
    public static void removeHomeSections(List<?> sections) {
        if (sections == null || sections.isEmpty()) return;
        try {
            // Only filter lists of home sections.
            Reflection.findField(sections.get(0).getClass(), "featureTypeCase_");
        } catch (Throwable ignored) {
            return;
        }

        try {
            Reflection.makeProtobufListMutable(sections);
            for (Iterator<?> it = sections.iterator(); it.hasNext(); ) {
                if (isHomeAd(it.next())) it.remove();
            }
        } catch (Throwable ex) {
            Logger.error("removeHomeSections failure", ex);
        }
    }

    /**
     * Injection point: return value of {@code BrowseStructure.getSections()}.
     */
    public static void removeBrowseSections(List<?> sections) {
        if (sections == null || sections.isEmpty()) return;
        try {
            Reflection.makeProtobufListMutable(sections);
            for (Iterator<?> it = sections.iterator(); it.hasNext(); ) {
                if (contains(BROWSE_AD_SECTION_TYPES, Reflection.getIntField(it.next(), "sectionTypeCase_"))) {
                    it.remove();
                }
            }
        } catch (Throwable ex) {
            Logger.error("removeBrowseSections failure", ex);
        }
    }
}
