/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.media.PauseUnderComments;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Open comments at full height (#179): the comment sheet fills the screen instead of opening part
 * way up.
 *
 * <p>The sheet's height is a fraction of the screen that its parameters carry from their
 * constructor to the popover fragment: one, Facebook's default, makes a phone's sheet full screen,
 * and anything less sizes the window to that share of the screen's height at the bottom. Reels ask
 * for two thirds, videos and some posts for a share a server value sets. The patch hands
 * {@link #sheetHeight} that fraction first thing in the constructor, and while the switch is on a
 * share below one comes back as one.
 *
 * <p>A reel's or a feed video's Comment button first tries Facebook's split screen, the video on
 * top and the comments under it, through five launchers that each answer whether they opened it.
 * Each already answers no when its server gate is off, and the button then opens the regular
 * sheet. The patch asks {@link #skipSplitScreen} first in each, so with the switch on they answer
 * no and the regular sheet, at full height, opens instead.
 *
 * <p>A share of one still has to pass the sheet fragment's "fill the screen?" check, which can say
 * no from the screen's size against a server value and then draws a centered box 80% of the screen
 * tall. The patch hands {@link #fillsScreen} the share where that check starts (on 584, right after
 * the check makes sure the sheet is the comment one), and while the switch is on a share of one
 * fills the screen.
 *
 * <p>A full-screen sheet on a reel still shows the reel above the comments, in the sheet's header,
 * so the list starts a third of the way down. Either the header holds the video, or, on the Reels
 * tab's watch-and-comment sheet, it's a see-through strip over the reel still playing behind the
 * sheet. The patch hands {@link #watchHeader} the sheet's views, the header's id and whether the
 * sheet is a watch-and-comment one first thing where Facebook sets them up, and while the switch is
 * on such a header is hidden, at once or at the first layout after the video lands in it. A post's
 * header, its reactions, holds no video and stays.
 */
public final class FullHeightComments {
    /** The member the report names once a comment sheet's height has been asked about. */
    static final String SHEET = "comment sheet height";

    /** The member the report names once a split-screen launcher has been asked about. */
    static final String SPLIT_SCREEN = "split-screen comments";

    /** What the report counts each time a sheet opens at full height instead of part way. */
    static final String SHEET_RAISED = "Comment sheet opened at full height";

    /** What the report counts each time the split screen is passed over for the regular sheet. */
    static final String SPLIT_SCREEN_SKIPPED = "Split screen passed over";

    /** The member the report names once the sheet's "fill the screen?" check has been asked about. */
    static final String FILLS = "comment sheet fills the screen";

    /** What the report counts each time that check is answered yes instead of Facebook's own way. */
    static final String SCREEN_FILLED = "Comment sheet kept full screen";

    /** The member the report names once a comment sheet's views have been handed over. */
    static final String HEADER = "comment sheet header";

    /** What the report counts each time the video above a sheet's comments is hidden. */
    static final String VIDEO_HIDDEN = "Video above the comments hidden";

    /** How many levels into a header a video is looked for. */
    private static final int VIDEO_DEPTH = 12;

    private static final String FAMILY = FamilyNames.FULL_HEIGHT_COMMENTS;

    /** The headers being watched, so a sheet whose views are set up twice is watched once. */
    private static final Map<View, Boolean> WATCHED = Collections.synchronizedMap(new WeakHashMap<>());

    private FullHeightComments() {
    }

    /**
     * The hook, first thing where a comment sheet's parameters are built, handed the share of the
     * screen's height the sheet opens to. While Open comments at full height is on, a share between
     * zero and one comes back as one; otherwise, and for a throw, Facebook's own share comes back.
     */
    public static float sheetHeight(float height) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, SHEET);
            if (!(height > 0f && height < 1f) || !Utils.settingsReady()
                    || !Settings.OPEN_COMMENTS_FULL_HEIGHT.get()) return height;
            HookStatus.counted(FAMILY, SHEET_RAISED);
            return 1f;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "sheet height", failure);
            return height;
        }
    }

    /**
     * The hook, first thing in each launcher of Facebook's split-screen comments. True makes the
     * launcher answer that it didn't open, so the button opens the regular sheet, while Open
     * comments at full height is on; false lets the launcher run.
     */
    public static boolean skipSplitScreen() {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, SPLIT_SCREEN);
            if (!Utils.settingsReady() || !Settings.OPEN_COMMENTS_FULL_HEIGHT.get()) return false;
            HookStatus.counted(FAMILY, SPLIT_SCREEN_SKIPPED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "split screen", failure);
            return false;
        }
    }

    /**
     * The hook, where the comment sheet's "fill the screen?" check starts, handed the share of the
     * screen's height the sheet opens to. True, while Open comments at full height is on and the
     * share is one or more, answers that the sheet fills the screen; false lets Facebook's check
     * decide.
     */
    public static boolean fillsScreen(float height) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, FILLS);
            if (!(height >= 1f) || !Utils.settingsReady() || !Settings.OPEN_COMMENTS_FULL_HEIGHT.get()) return false;
            HookStatus.counted(FAMILY, SCREEN_FILLED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "fills screen", failure);
            return false;
        }
    }

    /**
     * The hook, first thing where Facebook sets up a comment sheet's views, handed those views, the
     * id of the sheet's header and whether the sheet is a watch-and-comment one, the reel playing on
     * behind it. While Open comments at full height is on, the header of a watch-and-comment sheet
     * is hidden, and any other header once it holds a video, now or after a later layout; a header
     * without one is left as it is.
     */
    public static void watchHeader(@Nullable View content, int headerId, boolean overVideo) {
        // Pause reels while comments are open has its own switch and reads this sheet either way (#266).
        PauseUnderComments.sheetOpened(content);
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, HEADER);
            if (content == null || !Utils.settingsReady() || !Settings.OPEN_COMMENTS_FULL_HEIGHT.get()) return;
            View header = content.findViewById(headerId);
            if (header == null || WATCHED.put(header, Boolean.TRUE) != null) return;
            hideVideo(header, overVideo);
            // Watched for as long as the sheet's window lives, since Facebook can show it again.
            header.getViewTreeObserver().addOnGlobalLayoutListener(new Header(header, overVideo));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "comment sheet header", failure);
        }
    }

    /**
     * Hides [header] while the switch is on and it shows a video, its own or, on a watch-and-comment
     * sheet ([overVideo]), the reel behind it; true when it did.
     */
    static boolean hideVideo(View header, boolean overVideo) {
        if (header.getVisibility() == View.GONE || !Utils.settingsReady() || !Settings.OPEN_COMMENTS_FULL_HEIGHT.get()
                || !(overVideo || holdsVideo(header, VIDEO_DEPTH))) {
            return false;
        }
        header.setVisibility(View.GONE);
        HookStatus.counted(FAMILY, VIDEO_HIDDEN);
        Logger.printDebug(() -> "Open comments at full height: the video above a sheet's comments was hidden");
        return true;
    }

    /** Whether [view], or a view in it at most [depth] levels down, draws a video. */
    static boolean holdsVideo(View view, int depth) {
        if (view instanceof TextureView || view instanceof SurfaceView) return true;
        if (depth == 0 || !(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (holdsVideo(group.getChildAt(i), depth - 1)) return true;
        }
        return false;
    }

    /** One sheet's header, looked at after each layout. */
    private static final class Header implements ViewTreeObserver.OnGlobalLayoutListener {
        private final View header;
        private final boolean overVideo;

        Header(View header, boolean overVideo) {
            this.header = header;
            this.overVideo = overVideo;
        }

        @Override
        public void onGlobalLayout() {
            try {
                hideVideo(header, overVideo);
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "comment sheet header", failure);
            }
        }
    }
}
