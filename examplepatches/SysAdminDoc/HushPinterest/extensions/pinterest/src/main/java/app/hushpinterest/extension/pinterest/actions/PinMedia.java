/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;
import java.util.TreeMap;

import app.hushpinterest.extension.pinterest.ads.ModelFields;

/** Resolves public media and metadata Pinterest already supplied with a pin, without inspecting a file. */
final class PinMedia {
    private PinMedia() {}

    static Object field(Object model, String name) {
        if (model == null) return null;
        if (model instanceof Map<?, ?>) return ((Map<?, ?>) model).get(name);
        return ModelFields.read(ModelFields.of(model.getClass()), model, name);
    }

    static String id(Object pin) {
        Object id = field(pin, "id");
        if (!(id instanceof String) || !((String) id).matches("[0-9]{1,30}")) return null;
        // Boards and people also have numeric ids. A pin declares both media model fields,
        // even for an image whose videos field is null. A board cover can have images alone.
        if (pin instanceof Map<?, ?>) {
            Map<?, ?> fields = (Map<?, ?>) pin;
            if (!fields.containsKey("images") && !fields.containsKey("videos")) return null;
        } else if (!ModelFields.of(pin.getClass()).containsKey("images") ||
                !ModelFields.of(pin.getClass()).containsKey("videos")) return null;
        return (String) id;
    }

    static String pinUrl(Object pin) {
        String id = id(pin);
        return id == null ? null : "https://www.pinterest.com/pin/" + id + "/";
    }

    static URI webUri(String url) {
        if (url == null || url.length() > 16384 || !url.equals(url.trim())) return null;
        try {
            URI uri = new URI(url);
            String scheme = uri.getScheme();
            if (!("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme)) ||
                    uri.getHost() == null || uri.getRawUserInfo() != null || uri.getPort() == 0 ||
                    uri.getPort() < -1 || uri.getPort() > 65535) return null;
            return uri;
        } catch (URISyntaxException malformed) {
            return null;
        }
    }

    static boolean pinterestUri(URI uri) {
        String host = uri.getHost().toLowerCase(java.util.Locale.ROOT).replaceFirst("\\.$", "");
        return host.equals("pin.it") || host.endsWith(".pin.it") ||
                host.matches("(?:[a-z0-9-]+\\.)*pinterest\\.[a-z.]+");
    }

    static URI mediaUri(String url) {
        URI uri = webUri(url);
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme()) ||
                (uri.getPort() != -1 && uri.getPort() != 443)) return null;
        String host = uri.getHost().toLowerCase(java.util.Locale.ROOT);
        return host.equals("pinimg.com") || host.endsWith(".pinimg.com") ? uri : null;
    }

    static Source source(Object pin) {
        Resolution media = resolve(pin);
        return media == null ? null : media.source;
    }

    /** Null means the model isn't a verified pin; a known pin can carry a specific refusal. */
    static Resolution resolve(Object pin) {
        String id = id(pin);
        if (id == null) return null;
        Object videoList = field(field(pin, "videos"), "video_list");
        if (videoList instanceof Map<?, ?>) {
            // A sorted copy makes equal-size alternatives deterministic across model map types.
            TreeMap<String, Object> videos = new TreeMap<>();
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) videoList).entrySet()) {
                if (entry.getKey() instanceof String) videos.put((String) entry.getKey(), entry.getValue());
            }
            Source best = null;
            Object selected = null, unsupported = null;
            double largest = -1;
            double largestUnsupported = -1;
            boolean adaptive = false;
            for (Object video : videos.values()) {
                double area = dimension(field(video, "width")) * dimension(field(video, "height"));
                URI supplied = field(video, "url") instanceof String ? mediaUri((String) field(video, "url")) : null;
                if (supplied != null && supplied.getPath() != null) {
                    String path = supplied.getPath().toLowerCase(java.util.Locale.ROOT);
                    adaptive |= path.endsWith(".m3u8") || path.endsWith(".mpd");
                }
                if (unsupported == null || area > largestUnsupported) {
                    unsupported = video;
                    largestUnsupported = area;
                }
                Source candidate = sourceUrl(field(video, "url"), true);
                if (candidate == null) continue;
                if (best == null || area > largest) {
                    best = candidate;
                    selected = video;
                    largest = area;
                }
            }
            if (best != null) return new Resolution(id, best, null, selected);
            // A supplied playlist still identifies a video when is_video was omitted.
            if (!((Map<?, ?>) videoList).isEmpty()) {
                return new Resolution(id, null, adaptive ? Refusal.ADAPTIVE_VIDEO : Refusal.MP4_MISSING, unsupported);
            }
        }
        // A video thumbnail is not the video the user asked to save.
        if (Boolean.TRUE.equals(field(pin, "is_video"))) return new Resolution(id, null, Refusal.MP4_MISSING, null);
        Object original = field(field(pin, "images"), "orig");
        Object url = field(original, "url");
        Source source = sourceUrl(url, false);
        Refusal refusal = source != null ? null : !(url instanceof String) ? Refusal.ORIGINAL_MISSING
                : mediaUri((String) url) == null ? Refusal.PUBLIC_LINK : Refusal.ORIGINAL_TYPE;
        return new Resolution(id, source, refusal, original);
    }

    private static double dimension(Object value) {
        if (!(value instanceof Number)) return 0;
        double number = ((Number) value).doubleValue();
        return Double.isFinite(number) && number > 0 && number <= 100000 ? number : 0;
    }

    private static Integer suppliedDimension(Object value) {
        double number = dimension(value);
        return number > 0 && number == Math.rint(number) ? (int) number : null;
    }

    enum Refusal { ORIGINAL_MISSING, ORIGINAL_TYPE, PUBLIC_LINK, MP4_MISSING, ADAPTIVE_VIDEO }

    static final class Resolution {
        final String id;
        final Source source;
        final Refusal refusal;
        final Integer width, height;
        final String urlType;

        private Resolution(String id, Source source, Refusal refusal, Object supplied) {
            this.id = id;
            this.source = source;
            this.refusal = refusal;
            width = suppliedDimension(field(supplied, "width"));
            height = suppliedDimension(field(supplied, "height"));
            // Type comes only from a supported supplied URL, never a probe or a thumbnail.
            urlType = source == null ? null : source.mime;
        }
    }

    static Source sourceUrl(Object value, boolean video) {
        if (!(value instanceof String)) return null;
        URI uri = mediaUri((String) value);
        if (uri == null || uri.getPath() == null) return null;
        String path = uri.getPath().toLowerCase(java.util.Locale.ROOT);
        if (video) return path.endsWith(".mp4") ? new Source(uri.toString(), "video/mp4", ".mp4") : null;
        if (path.endsWith(".jpg") || path.endsWith(".jpeg")) return new Source(uri.toString(), "image/jpeg", ".jpg");
        if (path.endsWith(".png")) return new Source(uri.toString(), "image/png", ".png");
        if (path.endsWith(".webp")) return new Source(uri.toString(), "image/webp", ".webp");
        if (path.endsWith(".gif")) return new Source(uri.toString(), "image/gif", ".gif");
        return null;
    }

    static final class Source {
        final String url;
        final String mime;
        final String suffix;

        Source(String url, String mime, String suffix) {
            this.url = url;
            this.mime = mime;
            this.suffix = suffix;
        }
    }
}
