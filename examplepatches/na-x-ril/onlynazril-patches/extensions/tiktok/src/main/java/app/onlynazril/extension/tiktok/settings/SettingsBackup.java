package app.onlynazril.extension.tiktok.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import app.onlynazril.extension.tiktok.Surfaces;
import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Exports every switch to one JSON object and loads it back.
 * <p>
 * The format is flat and versioned. Import only touches keys the file carries, so an older or
 * partial file leaves the rest of the settings alone.
 */
public final class SettingsBackup {
    public static final int REQUEST_EXPORT = 0x4F4E55;
    public static final int REQUEST_IMPORT = 0x4F4E56;

    private static final int VERSION = 1;
    private static final int MAX_BYTES = 256 * 1024;

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
            boolean done = read(activity, uri);
            Toast.makeText(activity, done ? "Settings imported" : "Import failed",
                    Toast.LENGTH_SHORT).show();
            if (done) RestartPrompt.askNow(activity);
        }
        return true;
    }

    private static boolean write(Context context, Uri uri) {
        try (OutputStream out = context.getContentResolver().openOutputStream(uri, "wt")) {
            if (out == null) return false;
            out.write(toJson(context).getBytes(StandardCharsets.UTF_8));
            return true;
        } catch (IOException | JSONException | SecurityException e) {
            Debug.print("settings: export failed (" + e + ")");
            return false;
        }
    }

    private static boolean read(Context context, Uri uri) {
        try (InputStream in = context.getContentResolver().openInputStream(uri)) {
            if (in == null) return false;
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            int total = 0;
            int count;
            while ((count = in.read(chunk)) != -1) {
                total += count;
                if (total > MAX_BYTES) return false;
                buffer.write(chunk, 0, count);
            }
            return apply(context, buffer.toString(StandardCharsets.UTF_8.name()));
        } catch (IOException | SecurityException e) {
            Debug.print("settings: import failed (" + e + ")");
            return false;
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

        root.put("resume_playback_enabled", ResumePlaybackSettings.isEnabled(context));
        root.put("resume_playback_start_s", ResumePlaybackSettings.startSeconds(context));
        root.put("resume_playback_end_s", ResumePlaybackSettings.endSeconds(context));

        root.put("captcha_hide_enabled", CaptchaSettings.isEnabled(context));
        root.put("comment_copy_without_username", CommentCopySettings.isEnabled(context));
        root.put("custom_font_enabled", CustomFontSettings.isEnabled(context));

        root.put("download_enabled", DownloadSettings.isEnabled(context));
        root.put("download_no_watermark", DownloadSettings.isNoWatermarkEnabled(context));
        root.put("download_every_sheet", DownloadSettings.isEverySheetEnabled(context));
        root.put("download_best_quality", DownloadSettings.isBestQualityEnabled(context));

        root.put("profile_bg_enabled", ProfileBgSettings.isEnabled(context));
        root.put("keep_screen_enabled", KeepScreenSettings.isEnabled(context));
        root.put("refresh_rate_fps", RefreshRateSettings.fps(context));
        root.put("pause_image_search_disabled", PauseImageSearchSettings.isDisabled(context));
        return root.toString(2);
    }

    private static boolean apply(Context context, String json) {
        try {
            JSONObject root = new JSONObject(json);
            if (root.optInt("version", VERSION) > VERSION) return false;

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
            if (root.has("custom_font_enabled")) {
                CustomFontSettings.setEnabled(context, root.optBoolean("custom_font_enabled"));
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

            HandleSettings.flush(context);
            return true;
        } catch (JSONException e) {
            Debug.print("settings: invalid file (" + e + ")");
            return false;
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
