package app.morphe.extension.syncforreddit.translate;

import com.google.android.gms.tasks.Tasks;
import com.google.mlkit.common.model.DownloadConditions;
import com.google.mlkit.nl.languageid.LanguageIdentification;
import com.google.mlkit.nl.languageid.LanguageIdentifier;
import com.google.mlkit.nl.translate.TranslateLanguage;
import com.google.mlkit.nl.translate.Translation;
import com.google.mlkit.nl.translate.Translator;
import com.google.mlkit.nl.translate.TranslatorOptions;

import app.morphe.extension.shared.Logger;

import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 * Translating on the device, with what the app already carries.
 *
 * <p>Nothing is sent anywhere and nothing has to be set up, which is why it is what translation
 * starts as. It works from a model for the pair of languages, fetched the first time that pair
 * is asked for, so the first translation into a new language waits on a download of a few
 * megabytes and the rest are quick.
 *
 * <p>Every call here blocks, and none may be made on the main thread.
 */
final class OnDeviceTranslator {
    /** What the identifier answers where it cannot tell what it is reading. */
    static final String UNKNOWN = "und";

    /**
     * The library names its models after a pair of languages and nothing else, so a tag that
     * says which country it is spoken in is not one it can use.
     */
    private static final String A_LANGUAGE_ALONE = "[a-z]{2,3}";

    /** Where the library's name for a language is not the one the settings use. */
    private static final String NORWEGIAN = "nb";

    private static final String NORWEGIAN_TO_THE_LIBRARY = "no";

    private static final long MODEL_WAIT_SECONDS = 120;
    private static final long TRANSLATE_WAIT_SECONDS = 30;
    private static final long IDENTIFY_WAIT_SECONDS = 10;

    private OnDeviceTranslator() {}

    /**
     * @return The language the text is written in, as a tag, or {@link #UNKNOWN}.
     */
    static String languageOf(String text) throws Exception {
        LanguageIdentifier identifier = LanguageIdentification.a();
        try {
            Object said = Tasks.b(identifier.q0(text), IDENTIFY_WAIT_SECONDS, TimeUnit.SECONDS);
            return said == null ? UNKNOWN : said.toString();
        } finally {
            identifier.close();
        }
    }

    /**
     * @param from A language tag, which must be one the library knows.
     * @param into The language wanted.
     * @return The translated text.
     */
    static String translate(String text, String from, String into) throws Exception {
        return with(from, into, translator -> said(translator, text));
    }

    /**
     * The same, for text written as markdown, where every run of words on every line is asked
     * for separately. One translator answers all of them: opening one loads a model, and doing
     * that for each line of a post would cost far more than the translating does.
     *
     * @return The text translated, with everything that was not words left as it was.
     */
    static String translateMarkdown(String markdown, String from, String into) throws Exception {
        return with(from, into, translator ->
                Markdown.translated(markdown, run -> said(translator, run)));
    }

    /** What is done with a translator once there is one. */
    private interface Asks<T> {
        T of(Translator translator) throws Exception;
    }

    /** Opens a translator for the pair of languages, fetches its model, and closes it after. */
    private static <T> T with(String from, String into, Asks<T> asked) throws Exception {
        String source = named(from);
        String target = named(into);
        if (source == null || target == null) {
            throw new IllegalArgumentException("Cannot translate " + from + " into " + into
                    + " on this device");
        }

        Logger.printInfo(() -> "Translating " + source + " into " + target);

        Translator translator = Translation.a(
                new TranslatorOptions.Builder().b(source).c(target).a());
        try {
            // Nothing is asked of the connection: a model is wanted now, not when there is wifi.
            try {
                Tasks.b(translator.G(new DownloadConditions.Builder().a()),
                        MODEL_WAIT_SECONDS, TimeUnit.SECONDS);
            } catch (Exception ex) {
                // What comes back is a pair of failures wrapped twice over, and the message on
                // the outside of it says only how many of them there were.
                throw new IllegalStateException(
                        "No model for " + source + " into " + target + ": " + because(ex), ex);
            }

            return asked.of(translator);
        } finally {
            translator.close();
        }
    }

    /** @return What the translator makes of one run of words. */
    private static String said(Translator translator, String text) throws Exception {
        Object translated = Tasks.b(translator.A(text), TRANSLATE_WAIT_SECONDS, TimeUnit.SECONDS);
        if (translated == null) {
            throw new IllegalStateException("Nothing came back");
        }
        return translated.toString();
    }

    /**
     * The settings hold a language as the services abroad want it, which is a tag that may say
     * which country speaks it: en-US, pt-BR. The library on the device wants the language on
     * its own, since that is what it names its models after, and it will not say so — it takes
     * whatever it is given and fails much later, when the name it built matches nothing.
     *
     * @return The library's name for the language, or null if it can have no name for it.
     */
    private static String named(String tag) {
        if (tag == null || tag.isEmpty()) {
            return null;
        }

        String language = tag;
        for (int at = 0; at < tag.length(); at++) {
            if (tag.charAt(at) == '-' || tag.charAt(at) == '_') {
                language = tag.substring(0, at);
                break;
            }
        }

        language = language.toLowerCase(Locale.ROOT);
        if (NORWEGIAN.equals(language)) {
            language = NORWEGIAN_TO_THE_LIBRARY;
        }
        if (!language.matches(A_LANGUAGE_ALONE)) {
            return null;
        }

        // Only to have the one language the library knows by an older name, which is the whole
        // of what this does.
        return TranslateLanguage.a(language);
    }

    /**
     * @return Every reason behind a failure, outermost first. A failure from the library is
     *         wrapped in as many as three layers, and only the innermost one says anything.
     */
    static String because(Throwable ex) {
        StringBuilder said = new StringBuilder();
        Throwable at = ex;
        while (at != null && said.length() < 600) {
            if (said.length() > 0) said.append(" <- ");
            said.append(at.getClass().getSimpleName());
            if (at.getMessage() != null) said.append(": ").append(at.getMessage());
            if (at.getCause() == at) break;
            at = at.getCause();
        }
        return said.toString();
    }

    /**
     * @return Whether these are the same language, whatever else the tags say about them. A
     *         post written in en-GB is not worth translating into en-US.
     */
    static boolean isTheSameLanguage(String one, String other) {
        String first = named(one);
        String second = named(other);
        return first != null && first.equals(second);
    }

    /** @return What a language is called, for saying so, or null where it has no name here. */
    static String nameOf(String tag) {
        String language = named(tag);
        if (language == null) {
            return null;
        }
        String called = new java.util.Locale(language).getDisplayLanguage();
        return called.isEmpty() || called.equalsIgnoreCase(language) ? null : called;
    }

    /** @return Whether the library has a name for the language, and so can work with it. */
    static boolean knows(String languageTag) {
        try {
            return named(languageTag) != null;
        } catch (Exception ex) {
            return false;
        }
    }
}
