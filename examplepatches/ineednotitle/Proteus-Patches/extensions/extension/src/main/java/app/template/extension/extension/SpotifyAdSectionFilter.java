package app.template.extension.extension;

import java.util.Iterator;
import java.util.List;

/**
 * Removes brand ad sections from the home and browse (search) pages.
 *
 * The sections come from protobuf structures; ads are identified by their
 * oneof case numbers ({@code Section.VIDEO_BRAND_AD_FIELD_NUMBER},
 * {@code Section.IMAGE_BRAND_AD_FIELD_NUMBER} on home and
 * {@code Section.BRAND_ADS_FIELD_NUMBER} on browse) or, as a fallback, by the
 * presence of ad metadata in the section feature type.
 */
@SuppressWarnings("unused")
public final class SpotifyAdSectionFilter {
    /**
     * {@code Section.VIDEO_BRAND_AD_FIELD_NUMBER} and
     * {@code Section.IMAGE_BRAND_AD_FIELD_NUMBER} of the home page protobuf.
     */
    private static final int[] HOME_AD_FEATURE_TYPES = {20, 21};

    /**
     * {@code Section.BRAND_ADS_FIELD_NUMBER} of the browse page protobuf.
     */
    private static final int[] BROWSE_AD_SECTION_TYPES = {6};

    private SpotifyAdSectionFilter() {
    }

    private static boolean contains(int[] values, int value) {
        for (int v : values) {
            if (v == value) return true;
        }
        return false;
    }

    private static boolean isHomeAd(Object section) throws ReflectiveOperationException {
        if (contains(HOME_AD_FEATURE_TYPES, SpotifyReflection.getIntField(section, "featureTypeCase_"))) return true;

        Object featureType = SpotifyReflection.getField(section, "featureType_");
        if (featureType == null) return false;
        try {
            return SpotifyReflection.getField(featureType, "adMetadata_") != null;
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
            SpotifyReflection.findField(sections.get(0).getClass(), "featureTypeCase_");
        } catch (Throwable ignored) {
            return;
        }

        try {
            SpotifyReflection.makeProtobufListMutable(sections);
            for (Iterator<?> it = sections.iterator(); it.hasNext(); ) {
                if (isHomeAd(it.next())) it.remove();
            }
        } catch (Throwable ignored) {
            // Filtering is best-effort; keep the stock section list on drift.
        }
    }

    /**
     * Injection point: return value of {@code BrowseStructure.getSections()}.
     */
    public static void removeBrowseSections(List<?> sections) {
        if (sections == null || sections.isEmpty()) return;
        try {
            SpotifyReflection.makeProtobufListMutable(sections);
            for (Iterator<?> it = sections.iterator(); it.hasNext(); ) {
                if (contains(BROWSE_AD_SECTION_TYPES, SpotifyReflection.getIntField(it.next(), "sectionTypeCase_"))) {
                    it.remove();
                }
            }
        } catch (Throwable ignored) {
            // Filtering is best-effort; keep the stock section list on drift.
        }
    }
}
