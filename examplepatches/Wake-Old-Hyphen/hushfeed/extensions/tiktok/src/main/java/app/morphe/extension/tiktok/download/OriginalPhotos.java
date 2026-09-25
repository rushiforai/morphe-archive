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
        if (!Settings.DOWNLOAD_ORIGINAL_PHOTOS.get() || context == null) return false;
        if (Reflect.property(aweme, "getPhotoModeImageInfo", "photoModeImageInfo") == null) return false;
        if (android.os.Build.VERSION.SDK_INT < 29
                && context.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) return false;
        List<List<String>> photos = sources(aweme);
        if (photos.isEmpty()) {
            Utils.showToastShort(L10n.t(
                    "The original photos aren't available, so TikTok's own save runs instead"));
            return false;
        }
        List<Integer> chosen = positions(indices, photos.size());
        // Asked for photos this post doesn't have: TikTok's own save says what it makes of that.
        if (chosen.isEmpty()) return false;
        String id = Reflect.string(aweme, "getAid", "aid");
        if (id == null) return false;
        List<List<String>> photoSnapshot = snapshot(photos);
        if (!ACTIVE.add(id)) return true;
        Context app = context.getApplicationContext();
        Utils.showToastShort(L10n.quantity(app, chosen.size(),
                "Saving one original photo", "Saving %1$s original photos"));
        boolean submitted = MediaJobScheduler.submit("original photos", () -> {
            // The banner's Open lands on the newest photo, which is where the gallery puts the rest.
            MediaFileWriter.Saved[] last = {null};
            try {
                // From three photos up a row counts them and offers Cancel; a photo that fails
                // is skipped and the rest still land, and the result says what did.
                SaveProgress.Outcome outcome = SaveProgress.begin(chosen.size()).run(index -> {
                    int i = chosen.get(index);
                    MediaBudget.checkDiskSpace(app.getCacheDir(), -1L);
                    File temp = MediaCache.createTempFile(app, "original-photo-", ".tmp");
                    try {
                        String extension = RemoteMedia.fetch(photoSnapshot.get(i), temp, RemoteMedia.Kind.IMAGE);
                        String mime = "jpg".equals(extension) ? "image/jpeg" : "image/" + extension;
                        // Numbered by the photo's place in the post, also when only some are saved.
                        String name = DownloadFilenameFormatter.formatOriginalPhotoName(aweme, i + 1, extension);
                        last[0] = MediaFileWriter.publishForResult(app, temp, name, mime, DownloadsPatch.getPhotoDownloadPath(), false);
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
            } finally {
                ACTIVE.remove(id);
            }
        });
        if (!submitted) {
            ACTIVE.remove(id);
            return false;
        }
        return true;
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
            result.add(candidates);
        }
        return result;
    }

}
