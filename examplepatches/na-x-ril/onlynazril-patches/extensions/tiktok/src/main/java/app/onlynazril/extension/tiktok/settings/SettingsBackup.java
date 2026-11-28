package app.onlynazril.extension.tiktok.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Base64;
import android.widget.Toast;

import app.onlynazril.extension.tiktok.Surfaces;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/**
 * Exports every switch to one JSON object and loads it back.
 * <p>
 * The format is flat and versioned. Import only touches keys the file carries, so an older or
 * partial file leaves the rest of the settings alone. The imported fonts ride along as gzipped
 * base64, because no storage location survives an uninstall on every ROM, and a font cannot be
 * rebuilt from its name.
 */
public final class SettingsBackup {
    public static final int REQUEST_EXPORT = 0x4F4E55;
    public static final int REQUEST_IMPORT = 0x4F4E56;

    private static final int VERSION = 1;
    /** The whole file: a few kilobytes of switches plus the gzipped fonts. */
    private static final int MAX_BYTES = 16 * 1024 * 1024;
    /** How much gzipped font data one export carries. */
    private static final long MAX_FONTS_BYTES = 12L * 1024 * 1024;

    private SettingsBackup() {}

    /** Returns whether the result belonged to the backup pickers. */
    public static boolean onActivityResult(
            Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode != REQUEST_EXPORT && requestCode != REQUEST_IMPORT) return false;
        if (resultCode != Activity.RESULT_OK || data == null) return true;
        Uri uri = data.getData();
        if (uri == null) return true;

