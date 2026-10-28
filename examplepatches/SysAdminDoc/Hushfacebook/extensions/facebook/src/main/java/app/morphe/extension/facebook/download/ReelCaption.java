/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;

import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;

/**
 * The Copy caption row "Download any reel" adds to a reel's More sheet (#240).
 *
 * <p>Facebook cuts a long reel caption off behind "See more" and gives no way to copy it. The
 * caption's render hands each reel's whole caption text here, with the reel it belongs to, and this
 * keeps the text by the reel's video id. When that reel's More sheet is built, the patch asks
 * {@link #forVideo} for a row, which it only gets when a caption was seen for that very video, so the
 * row never copies another reel's text.
 *
 * <p>The row's click type is a Facebook interface whose name changes every build, so the patch makes
 * this class implement it while patching and adds its one method, which calls {@link #run}.
 */
public final class ReelCaption {
    private static final String SOURCE = "ReelCaption";

    /* What Hook status counts each time a reel's More sheet is built, and each caption seen. */
    static final String ROW_ADDED = "More sheet with Copy caption";
    static final String ROW_NO_CAPTION = "More sheet without Copy caption, no caption seen for the reel";
    static final String ROW_SWITCH_OFF = "More sheet without Copy caption, switch off";
    static final String ROW_PAUSED = "More sheet without Copy caption, paused";
    static final String ROW_NOT_READY = "More sheet without Copy caption, settings not ready";
    static final String CAPTION_KEPT = "Reel caption kept";
    static final String CAPTION_NO_ID = "Reel caption without a video id";

    /** How many captions are kept, the oldest dropped first. A Reels session rarely goes back further. */
    static final int KEPT = 64;

    private static final int SHORT_FORM_VIDEO_CONTEXT = "short_form_video_context".hashCode();
    private static final int VIDEO = "video".hashCode();
    private static final int PLAYBACK_VIDEO = "playback_video".hashCode();

    private static final Map<String, String> CAPTIONS = new LinkedHashMap<String, String>(KEPT, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > KEPT;
        }
    };

    private final Context context;
    private final String caption;

    private ReelCaption(Context context, String caption) {
        this.context = context;
        this.caption = caption;
    }

    /**
     * Injection point, right after a reel caption's render builds its tap lambda: keeps [caption] by [unit]'s video id.
     * Never throws.
     *
     * @param unit    the reel the caption belongs to, a GraphQL model.
     * @param caption the caption's whole text, as the render was handed it.
     */
    public static void remember(Object unit, CharSequence caption) {
        try {
            if (caption == null || caption.length() == 0) return;
            String id = videoIdOf(unit);
            if (id == null) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, CAPTION_NO_ID);
                return;
            }
            keep(id, caption.toString());
            HookStatus.counted(FamilyNames.REEL_DOWNLOAD, CAPTION_KEPT);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "Reel caption", t);
        }
    }

    /**
     * Injection point, asked each time a reel's More sheet is built: the row's handler, or null to
     * leave the sheet without it. Off, paused, before the settings are ready, or with no caption seen
     * for [videoId], the answer is null. Never throws.
     */
    public static ReelCaption forVideo(Context context, String videoId) {
        try {
            if (!Utils.settingsReady()) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, ROW_NOT_READY);
                return null;
            }
            if (!Settings.COPY_REEL_CAPTION.get()) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, HushfacebookPause.isPaused() ? ROW_PAUSED : ROW_SWITCH_OFF);
                return null;
            }
            String caption = captionFor(videoId);
            if (caption == null) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, ROW_NO_CAPTION);
                return null;
            }
            HookStatus.counted(FamilyNames.REEL_DOWNLOAD, ROW_ADDED);
            return new ReelCaption(context, caption);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "Copy caption row", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not add the Copy caption row", t);
            return null;
        }
    }

    /** The row's title. */
    public static String label() {
        return L10n.t("Copy caption");
    }

    /** The row's tap, through the method the patch adds for Facebook's click interface. Never throws. */
    public void run() {
        try {
            Context application = context == null ? Utils.getContext() : context.getApplicationContext();
            if (application == null) return;
            ClipboardManager clipboard = (ClipboardManager) application.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(L10n.t(application, "Reel caption"), caption));
            Feedback.show(application, L10n.t(application, "Caption copied"), false);
        } catch (Throwable t) {
            // The sheet's click runs inside Facebook's own dispatch, so nothing may leave here.
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "Copy caption tap", t);
        }
    }

    static void keep(String videoId, String caption) {
        synchronized (CAPTIONS) {
            CAPTIONS.put(videoId, caption);
        }
    }

    static String captionFor(String videoId) {
        if (videoId == null) return null;
        synchronized (CAPTIONS) {
            return CAPTIONS.get(videoId);
        }
    }

    static void forgetAll() {
        synchronized (CAPTIONS) {
            CAPTIONS.clear();
        }
    }

    /**
     * The video id of a reel unit: its short-form video context's video, else its own video or
     * playback video. Never its own id, which names the story rather than the video. Null when none
     * of those carries a numeric id.
     */
    static String videoIdOf(Object unit) {
        Object context = PostDetails.tree(unit, SHORT_FORM_VIDEO_CONTEXT);
        Object[] videos = {
            PostDetails.tree(context, VIDEO),
            PostDetails.tree(context, PLAYBACK_VIDEO),
            PostDetails.tree(unit, VIDEO),
            PostDetails.tree(unit, PLAYBACK_VIDEO),
        };
        for (int index = 0; index < videos.length; index++) {
            String id = PostDetails.idOf(videos[index]);
            if (id != null) {
                final int path = index;
                Logger.diagnosticDebug(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "video id from path " + path);
                return id;
            }
        }
        return null;
    }
}
