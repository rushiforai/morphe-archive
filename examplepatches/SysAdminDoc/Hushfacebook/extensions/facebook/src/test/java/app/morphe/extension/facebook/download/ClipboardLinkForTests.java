/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;

import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

import java.util.concurrent.atomic.AtomicLong;

/**
 * The copied-link offer, for a test outside this package: a screen comes to the front with a reel
 * link on the clipboard that wasn't offered before.
 */
public final class ClipboardLinkForTests {
    private ClipboardLinkForTests() {
    }

    /** A new reel each time, so a link offered by an earlier call can't stand in for this one. */
    private static final AtomicLong NEXT_ID = new AtomicLong(700_000_000_000L);

    /**
     * Copies a reel link, resumes a screen and hands it focus the way Android does, then says
     * whether the clipboard was read. Any offer is closed again.
     */
    public static boolean readsTheClipboard() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        try {
            ClipboardManager clipboard = activity.getSystemService(ClipboardManager.class);
            clipboard.setPrimaryClip(ClipData.newPlainText("link",
                    "https://www.facebook.com/reel/" + NEXT_ID.getAndIncrement()));
            ClipboardLink.forgetClipForTests();
            int before = ClipboardLink.READS.get();
            ClipboardLink.onResumed(activity);
            ClipboardLink.FocusWait wait = ClipboardLink.focusWait();
            if (wait != null) wait.onWindowFocusChanged(true);
            return ClipboardLink.READS.get() > before;
        } finally {
            AlertDialog offer = ClipboardLink.shownDialog();
            if (offer != null) offer.dismiss();
            ClipboardLink.onPaused(activity);
            controller.pause().stop().destroy();
        }
    }
}
