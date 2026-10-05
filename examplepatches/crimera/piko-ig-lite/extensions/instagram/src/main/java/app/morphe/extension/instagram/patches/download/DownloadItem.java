/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import java.util.List;

/** One downloadable media of a post (a single photo or video, or one carousel page). */
final class DownloadItem {
    final String label;
    final String url;
    final boolean video;
    /**
     * Real `ExtendedImageUrl` variants probed against Instagram's in-memory cache, display variant
     * first. Carries width/height, so it produces the same `ImageCacheKey` the feed cached under.
     */
    final List<Object> cacheObjects;
    /** Same variants as URL strings, index-aligned with [cacheObjects]; string fallback tier. */
    final List<String> cacheUrls;
    /** Small variant fetched from the network when no cache tier hits; null when unavailable. */
    final String thumbnailUrl;

    DownloadItem(
            String label,
            String url,
            boolean video,
            List<Object> cacheObjects,
            List<String> cacheUrls,
            String thumbnailUrl
    ) {
        this.label = label;
        this.url = url;
        this.video = video;
        this.cacheObjects = cacheObjects;
        this.cacheUrls = cacheUrls;
        this.thumbnailUrl = thumbnailUrl;
    }
}
