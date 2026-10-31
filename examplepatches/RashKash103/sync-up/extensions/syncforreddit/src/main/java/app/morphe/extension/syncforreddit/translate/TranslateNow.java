package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Translating a post or a comment, in place of the app doing it.
 *
 * <p>Sync already works out what to translate, shows something while it happens, writes what
 * comes back where the app reads its text from, and closes itself. Only the translating is
 * taken over, so that it goes to the service that was chosen, into the language that was
 * chosen, and is not asked for twice.
 *
 * @noinspection unused
 */
public final class TranslateNow {
    /** What the app calls a comment, where it says which kind of thing it has. */
    private static final int A_COMMENT = 11;

    private static final Handler onTheMainThread = new Handler(Looper.getMainLooper());

    private TranslateNow() {}

    /**
     * Called where Sync would have asked the on-device library for a translation.
     *
     * @param sheet    What is waiting for the answer.
     * @param text     What to translate.
     * @param language What it is written in, as far as Sync could tell.
     */
    public static void instead(da.d sheet, String text, String language) {
        new Thread(() -> {
            try {
                Context context = Utils.getContext();

                // Asking a second time is asking for it back, since the translation stands
                // where what was written used to.
                Originals.Written wasWritten = Originals.written(idOf(sheet));
                if (wasWritten != null && wasWritten.body != null) {
                    Logger.printInfo(() -> "Putting back what was written");
                    answer(sheet, language, wasWritten.body);
                    return;
                }
                String into = TranslationSettings.language(context);
                String service = TranslationSettings.service(context);

                // The app asks about the text as it is drawn — the rendering, tags and all,
                // which has lost the lines it was written on. The text as it was written is
                // still there to be had, and is what the app composes back into afterwards, so
                // it is what is worth translating.
                String written = asWritten(sheet);
                boolean haveWritten = Markdown.worthTranslating(written);
                String toTranslate = haveWritten ? written : text;

                TranslationCache.Translated already =
                        TranslationCache.remembered(context, toTranslate, service, into);
                if (already != null) {
                    Logger.printInfo(() -> "Translated this before, from " + already.from);
                    answer(sheet, already.from, already.text);
                    return;
                }

                String from = language == null || language.isEmpty()
                        || OnDeviceTranslator.UNKNOWN.equals(language)
                        ? OnDeviceTranslator.languageOf(text)
                        : language;

                String at = from;
                String translated = haveWritten
                        ? by(service, written, at, into, true, null)
                        : by(service, text, at, into, false, null);

                TranslationCache.remember(context, toTranslate, service, into,
                        new TranslationCache.Translated(translated, from));

                answer(sheet, from, translated);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not translate: " + OnDeviceTranslator.because(ex));
                String said = ex.getMessage() == null
                        ? ex.getClass().getSimpleName() : ex.getMessage();
                onTheMainThread.post(() -> da.d.v4(sheet, "Could not translate: " + said));
            }
        }, "sync-up-translate").start();
    }

    /** @return What the sheet is about, by id, or null where it cannot say. */
    private static String idOf(da.d sheet) {
        try {
            xa.d about = sheet.U3();
            return about == null ? null : about.U();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not tell what the sheet is about: " + ex);
            return null;
        }
    }

    /**
     * @return The text of what the sheet is about as it was written, or null where the sheet
     *         cannot say what it is about. This is the markdown: the other pair of readers on
     *         the model hand back the rendering of it, which is what the app translates and is
     *         why its own translations come back as one flat paragraph.
     */
    private static String asWritten(da.d sheet) {
        try {
            xa.d about = sheet.U3();
            if (about == null) {
                return null;
            }
            return about.Y0() == A_COMMENT ? about.o() : about.P0();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the text as it was written: " + ex);
            return null;
        }
    }

    /**
     * @param asWritten Whether the text is markdown, and so has to be translated around what
     *                  in it is not language.
     * @return The text translated by whichever service was chosen.
     */
    static String by(String service, String text, String from, String into, boolean asWritten,
                     String about) throws Exception {
        if (TranslationSettings.DEEPL.equals(service)) {
            Context context = Utils.getContext();
            return asWritten
                    ? DeepLTranslator.translateMarkdown(context, text, from, into, about)
                    : DeepLTranslator.translate(context, text, from, into, about);
        }

        if (TranslationSettings.GOOGLE.equals(service)) {
            Context context = Utils.getContext();
            return asWritten
                    ? GoogleTranslator.translateMarkdown(context, text, from, into)
                    : GoogleTranslator.translate(context, text, from, into);
        }
        return asWritten
                ? OnDeviceTranslator.translateMarkdown(text, from, into)
                : OnDeviceTranslator.translate(text, from, into);
    }

    private static void answer(da.d sheet, String from, String translated) {
        onTheMainThread.post(() -> da.d.x4(sheet, from, translated));
    }
}
