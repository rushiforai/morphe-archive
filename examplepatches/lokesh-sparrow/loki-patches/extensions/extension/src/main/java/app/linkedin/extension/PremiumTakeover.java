/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;

import java.lang.reflect.Method;

/**
 * LinkedIn opens a full screen Premium upsell ("full page takeover") on its own, for instance when the feed loads.
 * With "Hide Premium upsells" on, its only component (fpt-upsell) is hidden, which leaves an empty page that is
 * pure black in dark mode. The page is closed again here, as the ✕ in its corner would, so the feed comes back.
 * <p>
 * It is only closed when it is really on screen: LinkedIn also reports this screen when it prepares it behind the
 * current one, and pressing back there would close something else.
 */
final class PremiumTakeover {
    /** The nav destination of the takeover page; it keeps this name in every supported version. */
    private static final String SCREEN = ".premium.upsells.PremiumUpsellFullPageTakeoverNavGraphScreen";
    /** Time for the page to finish opening and for its component to be hidden before it is closed. */
    private static final long DELAY_MS = 400;
    /** A resuming screen can be reported more than once: close at most one page per this window. */
    private static final long REPEAT_MS = 2000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static long lastClosed;
    private static Method viewOf;

    private PremiumTakeover() {
    }

    /** Called when a screen resumes. Closes the takeover page when it would show nothing. */
    static void onScreenResumed(Activity host, Object fragment, String screen) {
        if (host == null || fragment == null || screen == null || !screen.endsWith(SCREEN)) return;
        if (!Settings.hidePremium()) return;
        long now = SystemClock.uptimeMillis();
        if (now - lastClosed < REPEAT_MS) return;
        lastClosed = now;
        MAIN.postDelayed(() -> {
            try {
                if (host.isFinishing() || host.isDestroyed()) return;
                // Still the page in front, and its view really on screen: nothing else is closed by mistake.
                if (!SduiMediaDownload.resumedScreen().endsWith(SCREEN)) return;
                if (!isShown(fragment)) return;
                Settings.debugLog("premium takeover: empty page, closing it");
                host.onBackPressed();
            } catch (Throwable failure) {
                Diagnostics.error("closing the premium takeover failed", failure);
            }
        }, DELAY_MS);
    }

    /** Whether the fragment's view is attached and visible, not a screen the app prepared behind the current one. */
    private static boolean isShown(Object fragment) throws ReflectiveOperationException {
        if (viewOf == null) viewOf = fragment.getClass().getMethod("getView");
        View view = (View) viewOf.invoke(fragment);
        if (view == null || !view.isShown() || view.getWindowVisibility() != View.VISIBLE) return false;
        Rect visible = new Rect();
        return view.getGlobalVisibleRect(visible) && visible.height() > view.getHeight() / 2;
    }
}
