/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import android.content.Context;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import androidx.annotation.Nullable;

import java.util.ArrayDeque;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Double tap the top of a reel to share" patch.
 *
 * <p>The Reels viewer hands every double tap to one gesture listener's onDoubleTap, which tries
 * Instagram's skip and forward actions and then likes the reel. The patch asks {@link #doubleTap}
 * first thing there, with the reel's page (the view the listener measures the tap against) and the
 * tap. While the switch is on and the tap lands in the top {@link Settings#REEL_TOP_SHARE_ZONE}
 * percent of the page, this class presses the reel's own Share button, the paper plane Instagram
 * renders with the id {@link #SHARE_ID}, and the listener returns without liking. Clear mode only
 * fades that button out, so the press opens the share sheet there too.
 *
 * <p>When no Share button can be found (an ad, a card, a reel that can't be shared), nothing
 * happens here and the double tap goes on to Instagram's like as before. Never throws.
 */
public final class ReelTopShare {
    /** The view id Instagram gives a reel's Share button (its Litho component's viewId). */
    static final String SHARE_ID = "direct_share_button";

    /** The zone's bounds, in percent of the page's height. */
    static final int LEAST = 10;
    static final int MOST = 40;

    /** How far up from the page the search for its Share button goes. */
    static final int CLIMB = 6;

    /** How many views the search looks at, at most. */
    static final int MOST_VIEWS = 4000;

    static final String HOOK = "reel double tap";
    static final String COUNT_SHARED = "reels shared by a double tap at the top";
    static final String COUNT_NO_BUTTON = "double taps at the top with no Share button found";

    private static final String FAMILY = FamilyNames.REEL_TOP_SHARE;

    /** The Share button's id once looked up, 0 before, -1 when the build has none. */
    private static int shareId;

    /** Tests set the id, since a test app has none of Instagram's. */
    @Nullable
    static Integer idForTests;

    private static boolean logged;

    private ReelTopShare() {
    }

    /**
     * Injected first thing in the Reels viewer's onDoubleTap with its page view and the tap. True
     * when the tap opened the share sheet, and the listener then returns without liking.
     */
    public static boolean doubleTap(@Nullable View page, @Nullable MotionEvent event) {
        try {
            HookStatus.invoked(FAMILY);
            if (page == null || event == null || !on()) return false;
            if (!inZone(event.getY(), page.getHeight(), Settings.REEL_TOP_SHARE_ZONE.get())) return false;
            View share = findShare(page);
            if (share == null) {
                HookStatus.counted(FAMILY, COUNT_NO_BUTTON);
                return false;
            }
            share.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
            if (!share.performClick()) return false;
            HookStatus.counted(FAMILY, COUNT_SHARED);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Reel top share: opened the share sheet from a double tap");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, HOOK, failure);
            return false;
        }
    }

    /** Whether a tap [y] pixels down a page [height] tall is in the top [percent] of it. */
    static boolean inZone(float y, int height, int percent) {
        if (height <= 0 || y < 0f) return false;
        int zone = Math.max(LEAST, Math.min(MOST, percent));
        return y < height * (zone / 100f);
    }

    /**
     * The reel's Share button: one under [page] first, then under each of its parents up to
     * {@link #CLIMB} levels, taking the first whose middle sits within the page's width on screen,
     * so a neighbouring reel's button in the same pager is passed over.
     */
    @Nullable
    static View findShare(View page) {
        int id = shareId(page.getContext());
        if (id <= 0) return null;
        int[] at = new int[2];
        page.getLocationInWindow(at);
        int left = at[0];
        int right = left + page.getWidth();
        View from = page;
        for (int level = 0; level <= CLIMB && from != null; level++) {
            View found = search(from, id, left, right);
            if (found != null) return found;
            ViewParent parent = from.getParent();
            from = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    @Nullable
    private static View search(View root, int id, int left, int right) {
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        int seen = 0;
        int[] at = new int[2];
        while (!queue.isEmpty() && seen++ < MOST_VIEWS) {
            View view = queue.poll();
            if (view.getId() == id && view.getVisibility() == View.VISIBLE) {
                view.getLocationInWindow(at);
                int middle = at[0] + view.getWidth() / 2;
                if (middle >= left && middle < right) return view;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) queue.add(group.getChildAt(i));
            }
        }
        return null;
    }

    private static int shareId(Context context) {
        Integer forced = idForTests;
        if (forced != null) return forced;
        int known = shareId;
        if (known != 0) return known;
        int found = context.getResources().getIdentifier(SHARE_ID, "id", Utils.resourcePackage(context));
        shareId = found != 0 ? found : -1;
        return shareId;
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.REEL_TOP_SHARE.get();
    }
}
