package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import android.content.Context;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Owns a private Delight5 native dispatcher for a single ABC stroke. */
public final class GboardJapaneseQwertyGlideDecoder {
    private static final String DECODER = "com.google.android.keyboard.client.delight5.Decoder";
    private static final String FACILITATOR =
            "com.google.android.apps.inputmethod.libs.delight5.Delight5Facilitator";

    private GboardJapaneseQwertyGlideDecoder() {
    }

    static Object snapshot(ClassLoader loader, Context context) throws Exception {
        try {
            return snapshot(loader);
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            return GboardJapaneseQwertyGlideBootstrap.snapshot(loader, context);
        }
    }

    static final class Snapshot {
        final byte[] parameters;
        final byte[] runtime;
        final byte[] experiments;
        final List<byte[]> models;

        Snapshot(byte[] parameters, byte[] runtime, byte[] experiments, List<byte[]> models) {
            if (parameters == null || models.isEmpty()) {
                throw new IllegalArgumentException("No English model config");
            }
            this.parameters = parameters.clone();
            this.runtime = runtime != null ? runtime.clone() : null;
            this.experiments = experiments != null ? experiments.clone() : null;
            List<byte[]> copies = new ArrayList<byte[]>();
            for (byte[] model : models) {
                copies.add(model.clone());
            }
            this.models = Collections.unmodifiableList(copies);
        }
    }

    /** Copies stock settings and successfully loaded English MAIN models; never retains a proxy/editor. */
    public static Object snapshot(ClassLoader loader) throws ReflectiveOperationException {
        Object facilitator = Class.forName(FACILITATOR, false, loader).getMethod("f").invoke(null);
        if (facilitator == null) {
            throw new IllegalStateException("No Delight5 facilitator");
        }
        Object locale = call(facilitator, "n", new Class<?>[0]);
        if (!(locale instanceof Locale) || !"en".equals(((Locale) locale).getLanguage())) {
            throw new IllegalStateException("Dedicated glide requires a loaded English primary locale");
        }
        Object wrapper = read(facilitator, "k");
        if (wrapper == null) {
            throw new IllegalStateException("No stock decoder settings");
        }
        Object decoder = read(read(wrapper, "g"), "a");
        Object config = call(decoder, "getCurrentConfiguration", new Class<?>[0]);
        ReflectiveWire wire = new ReflectiveWire(loader);
        Object parameters = call(config, "keyboardDecoderParams", new Class<?>[0]);
        if (parameters == null) {
            throw new IllegalStateException("Missing keyboard decoder parameters");
        }
        Object runtime = call(config, "keyboardRuntimeParams", new Class<?>[0]);
        Object experiments = call(config, "decoderExperimentParams", new Class<?>[0]);
        Object loaded = call(wrapper, "k", new Class<?>[0]);
        Object locales = read(facilitator, "t");
        if (!(loaded instanceof List) || !(locales instanceof Map)) {
            throw new IllegalStateException("Unrecognized loaded model inventory");
        }
        List<byte[]> models = new ArrayList<byte[]>();
        for (Object model : (List<?>) loaded) {
            Object modelLocale = ((Map<?, ?>) locales).get(model);
            // gaw associates each MAIN definition with its exact Locale in facilitator.t.
            if (isEnglishMain(((Number) read(model, "e")).intValue(), modelLocale)) {
                models.add(wire.bytes(model));
            }
        }
        if (models.isEmpty()) {
            throw new IllegalStateException("No confirmed loaded English MAIN model");
        }
        return new Snapshot(wire.bytes(parameters), runtime != null ? wire.bytes(runtime) : null,
                experiments != null ? wire.bytes(experiments) : null, models);
    }

    static boolean isEnglishMain(int kind, Object locale) {
        return kind == 1 && locale instanceof Locale && "en".equals(((Locale) locale).getLanguage());
    }

    /** Returns a yst diff without calling any stock global decoder or input-context proxy. */
    public static Object decode(ClassLoader loader, Object snapshot, Object layout, Object touch, long requestId)
            throws Exception {
        if (!(snapshot instanceof Snapshot) || layout == null || touch == null) {
            throw new IllegalArgumentException("Missing dedicated glide inputs");
        }
        if (!GboardJapaneseQwertyGlideRuntime.validAlphabetLayout(layout)) {
            throw new IllegalArgumentException("Invalid alphabet geometry");
        }
        if (!Boolean.TRUE.equals(read(touch, "d"))) {
            throw new IllegalArgumentException("Not gesture touch data");
        }
        return decode(new HandleTransport(loader), new ReflectiveWire(loader), (Snapshot) snapshot,
                layout, touch, requestId);
    }

    interface Transport {
        Object invoke(String name, Object... args) throws Exception;
    }

    static final class ModelLoadFailure extends IllegalStateException {
        ModelLoadFailure() {
            super("Dedicated English model load failed");
        }
    }

    interface DecodeAttempt {
        Object decode(Object snapshot) throws Exception;
        Object fallback() throws Exception;
    }

