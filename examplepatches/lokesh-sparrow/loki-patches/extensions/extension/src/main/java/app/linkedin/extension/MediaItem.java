/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * One savable photo or video found in an SDUI media viewer payload.
 *
 * <p>Only the best rendition of each asset is kept: the tallest progressive MP4 for a video, the
 * widest image for a photo. Video covers are collected separately and become the thumbnails.
 */
final class MediaItem {
    private static final String VIDEO_PATH = "https://dms.licdn.com/playlist/vid/v2/";
    private static final String IMAGE_PATH = "https://media.licdn.com/dms/image/v2/";
    private static final String MP4_MARKER = "/mp4-";

    /** The asset id from the URL: what makes two renditions the same photo or video. */
    final String assetId;
    /** Whether this is a video (MP4) rather than a photo (JPEG). */
    final boolean video;
    /** Full URL to hand to the DownloadManager. */
    final String url;
    /** Video height in pixels ("720" for mp4-720p), or image width in pixels. */
    final int size;
    /** Preview image for the download button; null when the payload carried no cover. */
    String thumbnailUrl;

    private MediaItem(String assetId, String url, int size, boolean video) {
        this.assetId = assetId;
        this.video = video;
        this.url = url;
        this.size = size;
    }

    /** "Video 720p" or "Photo 1080px". */
    String label() {
        String kind = video ? "Video " : "Photo ";
        return kind + size + (video ? "p" : "px");
    }

    /**
     * Everything savable in one payload, videos first, then photos, each in payload order.
     *
     * <p>Recognised asset kinds: progressive MP4 renditions; post images (feedshare-,
     * image-shrink_); and, on profile screens, the profile photo and banner. Logos, avatars,
     * document covers and video covers are skipped — covers are only kept as thumbnails.
     *
     * @param scan          result of scanning the payload bytes
     * @param profileScreen whether the payload came from a profile rather than the feed
     */
    static List<MediaItem> extract(ProtoScanner scan, boolean profileScreen) {
        Map<String, MediaItem> clips = new LinkedHashMap<>();
        collectVideos(scan, clips);

        Map<String, MediaItem> photos = new LinkedHashMap<>();
        Map<String, String> covers = new LinkedHashMap<>();
        collectPhotos(scan, profileScreen, photos, covers);

        List<MediaItem> savable = new ArrayList<>(clips.size() + photos.size());
        for (MediaItem clip : clips.values()) {
            clip.thumbnailUrl = covers.get(clip.assetId);
            savable.add(clip);
        }
        savable.addAll(photos.values());
        return savable;
    }

    /** Best MP4 rendition per asset, keyed by asset id and kept in the order first seen. */
    private static void collectVideos(ProtoScanner scan, Map<String, MediaItem> into) {
        for (int i = 0; i < scan.strings.size(); i++) {
            String found = scan.strings.get(i);
            int start = found.indexOf(VIDEO_PATH);
            if (start == -1) continue;
            String candidate = found.substring(start);
            String asset = segmentAfter(candidate, VIDEO_PATH.length());
            int mp4At = candidate.indexOf(MP4_MARKER);
            if (asset == null || mp4At < 0) continue;
            int height = digitsAt(candidate, mp4At + MP4_MARKER.length());
            if (height < 1) continue;
            MediaItem known = into.get(asset);
            // The payload usually lists several sizes of the same video; keep the tallest.
            if (known == null || height > known.size) into.put(asset, new MediaItem(asset, candidate, height, true));
        }
    }

    /** Best photo per asset, plus the video covers found along the way. */
    private static void collectPhotos(ProtoScanner scan, boolean profileScreen,
                                      Map<String, MediaItem> photos, Map<String, String> covers) {
        for (ProtoScanner.ImageRef picture : scan.images) {
            if (!picture.root.startsWith(IMAGE_PATH)) continue;
            String asset = segmentAfter(picture.root, IMAGE_PATH.length());
            if (asset == null) continue;
            String kind = picture.root.substring(IMAGE_PATH.length() + asset.length() + 1);

            boolean isCover = kind.startsWith("videocover");
            if (isCover) {
                covers.put(asset, picture.smallestUrl);
                continue;
            }
            // A post viewer also carries the author's avatar, so profile images only count on
            // profile screens — and post images only count everywhere else.
            if (!isWanted(kind, profileScreen)) continue;

            MediaItem known = photos.get(asset);
            if (known != null && picture.largestWidth <= known.size) continue;
            MediaItem photo = new MediaItem(asset, picture.largestUrl, picture.largestWidth, false);
            photo.thumbnailUrl = picture.smallestUrl;
            photos.put(asset, photo);
        }
    }

    private static boolean isWanted(String kind, boolean profileScreen) {
        if (profileScreen) {
            return kind.startsWith("profile-displayphoto") || kind.startsWith("profile-displaybackgroundimage");
        }
        return kind.startsWith("feedshare-") || kind.startsWith("image-shrink_");
    }

    /** The segment after {@code from} up to the next slash, or null when it is empty. */
    private static String segmentAfter(String text, int from) {
        int slash = text.indexOf('/', from);
        if (slash <= from) return null;
        return text.substring(from, slash);
    }

    /** The digits starting at {@code from} as an int, or -1 when there is no digit there. */
    private static int digitsAt(String text, int from) {
        int end = from;
        while (end < text.length() && Character.isDigit(text.charAt(end))) end++;
        if (end == from) return -1;
        int number = 0;
        for (int i = from; i < end; i++) number = number * 10 + (text.charAt(i) - '0');
        return number;
    }
}
