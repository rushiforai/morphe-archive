package com.waze.gw;

import java.text.Normalizer;
import java.util.Locale;
import java.util.regex.Pattern;

/** Conservative free-drive fallback used only when Waze has not supplied an explicit road type. */
public final class RoadTypeClassifier {
    private static final Pattern VIETNAM_EXPRESSWAY_CODE =
            Pattern.compile("(^|[^A-Z0-9])CT[.\\s-]*[0-9]{1,3}([^0-9]|$)");
    /** Waze uses both "CT. Biên Hòa..." and "CT HCM-Long Thành..." without a number. */
    private static final Pattern VIETNAM_EXPRESSWAY_PREFIX =
            Pattern.compile("(^|[^A-Z0-9])CT[.\\s-]+(?=\\p{L})");

    private RoadTypeClassifier() { }

    /** True only for high-confidence Vietnamese expressway names/codes, never generic highways. */
    public static boolean isFreewayStreetName(String streetName) {
        if (streetName == null || streetName.trim().isEmpty()) return false;
        String folded = Normalizer.normalize(streetName, Normalizer.Form.NFD)
                .replaceAll("\\p{M}+", "")
                .toUpperCase(Locale.US);
        return folded.contains("CAO TOC")
                || folded.contains("EXPRESSWAY")
                || folded.contains("MOTORWAY")
                || VIETNAM_EXPRESSWAY_PREFIX.matcher(folded).find()
                || VIETNAM_EXPRESSWAY_CODE.matcher(folded).find();
    }
}
