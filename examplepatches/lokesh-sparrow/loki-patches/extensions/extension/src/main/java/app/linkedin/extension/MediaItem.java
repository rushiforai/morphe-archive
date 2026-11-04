package app.linkedin.extension;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** One downloadable photo or video found in an SDUI media viewer payload. */
final class MediaItem {
    private static final String VIDEO_PREFIX = "https://dms.licdn.com/playlist/vid/v2/";
    private static final String IMAGE_PREFIX = "https://media.licdn.com/dms/image/v2/";

    final String assetId;
    final boolean video;
    final String url;
    /** Video height (720 for mp4-720p) or image width. */
    final int size;
    String thumbnailUrl;

    private MediaItem(String assetId, boolean video, String url, int size) {
        this.assetId = assetId;
        this.video = video;
        this.url = url;
        this.size = size;
    }

    String label() {
        return video ? "Video " + size + "p" : "Photo " + size + "px";
    }

    /**
     * Videos: progressive MP4 renditions (.../vid/v2/{asset}/mp4-720p-30fp-crf28/...), best per asset.
     * Photos: post images (feedshare-, image-shrink_), or on profile screens the profile photo and
     * banner (profile-displayphoto, profile-displaybackgroundimage), best rendition per asset.
     * Logos, avatars, document covers and video covers are skipped; video covers become thumbnails.
     */
    static List<MediaItem> extract(ProtoScanner scan, boolean profileScreen) {
        Map<String, MediaItem> videos = new LinkedHashMap<>();
        for (String s : scan.strings) {
            int start = s.indexOf(VIDEO_PREFIX);
            if (start < 0) continue;
            String url = s.substring(start);
            String asset = segment(url, VIDEO_PREFIX.length());
            int mp4 = url.indexOf("/mp4-");
            if (asset == null || mp4 < 0) continue;
            int height = leadingInt(url, mp4 + "/mp4-".length());
            if (height <= 0) continue;
            MediaItem current = videos.get(asset);
            if (current == null || height > current.size) videos.put(asset, new MediaItem(asset, true, url, height));
        }

        Map<String, MediaItem> images = new LinkedHashMap<>();
        Map<String, String> thumbnails = new LinkedHashMap<>();
        for (ProtoScanner.ImageRef image : scan.images) {
            if (!image.root.startsWith(IMAGE_PREFIX)) continue;
            String asset = segment(image.root, IMAGE_PREFIX.length());
            if (asset == null) continue;
            String kind = image.root.substring(IMAGE_PREFIX.length() + asset.length() + 1);

            if (kind.startsWith("videocover")) {
                thumbnails.put(asset, image.smallestUrl);
            } else if (profileScreen
                    // Post viewers also carry the author's avatar, so profile images only count on profile screens.
                    ? kind.startsWith("profile-displayphoto") || kind.startsWith("profile-displaybackgroundimage")
                    : kind.startsWith("feedshare-") || kind.startsWith("image-shrink_")) {
                MediaItem current = images.get(asset);
                if (current == null || image.largestWidth > current.size) {
                    MediaItem item = new MediaItem(asset, false, image.largestUrl, image.largestWidth);
                    item.thumbnailUrl = image.smallestUrl;
                    images.put(asset, item);
                }
            }
        }

        List<MediaItem> result = new ArrayList<>();
        for (MediaItem video : videos.values()) {
            video.thumbnailUrl = thumbnails.get(video.assetId);
            result.add(video);
        }
        result.addAll(images.values());
        return result;
    }

    /** The path segment starting at index, up to the next '/'. */
    private static String segment(String url, int index) {
        int end = url.indexOf('/', index);
        return end > index ? url.substring(index, end) : null;
    }

    private static int leadingInt(String s, int index) {
        int value = 0;
        int i = index;
        while (i < s.length() && Character.isDigit(s.charAt(i))) {
            value = value * 10 + (s.charAt(i) - '0');
            i++;
        }
        return i > index ? value : -1;
    }
}
