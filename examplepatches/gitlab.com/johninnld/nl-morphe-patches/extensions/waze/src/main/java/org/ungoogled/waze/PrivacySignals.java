package org.ungoogled.waze;

import java.util.Collections;
import java.util.List;

public final class PrivacySignals {
    private PrivacySignals() {}

    /** Also filters an identifier cached before Remove telemetry was switched on. */
    public static String attributionId(String original) {
        return Customization.on("removeTelemetry") ? null : original;
    }

    /** Filter cached campaign banners too; a server flag does not remove an existing model. */
    public static List<?> menuBanners(List<?> original) {
        return Customization.on("hideAds") ? Collections.emptyList() : original;
    }
}