        if (requestCode == REQUEST_EXPORT) {
            boolean done = write(activity, uri);
            Toast.makeText(activity, done ? "Settings exported" : "Export failed",
                    Toast.LENGTH_SHORT).show();
        } else {
            Imported imported = read(activity, uri);
            String message;
            if (!imported.ok) {
                message = "Import failed";
            } else if (imported.fontMissing != null) {
                message = "Settings imported, but the font " + imported.fontMissing
                        + " is not on this device. Pick it again.";
            } else {
                message = "Settings imported";
            }
            Toast.makeText(activity, message,
                    imported.fontMissing != null ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT).show();
            if (imported.ok) RestartPrompt.askNow(activity);
        }
        return true;
    }

    /** What an import did, and the font it named but could not find on this device. */
    private static final class Imported {
        final boolean ok;
        final String fontMissing;

        Imported(boolean ok, String fontMissing) {
            this.ok = ok;
            this.fontMissing = fontMissing;
        }
    }

    private static boolean write(Context context, Uri uri) {
        try (OutputStream out = context.getContentResolver().openOutputStream(uri, "wt")) {
            if (out == null) return false;
            out.write(toJson(context).getBytes(StandardCharsets.UTF_8));
            return true;
        } catch (IOException | JSONException | SecurityException e) {
            Debug.print("settings: export failed (" + e + ")" + Debug.by(4));
            return false;
        }
    }

    private static Imported read(Context context, Uri uri) {
        try (InputStream in = context.getContentResolver().openInputStream(uri)) {
            if (in == null) return new Imported(false, null);
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            int total = 0;
            int count;
            while ((count = in.read(chunk)) != -1) {
                total += count;
                if (total > MAX_BYTES) {
                    Debug.print("settings: file is larger than " + MAX_BYTES + " bytes");
                    return new Imported(false, null);
                }
                buffer.write(chunk, 0, count);
            }
            return apply(context, buffer.toString(StandardCharsets.UTF_8.name()));
        } catch (IOException | SecurityException e) {
            Debug.print("settings: import failed (" + e + ")" + Debug.by(4));
            return new Imported(false, null);
        }
    }

    private static String toJson(Context context) throws JSONException {
        JSONObject root = new JSONObject();
        root.put("version", VERSION);

        root.put("handle_enabled", HandleSettings.isEnabled(context));
        root.put("region_enabled", HandleSettings.isRegionEnabled(context));
        root.put("region_name", HandleSettings.isRegionName(context));
        root.put("post_time_enabled", HandleSettings.isPostTimeEnabled(context));
        root.put("post_time_compact", HandleSettings.isCompactEnabled(context));
        root.put("clock", HandleSettings.isClockEnabled(context));
        root.put("date_format", HandleSettings.dateFormat(context).stored);
        root.put("date_pattern", HandleSettings.customDatePattern(context));
        root.put("surface_feed", HandleSettings.isSurfaceEnabled(context, Surfaces.FEED));
        root.put("surface_comments", HandleSettings.isSurfaceEnabled(context, Surfaces.COMMENTS));

        long[] views = FeedFilterSettings.minMaxViews();
        long[] likes = FeedFilterSettings.minMaxLikes();
        root.put("feed_filter_ads", FeedFilterSettings.isAdsEnabled(context));
        root.put("feed_filter_survey", FeedFilterSettings.isSurveyEnabled(context));
        root.put("feed_filter_live", FeedFilterSettings.isLiveEnabled(context));
        root.put("feed_filter_drama", FeedFilterSettings.isDramaEnabled(context));
        root.put("feed_filter_views_min", views[0]);
        root.put("feed_filter_views_max", views[1]);
        root.put("feed_filter_likes_min", likes[0]);
        root.put("feed_filter_likes_max", likes[1]);

        root.put("speed_up_only", SpeedOnlySettings.isEnabled(context));
        root.put("resume_playback_enabled", ResumePlaybackSettings.isEnabled(context));
        root.put("resume_playback_start_s", ResumePlaybackSettings.startSeconds(context));
        root.put("resume_playback_end_s", ResumePlaybackSettings.endSeconds(context));

        root.put("captcha_hide_enabled", CaptchaSettings.isEnabled(context));
        root.put("comment_copy_without_username", CommentCopySettings.isEnabled(context));
        root.put("custom_font_enabled", CustomFontSettings.isEnabled(context));
        String font = CustomFontSettings.storedSelection(context);
        if (font != null) root.put("custom_font_selected", font);
        JSONArray fonts = fonts(context);
        if (fonts.length() > 0) root.put("fonts", fonts);

        root.put("download_enabled", DownloadSettings.isEnabled(context));
        root.put("download_no_watermark", DownloadSettings.isNoWatermarkEnabled(context));
        root.put("download_every_sheet", DownloadSettings.isEverySheetEnabled(context));
        root.put("download_best_quality", DownloadSettings.isBestQualityEnabled(context));

        root.put("profile_bg_enabled", ProfileBgSettings.isEnabled(context));
        root.put("keep_screen_enabled", KeepScreenSettings.isEnabled(context));
        root.put("refresh_rate_fps", RefreshRateSettings.fps(context));
        root.put("pause_image_search_disabled", PauseImageSearchSettings.isDisabled(context));
        root.put("feed_search_hidden", FeedSearchSettings.isHidden(context));
        root.put("copy_handle_on_hold", HandleSettings.isCopyOnHoldEnabled(context));

        JSONObject flags = new JSONObject();
        for (Map.Entry<String, String> entry : FeatureFlagSettings.overrides().entrySet()) {
            flags.put(entry.getKey(), entry.getValue());
        }
        root.put("flag_overrides", flags);
        return root.toString(2);
    }

    private static Imported apply(Context context, String json) {
        String fontMissing = null;
        try {
            JSONObject root = new JSONObject(json);
            if (root.optInt("version", VERSION) > VERSION) return new Imported(false, null);

            if (root.has("handle_enabled")) {
                HandleSettings.setEnabled(context, root.optBoolean("handle_enabled"));
            }
            if (root.has("region_enabled")) {
                HandleSettings.setRegionEnabled(context, root.optBoolean("region_enabled"));
            }
            if (root.has("region_name")) {
                HandleSettings.setRegionName(context, root.optBoolean("region_name"));
            }
            if (root.has("post_time_enabled")) {
                HandleSettings.setPostTimeEnabled(context, root.optBoolean("post_time_enabled"));
            }
            if (root.has("post_time_compact")) {
                HandleSettings.setCompactEnabled(context, root.optBoolean("post_time_compact"));
            }
            if (root.has("clock")) {
                HandleSettings.setClockEnabled(context, root.optBoolean("clock"));
            } else if (root.has("comment_clock")) {
                // Backups written while the switch was comment-only.
                HandleSettings.setClockEnabled(context, root.optBoolean("comment_clock"));
            }
            if (root.has("date_format")) {
                HandleSettings.setDateFormat(
                        context, PostDateFormat.fromStored(root.optInt("date_format")));
            }
            if (root.has("date_pattern")) {
                HandleSettings.setCustomDatePattern(context, root.optString("date_pattern"));
            }
            if (root.has("surface_feed")) {
                HandleSettings.setSurfaceEnabled(
                        context, Surfaces.FEED, root.optBoolean("surface_feed"));
            }
            if (root.has("surface_comments")) {
                HandleSettings.setSurfaceEnabled(
                        context, Surfaces.COMMENTS, root.optBoolean("surface_comments"));
            }

            if (root.has("feed_filter_ads")) {
                FeedFilterSettings.setAdsEnabled(context, root.optBoolean("feed_filter_ads"));
            }
            if (root.has("feed_filter_survey")) {
                FeedFilterSettings.setSurveyEnabled(context, root.optBoolean("feed_filter_survey"));
            }
            if (root.has("feed_filter_live")) {
                FeedFilterSettings.setLiveEnabled(context, root.optBoolean("feed_filter_live"));
            }
            if (root.has("feed_filter_drama")) {
                FeedFilterSettings.setDramaEnabled(context, root.optBoolean("feed_filter_drama"));
            }
            applyRange(context, root, "feed_filter_views", true);
            applyRange(context, root, "feed_filter_likes", false);

            if (root.has("speed_up_only")) {
                SpeedOnlySettings.setEnabled(context, root.optBoolean("speed_up_only"));
            }
            if (root.has("resume_playback_enabled")) {
                ResumePlaybackSettings.setEnabled(
                        context, root.optBoolean("resume_playback_enabled"));
            }
            if (root.has("resume_playback_start_s")) {
                ResumePlaybackSettings.setStartSeconds(
                        context, root.optLong("resume_playback_start_s"));
            }
            if (root.has("resume_playback_end_s")) {
                ResumePlaybackSettings.setEndSeconds(
                        context, root.optLong("resume_playback_end_s"));
            }

            if (root.has("captcha_hide_enabled")) {
                CaptchaSettings.setEnabled(context, root.optBoolean("captcha_hide_enabled"));
            }
            if (root.has("comment_copy_without_username")) {
                CommentCopySettings.setEnabled(
                        context, root.optBoolean("comment_copy_without_username"));
            }
            restoreFonts(context, root);
            if (root.has("custom_font_enabled")) {
                CustomFontSettings.setEnabled(context, root.optBoolean("custom_font_enabled"));
            }
            if (root.has("custom_font_selected")) {
                // The bytes came with the backup, so the file is here unless the entry was
                // dropped by the size budget. A name with no file left is said out loud.
                String font = root.optString("custom_font_selected", null);
                if (font != null) {
                    if (CustomFontSettings.has(context, font)) {
                        CustomFontSettings.select(context, font);
                    } else {
                        fontMissing = font;
                    }
                }
            }

            if (root.has("download_enabled")) {
                DownloadSettings.setEnabled(context, root.optBoolean("download_enabled"));
            }
            if (root.has("download_no_watermark")) {
                DownloadSettings.setNoWatermarkEnabled(
                        context, root.optBoolean("download_no_watermark"));
            }
            if (root.has("download_every_sheet")) {
                DownloadSettings.setEverySheetEnabled(
                        context, root.optBoolean("download_every_sheet"));
            }
            if (root.has("download_best_quality")) {
                DownloadSettings.setBestQualityEnabled(
                        context, root.optBoolean("download_best_quality"));
            }

            if (root.has("profile_bg_enabled")) {
                ProfileBgSettings.setEnabled(context, root.optBoolean("profile_bg_enabled"));
            }
            if (root.has("keep_screen_enabled")) {
                KeepScreenSettings.setEnabled(context, root.optBoolean("keep_screen_enabled"));
            }
            if (root.has("refresh_rate_fps")) {
                RefreshRateSettings.setFps(context, root.optInt("refresh_rate_fps"));
            }
            if (root.has("pause_image_search_disabled")) {
                PauseImageSearchSettings.setDisabled(
                        context, root.optBoolean("pause_image_search_disabled"));
            }
            if (root.has("feed_search_hidden")) {
                FeedSearchSettings.setHidden(context, root.optBoolean("feed_search_hidden"));
            }
            if (root.has("flag_overrides")) {
                JSONObject flags = root.optJSONObject("flag_overrides");
                Map<String, String> overrides = new LinkedHashMap<>();
                if (flags != null) {
                    Iterator<String> names = flags.keys();
                    while (names.hasNext()) {
                        String key = names.next();
                        String value = flags.optString(key, null);
                        if (value != null) overrides.put(key, value);
                    }
                }
                FeatureFlagSettings.replaceOverrides(context, overrides);
            }
            if (root.has("copy_handle_on_hold")) {
                HandleSettings.setCopyOnHoldEnabled(
                        context, root.optBoolean("copy_handle_on_hold"));
            }

            HandleSettings.flush(context);
            return new Imported(true, fontMissing);
        } catch (JSONException e) {
            Debug.print("settings: invalid file (" + e + ")" + Debug.by(4));
            return new Imported(false, null);
        }
    }

    /**
     * The imported fonts themselves, gzipped and base64'd into the file. A font is the one part of
     * the settings that cannot be rebuilt from a name, and no storage location survives an
     * uninstall on every ROM, so the backup carries the bytes.
     */
    private static JSONArray fonts(Context context) throws JSONException {
        JSONArray fonts = new JSONArray();
        long carried = 0;
        for (String name : CustomFontSettings.names(context)) {
            byte[] raw = CustomFontSettings.bytes(context, name);
            if (raw == null) {
                Debug.print("settings: font " + name + " is too heavy for the export");
                continue;
            }
            byte[] packed = gzip(raw);
            if (packed == null) continue;
            if (carried + packed.length > MAX_FONTS_BYTES) {
                Debug.print("settings: font " + name + " exceeds the export budget");
                continue;
            }
            carried += packed.length;
            JSONObject entry = new JSONObject();
            entry.put("name", name);
            entry.put("gzip", true);
            entry.put("data", Base64.encodeToString(packed, Base64.NO_WRAP));
            fonts.put(entry);
        }
        return fonts;
    }

    /**
     * Writes the fonts a backup carries back into the working directory. A plain base64 entry,
     * which the first build wrote, is accepted as well as the gzipped one written now.
     */
    private static void restoreFonts(Context context, JSONObject root) {
        JSONArray fonts = root.optJSONArray("fonts");
        if (fonts == null) return;
        for (int i = 0; i < fonts.length(); i++) {
            JSONObject entry = fonts.optJSONObject(i);
            if (entry == null) continue;
            String name = entry.optString("name", null);
            String data = entry.optString("data", null);
            if (name == null || data == null) continue;
            byte[] bytes;
            try {
                bytes = Base64.decode(data, Base64.DEFAULT);
            } catch (IllegalArgumentException | OutOfMemoryError e) {
                Debug.print("settings: font " + name + " is not readable");
                continue;
            }
            if (entry.optBoolean("gzip", false)) {
                bytes = gunzip(bytes);
                if (bytes == null) {
                    Debug.print("settings: font " + name + " will not unpack");
                    continue;
                }
            }
            if (CustomFontSettings.restore(context, name, bytes) == null) {
                Debug.print("settings: font " + name + " is not a font file");
            }
        }
    }

    private static byte[] gzip(byte[] raw) {
        try (ByteArrayOutputStream out = new ByteArrayOutputStream(raw.length / 2 + 64);
                GZIPOutputStream zip = new GZIPOutputStream(out)) {
            zip.write(raw);
            zip.finish();
            return out.toByteArray();
        } catch (IOException e) {
            return null;
        }
    }

    private static byte[] gunzip(byte[] packed) {
        try (GZIPInputStream zip = new GZIPInputStream(new ByteArrayInputStream(packed))) {
            ByteArrayOutputStream out = new ByteArrayOutputStream(packed.length * 2);
            byte[] buffer = new byte[8192];
            int read;
            while ((read = zip.read(buffer)) > 0) out.write(buffer, 0, read);
            return out.toByteArray();
        } catch (IOException e) {
            return null;
        }
    }

    private static void applyRange(Context context, JSONObject root, String prefix, boolean views) {
        String minKey = prefix + "_min";
        String maxKey = prefix + "_max";
        if (!root.has(minKey) || !root.has(maxKey)) return;
        long min = root.optLong(minKey, -1);
        long max = root.optLong(maxKey, -1);
        if (min < 0 || max < min) return;
        if (views) {
            FeedFilterSettings.setViewsRange(context, min, max);
        } else {
            FeedFilterSettings.setLikesRange(context, min, max);
        }
    }
}
