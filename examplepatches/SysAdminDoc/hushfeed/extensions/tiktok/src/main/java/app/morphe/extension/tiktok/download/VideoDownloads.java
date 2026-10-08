/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

final class VideoDownloads {
    private static final Set<String> ACTIVE = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    /** The videos whose already-saved choice is on screen, a subset of {@link #ACTIVE}. */
    private static final Set<String> ASKING = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private VideoDownloads() {}

    /**
     * One save of a video, into the row that follows it. Not Consumer: java.util.function arrived
     * at API 24 and D8 can't backport a type, so on Android 6 every save through here threw
     * NoClassDefFoundError with the video's id still held. Lint doesn't flag it.
     */
    private interface Save {
        void accept(SaveProgress progress);
    }

    /**
     * The rendition a download takes: the chosen quality, or on Automatic the highest when
     * captions need a file of our own; null leaves the save to TikTok. Read from every rendition
     * TikTok received ({@link QualitySelector#rawGears}).
     */
    static Object selectedGear(Object video, String quality, boolean withCaptions) {
        Object rates = QualitySelector.rawGears(video);
        if (!(rates instanceof List<?>)) return null;
        if (!"auto".equals(quality)) return QualitySelector.chooseForFile(video, (List<?>) rates, quality);
        return withCaptions ? QualitySelector.chooseForFile(video, (List<?>) rates, "highest") : null;
    }

    /** With the already-saved check on every video Download is this save's, and so is its cover. */
    static boolean savesTheCover() {
        return Settings.CHECK_SAVED_VIDEOS.get();
    }

    static boolean start(Object aweme, Context context) {
        return start(aweme, context, true);
    }

