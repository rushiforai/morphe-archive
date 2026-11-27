package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Dynamic reflection bridge to Gboard's {@code UserFeatureCache} {@code MUSE_STATS} biasing word
 * store and {@code pref_key_rambler_custom_instruction} preference.
 *
 * <p>All obfuscated class, method, and field names are supplied via {@link RamblerDynamicConfig}
 * (resolved dynamically at Morphe patch time). Fails closed cleanly if any symbol is unavailable
 * on an unverified future Gboard build.</p>
 */
public final class RamblerMuseStatsBridge {
    private static final String TAG = "RamblerDict";
    public static final String CUSTOM_INSTRUCTION_PREF_KEY =
            "pref_key_rambler_custom_instruction";
    public static final int MAX_WORD_LENGTH = 64;
    private static final long UPDATE_WAIT_TIMEOUT_MS = 1500L;
    private static final String MODULE_MANAGER_CLASS =
            "com.google.android.libraries.inputmethod.module.ModuleManager";

    interface Backend {
        List<String> readWords(Context context);

        boolean addWords(Context context, Collection<String> words);

        boolean removeWord(Context context, String word);

        boolean clearAllWords(Context context);

        String readCustomInstruction(Context context);

        boolean writeCustomInstruction(Context context, String value);
    }

    private static final Backend REFLECTIVE_BACKEND = new DynamicReflectiveBackend();
    private static volatile Backend activeBackend = REFLECTIVE_BACKEND;

    private RamblerMuseStatsBridge() {
    }

    static void setBackendForTesting(Backend backend) {
        activeBackend = backend == null ? REFLECTIVE_BACKEND : backend;
    }

    public static List<String> readWords(Context context) {
        if (context == null) {
            return null;
        }
        return activeBackend.readWords(context);
    }

    public static boolean addWords(Context context, Collection<String> words) {
        if (context == null || words == null) {
            return false;
        }
        LinkedHashSet<String> sanitized = sanitizeWords(words);
        if (sanitized.isEmpty()) {
            return readWords(context) != null;
        }
        return activeBackend.addWords(context, sanitized);
    }

    public static boolean removeWord(Context context, String word) {
        if (context == null || word == null) {
            return false;
        }
        String trimmed = normalizeWord(word);
        if (trimmed.isEmpty()) {
            return false;
        }
        return activeBackend.removeWord(context, trimmed);
    }

    public static boolean clearAllWords(Context context) {
        if (context == null) {
            return false;
        }
        return activeBackend.clearAllWords(context);
    }

    public static String readCustomInstruction(Context context) {
        if (context == null) {
            return "";
        }
        String value = activeBackend.readCustomInstruction(context);
        return value == null ? "" : value;
    }

    public static boolean writeCustomInstruction(Context context, String value) {
        if (context == null) {
            return false;
        }
        String normalized = value == null ? "" : value.trim();
        return activeBackend.writeCustomInstruction(context, normalized);
    }

    public static LinkedHashSet<String> parseWordList(String rawText) {
        LinkedHashSet<String> words = new LinkedHashSet<String>();
        if (rawText == null || rawText.isEmpty()) {
            return words;
        }
        Set<String> seen = new HashSet<String>();
        String[] parts = rawText.split("[\\r\\n,;]+");
        for (String part : parts) {
            String normalized = normalizeWord(part);
            if (!normalized.isEmpty() && normalized.length() <= MAX_WORD_LENGTH
                    && seen.add(normalized.toLowerCase(Locale.ROOT))) {
                words.add(normalized);
            }
        }
        return words;
    }

    public static LinkedHashSet<String> sanitizeWords(Collection<String> rawWords) {
        LinkedHashSet<String> words = new LinkedHashSet<String>();
        if (rawWords == null) {
            return words;
        }
        Set<String> seen = new HashSet<String>();
        for (String raw : rawWords) {
            String normalized = normalizeWord(raw);
            if (!normalized.isEmpty() && normalized.length() <= MAX_WORD_LENGTH
                    && seen.add(normalized.toLowerCase(Locale.ROOT))) {
                words.add(normalized);
            }
        }
        return words;
    }

    public static String formatExportText(List<String> words) {
        if (words == null || words.isEmpty()) {
            return "";
        }
        StringBuilder builder = new StringBuilder();
        for (int index = 0; index < words.size(); index++) {
            if (index > 0) {
                builder.append('\n');
            }
            builder.append(words.get(index));
        }
        builder.append('\n');
        return builder.toString();
    }

