package dev.jason.gboardpatches.extension.ocr;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

public final class GboardOcrRuntimeTest {
    @After
    public void tearDown() {
        GboardOcrRuntime.resetForTests();
    }

    @Test
    public void entryGateForcesOnlyTheThreeOcrFlags() {
        Assert.assertEquals(Boolean.TRUE,
                GboardOcrRuntime.applyFlagValue("enable_ocr", Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE,
                GboardOcrRuntime.applyFlagValue("config_ocr", Boolean.FALSE));
        Assert.assertEquals("*",
                GboardOcrRuntime.applyFlagValue("enabled_ocr_language_tags", "en"));
        Object untouched = new Object();
        Assert.assertSame(untouched,
                GboardOcrRuntime.applyFlagValue("another_flag", untouched));
    }

    @Test
    public void chineseBackendSelectsExactThinAndThickMetadata() {
        GboardOcrRuntime.setEngineOverrideForTests(GboardOcrEngine.CHINESE);
        GboardOcrRuntime.setThickAvailabilityOverrideForTests(Boolean.FALSE);

        Assert.assertEquals(
                "taser_tflite_gocrchinese_and_latin_mbv2_aksara_layout_gcn_mobile",
                GboardOcrRuntime.applyConfigLabel("stock"));
        Assert.assertEquals("zh", GboardOcrRuntime.applyLanguageHint("stock"));
        Assert.assertEquals("play-services-mlkit-text-recognition-chinese",
                GboardOcrRuntime.applyLoggingLibrary("stock"));
        Assert.assertEquals("optional-module-text-chinese",
                GboardOcrRuntime.applyOptionalModuleName("stock"));
        Assert.assertEquals("com.google.android.gms.mlkit_ocr_chinese",
                GboardOcrRuntime.applyModuleId("stock"));
        Assert.assertFalse(GboardOcrRuntime.applyModuleAvailability(true));

        GboardOcrRuntime.setThickAvailabilityOverrideForTests(Boolean.TRUE);
        Assert.assertEquals("text-recognition-chinese",
                GboardOcrRuntime.applyLoggingLibrary("stock"));
        Assert.assertEquals("com.google.mlkit.dynamite.text.chinese",
                GboardOcrRuntime.applyModuleId("stock"));
        Assert.assertTrue(GboardOcrRuntime.applyModuleAvailability(false));
    }

    @Test
    public void nonLatinModuleRequestIncludesLegacyAndSelectedFeatures() {
        GboardOcrRuntime.setEngineOverrideForTests(GboardOcrEngine.CHINESE);
        FakeRequest[] stock = new FakeRequest[]{new FakeRequest("vision.ocr")};

        Object result = GboardOcrRuntime.applyOptionalModuleRequest(stock);

        Assert.assertTrue(result instanceof FakeRequest[]);
        FakeRequest[] requests = (FakeRequest[]) result;
        Assert.assertEquals(3, requests.length);
        Assert.assertEquals("vision.ocr", requests[0].a);
        Assert.assertEquals("mlkit.ocr.common", requests[1].a);
        Assert.assertEquals("mlkit.ocr.chinese", requests[2].a);
    }

    @Test
    public void latinModuleRequestAndPayloadPolicyRemainStockCompatible() {
        GboardOcrRuntime.setEngineOverrideForTests(GboardOcrEngine.LATIN);
        FakeRequest[] stock = new FakeRequest[]{new FakeRequest("vision.ocr")};
        Assert.assertSame(stock, GboardOcrRuntime.applyOptionalModuleRequest(stock));

        GboardOcrRuntime.setEngineOverrideForTests(GboardOcrEngine.DEVANAGARI);
        GboardOcrRuntime.ThinPayloadSpec payload =
                GboardOcrRuntime.buildSelectedThinPayloadSpec();
        Assert.assertEquals("hi", payload.languageHint);
        Assert.assertEquals(3, payload.languageOption);
        Assert.assertEquals("optional-module-text-devanagari", payload.optionalModule);
        Assert.assertTrue(payload.enableOptionalModule);
    }

    @Test
    public void moduleInstallRequestsCoverEveryBackend() {
        Assert.assertArrayEquals(new String[]{"vision.ocr"},
                GboardOcrRuntime.selectedOptionalModuleNames(GboardOcrEngine.LATIN));
        Assert.assertArrayEquals(
                new String[]{"vision.ocr", "mlkit.ocr.common", "mlkit.ocr.chinese"},
                GboardOcrRuntime.selectedOptionalModuleNames(GboardOcrEngine.CHINESE));
        Assert.assertArrayEquals(new String[]{"vision.ocr", "mlkit.ocr.japanese"},
                GboardOcrRuntime.selectedOptionalModuleNames(GboardOcrEngine.JAPANESE));
        Assert.assertArrayEquals(new String[]{"vision.ocr", "mlkit.ocr.korean"},
                GboardOcrRuntime.selectedOptionalModuleNames(GboardOcrEngine.KOREAN));
        Assert.assertArrayEquals(new String[]{"vision.ocr", "mlkit.ocr.devanagari"},
                GboardOcrRuntime.selectedOptionalModuleNames(GboardOcrEngine.DEVANAGARI));
    }

    private static final class FakeRequest {
        private final String a;

        private FakeRequest(String name) {
            a = name;
        }
    }
}
