package app.yydarlinker.deepseekcaptions;

import java.util.Collections;
import java.util.List;

/** Pure lifecycle regression harness for verified ownership and shared publication guards. */
public final class ContextualVideoOwnershipHarness {
    public static void main(String[] args) {
        assertEquals("", ContextualUnitCorePolicy.bindOwnerOnVideoId("", "video-b"),
                "unresolved session without provenance must not bind first observed video");
        assertTrue(ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                true, true, "", ""),
                "contextual AI request without owner must remain native pass-through");
        assertFalse(ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                true, true, "video-b", ""),
                "URL video provenance permits contextual interception");
        assertFalse(ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                true, true, "", "video-b"),
                "activation-time current owner permits contextual interception");
        assertFalse(ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                false, true, "", ""),
                "legacy core behavior is not changed by contextual owner gate");
        assertFalse(ContextualUnitCorePolicy.shouldPassThroughUnresolvedActivation(
                true, false, "", ""),
                "non-activation requests do not need contextual pass-through gate");
        assertEquals("video-b", ContextualUnitCorePolicy.bindOwnerOnVideoId(
                "video-b", "video-b"),
                "verified video-b provenance binds matching video");
        assertEquals("", ContextualUnitCorePolicy.bindOwnerOnVideoId(
                "video-a", "video-b"),
                "video-a provenance cannot bind video-b");

        assertFalse(ContextualUnitCorePolicy.mayContinue(true, false, "", ""),
                "unresolved owner cannot start or continue source preparation");
        assertFalse(ContextualUnitCorePolicy.mayPublish(true, false, "", "video-b"),
                "unresolved owner cannot publish after current video is known");
        assertTrue(ContextualUnitCorePolicy.mayPublish(
                true, false, "video-b", "video-b"),
                "verified matching owner may publish");
        assertFalse(ContextualUnitCorePolicy.mayPublish(
                true, false, "video-a", "video-b"),
                "stale video-a session cannot publish into video-b");

        List<CaptionDocument.Cue> videoA = Collections.singletonList(
                new CaptionDocument.Cue(0L, 1_000L, "owned-a")
        );
        List<CaptionDocument.Cue> unknown = Collections.singletonList(
                new CaptionDocument.Cue(0L, 1_000L, "unknown")
        );
        List<CaptionDocument.Cue> videoB = Collections.singletonList(
                new CaptionDocument.Cue(0L, 1_000L, "owned-b")
        );

        SemanticCaptionTimeline.onVideoId("video-a");
        assertTrue(RawCaptionSource.publishSharedTimeline("video-a", videoA),
                "explicit Raw owner publishes shared timeline");
        assertCue("owned-a", 100L, "video-a timeline visible");

        assertFalse(RawCaptionSource.publishSharedTimeline("", unknown),
                "Raw boundary rejects empty owner");
        assertFalse(SemanticCaptionTimeline.replace("", unknown),
                "global shared boundary rejects direct empty owner");
        assertCue("owned-a", 100L, "empty-owner attempts do not replace existing timeline");

        SemanticCaptionTimeline.onVideoId("video-b");
        assertTrue(RawCaptionSource.publishSharedTimeline("video-b", videoB),
                "explicit video-b owner publishes normally");
        assertCue("owned-b", 100L, "video-b timeline visible");

        System.out.println("ContextualVideoOwnershipHarness: OK");
    }

    private static void assertCue(String expected, long timeMs, String label) {
        CaptionDocument.Cue cue = SemanticCaptionTimeline.activeCue(timeMs);
        String actual = cue == null || cue.text == null ? "" : cue.text;
        assertEquals(expected, actual, label);
    }

    private static void assertTrue(boolean value, String label) {
        if (!value) throw new AssertionError(label);
    }

    private static void assertFalse(boolean value, String label) {
        if (value) throw new AssertionError(label);
    }

    private static void assertEquals(String expected, String actual, String label) {
        if (!expected.equals(actual)) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }
}
