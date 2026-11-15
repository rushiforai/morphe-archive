/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.TextView;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.util.ReflectionHelpers;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Seen under TalkBack: a line that said "Saving changes" and then the answer a moment later was read
 * twice, both times as the answer, as TalkBack reads a live region's text when it gets to the change.
 * Each answer changes the line once here, and a busy line shows only for an action still running.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {26, 36})
public class SpokenLineTest {
    private AccessibilityManager reader;
    private TextView view;
    private SpokenLine line;
    private final List<String> shown = new ArrayList<>();

    @Before
    public void attach() {
        Activity host = Robolectric.buildActivity(Activity.class).setup().get();
        reader = host.getSystemService(AccessibilityManager.class);
        Shadows.shadowOf(reader).setEnabled(true);
        view = new TextView(host);
        view.setText("Changes are saved only when you tap Save.");
        host.setContentView(view);
        line = new SpokenLine(view);
        view.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { shown.add(text.toString()); }
            @Override public void afterTextChanged(android.text.Editable text) { }
        });
        ShadowLooper.idleMainLooper();
    }

    @Test
    public void aQuickAnswerChangesTheLineOnceAndNeverShowsTheBusyLine() {
        line.busy("Saving changes");
        line.say("Couldn't save. Try again.");
        ShadowLooper.idleMainLooper(SpokenLine.BUSY_AFTER_MS * 2, TimeUnit.MILLISECONDS);
        assertEquals(List.of("Couldn't save. Try again."), shown);
        assertEquals(1, readsFrom(reader, view));
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, view.getAccessibilityLiveRegion());
    }

    @Test
    public void theSameAnswerAgainIsReadOnceMore() {
        line.say("Couldn't save. Try again.");
        ShadowLooper.idleMainLooper();
        assertEquals(1, readsFrom(reader, view));
        line.busy("Saving changes");
        line.say("Couldn't save. Try again.");
        ShadowLooper.idleMainLooper(SpokenLine.BUSY_AFTER_MS * 2, TimeUnit.MILLISECONDS);
        assertEquals("the line changed twice to say it again", List.of("Couldn't save. Try again."), shown);
        assertEquals(2, readsFrom(reader, view));
    }

    @Test
    public void twoThingsSaidBeforeTheNextFrameAreReadAsTheLastOnly() {
        line.say("Couldn't read this account's muted posts.");
        line.say("Couldn't update muted posts. Try again.");
        assertTrue("the line changed before the next frame", shown.isEmpty());
        ShadowLooper.idleMainLooper();
        assertEquals(List.of("Couldn't update muted posts. Try again."), shown);
        assertEquals(1, readsFrom(reader, view));
    }

    @Test
    public void aSlowActionShowsItsBusyLineLongEnoughToBeRead() {
        line.busy("Saving changes");
        ShadowLooper.idleMainLooper(SpokenLine.BUSY_AFTER_MS - 1, TimeUnit.MILLISECONDS);
        assertTrue(shown.isEmpty());
        ShadowLooper.idleMainLooper(1, TimeUnit.MILLISECONDS);
        assertEquals(List.of("Saving changes"), shown);
        line.say("Words saved");
        ShadowLooper.idleMainLooper(SpokenLine.BUSY_HOLD_MS - 1, TimeUnit.MILLISECONDS);
        assertEquals("the answer replaced the busy line before it could be read", List.of("Saving changes"), shown);
        ShadowLooper.idleMainLooper(1, TimeUnit.MILLISECONDS);
        assertEquals(List.of("Saving changes", "Words saved"), shown);
        assertEquals(2, readsFrom(reader, view));
    }

    @Test
    public void cancelDropsWhatHasntShown() {
        line.busy("Saving changes");
        line.cancel();
        line.say("Couldn't save. Try again.");
        line.cancel();
        ShadowLooper.idleMainLooper(SpokenLine.BUSY_AFTER_MS * 2, TimeUnit.MILLISECONDS);
        assertTrue(shown.isEmpty());
        assertEquals(0, readsFrom(reader, view));
    }

    /** Sending an event with no screen reader on throws on the main thread. */
    @Test
    public void withoutAScreenReaderTheSameAnswerSendsNothing() {
        Shadows.shadowOf(reader).setEnabled(false);
        view.setText("Couldn't save. Try again.");
        shown.clear();
        line.say("Couldn't save. Try again.");
        ShadowLooper.idleMainLooper();
        assertTrue(shown.isEmpty());
        assertEquals(0, readsFrom(reader, view));
    }

    /** Text changes [view], a live region, sent for a screen reader to read. */
    public static int readsFrom(AccessibilityManager reader, View view) {
        int id = ReflectionHelpers.callInstanceMethod(view, "getAccessibilityViewId");
        int reads = 0;
        for (AccessibilityEvent event : Shadows.shadowOf(reader).getSentAccessibilityEvents()) {
            if (event.getEventType() != AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
                    || (event.getContentChangeTypes() & AccessibilityEvent.CONTENT_CHANGE_TYPE_TEXT) == 0) continue;
            long source = ReflectionHelpers.callInstanceMethod(event, "getSourceNodeId");
            if ((int) source == id) reads++;
        }
        return reads;
    }
}
