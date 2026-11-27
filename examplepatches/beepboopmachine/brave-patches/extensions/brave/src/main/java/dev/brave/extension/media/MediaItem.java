package dev.brave.extension.media;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MediaItem implements Serializable {
    private static final long serialVersionUID = 2L;

    public static class HlsVariant implements Serializable, Comparable<HlsVariant> {
        private static final long serialVersionUID = 2L;
        public final String url;
        public final int bandwidth;
        public final int width;
        public final int height;
        public final String codecs;
        public final String audioPlaylistUrl;

        public HlsVariant(String url, int bandwidth, int width, int height, String codecs) {
            this(url, bandwidth, width, height, codecs, "");
        }

        public HlsVariant(String url, int bandwidth, int width, int height, String codecs, String audioPlaylistUrl) {
            this.url = url;
            this.bandwidth = bandwidth;
            this.width = width;
            this.height = height;
            this.codecs = codecs != null ? codecs : "";
            this.audioPlaylistUrl = audioPlaylistUrl != null ? audioPlaylistUrl : "";
        }

        public String getResolutionLabel() {
            if (height > 0) {
                return height + "p";
            }
            if (bandwidth > 0) {
                return (bandwidth / 1000) + " kbps";
            }
            return "Default";
        }

        @Override
        public int compareTo(HlsVariant other) {
            // Lexicographical: higher resolution first, then higher bandwidth
            if (this.height != other.height) {
                return Integer.compare(other.height, this.height);
            }
            return Integer.compare(other.bandwidth, this.bandwidth);
        }
    }

    public final String id;
    public volatile MediaType type;
    public final String url;
    public volatile String title;
    public volatile String mimeType;
    public volatile long sizeBytes;
    public volatile int width;
    public volatile int height;
    public volatile long durationMs;
    public volatile String userAgent;
    public volatile String cookie;
    public volatile String referer;
    public volatile String cookieSourceUrl = "";
    public volatile String pageUrl = "";
    public volatile String trackingUrl = "";
    public final int tabId;
    public final long timestamp;
    public volatile String thumbnailUrl;
    public volatile String qualityLabel;
    public volatile String audioUrl = "";
    public final List<HlsVariant> variants = new ArrayList<>();

    public MediaItem(
            String id,
            MediaType type,
            String url,
            String title,
            String mimeType,
            long sizeBytes,
            int width,
            int height,
            long durationMs,
            String userAgent,
            String cookie,
            String referer,
            int tabId
    ) {
        this(id, type, url, title, mimeType, sizeBytes, width, height, durationMs, userAgent, cookie, referer, tabId, "", "");
    }

    public MediaItem(
            String id,
            MediaType type,
            String url,
            String title,
            String mimeType,
            long sizeBytes,
            int width,
            int height,
            long durationMs,
            String userAgent,
            String cookie,
            String referer,
            int tabId,
            String thumbnailUrl,
            String qualityLabel
    ) {
        this.url = url != null ? url : "";
        this.id = id != null ? id : this.url;
        this.type = type != null ? type : MediaType.VIDEO;
        this.title = (title != null && !title.trim().isEmpty()) ? title.trim() : "Media_" + Math.abs(this.url.hashCode() % 100000);
        this.mimeType = mimeType != null ? mimeType : "";
        this.sizeBytes = sizeBytes;
        this.width = width;
        this.height = height;
        this.durationMs = durationMs;
        this.userAgent = userAgent != null ? userAgent : "";
        this.cookie = cookie != null ? cookie : "";
        this.referer = referer != null ? referer : "";
        this.cookieSourceUrl = this.referer;
        this.pageUrl = this.referer;
        this.trackingUrl = this.url;
        this.tabId = tabId;
        this.thumbnailUrl = (thumbnailUrl != null && !thumbnailUrl.trim().isEmpty()) ? thumbnailUrl.trim() : (this.type == MediaType.IMAGE ? this.url : "");
        this.qualityLabel = qualityLabel != null ? qualityLabel.trim() : "";
        this.timestamp = System.currentTimeMillis();
    }

    public synchronized void updateEnrichedMetadata(String title, String mime, int w, int h, long size, long dur) {
        updateEnrichedMetadata(title, mime, w, h, size, dur, null, null);
    }

    public synchronized void updateEnrichedMetadata(String title, String mime, int w, int h, long size, long dur, String thumb, String quality) {
        if (title != null && !title.trim().isEmpty() && !title.startsWith("Media_")) {
            this.title = title.trim();
        }
        if (mime != null && !mime.isEmpty()) {
            this.mimeType = mime;
        }
        if (w > 0) this.width = w;
        if (h > 0) this.height = h;
        if (size > 0) this.sizeBytes = size;
        if (dur > 0) this.durationMs = dur;
        if (thumb != null && !thumb.trim().isEmpty()) {
            if (this.thumbnailUrl == null || this.thumbnailUrl.trim().isEmpty()) {
                this.thumbnailUrl = thumb.trim();
            }
        }
        if (quality != null && !quality.trim().isEmpty()) this.qualityLabel = quality.trim();
    }

    public static int typePriority(MediaType t) {
        if (t == null) return 0;
        switch (t) {
            case HLS_STREAM: return 4;
            case DASH_STREAM: return 3;
            case VIDEO:
            case AUDIO: return 2;
            case IMAGE: return 1;
            default: return 0;
        }
    }

    /**
     * Merges all enriched metadata, authentication context, audio track URL, and HLS variants
     * from a richer duplicate entry into this canonical item, upgrading classification type
     * if the incoming item has higher specificity (e.g. VIDEO -> HLS_STREAM).
     */
    public synchronized boolean mergeFrom(MediaItem other) {
        if (other == null || other == this) return false;
        boolean upgradedType = false;
        if (typePriority(other.type) > typePriority(this.type)) {
            this.type = other.type;
            upgradedType = true;
        }
        updateEnrichedMetadata(other.title, other.mimeType, other.width, other.height,
                other.sizeBytes, other.durationMs, other.thumbnailUrl, other.qualityLabel);

        if ((this.userAgent == null || this.userAgent.isEmpty()) && other.userAgent != null && !other.userAgent.isEmpty()) {
            this.userAgent = other.userAgent;
        }
        if ((this.cookie == null || this.cookie.isEmpty()) && other.cookie != null && !other.cookie.isEmpty()) {
            this.cookie = other.cookie;
            if (other.cookieSourceUrl != null && !other.cookieSourceUrl.isEmpty()) {
                this.cookieSourceUrl = other.cookieSourceUrl;
            }
        }
        if ((this.referer == null || this.referer.isEmpty() || this.referer.equals(this.url))
                && other.referer != null && !other.referer.isEmpty() && !other.referer.equals(this.url)) {
            this.referer = other.referer;
        }
        if ((this.pageUrl == null || this.pageUrl.isEmpty() || this.pageUrl.equals(this.url))
                && other.pageUrl != null && !other.pageUrl.isEmpty()) {
            this.pageUrl = other.pageUrl;
        }
        if ((this.audioUrl == null || this.audioUrl.isEmpty()) && other.audioUrl != null && !other.audioUrl.isEmpty()) {
            this.audioUrl = other.audioUrl;
        }
        if (this.variants.isEmpty() && !other.variants.isEmpty()) {
            this.variants.addAll(other.variants);
        }
        return upgradedType;
    }

    public String getQualityLabel() {
        if (qualityLabel != null && !qualityLabel.trim().isEmpty()) {
            return qualityLabel.trim();
        }
        if (height > 0) {
            if (height >= 2160 || width >= 3840) return "4K";
            if (height >= 1440 || width >= 2560) return "2K";
            if (height >= 1080 || width >= 1920) return "1080p";
            if (height >= 720 || width >= 1280) return "720p";
            if (height >= 480) return "480p";
            if (height >= 360) return "360p";
            if (height >= 240) return "240p";
            return height + "p";
        }
        if (!variants.isEmpty()) {
            int maxH = 0;
            for (HlsVariant v : variants) {
                if (v.height > maxH) maxH = v.height;
            }
            if (maxH > 0) {
                if (variants.size() > 1) {
                    return "Multi (" + maxH + "p max)";
                } else {
                    return maxH + "p";
                }
            }
        }
        String target = (url + " " + title).toLowerCase(java.util.Locale.ROOT);
        if (target.contains("2160p") || target.contains("4k")) return "4K";
        if (target.contains("1440p") || target.contains("2k")) return "2K";
        if (target.contains("1080p") || target.contains("_1080")) return "1080p";
        if (target.contains("720p") || target.contains("_720") || target.contains("hd")) return "720p";
        if (target.contains("480p") || target.contains("_480")) return "480p";
        if (target.contains("360p") || target.contains("_360")) return "360p";
        if (target.contains("240p")) return "240p";
        return "";
    }

    public String getFormattedSize() {
        if (sizeBytes <= 0) return "";
        if (sizeBytes < 1024) return sizeBytes + " B";
        if (sizeBytes < 1024 * 1024) return String.format("%.1f KB", sizeBytes / 1024.0);
        if (sizeBytes < 1024 * 1024 * 1024) return String.format("%.1f MB", sizeBytes / (1024.0 * 1024.0));
        return String.format("%.2f GB", sizeBytes / (1024.0 * 1024.0 * 1024.0));
    }

    public String getResolutionString() {
        if (width > 0 && height > 0) {
            return width + "x" + height;
        }
        return "";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MediaItem mediaItem = (MediaItem) o;
        return Objects.equals(url, mediaItem.url);
    }

    @Override
    public int hashCode() {
        return url != null ? url.hashCode() : 0;
    }

    /**
     * Shared container extension & default MIME resolver used by both the picker relay path
     * and the direct MediaDownloadService fallback path.
     * Returns a 2-element array: { extensionWithDot, defaultMime }.
     */
    public static String[] resolveContainerFormat(String rawMime, String url, MediaType mediaType) {
        String ext = (mediaType == MediaType.AUDIO) ? ".mp3" : ".mp4";
        String defaultMime = (mediaType == MediaType.AUDIO) ? "audio/mpeg" : "video/mp4";
        String mimeLower = (rawMime != null) ? rawMime.toLowerCase(java.util.Locale.ROOT).trim() : "";
        int semi = mimeLower.indexOf(';');
        if (semi >= 0) mimeLower = mimeLower.substring(0, semi).trim();

        String pathLower = "";
        if (url != null && !url.isEmpty()) {
            try {
                String path = android.net.Uri.parse(url).getPath();
                if (path != null) pathLower = path.toLowerCase(java.util.Locale.ROOT);
            } catch (Throwable ignored) {}
        }

        if (mimeLower.contains("webm") || pathLower.endsWith(".webm")) { ext = ".webm"; defaultMime = "video/webm"; }
        else if (mimeLower.contains("matroska") || pathLower.endsWith(".mkv")) { ext = ".mkv"; defaultMime = "video/x-matroska"; }
        else if (mimeLower.contains("quicktime") || pathLower.endsWith(".mov")) { ext = ".mov"; defaultMime = "video/quicktime"; }
        else if (mimeLower.contains("x-msvideo") || pathLower.endsWith(".avi")) { ext = ".avi"; defaultMime = "video/x-msvideo"; }
        else if (mimeLower.contains("x-flv") || pathLower.endsWith(".flv") || pathLower.endsWith(".f4v")) { ext = ".flv"; defaultMime = "video/x-flv"; }
        else if (mimeLower.contains("3gpp") || pathLower.endsWith(".3gp")) { ext = ".3gp"; defaultMime = "video/3gpp"; }
        else if (mimeLower.equals("video/ogg") || pathLower.endsWith(".ogv")) { ext = ".ogv"; defaultMime = "video/ogg"; }
        else if (mimeLower.equals("image/gif") || pathLower.endsWith(".gif")) { ext = ".gif"; defaultMime = "image/gif"; }
        else if (mimeLower.equals("audio/mp4") || pathLower.endsWith(".m4a")) { ext = ".m4a"; defaultMime = "audio/mp4"; }
        else if (mimeLower.equals("audio/aac") || pathLower.endsWith(".aac")) { ext = ".aac"; defaultMime = "audio/aac"; }
        else if (mimeLower.equals("audio/ogg") || mimeLower.equals("audio/opus") || pathLower.endsWith(".ogg") || pathLower.endsWith(".opus")) { ext = ".ogg"; defaultMime = "audio/ogg"; }
        else if (mimeLower.equals("audio/flac") || pathLower.endsWith(".flac")) { ext = ".flac"; defaultMime = "audio/flac"; }
        else if (mimeLower.equals("audio/wav") || pathLower.endsWith(".wav")) { ext = ".wav"; defaultMime = "audio/wav"; }
        else if (mimeLower.equals("audio/mpeg") || pathLower.endsWith(".mp3")) { ext = ".mp3"; defaultMime = "audio/mpeg"; }
        else if (mimeLower.equals("video/mp4") || pathLower.endsWith(".mp4") || pathLower.endsWith(".m4v")) { ext = ".mp4"; defaultMime = "video/mp4"; }

        return new String[]{ ext, defaultMime };
    }
}
