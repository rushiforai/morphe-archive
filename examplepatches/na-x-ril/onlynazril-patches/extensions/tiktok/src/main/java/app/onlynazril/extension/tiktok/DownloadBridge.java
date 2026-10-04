package app.onlynazril.extension.tiktok;

import java.util.ArrayList;
import java.util.List;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.Reflect;
import app.onlynazril.extension.tiktok.settings.DownloadSettings;

/**
 * The download feature's hooks.
 *
 * The download restriction and the watermark are both decided by the app's own ACL object,
 * `com.ss.android.ugc.aweme.feed.model.ACLCommonShare`: `getCode()` carries the restriction,
 * `getShowType()` how the entry is offered, and `getTranscode()` whether the file is watermarked on
 * the way out. Answering those three is enough, and the app then downloads the file itself, through
 * its own flow and its own progress, for every kind of content.
 *
 * That is the approach ReVanced's TikTok download patch takes
 * (https://gitlab.com/ReVanced/revanced-patches, GPLv3), and it is the one used here. The earlier
 * version of this patch hooked the share sheet instead, widening the photo-download handler and
 * borrowing the photo configuration's protocols, and fetched the file itself. It got a row on screen,
 * but it could not know which of the app's addresses were watermarked and it cut the sheet's own work
 * short, which is why the saved file still carried a watermark and the panel came up with a third of
 * its rows.
 *
 * The address the app calls its download address is redirected as well, so the file is taken from the
 * highest bitrate playback variant instead of the watermarked address.
 */
public final class DownloadBridge {
    private static final int LOG_CAP = 8;

    private static int logged;

    private DownloadBridge() {}

    /** `ACLCommonShare#getCode()`: the restriction on downloading, lifted. */
    public static boolean removeRestriction() {
        return DownloadSettings.everySheetOn();
    }

    /** `ACLCommonShare#getShowType()`: how the entry is offered, opened. */
    public static boolean openEntry() {
        return DownloadSettings.everySheetOn();
    }

    /** `ACLCommonShare#getTranscode()`: whether the file is watermarked on the way out. */
    public static boolean removeWatermark() {
        return DownloadSettings.noWatermarkOn();
    }

    /**
     * The address the app hands out for a save, replaced by the best playback address the item
     * carries. Read by the app's own download, so what it fetches is the highest variant there is.
     */
    public static Object addressFor(Object video, Object original) {
        try {
            if (video == null || !DownloadSettings.bestQualityOn()) return original;
            Object best = bestQuality(video);
            return best != null ? best : original;
        } catch (Throwable t) {
            report("download: address lookup failed (" + t + ")");
            return original;
        }
    }

    /**
     * The best variant the item carries, or null when it carries none.
     *
     * The pick is made on the variant's quality class, not on its bitrate: the bitrate field is not
     * trustworthy (the original variant of one item reports 87 Mbps, and a variant whose field is
     * unset would be skipped entirely if the number were the rule). The class is read off the gear
     * name, which is the one field the app fills for every variant ("original_1080_0",
     * "adapt_lower_720_1"), with the model's own width and height used when they are set.
     *
     * Every list the model exposes is pooled, because they are not the same list: the raw array as
     * parsed, the one the app has already filtered, and the one behind the playback address (DASH).
     * The variants are listed in the log, which is what says whether a higher class exists at all.
     */
    private static Object bestQuality(Object video) {
        List<Object> variants = new ArrayList<>();
        collect(variants, Reflect.property(video, "getRawBitRate", "rawBitRate"));
        collect(variants, Reflect.property(video, "getBitRate", "bitRate"));
        Object play = Reflect.property(video, "getPlayAddr", "playAddr");
        if (play != null) collect(variants, Reflect.property(play, "getBitRate", "bitRate"));

        if (variants.isEmpty()) {
            report("download: no bitrate variants on the video");
            return null;
        }

        Object best = null;
        long bestScore = -1;
        String bestGear = "";
        StringBuilder seen = new StringBuilder();
        for (Object variant : variants) {
            Object address = Reflect.property(variant, "getPlayAddr", "playAddr");
            if (address == null) continue;
            String gear = String.valueOf(Reflect.property(variant, "getGearName", "gearName"));
            int quality = qualityOf(variant, gear);
            Number rate = asNumber(Reflect.property(variant, "getBitRate", "bitRate"));
            long score = scoreOf(gear, quality, rate);
            if (seen.length() < 200) {
                seen.append(gear).append('/').append(quality).append(' ');
            }
            if (score <= bestScore) continue;
            bestScore = score;
            best = address;
            bestGear = gear + "/" + quality;
        }
        report("download: " + variants.size() + " variant(s), best " + bestGear
                + " of [" + seen.toString().trim() + "]");
        return best;
    }

    private static void collect(List<Object> into, Object list) {
        if (list instanceof List) into.addAll((List<?>) list);
    }

    /** `original_*` first, then the higher quality class, then the higher bitrate. */
    private static long scoreOf(String gear, int quality, Number rate) {
        long original = gear != null && gear.startsWith("original") ? 1_000_000_000L : 0L;
        long bitrate = rate == null ? 0L : Math.max(0L, rate.longValue()) / 1000L;
        return original + (long) quality * 1_000_000L + bitrate;
    }

    /** The variant's quality class: its own height, or the largest number in its gear name. */
    private static int qualityOf(Object variant, String gear) {
        Object height = Reflect.property(variant, "getVideoHeight", "videoHeight");
        if (height instanceof Number && ((Number) height).intValue() > 0) {
            return ((Number) height).intValue();
        }
        Object width = Reflect.property(variant, "getVideoWidth", "videoWidth");
        if (width instanceof Number && ((Number) width).intValue() > 0) {
            return ((Number) width).intValue();
        }
        return biggestNumber(gear);
    }

    /** The largest number in a gear name, which is its quality class (`original_1080_0`). */
    private static int biggestNumber(String text) {
        if (text == null) return 0;
        int best = 0;
        int current = 0;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c >= '0' && c <= '9') {
                current = current * 10 + (c - '0');
                if (current > best) best = current;
            } else {
                current = 0;
            }
        }
        return best;
    }

    private static Number asNumber(Object value) {
        return value instanceof Number ? (Number) value : null;
    }

    private static void report(String message) {
        if (logged++ < LOG_CAP) Debug.print(message);
    }
}
