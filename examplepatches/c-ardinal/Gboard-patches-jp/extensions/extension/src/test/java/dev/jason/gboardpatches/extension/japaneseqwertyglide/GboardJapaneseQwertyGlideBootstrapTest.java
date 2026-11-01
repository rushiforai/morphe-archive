package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

@RunWith(RobolectricTestRunner.class)
public final class GboardJapaneseQwertyGlideBootstrapTest {
    public static final class ArrayCache {
        public ArrayCache() {}
    }

    public static final class OptimizedXzReader extends java.io.FilterInputStream {
        public OptimizedXzReader(java.io.InputStream input, int limit, boolean checks,
                byte[] header, ArrayCache cache) {
            super(input);
            if (limit >= 0) {
                throw new IllegalArgumentException("APK optimizes nonnegative limits to zero");
            }
            Assert.assertTrue(checks);
            Assert.assertEquals(12, header.length);
            Assert.assertNotNull(cache);
        }
    }

    @Test
    public void optimizedXzReaderReceivesSupportedLimitAndConsumedHeader() throws Exception {
        byte[] stream = new byte[15];
        System.arraycopy(new byte[]{(byte) 253, 55, 122, 88, 90, 0}, 0, stream, 0, 6);
        stream[12] = 42;
        try (java.io.InputStream decoded = GboardJapaneseQwertyGlideBootstrap.xzStream(
                OptimizedXzReader.class, ArrayCache.class, new ByteArrayInputStream(stream))) {
            Assert.assertEquals(42, decoded.read());
        }
        stream[0] = 0;
        Assert.assertThrows(java.io.IOException.class,
                () -> GboardJapaneseQwertyGlideBootstrap.xzStream(
                        OptimizedXzReader.class, ArrayCache.class, new ByteArrayInputStream(stream)));
    }

    @Rule
    public TemporaryFolder files = new TemporaryFolder();

    @Test
    public void missingStockDecoderFallsBackToBootstrap() throws Exception {
        try {
            GboardJapaneseQwertyGlideDecoder.snapshot(new ClassLoader(null) {}, null);
            Assert.fail("Expected missing bootstrap context");
        } catch (IllegalArgumentException expected) {
            Assert.assertEquals("Missing bootstrap context", expected.getMessage());
        }
    }

    @Test
    public void bundledMetadataRequiresAnUnambiguousUsEnglishModel() {
        Assert.assertEquals(2026080409L, GboardJapaneseQwertyGlideBootstrap.englishVersion(
                new String[]{"ja", "en-us"}, new int[]{7, 0x7f130069}, new int[]{1, 2026080409}));
        for (String[] locales : new String[][]{{"ja"}, {"en-US", "en-US"}}) {
            int[] ids = new int[locales.length];
            int[] versions = new int[locales.length];
            Arrays.fill(ids, 0x7f130069);
            Arrays.fill(versions, 1);
            Assert.assertThrows(IllegalArgumentException.class,
                    () -> GboardJapaneseQwertyGlideBootstrap.englishVersion(locales, ids, versions));
        }
        Assert.assertThrows(IllegalArgumentException.class,
                () -> GboardJapaneseQwertyGlideBootstrap.englishVersion(
                        new String[]{"en-US"}, new int[]{0x7f130069}, new int[0]));
    }

    @Test
    public void apkSegmentCannotOverflowOrExtendPastFile() throws Exception {
        File apk = files.newFile("base.apk");
        Files.write(apk.toPath(), new byte[100]);
        GboardJapaneseQwertyGlideBootstrap.validateSegment(apk, 10, 90);
        for (long[] bounds : new long[][]{{-1, 10}, {10, 91}, {Long.MAX_VALUE, 10}, {0, 0}}) {
            Assert.assertThrows(java.io.IOException.class,
                    () -> GboardJapaneseQwertyGlideBootstrap.validateSegment(apk, bounds[0], bounds[1]));
        }
    }

    @Test
    public void expandedModelRejectsPartialAndCompressedFiles() throws Exception {
        File model = files.newFile("main.dict");
        Assert.assertFalse(GboardJapaneseQwertyGlideBootstrap.validModel(model));
        byte[] expanded = new byte[40];
        System.arraycopy(new byte[]{6, 111, 80, 7}, 0, expanded, 0, 4);
        Files.write(model.toPath(), expanded);
        Assert.assertTrue(GboardJapaneseQwertyGlideBootstrap.validModel(model));
        expanded[0] = (byte) 253;
        Files.write(model.toPath(), expanded);
        Assert.assertFalse(GboardJapaneseQwertyGlideBootstrap.validModel(model));
    }

    @Test
    public void canceledPreparationDoesNotWritePartialModel() throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        Thread.currentThread().interrupt();
        try {
            Assert.assertThrows(java.io.IOException.class,
                    () -> GboardJapaneseQwertyGlideBootstrap.copyModel(
                            new ByteArrayInputStream(new byte[100]), output));
            Assert.assertEquals(0, output.size());
        } finally {
            Thread.interrupted();
        }
        byte[] bytes = {1, 2, 3};
        Assert.assertEquals(3, GboardJapaneseQwertyGlideBootstrap.copyModel(
                new ByteArrayInputStream(bytes), output));
        Assert.assertArrayEquals(bytes, output.toByteArray());
    }

    @Test
    public void modelDefinitionUsesExpandedFileAndPreservesLocaleAndVersion() throws Exception {
        Map<String, Object> fields = new LinkedHashMap<>();
        GboardJapaneseQwertyGlideDecoder.Wire wire = new GboardJapaneseQwertyGlideDecoder.Wire() {
            public Object message(String type, int presence, Object... values) {
                Assert.assertEquals("yxj", type);
                for (int index = 0; index < values.length; index += 2) {
                    fields.put((String) values[index], values[index + 1]);
                }
                return fields;
            }
            public Object copy(Object message, int presence, Object... values) { throw new AssertionError(); }
            public byte[] bytes(Object message) { throw new AssertionError(); }
            public Object parse(String type, byte[] bytes) { throw new AssertionError(); }
            public Object field(Object message, String name) { throw new AssertionError(); }
        };
        GboardJapaneseQwertyGlideBootstrap.model(wire, "/cache/main.dict", 9264808, 2026080409);
        Assert.assertEquals(1, fields.get("e"));
        Assert.assertEquals("/cache/main.dict", fields.get("f"));
        Assert.assertEquals(0, fields.get("g"));
        Assert.assertEquals(9264808, fields.get("h"));
        Assert.assertEquals("en", fields.get("i"));
        Assert.assertEquals("US", fields.get("j"));
        Assert.assertEquals(2026080409L, fields.get("l"));
    }
}
