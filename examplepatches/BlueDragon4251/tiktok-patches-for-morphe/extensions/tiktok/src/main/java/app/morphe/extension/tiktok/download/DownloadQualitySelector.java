package app.morphe.extension.tiktok.download;

import com.ss.android.ugc.aweme.base.model.UrlModel;
import com.ss.android.ugc.aweme.feed.model.Video;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.tiktok.settings.Settings;

/** Runtime-safe discovery of TikTok video quality variants. */
final class DownloadQualitySelector {
    private static final int MAX_DEPTH = 4;
    private static final int MAX_COLLECTION_ITEMS = 64;
    private static final Pattern RESOLUTION = Pattern.compile(
            "(?:^|[^0-9])(2160|1440|1080|960|720|640|576|540|480|432|360|288|240)(?:p|[^0-9]|$)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern P_RESOLUTION = Pattern.compile(
            "(?:^|[^a-z0-9])p(2160|1440|1080|960|720|640|576|540|480|432|360|288|240)(?:[^0-9]|$)",
            Pattern.CASE_INSENSITIVE
    );

    private DownloadQualitySelector() {
    }

    static UrlModel select(Video video) {
        String quality = normalize(Settings.DOWNLOAD_VIDEO_QUALITY.get());
        if ("auto".equals(quality) || video == null) {
            return null;
        }

        List<Candidate> candidates = new ArrayList<>();
        Set<Object> visited = Collections.newSetFromMap(new IdentityHashMap<>());
        collect(video, "video", 0, -1, candidates, visited);
        if (candidates.isEmpty()) {
            return null;
        }

        Candidate selected = "highest".equals(quality)
                ? selectHighest(candidates)
                : selectTarget(candidates, parseTarget(quality));
        return selected == null ? null : selected.model;
    }

    private static Candidate selectHighest(List<Candidate> candidates) {
        Candidate best = null;
        for (Candidate candidate : candidates) {
            if (best == null || compareQuality(candidate, best) > 0) {
                best = candidate;
            }
        }
        return best;
    }

    private static Candidate selectTarget(List<Candidate> candidates, int target) {
        if (target <= 0) return selectHighest(candidates);

        Candidate exactOrLower = null;
        Candidate higher = null;
        for (Candidate candidate : candidates) {
            if (candidate.height <= 0) continue;
            if (candidate.height <= target) {
                if (exactOrLower == null
                        || candidate.height > exactOrLower.height
                        || (candidate.height == exactOrLower.height && compareQuality(candidate, exactOrLower) > 0)) {
                    exactOrLower = candidate;
                }
            } else if (higher == null
                    || candidate.height < higher.height
                    || (candidate.height == higher.height && compareQuality(candidate, higher) > 0)) {
                higher = candidate;
            }
        }
        if (exactOrLower != null) return exactOrLower;
        if (higher != null) return higher;
        return selectHighest(candidates);
    }

    private static int compareQuality(Candidate left, Candidate right) {
        if (left.height != right.height) return Integer.compare(left.height, right.height);
        if (left.size != right.size) return Long.compare(left.size, right.size);
        return Integer.compare(left.sourceRank, right.sourceRank);
    }

