package io.github.ilikeadofai.vocacolle.extension.settings;

import io.github.ilikeadofai.vocacolle.extension.BuildConfig;

/** Formats the user-visible VocaColle and Morphe patch versions. */
public final class MorphePatchInfo {
    private MorphePatchInfo() {
    }

    public static String formatAppVersion(String originalVersion) {
        if (originalVersion == null || originalVersion.isEmpty()) {
            return "Morphe " + BuildConfig.MORPHE_PATCH_VERSION;
        }
        return originalVersion + " · Morphe " + BuildConfig.MORPHE_PATCH_VERSION;
    }
}
