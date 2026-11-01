package dev.jason.gboardpatches.extension.webclipboard;

import org.junit.Assert;
import org.junit.Test;

public final class WebClipboardEchoSuppressorTest {
    @Test
    public void suppressesImmediateClipboardEchoFromWebApply() {
        WebClipboardEchoSuppressor suppressor = new WebClipboardEchoSuppressor(2_000L);

        suppressor.markWebApplied("web sent text", 1_000L);

        Assert.assertTrue(suppressor.shouldSuppressClipboardEvent("web sent text", 1_250L));
        Assert.assertFalse(suppressor.shouldSuppressClipboardEvent("web sent text", 1_300L));
    }

    @Test
    public void allowsDifferentOrExpiredClipboardText() {
        WebClipboardEchoSuppressor suppressor = new WebClipboardEchoSuppressor(2_000L);

        suppressor.markWebApplied("web sent text", 1_000L);

        Assert.assertFalse(suppressor.shouldSuppressClipboardEvent("phone copied text", 1_250L));
        Assert.assertFalse(suppressor.shouldSuppressClipboardEvent("web sent text", 3_100L));
    }

    @Test
    public void canDiscardPendingWebApplyWhenPhoneClipboardWriteFails() {
        WebClipboardEchoSuppressor suppressor = new WebClipboardEchoSuppressor(2_000L);

        suppressor.markWebApplied("web sent text", 1_000L);
        suppressor.clearWebApplied();

        Assert.assertFalse(suppressor.shouldSuppressClipboardEvent("web sent text", 1_250L));
    }

    @Test
    public void tracksMultiplePendingWebApplies() {
        WebClipboardEchoSuppressor suppressor = new WebClipboardEchoSuppressor(2_000L);

        suppressor.markWebApplied("first web text", 1_000L);
        suppressor.markWebApplied("second web text", 1_050L);

        Assert.assertTrue(suppressor.shouldSuppressClipboardEvent("first web text", 1_250L));
        Assert.assertTrue(suppressor.shouldSuppressClipboardEvent("second web text", 1_300L));
        Assert.assertFalse(suppressor.shouldSuppressClipboardEvent("first web text", 1_350L));
    }
}
