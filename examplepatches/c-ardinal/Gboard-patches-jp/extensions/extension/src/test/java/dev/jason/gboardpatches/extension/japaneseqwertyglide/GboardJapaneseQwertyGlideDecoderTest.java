package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import org.junit.Assert;
import org.junit.Test;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

public final class GboardJapaneseQwertyGlideDecoderTest {
    @Test
    public void missingStockModelRetriesWithBundledSnapshot() throws Exception {
        Object stock = new Object();
        Object bundled = new Object();
        List<Object> attempts = new ArrayList<>();
        Object result = GboardJapaneseQwertyGlideDecoder.recoverModelLoad(stock,
                new GboardJapaneseQwertyGlideDecoder.DecodeAttempt() {
                    public Object decode(Object snapshot) {
                        attempts.add(snapshot);
                        if (snapshot == stock) {
                            throw new GboardJapaneseQwertyGlideDecoder.ModelLoadFailure();
                        }
                        return "decoded";
                    }
                    public Object fallback() { return bundled; }
                });
        Assert.assertEquals("decoded", result);
        Assert.assertEquals(Arrays.asList(stock, bundled), attempts);
    }

    @Test
    public void fallbackLoadFailureIsNotRetriedIndefinitely() {
        int[] attempts = {0};
        Assert.assertThrows(GboardJapaneseQwertyGlideDecoder.ModelLoadFailure.class,
                () -> GboardJapaneseQwertyGlideDecoder.recoverModelLoad(new Object(),
                        new GboardJapaneseQwertyGlideDecoder.DecodeAttempt() {
                            public Object decode(Object snapshot) {
                                attempts[0]++;
                                throw new GboardJapaneseQwertyGlideDecoder.ModelLoadFailure();
                            }
                            public Object fallback() { return new Object(); }
                        }));
        Assert.assertEquals(2, attempts[0]);
    }

    @Test
    public void unrelatedDecodeFailureDoesNotReinitializeModel() {
        Assert.assertThrows(IllegalArgumentException.class,
                () -> GboardJapaneseQwertyGlideDecoder.recoverModelLoad(new Object(),
                        new GboardJapaneseQwertyGlideDecoder.DecodeAttempt() {
                            public Object decode(Object snapshot) { throw new IllegalArgumentException("layout"); }
                            public Object fallback() { throw new AssertionError("Unexpected fallback"); }
                        }));
    }

    @Test
    public void canceledDecodeDoesNotStartFallback() {
        Thread.currentThread().interrupt();
        try {
            Assert.assertThrows(InterruptedException.class,
                    () -> GboardJapaneseQwertyGlideDecoder.recoverModelLoad(new Object(),
                            new GboardJapaneseQwertyGlideDecoder.DecodeAttempt() {
                                public Object decode(Object snapshot) {
                                    throw new GboardJapaneseQwertyGlideDecoder.ModelLoadFailure();
                                }
                                public Object fallback() { throw new AssertionError("Canceled fallback"); }
                            }));
        } finally {
            Thread.interrupted();
        }
    }

    @Test
    public void failedModelLoadReleasesNativeHandleBeforeRecovery() {
        List<String> calls = new ArrayList<>();
        GboardJapaneseQwertyGlideDecoder.Transport transport = (name, args) -> {
            calls.add(name);
            if (name.equals("createCrankDispatcherNative")) {
                return 42L;
            }
            return name.equals("loadLanguageModelWithHandleNative") ? false : null;
        };
        GboardJapaneseQwertyGlideDecoder.Wire wire = new GboardJapaneseQwertyGlideDecoder.Wire() {
            public Object message(String type, int presence, Object... fields) { return new Object(); }
            public Object copy(Object message, int presence, Object... fields) { throw new AssertionError(); }
            public byte[] bytes(Object message) { return new byte[]{1}; }
            public Object parse(String type, byte[] bytes) { return new Object(); }
            public Object field(Object message, String name) { throw new AssertionError(); }
        };
        Assert.assertThrows(GboardJapaneseQwertyGlideDecoder.ModelLoadFailure.class,
                () -> GboardJapaneseQwertyGlideDecoder.decode(transport, wire,
                        new GboardJapaneseQwertyGlideDecoder.Snapshot(new byte[]{1}, null, null,
                                Arrays.asList(new byte[]{2})), new Object(), new Object(), 1L));
        Assert.assertEquals(Arrays.asList("createCrankDispatcherNative", "createDecoderWithHandleNative",
                "loadLanguageModelWithHandleNative", "releaseCrankDispatcherNative"), calls);
    }