    static Object recoverModelLoad(Object snapshot, DecodeAttempt attempt) throws Exception {
        try {
            return attempt.decode(snapshot);
        } catch (ModelLoadFailure failure) {
            checkInterrupted();
            Object fallback = attempt.fallback();
            if (fallback == snapshot) {
                throw failure;
            }
            return attempt.decode(fallback);
        }
    }

    static Object decodeWithFallback(final ClassLoader loader, final Context context, Object snapshot,
            final Object layout, final Object touch, final long requestId) throws Exception {
        return recoverModelLoad(snapshot, new DecodeAttempt() {
            @Override
            public Object decode(Object configuration) throws Exception {
                return GboardJapaneseQwertyGlideDecoder.decode(loader, configuration, layout, touch, requestId);
            }

            @Override
            public Object fallback() throws Exception {
                return GboardJapaneseQwertyGlideBootstrap.snapshot(loader, context);
            }
        });
    }

    interface Wire {
        Object message(String type, int presence, Object... fields) throws Exception;
        Object copy(Object message, int addPresence, Object... fields) throws Exception;
        byte[] bytes(Object message) throws Exception;
        Object parse(String type, byte[] bytes) throws Exception;
        Object field(Object message, String name) throws Exception;
    }

    static Object decode(Transport transport, Wire wire, Snapshot snapshot, Object layout,
            Object touch, long requestId) throws Exception {
        long handle = ((Number) transport.invoke("createCrankDispatcherNative")).longValue();
        if (handle == 0) {
            throw new IllegalStateException("Dedicated native handle creation failed");
        }
        Throwable failure = null;
        try {
            checkInterrupted();
            Object parameters = wire.parse("yse", snapshot.parameters);
            Object reset = wire.message("yui", 7, "c", parameters, "d", 1L, "e", requestId);
            transport.invoke("createDecoderWithHandleNative", handle, wire.bytes(reset));
            if (snapshot.experiments != null) {
                Object experiments = wire.message("yqc", 3, "c",
                        wire.parse("yqb", snapshot.experiments), "d", 2L);
                transport.invoke("setDecoderExperimentParamsWithHandleNative", handle, wire.bytes(experiments));
            }
            if (snapshot.runtime != null) {
                Object runtime = wire.message("yxf", 3, "c", wire.parse("yxe", snapshot.runtime), "d", 3L);
                transport.invoke("setRuntimeParamsWithHandleNative", handle, wire.bytes(runtime));
            }
            long metricId = 4;
            for (byte[] model : snapshot.models) {
                checkInterrupted();
                Object load = wire.message("yxk", 3, "c", wire.parse("yxj", model), "d", metricId++);
                if (!Boolean.TRUE.equals(transport.invoke("loadLanguageModelWithHandleNative", handle,
                        wire.bytes(load)))) {
                    throw new ModelLoadFailure();
                }
            }
            // Stock create/reset does not invoke beginSession; mirror that verified initialization path.
            Object alphabetLayout = wire.copy(layout, 4096, "q", 1);
            Object geometry = wire.message("ysd", 3, "c", alphabetLayout, "d", metricId++);
            transport.invoke("setKeyboardLayoutWithHandleNative", handle, wire.bytes(geometry));
            checkInterrupted();
            Object initial = inputState(wire, -1, 0, requestId);
            // Stock input-context parsing uses reason 0, initial state -1 and empty cursor strings.
            Object parseRequest = wire.message("yut", 1 | 2 | 4 | 8 | 16 | 32 | 64 | 256 | 512,
                    "c", "", "d", "", "e", "", "f", false, "g", false, "h", false,
                    "i", initial, "j", metricId++, "k", 0);
            Object parsed = wire.parse("yuu", (byte[]) transport.invoke("parseInputContextWithHandleNative",
                    handle, wire.bytes(parseRequest)));
            int parsedPresence = ((Number) wire.field(parsed, "b")).intValue();
            int parseCode = ((Number) wire.field(parsed, "f")).intValue();
            int stateId = ((Number) wire.field(parsed, "g")).intValue();
            int mode = ((Number) wire.field(parsed, "e")).intValue();
            // Code 0 is success; the stock gao proxy copies yuu.g into its state id and yuu.e into input mode.
            if (parseCode != 0 || (parsedPresence & (8 | 16)) != (8 | 16) || stateId < 0
                    || mode < 0 || mode > 2) throw new IllegalStateException("Dedicated empty context rejected");
            checkInterrupted();
            Object input = inputState(wire, stateId, mode, requestId + 1);
            Object decode = wire.message("yuj", 1 | 2 | 16 | 32,
                    "c", 10, "d", touch, "f", input, "g", metricId);
            Object result = wire.parse("yuk", (byte[]) transport.invoke("decodeWithHandleNative", handle,
                    wire.bytes(decode)));
            if (((Number) wire.field(result, "e")).intValue() != 0
                    || (((Number) wire.field(result, "b")).intValue() & 2) == 0) {
                throw new IllegalStateException("Dedicated gesture decode returned no successful diff");
            }
            Object diff = wire.field(result, "d");
            if (diff == null) {
                throw new IllegalStateException("Dedicated gesture diff is null");
            }
            return diff;
        } catch (Exception | Error error) {
            failure = error;
            throw error;
        } finally {
            try {
                transport.invoke("releaseCrankDispatcherNative", handle);
            } catch (Exception | Error releaseFailure) {
                if (failure != null) failure.addSuppressed(releaseFailure);
                else throw releaseFailure;
            }
        }
    }

