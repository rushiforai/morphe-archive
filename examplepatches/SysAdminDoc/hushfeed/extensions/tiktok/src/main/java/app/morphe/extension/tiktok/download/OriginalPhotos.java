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
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public final class OriginalPhotos {
    private static final Set<String> ACTIVE = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private OriginalPhotos() {}

    public static boolean start(Object aweme, Context context) {
        // Handing the link to another app replaces the save, so it comes before all of it.
        if (ExternalDownloader.handOff(aweme, context)) return true;
        if (VideoDownloads.start(aweme, context)) return true;
        // Nothing here is handling the video, so the sound has to fetch its own bytes. When
        // the quality download above took it, it saved the sound from what it already had.
        AudioDownloads.start(aweme, context);
        return savePhotos(aweme, context, null);
    }

    /**
     * TikTok's own photo save job, which every photo save on 47.0.3 runs and the start above
     * never sees: "Download image" in the sheet a single photo asks with, a single photo saved
     * without asking, the photos picked in TikTok's selection sheet, and a TikTok Now save.
     * {@code indices} are the photos it was asked for, counted from 0.
     *
     * <p>{@code video} is not "this is a video save": inside the job it picks the live-photo
     * video over the still for the items that have one ({@code livePhotoStruct.videoModel}),
     * and the picker's Download sets it for every save, plain stills included, which is how
     * two picked stills came out as TikTok's own files with the switch on (S22, 2026-09-23).
     * So it only stands aside where it matters: a chosen photo that really is a live photo
     * would come down as a video, and that save stays TikTok's whole.
     *
     * @return true when Hushfeed took the save, so TikTok's own must not run.
     */
    public static boolean startPhotos(Object aweme, Set<?> indices, boolean video) {
        if (video && anyChosenIsLive(aweme, indices)) return false;
        return savePhotos(aweme, Utils.getContext(), indices);
    }

    /**
     * The separate "Download video" choice that compiles a still photo and its sound into an
     * MP4. This runs before TikTok starts that job. Its callback expects a video path and opens
     * video sharing, so the image job never calls it, including on failure or cancellation.
     * Live Photo video choices stay native. This entry carries no selected-photo indices.
     */
    public static boolean startImageAsVideo(Object aweme) {
        if (!Settings.DOWNLOAD_ORIGINAL_PHOTOS.get()) return false;
        Object info = Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo");
        // Keep the null-info video path outside this Photo Mode conversion hook.
        if (info == null) return false;
        Object raw = Reflect.property(info, "getImageList", "imageList");
        if (raw instanceof List<?> && anyChosenIsLive(aweme, null)) return false;
        return savePhotos(aweme, Utils.getContext(), null, true);
    }

    /**
     * Whether any photo the save was asked for carries a live-photo video. An unreadable post
     * answers yes: with the flag set, guessing "all stills" could swallow a video save.
     */
    static boolean anyChosenIsLive(Object aweme, Set<?> indices) {
        Object info = Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo");
        Object raw = Reflect.property(info, "getImageList", "imageList");
        if (!(raw instanceof List<?>)) return true;
        List<?> photos = (List<?>) raw;
        for (int position : positions(indices, photos.size())) {
            Object live = Reflect.property(photos.get(position), "getLivePhotoStruct", "livePhotoStruct");
            if (live != null && Reflect.property(live, "getVideoModel", "videoModel") != null) return true;
        }
        return false;
    }

    /** The positions to save, in the post's order: all of them for null, else the ones asked for. */
    static List<Integer> positions(Set<?> indices, int count) {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            if (indices == null || asked(indices, i)) result.add(i);
        }
        return result;
    }

    private static boolean asked(Set<?> indices, int position) {
        for (Object index : indices) {
            if (index instanceof Number && ((Number) index).longValue() == position) return true;
        }
        return false;
    }

    private static boolean savePhotos(Object aweme, Context context, Set<?> indices) {
        return savePhotos(aweme, context, indices, false);
    }

    private static boolean savePhotos(Object aweme, Context context, Set<?> indices, boolean conversion) {
        if (!Settings.DOWNLOAD_ORIGINAL_PHOTOS.get()) return false;
        if (context == null) return failedConversion(conversion);
        if (Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo") == null) return false;
        if (android.os.Build.VERSION.SDK_INT < 29
                && context.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) return failedConversion(conversion);
        List<List<String>> photos = sources(aweme);
        if (photos.isEmpty()) {
            if (conversion) {
                Utils.showToastShort(L10n.t("The original photos aren't available. No video was saved."));
            } else {
                Utils.showToastShort(L10n.t(
                        "The original photos aren't available, so TikTok's own save runs instead"));
            }
            return conversion;
        }
        List<Integer> chosen = positions(indices, photos.size());
        // Asked for photos this post doesn't have: TikTok's own save says what it makes of that.
        if (chosen.isEmpty()) return failedConversion(conversion);
        String id = Reflect.string(aweme, "getAid", "aid");
        if (id == null) return failedConversion(conversion);
        List<List<String>> photoSnapshot = snapshot(photos);
        String path = DownloadFilenameFormatter.destinationPath(aweme, true);
        List<String> names = new ArrayList<>();
        for (int i = 0; i < photos.size(); i++) {
            names.add(DownloadFilenameFormatter.formatOriginalPhotoName(aweme, i + 1, "tmp"));
        }
        String key = "photos " + id;
        if (!ACTIVE.add(id)) {
            Utils.showToastShort(MediaJobScheduler.busyMessage(key));
            return true;
        }
        Context app = context.getApplicationContext();
        // Every original-photo save has a file count and Cancel, including one chosen still.
        SaveProgress progress = SaveProgress.queuedFiles(chosen.size());
        MediaJobScheduler.Job job = progress.submit("original photos", key, () -> {
            // The banner's Open lands on the newest photo, which is where the gallery puts the rest.
            MediaFileWriter.Saved[] last = {null};
            try {
                // A photo that fails is skipped and the rest still land, and the result says what did.
                SaveProgress.Outcome outcome = progress.run(index -> {
                    int i = chosen.get(index);
                    MediaBudget.checkDiskSpace(app.getCacheDir(), -1L);
                    File temp = MediaCache.createTempFile(app, "original-photo-", ".tmp");
                    try {
                        String extension = PhotoToJpeg.convert(app, temp,
                                RemoteMedia.fetch(photoSnapshot.get(i), temp, RemoteMedia.Kind.IMAGE));
                        String mime = "jpg".equals(extension) ? "image/jpeg" : "image/" + extension;
                        // Numbered by the photo's place in the post, also when only some are saved.
                        String named = names.get(i);
                        String name = named.substring(0, named.lastIndexOf('.') + 1) + extension;
                        last[0] = MediaFileWriter.publishForResult(app, temp, name, mime, path, false);
                    } finally {
                        if (!MediaCache.delete(temp)) Logger.printInfo(() -> "Could not remove original photo temporary file");
                    }
                });
                if (outcome.saved == 0 && outcome.cancelled == 0) {
                    Utils.showToastLong(L10n.t("None of the photos could be saved. Try again."));
                } else {
                    SaveNotice.saved(SaveProgress.message(outcome, L10n.quantity(Utils.getContext(), outcome.saved,
                            "Saved one original photo", "Saved %1$s original photos")), last[0]);
                }
            } catch (RuntimeException exception) {
                Logger.printException(() -> "Original photo download failed", exception);
                Utils.showToastLong(L10n.t("None of the photos could be saved. Try again."));
            }
        }, () -> ACTIVE.remove(id));
        // The scheduler already reports a refusal. A requested image save must not become a
        // native converted video merely because the image queue is full.
        if (job == null) return conversion;
        String saying = L10n.quantity(app, chosen.size(), "Saving one original photo", "Saving %1$s original photos");
        progress.acknowledge(saying, saying);
        return true;
    }

    private static boolean failedConversion(boolean conversion) {
        if (conversion) Utils.showToastLong(L10n.t("None of the photos could be saved. Try again."));
        return conversion;
    }

    private static List<List<String>> snapshot(List<List<String>> photos) {
        List<List<String>> copy = new ArrayList<>();
        for (List<String> photo : photos) copy.add(List.copyOf(photo));
        return List.copyOf(copy);
    }

    static List<List<String>> sources(Object aweme) {
        Object info = Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo");
        Object raw = Reflect.property(info, "getImageList", "imageList");
        if (!(raw instanceof List<?>)) return Collections.emptyList();
        List<List<String>> result = new ArrayList<>();
        for (Object photo : (List<?>) raw) {
            Object model = Reflect.property(photo, "getDisplayImageNoWatermark", "displayImageNoWatermark");
            Object urls = Reflect.property(model, "getUrlList", "urlList");
            List<String> candidates = new ArrayList<>();
            if (urls instanceof List<?>) {
                for (Object url : (List<?>) urls) {
                    if (url instanceof String && MediaTransport.hasAllowedShape((String) url)) {
                        candidates.add((String) url);
                    }
                }
            }
            // Never silently save just part of a post whose original sources are missing.
            if (candidates.isEmpty()) return Collections.emptyList();
            int position = result.size() + 1;
            Logger.printDebug(() -> listing(position, candidates));
            result.add(saveOrder(candidates));
        }
        return result;
    }

    /**
     * The order a photo's addresses are tried in: JPEG copies, then the rest, then HEIF and AVIF
     * copies, each group in TikTok's order.
     *
     * <p>TikTok leads each photo's list with a HEIF copy, and that was what got saved: a .heif that
     * plenty of galleries can't open (#105). A JPEG copy, where TikTok's web lists one, is saved as
     * it is. Next comes the WebP copy TikTok lists beside the HEIF, which {@link PhotoToJpeg} turns
     * into a JPEG on any phone. It couldn't do that with the HEIF on a Samsung, whose decoder turns
     * TikTok's HEIF down, so the HEIF only stays behind the others in case they fail.
     */
    static List<String> saveOrder(List<String> urls) {
        List<String> ordered = new ArrayList<>(urls.size());
        for (String url : urls) if (isJpeg(url)) ordered.add(url);
        for (String url : urls) if (!isJpeg(url) && !isHeifOrAvif(url)) ordered.add(url);
        for (String url : urls) if (isHeifOrAvif(url)) ordered.add(url);
        return ordered;
    }

    /** Whether the address names a HEIF or AVIF copy, the encodings plenty of phones can't decode. */
    private static boolean isHeifOrAvif(String url) {
        String path = path(url);
        return path.endsWith(".heic") || path.endsWith(".heif") || path.endsWith(".avif");
    }

    /** Whether the address names a JPEG, read from its path so a query can't pass for one. */
    private static boolean isJpeg(String url) {
        String path = path(url);
        return path.endsWith(".jpeg") || path.endsWith(".jpg");
    }

    /**
     * The debug line naming one photo's encodings. Worded without a "name: value" pair, since the
     * log's redactor reads "encodings:" as a field holding an ID ("odin" is in the name) and blanked
     * the first encoding, the one that mattered.
     */
    static String listing(int position, List<String> urls) {
        return "Original photo " + position + " is listed as " + String.join(", ", encodings(urls));
    }

    /** What each address's path ends in, which says the encoding without its signed query. */
    static List<String> encodings(List<String> urls) {
        List<String> encodings = new ArrayList<>(urls.size());
        for (String url : urls) {
            String path = path(url);
            int dot = path.lastIndexOf('.');
            encodings.add(dot < 0 || dot < path.lastIndexOf('/') ? "?" : path.substring(dot + 1));
        }
        return encodings;
    }

    private static String path(String url) {
        int end = url.length();
        int query = url.indexOf('?');
        if (query >= 0) end = query;
        int fragment = url.indexOf('#');
        if (fragment >= 0 && fragment < end) end = fragment;
        return url.substring(0, end).toLowerCase(java.util.Locale.ROOT);
    }

}
