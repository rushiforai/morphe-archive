package io.github.liongalahad.nuviotv.extension.settings;

import io.github.liongalahad.nuviotv.extension.BuildConfig;

/** Build metadata shared by the Morphe settings caption and About section. */
public final class MorpheBuildInfo {
    private static final String AUTHOR = "liongalahad";
    private static final String REPOSITORY_URL =
            "https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches";

    private MorpheBuildInfo() {}

    public static String version() {
        return displayVersion(BuildConfig.MORPHE_PATCH_VERSION);
    }

    public static String author() {
        return AUTHOR;
    }

    public static String repositoryUrl() {
        return REPOSITORY_URL;
    }

    static String displayVersion(String buildVersion) {
        if (buildVersion == null) return "unknown";
        String normalized = buildVersion.trim();
        if (normalized.isEmpty()) return "unknown";
        return normalized.replaceFirst("-dev\\.(\\d+)$", "-dev$1");
    }
}
