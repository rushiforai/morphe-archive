/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/DownloadsPreferenceCategory.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/DownloadsPreferenceCategory.java
 */

package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;
import android.text.format.Formatter;

import app.morphe.extension.tiktok.offline.CustomOfflineVideosLimitPatch;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.DownloadPathPreference;
import app.morphe.extension.tiktok.settings.preference.ChoicePreference;
import app.morphe.extension.tiktok.settings.preference.ForgetSavedVideosPreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.NumberInputPreference;
import app.morphe.extension.tiktok.settings.preference.SectionHeadingPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;
import app.morphe.extension.tiktok.download.DownloadDestination;
import app.morphe.extension.tiktok.download.DownloadNamePreview;
import app.morphe.extension.tiktok.download.ExternalDownloader;
import app.morphe.extension.tiktok.download.SavedVideoArchive;

/**
 * Where files go and what goes in them, then video, photos and stickers, the long presses,
 * subtitles, the hand-off to another app, and the offline limit. Each block belongs to its
 * own patch and any of them can be in the bundle alone, so every block is a plain if and never
 * a return: a return for one of them took every later block with it once.
 */
@SuppressWarnings("deprecation")
public class DownloadsPreferenceCategory extends ConditionalPreferenceCategory {
    public DownloadsPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Downloads");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.downloadEnabled || SettingsStatus.advancedDownloadsEnabled
                || SettingsStatus.customOfflineVideosEnabled
                || SettingsStatus.subtitleToolsEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        // The downloader is what reads the destinations and names. With only the offline
        // videos limit selected they were rows on a reachable page that changed nothing.
        if (SettingsStatus.downloadEnabled || SettingsStatus.advancedDownloadsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Files"));
            addPreference(new DownloadPathPreference(
                    context,
                    "Video destination",
                    Settings.DOWNLOAD_VIDEO_PATH,
                    DownloadDestination.Kind.VIDEO
            ));
            addPreference(new DownloadPathPreference(
                    context,
                    "Photo destination",
                    Settings.DOWNLOAD_PHOTO_PATH,
                    DownloadDestination.Kind.PHOTO
            ));
            if (SettingsStatus.downloadEnabled) {
                addPreference(new DownloadPathPreference(
                        context,
                        "Sticker destination",
                        Settings.DOWNLOAD_STICKER_PATH,
                        DownloadDestination.Kind.STICKER
                ));
            }
            addPreference(new InputTextPreference(
                    context,
                    "Video filename",
                    "Tokens: {creator}, {date}, {video_id}. Start with {creator}/ to give each creator a folder. The file extension is kept automatically.",
                    Settings.DOWNLOAD_VIDEO_FILENAME_TEMPLATE
            ).withNameKeyboard().withPreview(DownloadNamePreview::video));
            addPreference(new InputTextPreference(
                    context,
                    "Photo filename",
                    "Tokens: {creator}, {date}, {video_id}, {index}. {index} numbers the photos of a "
                            + "slideshow you save with Download original photos. Anything saved through "
                            + "TikTok's own button is numbered by the folder instead. The file "
                            + "extension is kept automatically.",
                    Settings.DOWNLOAD_PHOTO_FILENAME_TEMPLATE
            ).withNameKeyboard().withPreview(DownloadNamePreview::photo));
            if (SettingsStatus.downloadEnabled) {
                addPreference(new InputTextPreference(
                        context,
                        "Comment media filename",
                        "Tokens: {date}, {media_id}. Works for image and video stickers.",
                        Settings.DOWNLOAD_COMMENT_MEDIA_FILENAME_TEMPLATE
                ).withNameKeyboard().withPreview(DownloadNamePreview::commentMedia));
                addPreference(new TogglePreference(
                        context,
                        "Remove watermark",
                        "Applies to both video and photo downloads.",
                        Settings.REMOVE_DOWNLOAD_WATERMARK
                ));
            }
        }
        if (SettingsStatus.advancedDownloadsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Video"));
            addPreference(new ChoicePreference(context, "Video download quality", Settings.DOWNLOAD_VIDEO_QUALITY,
                    new String[]{"Automatic", "Highest", "Lowest", "1080p", "720p", "540p", "480p", "360p"},
                    new String[]{"auto", "highest", "lowest", "1080", "720", "540", "480", "360"}));
            addPreference(new TogglePreference(context, "Fall back to the watermarked copy",
                    "When the video without the watermark can't be fetched, save TikTok's own watermarked copy instead and say so. It's the size TikTok's own save uses, so it may be smaller than the quality you picked.",
                    Settings.DOWNLOAD_WATERMARK_FALLBACK));
            addPreference(new TogglePreference(context, "Save videos without sound",
                    "Leave the sound out of the saved video. Save the sound as well still writes "
                            + "the .m4a beside it if you want both.", Settings.DOWNLOAD_WITHOUT_SOUND));
            addPreference(new TogglePreference(context, "Save the sound as well",
                    "Write the video's sound beside it as an .m4a. Android 10 and later file audio separately, so it lands in Music under the same folder name as your videos.", Settings.DOWNLOAD_AUDIO_TRACK));
            addPreference(new TogglePreference(context, "Save the cover as well",
                    "Save the video's cover picture at the largest size TikTok has, each time you tap Download. It goes to your photo folder, named after the video.",
                    Settings.DOWNLOAD_COVER));
            addPreference(new TogglePreference(context, "Show download progress",
                    "Show a progress bar while a video saves.", Settings.DOWNLOAD_PROGRESS));
            addPreference(new TogglePreference(context, "Save details beside the video",
                    "Save the caption, creator, link and publication date in a TXT file. On Android 10 and later, the pair uses Download or Documents under the same folder name. Applies to saves handled here.",
                    Settings.DOWNLOAD_DETAILS));
            addPreference(new TogglePreference(context, "Save details as JSON",
                    "Write the details file as JSON instead of plain text, for scripts and archive tools.",
                    Settings.DOWNLOAD_DETAILS_JSON));
            addPreference(new TogglePreference(context, "Tag saved videos with their details",
                    "Write the caption, creator, publication date and link into the video file itself, where media players and tools like ffprobe can read them. Applies to saves handled here.",
                    Settings.DOWNLOAD_TAGS));
            addPreference(new TogglePreference(context, "Check for already-saved videos",
                    L10n.f(context, "Remember up to %1$s video saves made here while this is on. If the file still exists, offer Open or Save again before downloading another copy.",
                            java.text.NumberFormat.getIntegerInstance().format(SavedVideoArchive.LIMIT)),
                    Settings.CHECK_SAVED_VIDEOS));
            addPreference(new TogglePreference(context, "Mark saved videos",
                    "Put a ✓ before the view count on profile grids, and before the time on a feed "
                            + "video's creator row, for videos Hushfeed saved here. The feed's mark shows "
                            + "wherever Always show publish date shows the time. "
                            + "It reads the record Check for already-saved videos keeps, so it works only "
                            + "while that switch is on. Photo posts aren't marked, and a video you've deleted "
                            + "since keeps its mark until you use Forget saved videos.",
                    Settings.MARK_SAVED_VIDEOS));
            addPreference(new ForgetSavedVideosPreference(context));
        }
        if (SettingsStatus.advancedDownloadsEnabled || SettingsStatus.downloadEnabled) {
            addPreference(new SectionHeadingPreference(context, "Photos and stickers"));
        }
        if (SettingsStatus.advancedDownloadsEnabled) {
            addPreference(new TogglePreference(context, "Download original photos",
                    "Save every photo in the post at full size as a JPEG, not as the screen shows it.", Settings.DOWNLOAD_ORIGINAL_PHOTOS));
            addPreference(new TogglePreference(context, "Save photo posts as a video",
                    "Download video on a one-photo post makes the MP4 here, with the post's sound "
                            + "and no TikTok logo or end card. On a post with several photos, Download "
                            + "asks whether you want the photos you picked as full-size originals or "
                            + "as one video.", Settings.DOWNLOAD_PHOTOS_AS_VIDEO));
            addPreference(new NumberInputPreference(context, "Seconds per photo",
                    "How long each photo stays on screen in a video made from a photo post.",
                    Settings.PHOTO_VIDEO_SECONDS, "%1$s second", "%1$s seconds"));
        }
        if (SettingsStatus.downloadEnabled) {
            addPreference(new ChoicePreference(context, "Animated sticker format", Settings.DOWNLOAD_STICKER_FORMAT,
                    new String[]{"Video (MP4)", "GIF", "WebP, exactly as TikTok sent it"},
                    new String[]{"mp4", "gif", "webp"}));
        }
        if (SettingsStatus.advancedDownloadsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Long press"));
            addPreference(new TogglePreference(context, "Save a profile picture on a long press",
                    "Press and hold a profile picture to save the full size original to your photo destination.",
                    Settings.SAVE_PROFILE_PICTURE));
            addPreference(new TogglePreference(context, "Save a story on a long press",
                    "Press and hold a story to save it. Stories have no save button of their own, "
                            + "and holding one is how TikTok pauses it, so this takes that gesture over.",
                    Settings.SAVE_STORY));
        }
        if (SettingsStatus.subtitleToolsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Subtitles"));
            addPreference(new TogglePreference(context, "Save subtitles beside videos",
                    "Save SRT files with the video. They go to Movies on Android 11+, Download on Android 10, and your video folder on older versions. On Android 11+ with Save details on, the video moves to Download or Documents and the SRT files stay in Movies.", Settings.DOWNLOAD_SUBTITLES));
            addPreference(new ChoicePreference(context, "Subtitle language", Settings.SUBTITLE_LANGUAGE,
                    new String[]{"Original language", "Device language, then original", "All available languages"},
                    new String[]{"original", "device", "all"}));
        }
        if (SettingsStatus.advancedDownloadsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Hand-off"));
            addPreference(new InputTextPreference(
                    context,
                    "Send links to another app",
                    "An app's package name, like com.dv.adm. The save button sends the video's "
                            + "link there instead of saving it here. Leave it empty to save here.",
                    Settings.EXTERNAL_DOWNLOADER_PACKAGE)
                    .withCheck(value -> ExternalDownloader.packageNameProblem(value.trim()))
                    .withNameKeyboard());
            ChoicePreference ytdlnisType = new ChoicePreference(context, "YTDLnis download type",
                    Settings.YTDLNIS_DOWNLOAD_TYPE, new String[]{"Video", "Audio"},
                    new String[]{"video", "audio"});
            ytdlnisType.setSummary("For com.deniscerri.ytdl only. Ask YTDLnis for audio or video "
                    + "when the save button hands it a link.");
            addPreference(ytdlnisType);
            addPreference(new TogglePreference(context, "YTDLnis background mode",
                    "For com.deniscerri.ytdl only. Hide its download card and start the handoff in "
                            + "the background.", Settings.YTDLNIS_BACKGROUND));
        }
        if (SettingsStatus.customOfflineVideosEnabled) {
            addPreference(new SectionHeadingPreference(context, "Offline videos"));
            addPreference(new TogglePreference(
                    context,
                    "Use your own offline videos limit",
                    "Let the Offline videos menu use your own limit instead of TikTok's fixed one. Restart TikTok to apply this.",
                    Settings.CUSTOM_OFFLINE_VIDEOS
            ));
            addPreference(new NumberInputPreference(
                    context,
                    "Offline videos limit",
                    L10n.f(context, "Choose %1$d to %2$d videos. Values outside this range use the nearest valid limit. Restart TikTok to apply this.",
                            CustomOfflineVideosLimitPatch.MIN_LIMIT, CustomOfflineVideosLimitPatch.MAX_LIMIT),
                    Settings.CUSTOM_OFFLINE_VIDEO_LIMIT
            ) {
                @Override protected String extraSummaryLine() {
                    return L10n.f(getContext(), "About %1$s of storage at this limit", Formatter.formatShortFileSize(
                            getContext(), CustomOfflineVideosLimitPatch.storageBytes(Settings.CUSTOM_OFFLINE_VIDEO_LIMIT.get())));
                }
            });
            if (SettingsStatus.keepOfflineVideosEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Keep offline videos until you delete them",
                        "TikTok throws out the videos it saved for offline viewing after a set time, sometimes only two days, "
                                + "watched or not. With this on they stay until you delete them in TikTok's Offline videos settings. "
                                + "Delete them there when you want a fresh set. TikTok can still clear ones you've watched when your "
                                + "phone runs low on space.",
                        Settings.KEEP_OFFLINE_VIDEOS
                ));
            }
        }
    }
}