    @Test
    public void reflectiveParserDoesNotRequireProtoUtilsConstructor() throws Exception {
        Class<?> wireType = Class.forName(GboardJapaneseQwertyGlideDecoder.class.getName()
                + "$ReflectiveWire");
        java.lang.reflect.Constructor<?> constructor = wireType.getDeclaredConstructor(ClassLoader.class);
        constructor.setAccessible(true);
        GboardJapaneseQwertyGlideDecoder.Wire wire =
                (GboardJapaneseQwertyGlideDecoder.Wire) constructor.newInstance(getClass().getClassLoader());
        Assert.assertEquals("parsed", wire.parse("java.lang.String", new byte[]{112, 97, 114, 115, 101, 100}));
    }

    @Test
    public void snapshotOwnsItsConfigurationBytes() {
        byte[] parameters = {1};
        byte[] model = {2};
        GboardJapaneseQwertyGlideDecoder.Snapshot snapshot =
                new GboardJapaneseQwertyGlideDecoder.Snapshot(parameters, null, null,
                        Arrays.asList(model));
        parameters[0] = 9;
        model[0] = 9;
        Assert.assertEquals(1, snapshot.parameters[0]);
        Assert.assertEquals(2, snapshot.models.get(0)[0]);
    }

    @Test
    public void onlyEnglishMainModelsAreAccepted() {
        Assert.assertTrue(GboardJapaneseQwertyGlideDecoder.isEnglishMain(1, Locale.US));
        Assert.assertFalse(GboardJapaneseQwertyGlideDecoder.isEnglishMain(1, Locale.JAPAN));
        Assert.assertFalse(GboardJapaneseQwertyGlideDecoder.isEnglishMain(2, Locale.US));
        Assert.assertFalse(GboardJapaneseQwertyGlideDecoder.isEnglishMain(1, null));
    }

    @Test
    public void serializationFailureReleasesOwnedNativeHandle() throws Exception {
        List<String> calls = new ArrayList<>();
        GboardJapaneseQwertyGlideDecoder.Transport transport = (name, args) -> {
            calls.add(name);
            return name.equals("createCrankDispatcherNative") ? 42L : null;
        };
        GboardJapaneseQwertyGlideDecoder.Wire wire = new GboardJapaneseQwertyGlideDecoder.Wire() {
            public Object message(String type, int presence, Object... fields) { return null; }
            public Object copy(Object message, int presence, Object... fields) { return null; }
            public byte[] bytes(Object message) { return null; }
            public Object parse(String type, byte[] bytes) { throw new IllegalStateException("bad proto"); }
            public Object field(Object message, String name) { return null; }
        };
        try {
            GboardJapaneseQwertyGlideDecoder.decode(transport, wire,
                    new GboardJapaneseQwertyGlideDecoder.Snapshot(new byte[]{1}, null, null,
                            Arrays.asList(new byte[]{2})), new Object(), new Object(), 1L);
            Assert.fail("Expected serialization failure");
        } catch (IllegalStateException expected) {
            Assert.assertEquals("bad proto", expected.getMessage());
        }
        Assert.assertEquals(Arrays.asList("createCrankDispatcherNative", "releaseCrankDispatcherNative"), calls);
    }
}