    private static Object inputState(Wire wire, int stateId, int mode, long requestId) throws Exception {
        return wire.message("ytd", 1 | 2 | 4 | 256 | 512,
                "c", mode, "d", stateId, "e", requestId, "k", false, "l", 0L);
    }

    private static void checkInterrupted() throws InterruptedException {
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedException("Dedicated glide canceled");
        }
    }

    private static final class HandleTransport implements Transport {
        private final Map<String, Method> methods = new HashMap<String, Method>();

        HandleTransport(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> type = Class.forName(DECODER, false, loader);
            bind(type, "createCrankDispatcherNative", long.class);
            bind(type, "releaseCrankDispatcherNative", void.class, long.class);
            bind(type, "createDecoderWithHandleNative", void.class, long.class, byte[].class);
            bind(type, "loadLanguageModelWithHandleNative", boolean.class, long.class, byte[].class);
            bind(type, "setKeyboardLayoutWithHandleNative", void.class, long.class, byte[].class);
            bind(type, "setRuntimeParamsWithHandleNative", void.class, long.class, byte[].class);
            bind(type, "setDecoderExperimentParamsWithHandleNative", void.class, long.class, byte[].class);
            bind(type, "parseInputContextWithHandleNative", byte[].class, long.class, byte[].class);
            bind(type, "decodeWithHandleNative", byte[].class, long.class, byte[].class);
        }

        private void bind(Class<?> type, String name, Class<?> result, Class<?>... parameters)
                throws ReflectiveOperationException {
            Method method = type.getDeclaredMethod(name, parameters);
            if (method.getReturnType() != result || !Modifier.isStatic(method.getModifiers())
                    || !Modifier.isNative(method.getModifiers())) throw new NoSuchMethodException(name);
            method.setAccessible(true);
            methods.put(name, method);
        }

        @Override
        public Object invoke(String name, Object... args) throws ReflectiveOperationException {
            Method method = methods.get(name);
            if (method == null) {
                throw new NoSuchMethodException("Not an allowed private handle native: " + name);
            }
            return method.invoke(null, args);
        }
    }

    static final class ReflectiveWire implements Wire {
        private final ClassLoader loader;
        private final Object registry;
        private final Method parser;
        private final Method fromBytes;

        ReflectiveWire(ClassLoader loader) throws ReflectiveOperationException {
            this.loader = loader;
            parser = Class.forName("aaln", false, loader).getMethod("H", Class.class);
            Class<?> registryType = Class.forName("aalc", false, loader);
            registry = registryType.getMethod("a").invoke(null);
            fromBytes = Class.forName("aamx", false, loader).getMethod("j", byte[].class, registryType);
        }

        @Override
        public Object message(String type, int presence, Object... fields)
                throws ReflectiveOperationException {
            Object defaultInstance = readStatic(Class.forName(type, false, loader), "a");
            return build(call(defaultInstance, "l", new Class<?>[0]), presence, fields);
        }

        @Override
        public Object copy(Object message, int addPresence, Object... fields)
                throws ReflectiveOperationException {
            return build(call(message, "G", new Class<?>[0]),
                    ((Number) read(message, "b")).intValue() | addPresence, fields);
        }

        private Object build(Object builder, int presence, Object... fields) throws ReflectiveOperationException {
            call(builder, "t", new Class<?>[0]);
            Object mutable = read(builder, "b");
            findField(mutable.getClass(), "b").setInt(mutable, presence);
            for (int index = 0; index < fields.length; index += 2) {
                findField(mutable.getClass(), (String) fields[index]).set(mutable, fields[index + 1]);
            }
            return call(builder, "q", new Class<?>[0]);
        }

        @Override
        public byte[] bytes(Object message) throws ReflectiveOperationException {
            if (message == null) {
                throw new IllegalStateException("Missing required proto");
            }
            byte[] bytes = (byte[]) call(message, "g", new Class<?>[0]);
            if (bytes == null) {
                throw new IllegalStateException("Proto serialization failed");
            }
            return bytes;
        }

        @Override
        public Object parse(String type, byte[] bytes) throws ReflectiveOperationException {
            if (bytes == null) {
                throw new IllegalStateException("Null native response");
            }
            Object message = fromBytes.invoke(parser.invoke(null, Class.forName(type, false, loader)), bytes, registry);
            if (message == null) {
                throw new IllegalStateException("Native proto parse failed: " + type);
            }
            return message;
        }

        @Override
        public Object field(Object message, String name) throws ReflectiveOperationException {
            return read(message, name);
        }
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args)
            throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }

    private static Object read(Object target, String name) throws ReflectiveOperationException {
        return findField(target.getClass(), name).get(target);
    }

    private static Object readStatic(Class<?> type, String name) throws ReflectiveOperationException {
        return findField(type, name).get(null);
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // Generated proto and builder fields may be inherited.
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
