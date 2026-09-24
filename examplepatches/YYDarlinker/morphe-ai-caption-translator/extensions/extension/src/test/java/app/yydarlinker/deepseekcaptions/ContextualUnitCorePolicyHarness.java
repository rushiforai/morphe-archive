package app.yydarlinker.deepseekcaptions;

/** Pure policy regression harness for recovery, startup seek and stale-result guards. */
public final class ContextualUnitCorePolicyHarness {
    public static void main(String[] args) {
        ContextualUnitCorePolicy.RetryDecision transientDelayed =
                ContextualUnitCorePolicy.retryDecision(
                        ContextualUnitCorePolicy.FailureKind.TRANSIENT, 4, false
                );
        assertFalse(transientDelayed.permanent, "transient must not become permanent");
        assertTrue(transientDelayed.delayedRepair, "transient enters delayed repair");
        assertEquals(30_000L, transientDelayed.delayMs, "first delayed repair");

        ContextualUnitCorePolicy.RetryDecision protocolDelayed =
                ContextualUnitCorePolicy.retryDecision(
                        ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL, 7, false
                );
        assertFalse(protocolDelayed.permanent, "protocol repair remains retryable");
        assertEquals(120_000L, protocolDelayed.delayMs, "delayed repair cap");

        ContextualUnitCorePolicy.RetryDecision priority =
                ContextualUnitCorePolicy.retryDecision(
                        ContextualUnitCorePolicy.FailureKind.TRANSIENT, 8, true
                );
        assertFalse(priority.permanent, "current repair remains retryable");
        assertEquals(10_000L, priority.delayMs, "current repair cap");

        ContextualUnitCorePolicy.RetryDecision permanent =
                ContextualUnitCorePolicy.retryDecision(
                        ContextualUnitCorePolicy.FailureKind.PERMANENT, 1, true
                );
        assertTrue(permanent.permanent, "explicit permanent classification");

        assertTrue(ContextualUnitCorePolicy.shouldIsolateBatch(true, 6),
                "provider-rejected multi-unit batch is isolated");
        assertFalse(ContextualUnitCorePolicy.shouldIsolateBatch(true, 1),
                "single-unit rejection does not recursively split");
        assertEquals(1L, ContextualUnitCorePolicy.requestUnitLimit(true, 6),
                "isolated repair is exactly one unit");
        assertEquals(6L, ContextualUnitCorePolicy.requestUnitLimit(false, 6),
                "normal batch size remains unchanged");
        assertEquals(0L, ContextualUnitCorePolicy.isolatedRetryDelayMs(true, 5),
                "current isolated repair is immediate");
        assertEquals(900L, ContextualUnitCorePolicy.isolatedRetryDelayMs(false, 5),
                "future isolation uses bounded staggering");

        long promoted = ContextualUnitCorePolicy.promoteCurrentRepairAt(1_000L, 121_000L, 4);
        assertEquals(11_000L, promoted, "current delayed repair promotion");
        assertEquals(1_000L,
                ContextualUnitCorePolicy.promoteDemandedRepairAt(1_000L, 2_200L, 1),
                "current partial hole bypasses ordinary quick-retry wait");
        assertEquals(11_000L,
                ContextualUnitCorePolicy.promoteDemandedRepairAt(1_000L, 121_000L, 4),
                "repeated current failure remains rate-limited");

        assertTrue(ContextualUnitCorePolicy.refillEligible(false, true),
                "partial READY inventory unlocks future refill despite current hole");
        assertTrue(ContextualUnitCorePolicy.refillEligible(true, false),
                "normal first-ready path remains refill eligible");
        assertFalse(ContextualUnitCorePolicy.refillEligible(false, false),
                "no READY inventory keeps startup refill gate closed");

        assertTrue(ContextualUnitCorePolicy.mayPublish(true, false, "video-a", "video-a"),
                "matching session owns timeline");
        assertFalse(ContextualUnitCorePolicy.mayPublish(true, false, "video-a", "video-b"),
                "stale video cannot publish");
        assertFalse(ContextualUnitCorePolicy.mayPublish(false, false, "video-a", "video-a"),
                "inactive session cannot publish");

        assertTrue(ContextualUnitCorePolicy.acceptsRequestResult(
                true, false, false, 3L, 3L), "current generation accepted");
        assertFalse(ContextualUnitCorePolicy.acceptsRequestResult(
                true, false, false, 2L, 3L), "stale generation rejected");
        assertFalse(ContextualUnitCorePolicy.acceptsRequestResult(
                true, false, true, 3L, 3L), "cancelled request rejected");

        boolean debounce = ContextualUnitCorePolicy.shouldDebounceStartupSeek(
                false, false, true, 1_000L, 2_000L,
                10_000L, 11_600L, 5, 6, 5, 7
        );
        assertTrue(debounce, "small startup correction debounced once");
        assertFalse(ContextualUnitCorePolicy.shouldDebounceStartupSeek(
                true, false, true, 1_000L, 2_000L,
                10_000L, 11_600L, 5, 6, 5, 7
        ), "startup debounce is one-shot");
        assertFalse(ContextualUnitCorePolicy.shouldDebounceStartupSeek(
                false, false, true, 1_000L, 2_000L,
                10_000L, 13_200L, 5, 6, 5, 7
        ), "clock-level seek beyond correction cap is not debounced");
        assertTrue(ContextualUnitCorePolicy.shouldReprioritizeSeek(true, false),
                "non-debounced seek reaches generation invalidation path");
        assertFalse(ContextualUnitCorePolicy.shouldReprioritizeSeek(true, true),
                "small startup correction does not reprioritize");
        assertFalse(ContextualUnitCorePolicy.shouldDebounceStartupSeek(
                false, false, true, 1_000L, 2_000L,
                10_000L, 20_000L, 5, 6, 5, 7
        ), "obvious seek is not debounced");

        System.out.println("ContextualUnitCorePolicyHarness: OK");
    }

    private static void assertTrue(boolean value, String label) {
        if (!value) throw new AssertionError(label);
    }

    private static void assertFalse(boolean value, String label) {
        if (value) throw new AssertionError(label);
    }

    private static void assertEquals(long expected, long actual, String label) {
        if (expected != actual) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }
}
