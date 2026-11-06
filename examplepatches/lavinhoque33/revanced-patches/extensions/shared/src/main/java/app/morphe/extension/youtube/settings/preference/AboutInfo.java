/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import java.util.Locale;

/** Pure, Android-independent About card data formatting. */
public final class AboutInfo {
    public enum Link {
        GITHUB,
        REPORT_ISSUE,
        REQUEST_FEATURE
    }

    public static String url(Link link) {
        String repository = "https://github.com/lavinhoque33/revanced-patches";

        return switch (link) {
            case GITHUB -> repository;
            case REPORT_ISSUE -> repository + "/issues/new?template=bug-report.yml";
            case REQUEST_FEATURE -> repository + "/issues/new?template=feature-request.yml";
        };
    }

    /** The caller supplies localized labels, and only the explicitly listed non-personal metadata. */
    public static String buildDebugInfo(String format, String patchVersion, String appLabel, String appVersion,
                                       String patchedDate, String androidVersion, int sdk,
                                       String manufacturer, String model) {
        return String.format(Locale.ROOT, format, patchVersion, appLabel, appVersion,
                patchedDate, androidVersion, sdk, manufacturer, model);
    }

    private AboutInfo() {
    }
}