    private static void collect(
            Object value,
            String path,
            int depth,
            int inheritedHeight,
            List<Candidate> out,
            Set<Object> visited
    ) {
        if (value == null || depth > MAX_DEPTH || visited.contains(value)) return;
        visited.add(value);

        if (value instanceof UrlModel) {
            UrlModel model = (UrlModel) value;
            if (isVideoPath(path) && hasUsableUrl(model)) {
                int parsed = resolutionFromModel(model, path);
                int height = parsed > 0 ? parsed : inheritedHeight;
                out.add(new Candidate(path, model, height, safeSize(model), sourceRank(path)));
            }
            return;
        }

        Class<?> type = value.getClass();
        if (type.isArray()) {
            int count = Math.min(Array.getLength(value), MAX_COLLECTION_ITEMS);
            for (int i = 0; i < count; i++) {
                collect(Array.get(value, i), path + '[' + i + ']', depth + 1, inheritedHeight, out, visited);
            }
            return;
        }
        if (value instanceof Iterable<?>) {
            int index = 0;
            for (Object item : (Iterable<?>) value) {
                if (index >= MAX_COLLECTION_ITEMS) break;
                collect(item, path + '[' + index + ']', depth + 1, inheritedHeight, out, visited);
                index++;
            }
            return;
        }

        String className = type.getName();
        if (!(className.startsWith("com.ss.android.")
                || className.startsWith("com.bytedance.")
                || className.startsWith("X."))) {
            return;
        }

        int localHeight = findHeightHint(value, inheritedHeight);
        for (Class<?> owner = type; owner != null && owner != Object.class; owner = owner.getSuperclass()) {
            Field[] fields;
            try {
                fields = owner.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers()) || field.isSynthetic()) continue;
                try {
                    field.setAccessible(true);
                    Object child = field.get(value);
                    collect(child, path + '.' + field.getName(), depth + 1, localHeight, out, visited);
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static int findHeightHint(Object value, int fallback) {
        int best = fallback;
        Class<?> type = value.getClass();
        for (Class<?> owner = type; owner != null && owner != Object.class; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                String name = field.getName().toLowerCase(Locale.US);
                if (!name.contains("height") && !name.equals("h")) continue;
                if (!(field.getType() == int.class || Number.class.isAssignableFrom(field.getType()))) continue;
                try {
                    field.setAccessible(true);
                    Object raw = field.get(value);
                    int number = raw instanceof Number ? ((Number) raw).intValue() : field.getInt(value);
                    if (number >= 144 && number <= 4320) best = number;
                } catch (Throwable ignored) {
                }
            }
        }
        return best;
    }

    private static int resolutionFromModel(UrlModel model, String path) {
        int fromPath = parseResolution(path);
        if (fromPath > 0) return fromPath;
        try {
            int value = parseResolution(model.getUrlKey());
            if (value > 0) return value;
        } catch (Throwable ignored) {
        }
        try {
            int value = parseResolution(model.getUri());
            if (value > 0) return value;
        } catch (Throwable ignored) {
        }
        try {
            List<String> urls = model.getUrlList();
            if (urls != null) {
                for (String url : urls) {
                    int value = parseResolution(url);
                    if (value > 0) return value;
                }
            }
        } catch (Throwable ignored) {
        }
        return -1;
    }

    private static int parseResolution(String value) {
        if (value == null) return -1;
        Matcher matcher = RESOLUTION.matcher(value);
        if (matcher.find()) return Integer.parseInt(matcher.group(1));
        matcher = P_RESOLUTION.matcher(value);
        if (matcher.find()) return Integer.parseInt(matcher.group(1));
        return -1;
    }

    private static boolean isVideoPath(String path) {
        String value = path.toLowerCase(Locale.US);
        if (value.contains("cover") || value.contains("thumb") || value.contains("poster")
                || value.contains("avatar") || value.contains("image")) {
            return false;
        }
        return value.contains("play") || value.contains("download") || value.contains("bitrate")
                || value.contains("bit_rate") || value.contains("gear") || value.contains("video");
    }

    private static int sourceRank(String path) {
        String value = path.toLowerCase(Locale.US);
        if (value.contains("downloadnowatermark")) return 5;
        if (value.contains("h264")) return 4;
        if (value.contains("bitrate") || value.contains("bit_rate") || value.contains("gear")) return 3;
        if (value.contains("play")) return 2;
        return 1;
    }

    private static boolean hasUsableUrl(UrlModel model) {
        try {
            List<String> urls = model.getUrlList();
            if (urls == null) return false;
            for (String url : urls) {
                if (url != null && !url.trim().isEmpty() && !"null".equalsIgnoreCase(url.trim())) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static long safeSize(UrlModel model) {
        try {
            return model.getSize();
        } catch (Throwable ignored) {
            return -1L;
        }
    }

    private static String normalize(String value) {
        if (value == null) return "auto";
        String normalized = value.trim().toLowerCase(Locale.US);
        if (normalized.equals("highest") || normalized.equals("1080") || normalized.equals("720")
                || normalized.equals("540") || normalized.equals("480") || normalized.equals("360")) {
            return normalized;
        }
        return "auto";
    }

    private static int parseTarget(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return -1;
        }
    }

    private static final class Candidate {
        final String path;
        final UrlModel model;
        final int height;
        final long size;
        final int sourceRank;

        Candidate(String path, UrlModel model, int height, long size, int sourceRank) {
            this.path = path;
            this.model = model;
            this.height = height;
            this.size = size;
            this.sourceRank = sourceRank;
        }
    }
}
