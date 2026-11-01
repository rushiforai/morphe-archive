package dev.jason.gboardpatches.extension.extendeddictionary;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Gboard's enabled input languages (peu.a() -> pev.i()), compared the way Gboard routes personal
 * dictionary rows to engines: language (sfc.g) and region (sfc.j) must both match. Fail-soft:
 * any missing member or failure means "unknown" and is logged once.
 */
final class GboardEnabledLanguages {
    private static final String TAG = "GboardExtendedDictionary";
    private static final AtomicBoolean FAILURE_LOGGED = new AtomicBoolean();

    private final Method enabledList;
    private final Method languageTagOf;
    private final Method fromTag;
    private final Field language;
    private final Field region;

    private GboardEnabledLanguages(Method enabledList, Method languageTagOf, Method fromTag,
            Field language, Field region) {
        this.enabledList = enabledList;
        this.languageTagOf = languageTagOf;
        this.fromTag = fromTag;
        this.language = language;
        this.region = region;
    }

    /** Returns null when this Gboard build does not expose the expected members. */
    static GboardEnabledLanguages resolve(ClassLoader loader, String languagesClass,
            String inputLanguageClass, String languageTagClass) {
        try {
            Class<?> languages = Class.forName(languagesClass, false, loader);
            Class<?> inputLanguage = Class.forName(inputLanguageClass, false, loader);
            Class<?> languageTag = Class.forName(languageTagClass, false, loader);
            Method enabledList = languages.getMethod("a");
            Method languageTagOf = inputLanguage.getMethod("i");
            Method fromTag = languageTag.getMethod("g", String.class);
            Field language = languageTag.getField("g");
            Field region = languageTag.getField("j");
            if (!Modifier.isStatic(enabledList.getModifiers())
                    || !List.class.isAssignableFrom(enabledList.getReturnType())
                    || languageTagOf.getReturnType() != languageTag
                    || fromTag.getReturnType() != languageTag
                    || language.getType() != String.class || region.getType() != String.class) {
                logOnce("unexpected member shapes");
                return null;
            }
            return new GboardEnabledLanguages(enabledList, languageTagOf, fromTag, language,
                    region);
        } catch (Throwable failure) {
            logOnce(failure.getClass().getName());
            return null;
        }
    }

    /** Language+region keys of the enabled input languages; null when unknown or empty. */
    Set<String> enabledKeys() {
        try {
            List<?> enabled = (List<?>) enabledList.invoke(null);
            if (enabled == null || enabled.isEmpty()) {
                return null;
            }
            Set<String> keys = new HashSet<>();
            for (Object inputLanguage : enabled) {
                keys.add(keyOf(languageTagOf.invoke(inputLanguage)));
            }
            return keys;
        } catch (Throwable failure) {
            logOnce(failure.getClass().getName());
            return null;
        }
    }

    /** Language+region key of a stored tag (private-use subtags do not take part). */
    String keyOfTag(String localeTag) throws ReflectiveOperationException {
        return keyOf(fromTag.invoke(null, localeTag));
    }

    private String keyOf(Object languageTag) throws IllegalAccessException {
        return Objects.toString(language.get(languageTag), "") + '|'
                + Objects.toString(region.get(languageTag), "");
    }

    private static void logOnce(String reason) {
        if (FAILURE_LOGGED.compareAndSet(false, true)) {
            Log.w(TAG, "Enabled input languages unavailable: " + reason);
        }
    }
}
