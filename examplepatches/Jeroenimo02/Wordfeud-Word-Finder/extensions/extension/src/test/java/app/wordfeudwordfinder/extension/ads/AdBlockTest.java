package app.wordfeudwordfinder.extension.ads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.hooks.RouteTap;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class AdBlockTest {
    /** Collects the posted replies so a test can check that nothing is sent synchronously. */
    private final List<Runnable> posted = new ArrayList<>();

    @org.junit.Before
    public void postToList() {
        AdBlock.setReplyExecutorForTests(posted::add);
    }

    private void runPosted() {
        for (Runnable r : posted) r.run();
        posted.clear();
    }

    /** Stands in for FlutterJNI: the same public method names and parameter types. */
    public static final class FakeJni {
        final List<String> calls = new ArrayList<>();
        byte[] reply;

        public void invokePlatformMessageResponseCallback(int replyId, ByteBuffer message, int position) {
            assertTrue(message.isDirect());
            reply = new byte[position];
            ByteBuffer d = message.duplicate();
            d.flip();
            d.get(reply);
            calls.add("reply " + replyId);
        }

        public void cleanupMessageData(long messageData) {
            calls.add("cleanup " + messageData);
        }
    }

    @Test
    public void answersBlockedCallsWithAVoidReply() {
        FakeJni jni = new FakeJni();
        int before = AdBlock.blockedCount();
        assertTrue(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "showInterstitial",
                ByteBuffer.wrap(new byte[0]), 7, 1234L));
        assertTrue(jni.calls.isEmpty()); // never answered from inside handlePlatformMessage
        runPosted();
        assertEquals(Arrays.asList("reply 7", "cleanup 1234"), jni.calls);
        assertArrayEquals(new byte[] {12, 1, 0}, jni.reply);
        assertEquals(before + 1, AdBlock.blockedCount());
    }

    @Test
    public void leavesOtherMessagesAlone() {
        FakeJni jni = new FakeJni();
        ByteBuffer m = ByteBuffer.wrap(new byte[0]);
        assertFalse(AdBlock.onPlatformMessage(jni, "flutter/navigation", m, 1, 1L));
        assertFalse(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "canShowPrivacyOptions", m, 1, 1L));
        assertFalse(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "reset", m, 1, 1L));
        assertFalse(AdBlock.onPlatformMessage(jni, null, m, 1, 1L));
        assertFalse(AdBlock.onPlatformMessage(null, AdBlock.PREFIX + "showInterstitial", m, 1, 1L));
        assertTrue(posted.isEmpty());
        assertTrue(jni.calls.isEmpty());
    }

    @Test
    public void withoutTheFlutterMethodsTheAppHandlesTheMessage() {
        assertFalse(AdBlock.onPlatformMessage(new Object(), AdBlock.PREFIX + "setBannerVisible",
                ByteBuffer.wrap(new byte[0]), 1, 1L));
    }

    @Test
    public void noReplyWithoutAReplyId() {
        FakeJni jni = new FakeJni();
        assertTrue(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "setMrecVisible",
                ByteBuffer.wrap(new byte[0]), 0, 5L));
        runPosted();
        assertEquals(Arrays.asList("cleanup 5"), jni.calls);
    }

    @Test
    public void routeTapStillSeesTheBannerState() {
        FakeJni jni = new FakeJni();
        // pigeon: [true] = list(12), length 1, true(1)
        ByteBuffer on = ByteBuffer.wrap(new byte[] {12, 1, 1});
        assertTrue(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "setBannerVisible", on, 3, 3L));
        assertTrue(RouteTap.bannerVisible());
        assertEquals(0, on.position());
        assertTrue(AdBlock.onPlatformMessage(jni, AdBlock.PREFIX + "setBannerVisible",
                ByteBuffer.wrap(new byte[] {12, 1, 2}), 4, 4L));
        assertFalse(RouteTap.bannerVisible());
    }
}
