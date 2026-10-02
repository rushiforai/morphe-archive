/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import android.content.Context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.DiagnosticCategory;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Download in the menu of anyone's story.
 *
 * <p>A story's menu is a list of labels, and a tap hands the tapped label to a handler that
 * compares it with each of Instagram's own. Instagram offers a save only on your own stories. The
 * patch adds a label of its own:
 *
 * <ul>
 *   <li>Each builder of the menu hands its labels through {@link #labels} before the menu shows
 *       them. With the switch on, the menu gets Download at the end.
 *   <li>Each handler asks {@link #save} first. A tap on Download saves the story from the
 *       addresses its Media already holds, through {@link MediaSave}: a video at the Download
 *       quality, a photo at its largest size. Any other label goes on to Instagram.
 * </ul>
 *
 * <p>Every hook fails open: until the settings are ready, while HushGram is paused, with the switch
 * off, or when something throws, the menu is Instagram's own.
 */
public final class StoryDownload {
    private StoryDownload() {
    }

    /** The source a story save's lines carry in the diagnostic report. */
    private static final String SOURCE = "StoryDownload";

    /**
     * The labels [labels] of a story's menu, with Download at the end when the switch is on. A menu
     * that has the label already is left alone. Never throws.
     */
    public static CharSequence[] labels(CharSequence[] labels) {
        try {
            HookStatus.invoked(FamilyNames.STORY_DOWNLOAD);
            if (labels == null || !on()) return labels;
            String download = label();
            for (CharSequence label : labels) {
                if (label != null && download.contentEquals(label)) return labels;
            }
            CharSequence[] more = Arrays.copyOf(labels, labels.length + 1);
            more[labels.length] = download;
            return more;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story menu", t);
            return labels;
        }
    }

    /**
     * Saves the story [menu] is open on when [label], the tapped one, is Download and the switch is
     * on, and answers whether it did, in which case Instagram's handler is skipped. A save that
     * can't start says so. Never throws.
     */
    public static boolean save(CharSequence label, Object menu) {
        try {
            if (label == null || !on() || !label().contentEquals(label)) return false;
            Context context = Utils.getContext().getApplicationContext();
            Object media = InstagramMedia.storyMedia(menu);
            if (!(media != null && saveMedia(context, media))) {
                Feedback.show(context, L10n.t(context, "Download failed"), true);
            }
            return true;
        } catch (Throwable t) {
            // It runs inside Instagram's click dispatch, where a throw ends the app. Instagram's
            // handler goes ahead instead, and passes over a label it doesn't know.
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story menu", t);
            return false;
        }
    }

    /** Starts the save of [media]: its video when it has one, else its picture. */
    private static boolean saveMedia(Context context, Object media) {
        List<MediaSave.Rendition> videos = ReelDownload.renditions(media);
        String manifest = InstagramMedia.dashManifest(media);
        PostDetails details = ReelDownload.details(media);
        if (!videos.isEmpty() || manifest != null) {
            final int files = videos.size();
            final boolean dash = manifest != null;
            Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                    () -> "story video download tapped: " + files + " file(s)" + (dash ? " and a manifest" : ", no manifest"));
            return MediaSave.saveVideo(context, videos, manifest, details);
        }
        List<MediaSave.Rendition> pictures = pictures(media);
        final int sizes = pictures.size();
        Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "story photo download tapped: " + sizes + " size(s)");
        return MediaSave.savePhoto(context, pictures, details);
    }

    /** The sizes [media] lists for its picture, with the size each states. Never null. */
    static List<MediaSave.Rendition> pictures(Object media) {
        Object versions = InstagramMedia.imageVersions(media);
        List<?> candidates = versions == null ? null : InstagramMedia.imageCandidates(versions);
        if (candidates == null) return Collections.emptyList();
        List<MediaSave.Rendition> pictures = new ArrayList<>(candidates.size());
        for (Object candidate : candidates) {
            if (candidate == null) continue;
            String url = InstagramMedia.candidateUrl(candidate);
            if (url == null || url.isEmpty()) continue;
            pictures.add(new MediaSave.Rendition(url, InstagramMedia.candidateWidth(candidate),
                    InstagramMedia.candidateHeight(candidate), 0));
        }
        return pictures;
    }

    /** Download, in the app's language. */
    private static String label() {
        return L10n.t(Utils.getContext(), "Download");
    }

    private static boolean on() {
        try {
            return Utils.settingsReady() && Settings.DOWNLOAD_STORIES.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.STORY_DOWNLOAD, "story menu switch", t);
            return false;
        }
    }
}
