package dev.jason.gboardpatches.extension.extendeddictionary;

import android.content.Context;
import android.util.Log;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Called from Gboard's personal dictionary language label (qpu.b); never throws. */
public final class GboardExtendedDictionaryRuntime {
    private static final String TAG = "GboardExtendedDictionary";

    private GboardExtendedDictionaryRuntime() {
    }

    /**
     * Sections whose tag carries EXTENDED_TAG_SUFFIX become "Gboard's own label (Extended)";
     * every other language keeps Gboard's label untouched.
     */
    public static CharSequence sectionTitle(Context context, Object languageTag,
            CharSequence computed) {
        try {
            if (context == null || languageTag == null || computed == null
                    || !ExtendedDictionaryImporter.isExtendedTag(String.valueOf(languageTag))) {
                return computed;
            }
            return GboardSettingsText.format(context,
                    R.string.gboard_patches_extended_dictionary_language_title, computed);
        } catch (Throwable failure) {
            try {
                Log.w(TAG, "Section title fallback: " + failure.getClass().getName());
            } catch (Throwable ignored) {
                // Logging must not affect Gboard's dictionary screens.
            }
            return computed;
        }
    }
}