    /** Encodes a single MuseWord protobuf message containing field 1 (string spelling). */
    static byte[] encodeWordProto(String word) {
        byte[] utf8 = word.getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream out = new ByteArrayOutputStream(utf8.length + 6);
        out.write(0x0A); // field 1, wire type 2 (length-delimited)
        int length = utf8.length;
        while ((length & ~0x7F) != 0) {
            out.write((length & 0x7F) | 0x80);
            length >>>= 7;
        }
        out.write(length);
        out.write(utf8, 0, utf8.length);
        return out.toByteArray();
    }

    private static String normalizeWord(String raw) {
        if (raw == null) {
            return "";
        }
        return raw.trim().replaceAll("\\s+", " ");
    }

    private interface ProtoUpdater {
        Object update(Object currentStats) throws Exception;
    }

    private static final class Handles {
        final Class<?> ufcClass;
        final Class<?> museStatsClass;
        final Class<?> functionClass;
        final Method moduleGetInstance;
        final Method moduleLoad;
        final Method ufcRead;
        final Method ufcUpdate;
        final Object museStatsEnum;
        final Object museStatsDefault;
        final Field museStatsWordsField;
        final Object museWordDefault;
        final Field museWordTextField;
        final Method protoParseBytes;
        final Method protoToBuilder;
        final Method protoMutableCopyList;
        final Method builderCopyOnWrite;
        final Method builderBuild;
        final Field builderInstanceField;
        final Method listIsModifiable;

        private Handles(ClassLoader loader) throws Exception {
            Class<?> moduleManagerClass = Class.forName(MODULE_MANAGER_CLASS, false, loader);
            ufcClass = Class.forName(RamblerDynamicConfig.UFC_INTERFACE_CLASS, false, loader);
            Class<?> enumClass =
                    Class.forName(RamblerDynamicConfig.UFC_FEATURE_ENUM_CLASS, false, loader);
            museStatsClass = Class.forName(RamblerDynamicConfig.MUSE_STATS_CLASS, false, loader);
            Class<?> wordClass = Class.forName(RamblerDynamicConfig.MUSE_WORD_CLASS, false, loader);
            Class<?> protoBaseClass =
                    Class.forName(RamblerDynamicConfig.PROTO_BASE_CLASS, false, loader);
            Class<?> protoBuilderClass =
                    Class.forName(RamblerDynamicConfig.PROTO_BUILDER_CLASS, false, loader);
            Class<?> protoListClass =
                    Class.forName(RamblerDynamicConfig.PROTO_LIST_CLASS, false, loader);
            functionClass =
                    Class.forName(RamblerDynamicConfig.FUNCTION_INTERFACE_CLASS, false, loader);

            moduleGetInstance = moduleManagerClass.getMethod("getInstance", Context.class);
            moduleLoad = moduleManagerClass.getMethod(
                    RamblerDynamicConfig.MODULE_LOAD_METHOD, Class.class);
            ufcRead = ufcClass.getMethod(
                    RamblerDynamicConfig.UFC_READ_METHOD, enumClass, Class.class);
            ufcUpdate = ufcClass.getMethod(
                    RamblerDynamicConfig.UFC_UPDATE_METHOD, enumClass, Class.class, functionClass);

            Method enumFromId = enumClass.getMethod(
                    RamblerDynamicConfig.UFC_ENUM_FROM_ID_METHOD, int.class);
            museStatsEnum = enumFromId.invoke(null, 23);
            if (museStatsEnum == null) {
                throw new IllegalStateException("MUSE_STATS enum lookup for id 23 returned null");
            }

            museStatsDefault = museStatsClass
                    .getField(RamblerDynamicConfig.MUSE_STATS_DEFAULT_FIELD).get(null);
            museStatsWordsField = museStatsClass
                    .getField(RamblerDynamicConfig.MUSE_STATS_WORDS_FIELD);
            museWordDefault = wordClass
                    .getField(RamblerDynamicConfig.MUSE_WORD_DEFAULT_FIELD).get(null);
            museWordTextField = wordClass
                    .getField(RamblerDynamicConfig.MUSE_WORD_TEXT_FIELD);

            protoParseBytes = protoBaseClass.getMethod(
                    RamblerDynamicConfig.PROTO_PARSE_METHOD, protoBaseClass, byte[].class);
            protoToBuilder = protoBaseClass.getMethod(
                    RamblerDynamicConfig.PROTO_TO_BUILDER_METHOD);
            protoMutableCopyList = protoBaseClass.getMethod(
                    RamblerDynamicConfig.PROTO_MUTABLE_COPY_METHOD, protoListClass);
            builderCopyOnWrite = protoBuilderClass.getMethod(
                    RamblerDynamicConfig.BUILDER_COPY_ON_WRITE_METHOD);
            builderBuild = protoBuilderClass.getMethod(
                    RamblerDynamicConfig.BUILDER_BUILD_METHOD);
            builderInstanceField = protoBuilderClass.getField(
                    RamblerDynamicConfig.BUILDER_INSTANCE_FIELD);
            listIsModifiable = protoListClass.getMethod(
                    RamblerDynamicConfig.LIST_IS_MODIFIABLE_METHOD);
        }
    }

