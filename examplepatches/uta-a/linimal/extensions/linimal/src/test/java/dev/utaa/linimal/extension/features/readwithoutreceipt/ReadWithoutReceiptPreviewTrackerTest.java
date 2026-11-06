package dev.utaa.linimal.extension.features.readwithoutreceipt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public final class ReadWithoutReceiptPreviewTrackerTest {
    private static final String PREVIEW = ReadWithoutReceiptPreviewTracker.PREVIEW_ACTIVITY_CLASS;

    @Test
    public void onlyThePreviewActivityIsRemembered() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object chat = new Object();

        registry.noteCreated(chat, "jp.naver.line.android.activity.chathistory.ChatHistoryActivity");

        assertNull(registry.current());
    }

    @Test
    public void finishingClosesThePreviewOnceAndForgetsIt() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object preview = new Object();
        List<Object> finished = new ArrayList<>();
        registry.noteCreated(preview, PREVIEW);

        registry.finishCurrent(finished::add);
        registry.finishCurrent(finished::add);

        assertEquals(1, finished.size());
        assertSame(preview, finished.get(0));
        assertNull(registry.current());
    }

    @Test
    public void aDestroyedPreviewIsNotFinishedLater() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object preview = new Object();
        List<Object> finished = new ArrayList<>();
        registry.noteCreated(preview, PREVIEW);

        registry.noteDestroyed(preview);
        registry.finishCurrent(finished::add);

        assertEquals(0, finished.size());
    }

    @Test
    public void anOlderPreviewDestroyedLateDoesNotForgetTheNewerOne() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object older = new Object();
        Object newer = new Object();
        registry.noteCreated(older, PREVIEW);
        registry.noteCreated(newer, PREVIEW);

        registry.noteDestroyed(older);

        assertSame(newer, registry.current());
    }

    @Test
    public void aThrowingFinisherIsSwallowedAndThePreviewCanBeClosedAgain() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object preview = new Object();
        List<Object> finished = new ArrayList<>();
        registry.noteCreated(preview, PREVIEW);

        registry.finishCurrent(activity -> {
            throw new IllegalStateException("simulated finish failure");
        });
        registry.finishCurrent(finished::add);

        assertEquals(1, finished.size());
        assertSame(preview, finished.get(0));
        assertNull(registry.current());
    }

    @Test
    public void theResumedPreviewIsClosedRatherThanTheNewestOne() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object first = new Object();
        Object second = new Object();
        List<Object> finished = new ArrayList<>();
        registry.noteCreated(first, PREVIEW);
        registry.noteCreated(second, PREVIEW);
        registry.noteResumed(first, PREVIEW);

        registry.finishCurrent(finished::add);

        assertEquals(1, finished.size());
        assertSame(first, finished.get(0));
    }

    @Test
    public void aPreviewResumedAfterAnotherIsDestroyedIsStillClosed() {
        ReadWithoutReceiptPreviewTracker.Registry registry = new ReadWithoutReceiptPreviewTracker.Registry();
        Object first = new Object();
        Object second = new Object();
        List<Object> finished = new ArrayList<>();
        registry.noteCreated(first, PREVIEW);
        registry.noteCreated(second, PREVIEW);
        registry.noteDestroyed(second);
        registry.noteResumed(first, PREVIEW);

        registry.finishCurrent(finished::add);

        assertSame(first, finished.get(0));
    }

    @Test
    public void theDismissCallbackNeverThrowsWithoutAPreview() {
        new ReadWithoutReceiptPreviewDismiss().invoke();
    }
}
