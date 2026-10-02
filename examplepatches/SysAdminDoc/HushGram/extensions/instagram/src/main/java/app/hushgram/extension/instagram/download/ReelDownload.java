/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import android.app.Activity;
import android.content.Context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.DiagnosticCategory;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Download in every reel's more menu.
 *
 * <p>Instagram has a Download row of its own there, which it shows only on reels whose owner lets
 * other people download them, and which fetches a copy with a watermark after asking Instagram's
 * server. The patch keeps that row and changes who shows it and what a tap does:
 *
 * <ul>
 *   <li>Each builder of the menu asks {@link #offer} with Instagram's answer to whether the reel
 *       may be downloaded, and, in the builders that also read a server flag that holds the row
 *       back, {@link #withhold} with the flag. With the switch on, every reel gets the row.
 *   <li>The menu's handler asks {@link #save} first when Download is tapped. With the switch on,
 *       the reel is saved from the addresses its Media already holds, through {@link MediaSave},
 *       and Instagram's own download never starts.
 * </ul>
 *
 * <p>Every hook fails open: until the settings are ready, while HushGram is paused, with the switch
 * off, or when something throws, the menu is Instagram's own.
 */
public final class ReelDownload {
    private ReelDownload() {
    }

    /** The source a reel save's lines carry in the diagnostic report. */
    private static final String SOURCE = "ReelDownload";

    /**
     * The entry the patch calls, handed Instagram's answer as an int, non-zero for yes, so the hook
     * doesn't depend on Instagram's code leaving that register typed as a boolean.
     */
    public static boolean offer(int eligible) {
        return offer(eligible != 0);
    }

    /** Instagram's answer [eligible] to whether this reel has a Download row, or yes with the switch on. Never throws. */
    public static boolean offer(boolean eligible) {
        return eligible || on();
    }

    /** The entry the patch calls, handed Instagram's flag as an int, non-zero for yes, as {@link #offer(int)} is. */
    public static boolean withhold(int held) {
        return withhold(held != 0);
    }

    /** Instagram's flag [held] that keeps the Download row out, or no with the switch on. Never throws. */
    public static boolean withhold(boolean held) {
        return held && !on();
    }

    /** The options the reduced reel menu lists above Download, by the names Instagram keeps. */
    private static final List<String> ABOVE_DOWNLOAD = Arrays.asList("SHOP_SIMILAR", "SAVE", "UNSAVE");

    /**
     * Adds [download], Instagram's Download option, to [options], the list the reduced reel menu
     * shows, with the switch on. It goes after the save rows, which puts it above Playback as in the
     * full menu. A list that has it already is left alone. Never throws.
     */
    public static void addTo(List<Object> options, Object download) {
        try {
            if (options == null || download == null || !on() || options.contains(download)) return;
            int at = 0;
            for (int i = 0; i < options.size(); i++) {
                Object option = options.get(i);
                if (option instanceof Enum && ABOVE_DOWNLOAD.contains(((Enum<?>) option).name())) at = i + 1;
            }
            options.add(at, download);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "reduced reel menu", t);
        }
    }

    /**
     * Saves the reel [media] when its Download row is tapped with the switch on, and answers
     * whether it did, in which case Instagram's own download is skipped. [activity] is the one the
     * menu belongs to. A save that can't start says so. Never throws.
     */
    public static boolean save(Object media, Activity activity) {
        try {
            HookStatus.invoked(FamilyNames.REEL_DOWNLOAD);
            if (!on()) return false;
            Context context = activity != null ? activity : Utils.getContext();
            List<MediaSave.Rendition> renditions = renditions(media);
            String manifest = InstagramMedia.dashManifest(media);
            final int files = renditions.size();
            final boolean dash = manifest != null;
            Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                    () -> "reel download tapped: " + files + " file(s)" + (dash ? " and a manifest" : ", no manifest"));
            if (!MediaSave.saveVideo(context, renditions, manifest, details(media))) {
                Context application = context.getApplicationContext();
                Feedback.show(application, L10n.t(application, "Download failed"), true);
            }
            return true;
        } catch (Throwable t) {
            // It runs inside Instagram's click dispatch, where a throw ends the app. Instagram's own
            // download goes ahead instead.
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "reel menu", t);
            return false;
        }
    }

    private static boolean on() {
        try {
            return Utils.settingsReady() && Settings.DOWNLOAD_REELS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "reel menu switch", t);
            return false;
        }
    }

    /** The single files [media] lists for its video, with the size each states. Never null. */
    static List<MediaSave.Rendition> renditions(Object media) {
        List<?> versions = InstagramMedia.videoVersions(media);
        if (versions == null) return Collections.emptyList();
        List<MediaSave.Rendition> renditions = new ArrayList<>(versions.size());
        for (Object version : versions) {
            if (version == null) continue;
            String url = InstagramMedia.versionUrl(version);
            if (url == null || url.isEmpty()) continue;
            renditions.add(new MediaSave.Rendition(url, orZero(InstagramMedia.versionWidth(version)),
                    orZero(InstagramMedia.versionHeight(version)), 0));
        }
        return renditions;
    }

    /** The id, poster and posting day of [media], each null when it doesn't say. */
    static PostDetails details(Object media) {
        Object user = InstagramMedia.owner(media);
        String owner = user == null ? null : InstagramMedia.username(user);
        Long takenAt = InstagramMedia.takenAt(media);
        Date posted = takenAt == null || takenAt <= 0 ? null : new Date(takenAt * 1000L);
        return PostDetails.of(InstagramMedia.mediaId(media), owner, posted);
    }

    private static int orZero(Integer value) {
        return value == null ? 0 : value;
    }
}