    /**
     * {@code withCover} is false for a story's save, which goes through here too and has never
     * made a cover.
     */
    static boolean start(Object aweme, Context context, boolean withCover) {
        if (context == null) return false;
        if (android.os.Build.VERSION.SDK_INT < 29
                && context.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) return false;
        Object video = Reflect.property(aweme, "getVideo", "video");
        List<SubtitleDownloads.Track> captions = SettingsStatus.subtitleToolsEnabled && Settings.DOWNLOAD_SUBTITLES.get()
                ? SubtitleDownloads.tracks(video, Settings.SUBTITLE_LANGUAGE.get(), Locale.getDefault()) : Collections.emptyList();
        String quality = Settings.DOWNLOAD_VIDEO_QUALITY.get();
        boolean muted = Settings.DOWNLOAD_WITHOUT_SOUND.get();
        boolean withDetails = Settings.DOWNLOAD_DETAILS.get();
        boolean detailsAsJson = Settings.DOWNLOAD_DETAILS_JSON.get();
        boolean withTags = Settings.DOWNLOAD_TAGS.get();
        boolean checkSaved = Settings.CHECK_SAVED_VIDEOS.get();
        // Read as the save is accepted: a forget in settings while it runs leaves it unrecorded.
        long archiveGeneration = SavedVideoArchive.generation();
        boolean showProgress = Settings.DOWNLOAD_PROGRESS.get();
        boolean stampedFallback = stampedFallbackWanted();
        // TikTok's own save has no second try, so a fallback to the stamped copy needs the save
        // here.
        boolean extras = withDetails || withTags || checkSaved || showProgress || stampedFallback;
        // Photo posts can carry a video model too. Quality, mute and subtitle choices must
        // not intercept their save before OriginalPhotos or TikTok's still/live-photo job.
        if (Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo") != null) return false;
        boolean automatic = "auto".equals(quality);
        // Automatic with nothing else asked for is TikTok's own download, which already does
        // the right thing. Taking the sound off is a reason to take it over, but not a reason
        // to fetch a different file: on Automatic the source stays the one TikTok would have
        // used and only the sound is left out of it.
        if (captions.isEmpty() && automatic && !muted && !extras) return false;
        Object selected = selectedGear(video, quality, !captions.isEmpty());
        if (selected == null && captions.isEmpty() && !muted && !extras) return false;
        List<String> selectedUrls = urls(Reflect.property(selected, "getPlayAddr", "playAddr"));
        if (selected == null) {
            selectedUrls = automaticUrls(video);
        }
        List<String> videoUrls = List.copyOf(selectedUrls);
        List<String> stampedUrls = stampedFallback ? stampedFallbackUrls(video, videoUrls) : Collections.emptyList();
        boolean dash = selected != null && Boolean.TRUE.equals(Reflect.invoke(video, "hasDashBitrate"));
        List<String> audioUrls = dash ? List.copyOf(audioUrls(video, selected)) : Collections.emptyList();
        boolean unavailable = videoUrls.isEmpty() || (dash && !muted && audioUrls.isEmpty());
        if (unavailable && !checkSaved) {
            // A details file can't come from TikTok's own save, so that save is refused here. A
            // progress row alone is no reason to refuse one TikTok could still have made.
            if (withDetails) {
                Utils.showToastLong(L10n.t("This video isn't available as a complete file. Try again later."));
                return true;
            }
            Utils.showToastShort(L10n.t(
                    "This quality isn't available as a complete file, so TikTok's own save runs instead"));
            return false;
        }
        String id = Reflect.string(aweme, "getAid", "aid");
        if (id == null) return false;
        Context app = context.getApplicationContext();
        String name, path;
        DownloadDetails facts = withDetails || withTags ? new DownloadDetails(aweme, detailsAsJson) : null;
        DownloadDetails details = withDetails ? facts : null;
        Map<String, String> tags = withTags ? Mp4Tags.of(facts) : Collections.emptyMap();
        try {
            name = DownloadFilenameFormatter.formatSelectedVideoName(aweme);
            String destination = DownloadFilenameFormatter.destinationPath(aweme, false);
            path = withDetails ? DownloadDetails.pairedPath(destination)
                    : captions.isEmpty() ? destination : SubtitleDownloads.pairedPath(destination);
        } catch (RuntimeException exception) {
            // Working out the name is reflection over TikTok's model, so it can throw. Leaving
            // the id in ACTIVE here would refuse every later attempt on this video in silence.
            Logger.printException(() -> "Could not work out the download name", exception);
            if (extras) Utils.showToastLong(L10n.t("The video couldn't be saved. Try again, or choose Automatic."));
            return extras;
        }
        String audioName = null;
        if (AudioDownloads.enabled()) {
            try {
                audioName = DownloadFilenameFormatter.formatSelectedAudioName(aweme);
            } catch (RuntimeException exception) {
                Logger.printException(() -> "Could not work out the sound download name", exception);
            }
        }
        final String audioNameSnapshot = audioName;
        List<SubtitleDownloads.Track> captionSnapshot = List.copyOf(captions);
        String key = "video " + id;
        if (!ACTIVE.add(id)) {
            // Said rather than swallowed, so a second tap doesn't read as a broken button.
            Utils.showToastShort(ASKING.contains(id) ? L10n.t("The saved-video choice is still open")
                    : MediaJobScheduler.busyMessage(key));
            return true;
        }
        // Everything from here is one save of this video until it lets go of the id: its wait in
        // line, the already-saved check, the choice that check may ask for and the save itself.
        // Whichever of them ends it lets go, and letting go a second time does nothing.
        AtomicBoolean held = new AtomicBoolean(true);
        Runnable release = () -> {
            if (!held.compareAndSet(true, false)) return;
            ASKING.remove(id);
            ACTIVE.remove(id);
        };
        // The video, the sound beside it when wanted, then each subtitle track. From three files
        // up, or with progress asked for, a row follows the save from the moment it is accepted.
        int files = 1 + (details != null ? 1 : 0) + (audioNameSnapshot != null ? 1 : 0) + captionSnapshot.size();
        Save save = progress -> {
            // A source is needed for a new copy, but a remembered file can still be opened
            // after TikTok stops supplying a download address for this post.
            if (unavailable) {
                Utils.showToastLong(L10n.t("This video isn't available as a complete file. Try again later."));
                return;
            }
            Utils.showToastShort(L10n.f("Saving video to %1$s", path));
            List<File> temporary = new ArrayList<>();
            // The row offers Cancel, which lets the file under way finish and leaves the rest.
            // The video is the save itself: when it fails nothing else is tried; a sound or a
            // track that fails is skipped, and the result says so.
            int firstSubtitle = files - captionSnapshot.size();
            MediaFileWriter.Saved[] published = {null};
            File[] picture = {null};
            File[] sound = {null};
            int[] subtitles = {0};
            boolean[] soundSkipped = {false};
            boolean[] remembered = {!checkSaved};
            boolean[] stamped = {false};
            try {
                SaveProgress.Outcome outcome = progress.run(index -> {
                    if (index == 0) {
                        try {
                            picture[0] = temp(app, temporary);
                            // Whether the picture and the sound are separate files to be put
                            // together. TikTok's stamped copy is one file with both in it.
                            boolean separate = dash;
                            try {
                                RemoteMedia.fetch(videoUrls, picture[0], RemoteMedia.Kind.VIDEO, progress::transfer);
                                progress.transfer(0, -1);
                                if (dash && !muted) {
                                    // The sound is a separate stream here and the save is not
                                    // finished without it, so a failure to fetch it fails the whole thing.
                                    sound[0] = temp(app, temporary);
                                    RemoteMedia.fetch(audioUrls, sound[0], RemoteMedia.Kind.VIDEO);
                                }
                            } catch (MediaBudget.StopException stop) {
                                // A cancel, or out of time or space, is the save's answer.
                                throw stop;
                            } catch (IOException clean) {
                                if (stampedUrls.isEmpty()) throw clean;
                                Logger.printException(() -> "The clean video couldn't be fetched, so TikTok's watermarked copy is saved instead", clean);
                                sound[0] = null;
                                RemoteMedia.fetch(stampedUrls, picture[0], RemoteMedia.Kind.VIDEO, progress::transfer);
                                progress.transfer(0, -1);
                                separate = false;
                                stamped[0] = true;
                            }
                            File result = picture[0];
                            if (separate && !muted) {
                                result = temp(app, temporary);
                                TrackMuxer.combine(picture[0], sound[0], result);
                            } else if (separate && AudioDownloads.enabled() && !audioUrls.isEmpty()) {
                                // Muted, but the sound is wanted beside it as an .m4a. That is a
                                // second file, so losing it is not a reason to lose the video as well.
                                try {
                                    File soundFile = temp(app, temporary);
                                    RemoteMedia.fetch(audioUrls, soundFile, RemoteMedia.Kind.VIDEO);
                                    sound[0] = soundFile;
                                } catch (IOException | RuntimeException exception) {
                                    Logger.printException(() -> "Could not fetch the sound to save beside a muted video", exception);
                                }
                            } else if (!separate && muted) {
                                // One file with both tracks in it, so the picture is copied out on its own.
                                result = temp(app, temporary);
                                TrackMuxer.videoOnly(picture[0], result);
                            }
                            if (!tags.isEmpty()) result = tagged(app, temporary, result, tags);
                            published[0] = MediaFileWriter.publishForResult(app, result, name, "video/mp4", path, true);
                        } catch (IOException | RuntimeException failure) {
                            progress.stop();
                            throw failure;
                        }
                        if (checkSaved) {
                            try {
                                SavedVideoArchive.remember(app, id, published[0], archiveGeneration);
                                remembered[0] = true;
                            } catch (RuntimeException failure) {
                                Logger.printException(() -> "Could not remember the saved video", failure);
                            }
                        }
                    } else if (index == 1 && details != null) {
                        details.save(app, published[0], path);
                    } else if (index < firstSubtitle) {
                        // The sound is already on disk: the separate stream when the video has
                        // one, otherwise the video itself, which still carries it because the
                        // copy that dropped it went to a different file. Fetching it again would
                        // download twice. Its word keeps to a toast, so the video's banner below
                        // isn't taken down.
                        // The writer says a failure by toast and answers false; the count has
                        // to know, or a lost sound would read as a save with everything in it.
                        if (!AudioDownloads.write(app, audioNameSnapshot, sound[0] == null ? picture[0] : sound[0], path, false)) {
                            soundSkipped[0] = true;
                            throw new IOException("The sound beside the video was not saved");
                        }
                    } else {
                        SubtitleDownloads.saveOne(app, captionSnapshot.get(index - firstSubtitle), published[0].name, path);
                        subtitles[0]++;
                    }
                });
                if (published[0] == null) {
                    Utils.showToastLong(outcome.stop == SaveProgress.Stop.SERVER_WAIT
                            ? SaveProgress.message(outcome, "")
                            : L10n.t("The video couldn't be saved. Try again, or choose Automatic."));
                } else {
                    // The video's own words when everything landed or only a track is missing,
                    // since they name the tracks that came; the count for anything else.
                    String own = subtitleResult(captionSnapshot.size(), subtitles[0], path);
                    if (details != null) own = L10n.f("Video and details saved to %1$s", path);
                    // Said over everything else, since it's not the file that was asked for.
                    if (stamped[0]) own = L10n.f("The video without the watermark couldn't be fetched, so TikTok's watermarked copy was saved to %1$s. Try again later for the clean copy.", path);
                    boolean onlyTracks = details == null && outcome.cancelled == 0
                            && outcome.stop == SaveProgress.Stop.NONE && !soundSkipped[0];
                    String said = onlyTracks ? own : SaveProgress.message(outcome, own);
                    SaveNotice.saved(said, published[0]);
                    // A count took the banner, so the watermark is said on its own.
                    if (stamped[0] && !said.equals(own)) Utils.showToastLong(own);
                    if (!remembered[0]) Utils.showToastLong(L10n.t("The video was saved, but its record couldn't be updated. A later save may make another copy."));
                }
            } catch (RuntimeException exception) {
                Logger.printException(() -> "Selected-quality download failed", exception);
                Utils.showToastLong(L10n.t("The video couldn't be saved. Try again, or choose Automatic."));
            } finally {
                for (File file : temporary) if (!MediaCache.delete(file)) Logger.printInfo(() -> "Could not remove video temporary file");
            }
        };
        // Save again on the already-saved choice, on the main thread. The choice keeps the id
        // held for this second job, which lets go when it ends, or at once when the line is full.
        Runnable saveAgain = () -> {
            ASKING.remove(id);
            if (withCover) CoverSaver.beside(app, aweme);
            SaveProgress again = SaveProgress.queued(files, showProgress);
            again.submit("video", key, () -> save.accept(again), release);
            again.acknowledge(null, L10n.t("Waiting to save video"));
        };
        SaveProgress first = SaveProgress.queued(files, showProgress);
        AtomicBoolean asking = new AtomicBoolean();
        MediaJobScheduler.Job job = first.submit("video", key, () -> {
            if (checkSaved) {
                try {
                    MediaFileWriter.Saved previous = SavedVideoArchive.find(app, id);
                    if (previous != null) {
                        // The choice owns the save from here, so the end of this job leaves
                        // the id held, and a row that came up for a save goes before it asks.
                        first.dismiss();
                        asking.set(true);
                        ASKING.add(id);
                        SavedVideoArchive.offer(previous, saveAgain, release);
                        return;
                    }
                } catch (RuntimeException failure) {
                    Logger.printException(() -> "Could not check for an already-saved video", failure);
                    Utils.showToastLong(L10n.t("The already-saved check failed. Try again."));
                    return;
                }
                if (withCover) Utils.runOnMainThread(() -> CoverSaver.beside(app, aweme));
            }
            save.accept(first);
        }, () -> {
            if (!asking.get()) release.run();
        });
        if (job == null) return extras;
        // The save's own start says where it is going a moment later; only a wait needs a word now.
        first.acknowledge(null, L10n.t("Waiting to save video"));
        return true;
    }

    /**
     * What to say once the file is written. Three separate sentences rather than one built
     * from pieces: a translator needs the whole sentence to move the words around inside it.
     */
    private static String subtitleResult(int wanted, int saved, String path) {
        if (wanted == 0) return L10n.t("Video saved");
        if (saved == wanted) {
            return L10n.f("Video saved with %1$s subtitles in %2$s", saved, path);
        }
        return L10n.f("Video saved in %1$s, but only %2$s of %3$s subtitles came with it",
                path, saved, wanted);
    }

    private static File temp(Context context, List<File> files) throws IOException {
        File file = MediaCache.createTempFile(context, "selected-video-", ".mp4");
        files.add(file);
        return file;
    }

    /**
     * The video with its details written in, or the same file when they can't be. The tags are a
     * nicety, so a file this can't rewrite is still saved, just without them.
     */
    private static File tagged(Context context, List<File> files, File video, Map<String, String> tags) throws IOException {
        try {
            File withTags = temp(context, files);
            if (Mp4Tags.write(video, withTags, tags)) return withTags;
            Logger.printInfo(() -> "Saved the video without tags: its layout isn't one they can be written into");
        } catch (MediaBudget.StopException stop) {
            // Out of time or space is the save's answer, not the tags'.
            throw stop;
        } catch (IOException | RuntimeException exception) {
            Logger.printException(() -> "Could not write the video's tags, so it's saved without them", exception);
        }
        return video;
    }

    /** Every address the video itself can be fetched from, best first. */
    /**
     * Automatic, taken over for a switch like details or progress, keeps to the file TikTok's
     * own save would have made: the stamped one while Remove watermark is off. It fetched the
     * clean one whatever that switch said.
     */
    static List<String> automaticUrls(Object video) {
        if (DownloadsPatch.shouldRemoveWatermark()) return sourceUrls(video);
        List<String> stamped = urls(Reflect.property(video, "getDownloadAddr", "downloadAddr"));
        return stamped.isEmpty() ? sourceUrls(video) : stamped;
    }

    /**
     * The stamped copy as a fallback is for a save that asked for the clean one. With Remove
     * watermark off a failed fetch of a picked quality isn't a missing clean file, and the notice
     * would blame the watermark for it.
     */
    static boolean stampedFallbackWanted() {
        return Settings.DOWNLOAD_WATERMARK_FALLBACK.get() && DownloadsPatch.shouldRemoveWatermark();
    }

    /**
     * TikTok's stamped copy, for when the clean file can't be fetched: the addresses of
     * {@code downloadAddr} that the clean save isn't already trying. Remove watermark only ever
     * fills {@code downloadNoWatermarkAddr}, so this one stays TikTok's own. Empty when the save
     * is the stamped copy already, as Automatic is with Remove watermark off.
     */
    static List<String> stampedFallbackUrls(Object video, List<String> clean) {
        List<String> stamped = new ArrayList<>(urls(Reflect.property(video, "getDownloadAddr", "downloadAddr")));
        stamped.removeAll(clean);
        return List.copyOf(stamped);
    }

    static List<String> sourceUrls(Object video) {
        List<String> found = urls(Reflect.property(video, "getDownloadNoWatermarkAddr", "downloadNoWatermarkAddr"));
        if (found.isEmpty()) found = urls(Reflect.property(video, "getDownloadAddr", "downloadAddr"));
        if (found.isEmpty()) found = urls(Reflect.property(video, "getPlayAddr", "playAddr"));
        return found;
    }

    static List<String> audioUrls(Object video, Object gear) {
        Object raw = Reflect.readField(video, "bitRateAudio");
        if (!(raw instanceof List<?>)) return Collections.emptyList();
        String wanted = "";
        String extra = Reflect.string(gear, "getVideoExtra", "videoExtra");
        if (extra != null) {
            try { wanted = new JSONObject(extra).optString("audio_file_id"); }
            catch (org.json.JSONException exception) { return Collections.emptyList(); }
        }
        List<String> selected = Collections.emptyList();
        long bestRate = -1;
        for (Object track : (List<?>) raw) {
            Object meta = Reflect.property(track, "getAudioMeta", "audioMeta");
            if (!wanted.isEmpty() && !wanted.equals(Reflect.string(meta, "getFileId", "fileId"))) continue;
            Object addresses = Reflect.property(meta, "getUrlList", "urlList");
            List<String> candidates = new ArrayList<>();
            for (String[] field : new String[][]{{"getMainUrl", "mainUrl"}, {"getBackupUrl", "backupUrl"}, {"getFallbackUrl", "fallbackUrl"}}) {
                String url = Reflect.string(addresses, field[0], field[1]);
                if (MediaTransport.hasAllowedShape(url)) candidates.add(url);
            }
            Object rate = Reflect.property(meta, "getBitrate", "bitrate");
            long value = rate instanceof Number ? ((Number) rate).longValue() : 0;
            if (!candidates.isEmpty() && value > bestRate) { selected = candidates; bestRate = value; }
        }
        return selected;
    }

    /** The https addresses inside a UrlModel, in the order it lists them. */
    static List<String> urls(Object address) {
        Object raw = Reflect.property(address, "getUrlList", "urlList");
        List<String> result = new ArrayList<>();
        if (raw instanceof List<?>) for (Object url : (List<?>) raw) {
            if (url instanceof String && MediaTransport.hasAllowedShape((String) url)) {
                result.add((String) url);
            }
        }
        return result;
    }
}
