package com.akshaykadam.pixelboard.extension.clipboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.ClipboardManager;
import android.content.Context;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public class GboardClipboardSyncRuntimeTest {

    static class FakeClipboardDataHandler implements ClipboardManager.OnPrimaryClipChangedListener {
        Context c;
        ClipboardManager d;
        final AtomicBoolean clipChangedCalled = new AtomicBoolean(false);

        FakeClipboardDataHandler(Context context) {
            this.c = context;
        }

        @Override
        public void onPrimaryClipChanged() {
            clipChangedCalled.set(true);
        }
    }

    @Test
    public void testSyncOnStartInputView_nullHandlerDoesNotThrow() {
        GboardClipboardSyncRuntime.syncOnStartInputView(null);
    }

    @Test
    public void testSyncOnStartInputView_initializesClipboardManagerAndTriggersSync() {
        Context context = RuntimeEnvironment.getApplication();
        FakeClipboardDataHandler handler = new FakeClipboardDataHandler(context);

        // Before sync, ClipboardManager field d is null (as on Android 10+ devices)
        GboardClipboardSyncRuntime.syncOnStartInputView(handler);

        // ClipboardManager must have been initialized from Context
        assertNotNull(handler.d);
        // onPrimaryClipChanged must have been invoked
        assertTrue(handler.clipChangedCalled.get());
    }
}