    private static final class PrefHandles {
        final Method getInstance;
        final Method readString;
        final Method writeString;

        private PrefHandles(ClassLoader loader) throws Exception {
            Class<?> prefsClass = Class.forName(RamblerDynamicConfig.PREFS_CLASS, false, loader);
            getInstance = prefsClass.getMethod(
                    RamblerDynamicConfig.PREFS_GET_INSTANCE_METHOD, Context.class);
            readString = prefsClass.getMethod(
                    RamblerDynamicConfig.PREFS_READ_STRING_METHOD, String.class, String.class);
            writeString = prefsClass.getMethod(
                    RamblerDynamicConfig.PREFS_WRITE_STRING_METHOD, String.class, String.class);
        }
    }

    private static final class DynamicReflectiveBackend implements Backend {
        private volatile Handles cachedHandles;
        private volatile PrefHandles cachedPrefHandles;

        private Handles handles(Context context) {
            Handles existing = cachedHandles;
            if (existing != null) {
                return existing;
            }
            ClassLoader loader = context.getClassLoader();
            if (loader == null) {
                loader = RamblerMuseStatsBridge.class.getClassLoader();
            }
            try {
                Handles created = new Handles(loader);
                cachedHandles = created;
                return created;
            } catch (Throwable error) {
                Log.w(TAG, "MUSE_STATS handles unavailable", error);
                return null;
            }
        }

        private PrefHandles prefHandles(Context context) {
            PrefHandles existing = cachedPrefHandles;
            if (existing != null) {
                return existing;
            }
            ClassLoader loader = context.getClassLoader();
            if (loader == null) {
                loader = RamblerMuseStatsBridge.class.getClassLoader();
            }
            try {
                PrefHandles created = new PrefHandles(loader);
                cachedPrefHandles = created;
                return created;
            } catch (Throwable error) {
                Log.w(TAG, "Gboard Preferences handles unavailable", error);
                return null;
            }
        }

        private Object resolveStore(Context context, Handles handles) throws Exception {
            Object moduleManager = handles.moduleGetInstance.invoke(null, context);
            if (moduleManager == null) {
                return null;
            }
            return handles.moduleLoad.invoke(moduleManager, handles.ufcClass);
        }

        @Override
        public List<String> readWords(Context context) {
            Handles handles = handles(context);
            if (handles == null) {
                return null;
            }
            try {
                Object store = resolveStore(context, handles);
                if (store == null) {
                    return null;
                }
                Object current = handles.ufcRead.invoke(
                        store, handles.museStatsEnum, handles.museStatsClass);
                if (current == null) {
                    return null;
                }
                List<?> rawList = (List<?>) handles.museStatsWordsField.get(current);
                if (rawList == null || rawList.isEmpty()) {
                    return Collections.emptyList();
                }
                List<String> result = new ArrayList<String>(rawList.size());
                for (Object item : rawList) {
                    if (item != null) {
                        Object text = handles.museWordTextField.get(item);
                        if (text instanceof String) {
                            String value = ((String) text).trim();
                            if (!value.isEmpty()) {
                                result.add(value);
                            }
                        }
                    }
                }
                return Collections.unmodifiableList(result);
            } catch (Throwable error) {
                Log.w(TAG, "Failed to read MUSE_STATS words", error);
                return null;
            }
        }

        @Override
        public boolean addWords(Context context, Collection<String> words) {
            final List<String> additions = new ArrayList<String>(words);
            return runUpdate(context, (handles, draft, list) -> {
                Set<String> existing = new HashSet<String>();
                for (Object item : list) {
                    if (item != null) {
                        Object text = handles.museWordTextField.get(item);
                        if (text instanceof String) {
                            existing.add(((String) text).trim().toLowerCase(Locale.ROOT));
                        }
                    }
                }
                for (String word : additions) {
                    if (existing.add(word.toLowerCase(Locale.ROOT))) {
                        Object wordProto = handles.protoParseBytes.invoke(
                                null, handles.museWordDefault, encodeWordProto(word));
                        list.add(wordProto);
                    }
                }
            });
        }

