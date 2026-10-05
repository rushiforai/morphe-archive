/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.entity;

import java.util.List;

/**
 * Typed reads of the release's `Media` model. Every body below is a placeholder: the patch replaces
 * it with direct calls to the getters it resolves from the target APK (`MediaBridges.kt`), so the
 * download path never reflects over obfuscated names. The parameters are `Object` because the model
 * types are not on the extension's compile classpath; each bridge null-checks and type-checks before
 * it reads.
 */
final class MediaBridge {
    private MediaBridge() {}

    /** The `Media`'s video versions (Pando key `video_versions`), or null. */
    static List<?> videoVersions(Object media) {
        return null;
    }

    /** The `Media`'s image variants, largest first as the release orders them, or null. */
    static List<?> imageVariants(Object media) {
        return null;
    }

    /** The `Media`'s carousel children (Pando key `carousel_media`), or null for a single media. */
    static List<?> carouselMedia(Object media) {
        return null;
    }

    static boolean isVideo(Object media) {
        return false;
    }

    /** The `Media`'s primary key, or null. */
    static String mediaPkId(Object media) {
        return null;
    }

    /** The URL of one video version taken from [#videoVersions], or null. */
    static String videoUrl(Object videoVersion) {
        return null;
    }
}
