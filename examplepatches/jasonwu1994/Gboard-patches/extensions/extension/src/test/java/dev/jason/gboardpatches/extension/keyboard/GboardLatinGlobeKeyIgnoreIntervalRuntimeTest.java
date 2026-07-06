package dev.jason.gboardpatches.extension.keyboard;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Method;

public final class GboardLatinGlobeKeyIgnoreIntervalRuntimeTest {
    @Test
    public void forceConfiguredGlobeKeyIgnoreIntervalOnlyTouchesGlobeField() throws Exception {
        FakeRuntimeParams runtimeParams = new FakeRuntimeParams();
        Method method = GboardLatinGlobeKeyIgnoreIntervalRuntime.class.getDeclaredMethod(
                "forceGlobeKeyIgnoreInterval",
                Object.class,
                int.class);
        method.setAccessible(true);

        Assert.assertTrue((Boolean) method.invoke(null, runtimeParams, 250));
        Assert.assertEquals(250f, runtimeParams.h, 0f);
        Assert.assertEquals(321f, runtimeParams.o, 0f);
        Assert.assertEquals(-1f, runtimeParams.q, 0f);
        Assert.assertEquals(-2f, runtimeParams.r, 0f);
    }

    @Test
    public void forceConfiguredGlobeKeyIgnoreIntervalIsNoOpWhenAlreadySet() throws Exception {
        FakeRuntimeParams runtimeParams = new FakeRuntimeParams();
        runtimeParams.h = 500f;
        Method method = GboardLatinGlobeKeyIgnoreIntervalRuntime.class.getDeclaredMethod(
                "forceGlobeKeyIgnoreInterval",
                Object.class,
                int.class);
        method.setAccessible(true);

        Assert.assertFalse((Boolean) method.invoke(null, runtimeParams, 500));
        Assert.assertEquals(500f, runtimeParams.h, 0f);
        Assert.assertEquals(321f, runtimeParams.o, 0f);
        Assert.assertEquals(-1f, runtimeParams.q, 0f);
        Assert.assertEquals(-2f, runtimeParams.r, 0f);
    }

    @Test
    public void sanitizeConfiguredIntervalClampsToSupportedRange() {
        Assert.assertEquals(
                0,
                GboardLatinGlobeKeyIgnoreIntervalSettings.sanitizeIntervalMs(-5));
        Assert.assertEquals(
                500,
                GboardLatinGlobeKeyIgnoreIntervalSettings.sanitizeIntervalMs(500));
        Assert.assertEquals(
                1000,
                GboardLatinGlobeKeyIgnoreIntervalSettings.sanitizeIntervalMs(1500));
    }

    private static final class FakeRuntimeParams {
        float h = 500f;
        float o = 321f;
        float q = -1f;
        float r = -2f;
    }
}