        @Override
        public boolean removeWord(Context context, String word) {
            final String targetLower = word.toLowerCase(Locale.ROOT);
            return runUpdate(context, (handles, draft, list) -> {
                for (int index = list.size() - 1; index >= 0; index--) {
                    Object item = list.get(index);
                    if (item != null) {
                        Object text = handles.museWordTextField.get(item);
                        if (text instanceof String
                                && targetLower.equals(
                                ((String) text).trim().toLowerCase(Locale.ROOT))) {
                            list.remove(index);
                        }
                    }
                }
            });
        }

        @Override
        public boolean clearAllWords(Context context) {
            return runUpdate(context, (handles, draft, list) -> list.clear());
        }

        @Override
        public String readCustomInstruction(Context context) {
            PrefHandles handles = prefHandles(context);
            if (handles == null) {
                return "";
            }
            try {
                Object prefs = handles.getInstance.invoke(null, context);
                if (prefs == null) {
                    return "";
                }
                Object value = handles.readString.invoke(prefs, CUSTOM_INSTRUCTION_PREF_KEY, "");
                return value instanceof String ? (String) value : "";
            } catch (Throwable error) {
                Log.w(TAG, "Failed to read Rambler custom instructions", error);
                return "";
            }
        }

        @Override
        public boolean writeCustomInstruction(Context context, String value) {
            PrefHandles handles = prefHandles(context);
            if (handles == null) {
                return false;
            }
            try {
                Object prefs = handles.getInstance.invoke(null, context);
                if (prefs == null) {
                    return false;
                }
                handles.writeString.invoke(prefs, CUSTOM_INSTRUCTION_PREF_KEY, value);
                return true;
            } catch (Throwable error) {
                Log.w(TAG, "Failed to write Rambler custom instructions", error);
                return false;
            }
        }

        private interface ListMutator {
            void mutate(Handles handles, Object draftStats, List<Object> mutableList)
                    throws Exception;
        }

        private boolean runUpdate(Context context, ListMutator mutator) {
            final Handles handles = handles(context);
            if (handles == null) {
                return false;
            }
            try {
                Object store = resolveStore(context, handles);
                if (store == null) {
                    return false;
                }
                Object probe = handles.ufcRead.invoke(
                        store, handles.museStatsEnum, handles.museStatsClass);
                if (probe == null) {
                    return false;
                }

                final CountDownLatch applied = new CountDownLatch(1);
                final ProtoUpdater updater = currentObj -> {
                    Object base = currentObj != null ? currentObj : handles.museStatsDefault;
                    Object builder = handles.protoToBuilder.invoke(base);
                    handles.builderCopyOnWrite.invoke(builder);
                    Object draft = handles.builderInstanceField.get(builder);
                    Object rawList = handles.museStatsWordsField.get(draft);
                    boolean modifiable = Boolean.TRUE.equals(
                            handles.listIsModifiable.invoke(rawList));
                    if (!modifiable) {
                        rawList = handles.protoMutableCopyList.invoke(null, rawList);
                        handles.museStatsWordsField.set(draft, rawList);
                    }
                    @SuppressWarnings("unchecked")
                    List<Object> mutableList = (List<Object>) rawList;
                    mutator.mutate(handles, draft, mutableList);
                    return handles.builderBuild.invoke(builder);
                };

                Object fnProxy = Proxy.newProxyInstance(
                        handles.functionClass.getClassLoader(),
                        new Class<?>[]{handles.functionClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args)
                                    throws Throwable {
                                String name = method.getName();
                                if ("apply".equals(name)) {
                                    Object current = (args != null && args.length > 0)
                                            ? args[0]
                                            : null;
                                    try {
                                        return updater.update(current);
                                    } finally {
                                        applied.countDown();
                                    }
                                }
                                if ("equals".equals(name)) {
                                    return args != null && args.length == 1 && proxy == args[0];
                                }
                                if ("hashCode".equals(name)) {
                                    return System.identityHashCode(proxy);
                                }
                                if ("toString".equals(name)) {
                                    return "RamblerMuseStatsUpdater";
                                }
                                return null;
                            }
                        });

                handles.ufcUpdate.invoke(
                        store, handles.museStatsEnum, handles.museStatsClass, fnProxy);
                applied.await(UPDATE_WAIT_TIMEOUT_MS, TimeUnit.MILLISECONDS);
                return true;
            } catch (Throwable error) {
                Log.w(TAG, "Failed to update MUSE_STATS", error);
                return false;
            }
        }
    }
}
