/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;

/**
 * A line that says how an action went, a polite live region a screen reader reads once per answer.
 *
 * <p>TalkBack reads a live region's text when it gets to a change, not the text that change set.
 * A line that said "Saving changes" and then the answer a moment later was read twice, both times
 * as the answer. So a busy line shows only for an action still running after {@link #BUSY_AFTER_MS},
 * and once shown it stays {@link #BUSY_HOLD_MS} so it's read before the answer replaces it. An
 * answer shows on the next frame, and only the last one said before then, so an action that says
 * two things on the way changes the line once. The same answer twice (a second failed try) is
 * still news, and is read again without the line changing twice.
 */
public final class SpokenLine {
    /** An action that answers sooner never shows its busy line. */
    public static final long BUSY_AFTER_MS = 500;
    /** A busy line that showed stays at least this long. */
    public static final long BUSY_HOLD_MS = 400;

    private final TextView line;
    private final Runnable beforeShowing;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private Runnable pendingBusy, pendingAnswer, holding;
    /** The answer said while a busy line is held, shown when the hold ends. */
    private String held;

    public SpokenLine(TextView line) {
        this(line, null);
    }

    /** [beforeShowing] runs before each busy line or answer shows, as when the line's panel is hidden. */
    public SpokenLine(TextView line, Runnable beforeShowing) {
        this.line = line;
        this.beforeShowing = beforeShowing;
        line.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
    }

    /** Shows [text] if the action is still running after a moment. */
    public void busy(String text) {
        cancel();
        Runnable show = new Runnable() {
            @Override public void run() {
                if (pendingBusy != this) return;
                pendingBusy = null;
                apply(text);
                Runnable hold = new Runnable() {
                    @Override public void run() {
                        if (holding != this) return;
                        holding = null;
                        String answer = held;
                        held = null;
                        if (answer != null) apply(answer);
                    }
                };
                holding = hold;
                handler.postDelayed(hold, BUSY_HOLD_MS);
            }
        };
        pendingBusy = show;
        handler.postDelayed(show, BUSY_AFTER_MS);
    }

    /** Says [text] once on the next frame, the same text as before included. A later call replaces it. */
    public void say(String text) {
        if (pendingBusy != null) handler.removeCallbacks(pendingBusy);
        pendingBusy = null;
        if (holding != null) {
            held = text;
            return;
        }
        if (pendingAnswer != null) handler.removeCallbacks(pendingAnswer);
        Runnable answer = new Runnable() {
            @Override public void run() {
                if (pendingAnswer != this) return;
                pendingAnswer = null;
                apply(text);
            }
        };
        pendingAnswer = answer;
        handler.post(answer);
    }

    /** Shows [text] at once, read like any change. For lines that aren't an answer to an action. */
    public void show(String text) {
        cancel();
        if (!text.contentEquals(line.getText())) line.setText(text);
    }

    /** Drops a busy line or an answer still waiting, as when the window closes. */
    public void cancel() {
        if (pendingBusy != null) handler.removeCallbacks(pendingBusy);
        if (pendingAnswer != null) handler.removeCallbacks(pendingAnswer);
        if (holding != null) handler.removeCallbacks(holding);
        pendingBusy = null;
        pendingAnswer = null;
        holding = null;
        held = null;
    }

    private void apply(String text) {
        if (beforeShowing != null) beforeShowing.run();
        if (!text.contentEquals(line.getText())) {
            line.setText(text);
            return;
        }
        // The text a live region already shows changes nothing, so nothing is read. The event its
        // own change would send is sent instead, once.
        AccessibilityManager reader = line.getContext().getSystemService(AccessibilityManager.class);
        if (reader == null || !reader.isEnabled() || !line.isAttachedToWindow()) return;
        AccessibilityEvent changed = AccessibilityEvent.obtain(AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED);
        changed.setContentChangeTypes(AccessibilityEvent.CONTENT_CHANGE_TYPE_TEXT);
        line.sendAccessibilityEventUnchecked(changed);
    }
}
