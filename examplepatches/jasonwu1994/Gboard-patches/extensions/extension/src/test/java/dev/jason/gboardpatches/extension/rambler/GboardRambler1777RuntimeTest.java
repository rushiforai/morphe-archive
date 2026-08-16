package dev.jason.gboardpatches.extension.rambler;

import android.os.Bundle;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoice1777RuntimeSettings;
import dev.jason.gboardpatches.extension.advancedvoice.GboardAdvancedVoiceSettings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public final class GboardRambler1777RuntimeTest {
    @After
    public void clearOverrides() {
        GboardAdvancedVoice1777RuntimeSettings.clearEnabledOverrideForTest();
    }

    @Test
    public void exactLaunchScopeForcesNgaFallbackAndInjectsJetsonBundle() {
        enableRambler();
        Event event = new Event(-0x273a);

        Assert.assertFalse(hng.f(event, true));
        Assert.assertTrue(GboardRambler1777Runtime.afterNgaEligibility(true));

        Object transformed = jmz.f(event, "stock");
        Assert.assertTrue(transformed instanceof Bundle);
        Assert.assertEquals("jetson", ((Bundle) transformed).getString("session_type"));
    }

    @Test
    public void disabledAndNonLaunchCallsRemainStock() {
        Object original = new Object();
        Assert.assertTrue(hng.f(new Event(-0x273a), true));
        Assert.assertTrue(GboardRambler1777Runtime.afterNgaEligibility(true));
        Assert.assertSame(original, GboardRambler1777Runtime.injectJetsonSession(original));
        Assert.assertFalse(GboardRambler1777Runtime.tryInitializeStockFallback(null));

        enableRambler();
        Assert.assertTrue(hng.f(new Event(7), true));
    }

    @Test
    public void invocationMarkersUnwindInLifoOrderWithoutLeakingDepth() {
        GboardRambler1777Runtime.ScopedInvocationState state =
                new GboardRambler1777Runtime.ScopedInvocationState();
        state.noteInvocation(true, 1);
        state.noteInvocation(false, 2);

        Assert.assertFalse(state.isActive(2));
        Assert.assertEquals(-1, state.exitInvocation());
        Assert.assertTrue(state.isActive(1));
        Assert.assertEquals(0, state.exitInvocation());
        Assert.assertFalse(state.isActive(0));
        Assert.assertEquals(-1, state.exitInvocation());
    }

    @Test
    public void exceptionalScopeLeakIsInertAndSelfHealing() {
        GboardRambler1777Runtime.ScopedInvocationState state =
                new GboardRambler1777Runtime.ScopedInvocationState();
        state.noteInvocation(true, 1);

        Assert.assertFalse(state.isActive(0));

        state.noteInvocation(true, 1);
        state.noteInvocation(true, 1);
        Assert.assertTrue(state.isActive(1));
        Assert.assertEquals(0, state.exitInvocation());
        Assert.assertFalse(state.isActive(0));
    }

    @Test
    public void leakedRuntimeScopesCannotAffectCallsAfterStockException() {
        enableRambler();
        Event event = new Event(-0x273a);

        try {
            hng.failingF(event);
            Assert.fail("Expected stock launch failure");
        } catch (StockFailure expected) {
            // Simulates hng#f leaving exceptionally before the injected normal-return cleanup.
        }
        Assert.assertTrue(GboardRambler1777Runtime.afterNgaEligibility(true));

        try {
            jmz.failingF(event);
            Assert.fail("Expected stock parser failure");
        } catch (StockFailure expected) {
            // Simulates jmz#f leaving exceptionally before the injected normal-return cleanup.
        }
        Object original = new Object();
        Assert.assertSame(original, GboardRambler1777Runtime.injectJetsonSession(original));
    }

    private static void enableRambler() {
        GboardAdvancedVoice1777RuntimeSettings.setEnabledOverrideForTest(true);
        GboardAdvancedVoice1777RuntimeSettings.setBackendOverrideForTest(
                GboardAdvancedVoiceSettings.BACKEND_RAMBLER);
    }

    private static final class Event {
        private final Object[] b;

        private Event(int code) {
            b = new Object[] { new Action(code) };
        }
    }

    private static final class Action {
        private final int c;

        private Action(int code) {
            c = code;
        }
    }

    static final class StockFailure extends RuntimeException {
    }
}

final class hng {
    private hng() {
    }

    static boolean f(Object event, boolean stockResult) {
        GboardRambler1777Runtime.enterLaunchScope(event);
        try {
            return GboardRambler1777Runtime.afterNgaEligibility(stockResult);
        } finally {
            GboardRambler1777Runtime.exitLaunchScope();
        }
    }

    static void failingF(Object event) {
        GboardRambler1777Runtime.enterLaunchScope(event);
        throw new GboardRambler1777RuntimeTest.StockFailure();
    }
}

final class jmz {
    private jmz() {
    }

    static Object f(Object event, Object original) {
        GboardRambler1777Runtime.enterParserScope(event);
        try {
            return GboardRambler1777Runtime.injectJetsonSession(original);
        } finally {
            GboardRambler1777Runtime.exitParserScope();
        }
    }

    static void failingF(Object event) {
        GboardRambler1777Runtime.enterParserScope(event);
        throw new GboardRambler1777RuntimeTest.StockFailure();
    }
}
