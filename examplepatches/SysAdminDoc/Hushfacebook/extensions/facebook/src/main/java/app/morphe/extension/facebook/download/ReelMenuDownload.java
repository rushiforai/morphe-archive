/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;

/**
 * The Download row "Download any reel" adds to a reel's More sheet, the one with Playback speed,
 * Captions and Clear mode (#18).
 *
 * <p>The sidebar button only reaches reels drawn with the UDD sidebar. Some accounts get their Reels
 * tab as a list inside the main screen, whose reels show neither that sidebar nor the FbShorts one,
 * so they had no Download anywhere. Every reel's More sheet comes from one builder, though, so the
 * patch adds a row there, built with Facebook's own row class and the icon of Facebook's own
 * download row, right before Clear mode.
 *
 * <p>The row's click type is a Facebook interface whose name changes every build, so the patch makes
 * this class implement it while patching and adds its one method, which calls {@link #run}. The save
 * itself is the sidebar button's: the player state the sheet looks up for the reel holds the reel's
 * player params, and {@link ReelDownload} walks them to the source by type.
 */
public final class ReelMenuDownload {
    private static final String SOURCE = "ReelMenuDownload";

    /* What Hook status counts each time a reel's More sheet is built, the way the sidebar counts. */
    static final String ROW_ADDED = "More sheet with Download";
    static final String ROW_SWITCH_OFF = "More sheet without Download, switch off";
    static final String ROW_PAUSED = "More sheet without Download, paused";
    static final String ROW_NOT_READY = "More sheet without Download, settings not ready";

    /** The sidebar's tap slot, which is the one that saves. */
    private static final int TAP_SLOT = 1;

    private final ReelDownload download;

    private ReelMenuDownload(ReelDownload download) {
        this.download = download;
    }

    /**
     * Injection point, asked each time a reel's More sheet is built: the row's handler, or null to
     * leave the sheet as Facebook built it. Off, paused, before the settings are ready, or with no
     * player state for the reel, the answer is null. Never throws.
     *
     * @param player        the player state Facebook looked up for this reel, which holds its params.
     * @param context       the sheet's context.
     * @param hdField       the real names of the source's address fields, read by the patch.
     * @param story         the reel's props, for the file name, or null.
     */
    public static ReelMenuDownload forReel(Object player, Context context, String hdField, String sdField,
            String manifestField, Object story) {
        try {
            if (!Utils.settingsReady()) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, ROW_NOT_READY);
                return null;
            }
            if (!Settings.DOWNLOAD_REELS.get()) {
                HookStatus.counted(FamilyNames.REEL_DOWNLOAD, HushfacebookPause.isPaused() ? ROW_PAUSED : ROW_SWITCH_OFF);
                return null;
            }
            if (player == null) return null;
            HookStatus.counted(FamilyNames.REEL_DOWNLOAD, ROW_ADDED);
            return new ReelMenuDownload(new ReelDownload(player, context, hdField, sdField, manifestField,
                    TAP_SLOT, true, story));
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "More sheet row", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not add the Download row", t);
            return null;
        }
    }

    /** The row's tap, through the method the patch adds for Facebook's click interface. Never throws. */
    public void run() {
        try {
            download.invoke(null);
        } catch (Throwable t) {
            // The sheet's click runs inside Facebook's own dispatch, so nothing may leave here.
            HookStatus.threw(FamilyNames.REEL_DOWNLOAD, "More sheet row tap", t);
        }
    }
}
