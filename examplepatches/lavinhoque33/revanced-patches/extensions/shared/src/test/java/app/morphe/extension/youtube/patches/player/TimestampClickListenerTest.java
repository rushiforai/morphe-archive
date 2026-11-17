/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.*;

import android.view.View;

import org.junit.Test;

import java.lang.reflect.Field;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.youtube.patches.player.PlayerPatch.TimestampClickListener;

public class TimestampClickListenerTest {
    private static final class TimestampView extends View {
        OnClickListener listener;
        Runnable pending;

        TimestampView() {
            super(null);
        }

        @Override
        public void setOnClickListener(OnClickListener listener) {
            this.listener = listener;
        }

        @Override
        public void setTag(int key, Object value) {
            throw new AssertionError("Timestamp binding must not depend on resource tag keys");
        }

        @Override
        public Object getTag(int key) {
            throw new AssertionError("Timestamp lookup must not depend on resource tag keys");
        }

        @Override
        public boolean postDelayed(Runnable action, long delayMillis) {
            pending = action;
            return true;
        }

        @Override
        public boolean removeCallbacks(Runnable action) {
            assertSame(pending, action);
            pending = null;
            return true;
        }
    }

    @Test
    public void bindsBeforeAnyContextOrResourcesAreAvailable() {
        TimestampView view = new TimestampView();
        AtomicReference<View> clicked = new AtomicReference<>();

        TimestampClickListener.bind(view, clicked::set, true);

        assertSame(view.listener, TimestampClickListener.find(view));
        view.listener.onClick(view);
        assertSame(view, clicked.get());
    }

    @Test
    public void disabledAndNullBindingsRemoveRetainedListeners() {
        TimestampView view = new TimestampView();
        View.OnClickListener original = clicked -> {};
        TimestampClickListener.bind(view, original, true);

        TimestampClickListener.bind(view, original, false);
        assertNull(TimestampClickListener.find(view));
        assertSame(original, view.listener);

        TimestampClickListener.bind(view, original, true);
        TimestampClickListener.bind(view, null, true);
        assertNull(TimestampClickListener.find(view));
        assertNull(view.listener);
    }

    @Test
    public void separateTimestampViewsKeepTheirOwnNativeActions() {
        TimestampView first = new TimestampView();
        TimestampView second = new TimestampView();
        AtomicInteger clicks = new AtomicInteger();
        TimestampClickListener.bind(first, view -> clicks.addAndGet(1), true);
        TimestampClickListener.bind(second, view -> clicks.addAndGet(10), true);

        TimestampClickListener.find(first).onClick(first);
        TimestampClickListener.find(second).onClick(second);
        assertEquals(11, clicks.get());
    }

    @Test
    public void doubleTapCancelsMenuAndInvokesOriginalWithTheNativeView() throws Exception {
        TimestampView nativeView = new TimestampView();
        TimestampView tappedContainer = new TimestampView();
        AtomicReference<View> clicked = new AtomicReference<>();
        TimestampClickListener.bind(nativeView, clicked::set, true);
        TimestampClickListener listener = TimestampClickListener.find(nativeView);
        Field showMenu = TimestampClickListener.class.getDeclaredField("showMenu");
        showMenu.setAccessible(true);
        showMenu.setBoolean(listener, true);

        listener.onClick(tappedContainer);
        assertNotNull(tappedContainer.pending);
        assertNull(clicked.get());

        listener.onClick(tappedContainer);
        assertNull(tappedContainer.pending);
        assertSame(nativeView, clicked.get());
    }
}
