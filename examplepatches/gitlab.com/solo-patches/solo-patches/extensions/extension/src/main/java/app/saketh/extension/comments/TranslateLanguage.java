package app.saketh.extension.comments;

import android.app.AlertDialog;
import android.content.Context;
import app.saketh.extension.controls.PatchSettings;
import java.util.Arrays;
import java.util.Locale;

/** Target language for comment translation, saved in Patch controls. */
public final class TranslateLanguage {
    private static final String KEY = "translate_language";
    // WebNovel's own app languages, with the codes WebNovel itself sends to its translator.
    // An empty code follows the app language.
    private static final String[] CODES = {"", "en", "zh-Hans", "zh-Hant", "ja", "ko", "in", "ms", "th", "vi",
            "es", "pt", "fr", "de", "it", "da", "tr", "ru", "ar"};
    private static final String[] NAMES = {"App language", "English", "Chinese (Simplified)",
            "Chinese (Traditional)", "Japanese", "Korean", "Indonesian", "Malay", "Thai", "Vietnamese",
            "Spanish", "Portuguese", "French", "German", "Italian", "Danish", "Turkish", "Russian", "Arabic"};

    private TranslateLanguage() {}

    /** Name of the saved choice, for example "Japanese" or "App language". */
    public static String label() {
        int index = Arrays.asList(CODES).indexOf(saved());
        return NAMES[Math.max(index, 0)];
    }

    /** Language code sent to the translator. */
    static String code(Context context) {
        String saved = saved();
        return saved.isEmpty() ? appLanguage(context) : saved;
    }

    /** Shows the language list, saves the choice, then runs {@code chosen}. */
    public static void choose(Context context, Runnable chosen) {
        PatchSettings.initialize(context);
        int current = Math.max(Arrays.asList(CODES).indexOf(saved()), 0);
        new AlertDialog.Builder(context).setTitle("Translate comments to")
                .setSingleChoiceItems(NAMES, current, (dialog, which) -> {
                    PatchSettings.preferences().edit().putString(KEY, CODES[which]).apply();
                    dialog.dismiss();
                    chosen.run();
                }).setNegativeButton("Cancel", null).show();
    }

    private static String saved() {
        return PatchSettings.preferences().getString(KEY, "");
    }

    /** Same language code WebNovel sends for its own comment translations. */
    private static String appLanguage(Context context) {
        Locale locale = context.getResources().getConfiguration().getLocales().get(0);
        if (!"zh".equals(locale.getLanguage())) return locale.getLanguage();
        boolean simplified = "CN".equals(locale.getCountry()) || locale.getScript().contains("Hans");
        return simplified ? "zh-Hans" : "zh-Hant";
    }
}
