/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import android.content.Context;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * A comment's own photo: the sizes Instagram supplied for it, copied as they are when the menu
 * opens, and saved through the same pipeline as a post's photo when Save is tapped.
 */
public final class CommentPhotoDownload {
    private CommentPhotoDownload() {}

    interface Images {
        Object versions(Object media);
        List<?> candidates(Object versions);
        String url(Object candidate);
        int width(Object candidate);
        int height(Object candidate);
    }

    private static final Images NATIVE = new Images() {
        public Object versions(Object media) { return InstagramMedia.imageVersions(media); }
        public List<?> candidates(Object versions) { return InstagramMedia.imageCandidates(versions); }
        public String url(Object candidate) { return InstagramMedia.candidateUrl(candidate); }
        public int width(Object candidate) { return InstagramMedia.candidateWidth(candidate); }
        public int height(Object candidate) { return InstagramMedia.candidateHeight(candidate); }
    };

    /**
     * The sizes [media]'s picture lists with an address on Meta's media servers, in Instagram's
     * order and unchanged. Empty, never null, when there is no media or no such size.
     */
    public static List<MediaSave.Rendition> snapshot(Object media) {
        return snapshot(media, NATIVE);
    }

    static List<MediaSave.Rendition> snapshot(Object media, Images images) {
        if (media == null) return Collections.emptyList();
        Object versions = images.versions(media);
        List<?> candidates = versions == null ? null : images.candidates(versions);
        if (candidates == null) return Collections.emptyList();
        List<MediaSave.Rendition> sizes = new ArrayList<>(candidates.size());
        for (Object candidate : candidates) {
            if (candidate == null) continue;
            String url = images.url(candidate);
            if (MediaUrlPolicy.shapeRefusal(url) != null || animatedOrVideo(url)) continue;
            sizes.add(new MediaSave.Rendition(url, images.width(candidate), images.height(candidate), 0));
        }
        return copy(sizes);
    }

    /** An unmodifiable copy, so a later change to the source can't change what a row saves. */
    public static List<MediaSave.Rendition> copy(List<MediaSave.Rendition> sizes) {
        return Collections.unmodifiableList(new ArrayList<>(sizes));
    }

    /** Starts the save of the largest of [snapshot]. A save that can't start says so. Never throws. */
    public static void save(Context context, List<MediaSave.Rendition> snapshot) {
        try {
            if (!MediaSave.savePhoto(context, snapshot, null)) failed(context);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.COMMENT_PHOTO, "save comment photo", t);
            failed(context);
        }
    }

    /** Download failed, in the phone's language. Never throws. */
    public static void failed(Context context) {
        try {
            Context application = context == null ? null : context.getApplicationContext();
            if (application != null) Feedback.show(application, L10n.t(application, "Download failed"), true);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.COMMENT_PHOTO, "save feedback", t);
        }
    }

    // The media kind is already a photo. An address that names a GIF or a video file still never
    // stands in for the picture.
    private static boolean animatedOrVideo(String address) {
        try {
            String path = new URL(address).getPath().toLowerCase(Locale.US);
            return path.endsWith(".gif") || path.endsWith(".mp4") || path.endsWith(".m4v")
                    || path.endsWith(".webm") || path.endsWith(".m3u8") || path.endsWith(".mpd");
        } catch (Throwable malformed) {
            return true;
        }
    }
}
