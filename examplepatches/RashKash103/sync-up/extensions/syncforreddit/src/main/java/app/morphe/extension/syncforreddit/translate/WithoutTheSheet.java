package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.content.CursorLoader;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import androidx.fragment.app.FragmentManager;

import java.util.List;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Translating where the app would have opened a sheet to do it in.
 *
 * <p>Sync opens a sheet, works the text out in it, waits there for the translation and closes
 * itself. Where the translation is one already made it is gone again within the same moment,
 * which reads as the screen flinching. Nothing about it is needed: everything the sheet is
 * given is in the arguments it would have been opened with.
 *
 * <p>So the opening is taken over instead. Every way into that sheet goes through the one call
 * that shows it, which is where this is asked first. Answering false lets the sheet open as it
 * would have, and is what happens if anything here cannot be done — the sheet still works.
 *
 * @noinspection unused
 */
public final class WithoutTheSheet {
    /** What Sync puts in the arguments of that sheet. */
    private static final String THE_CONTENT = "translate_post";
    private static final String THE_LANGUAGE = "override_language";


    /** Enough of the text to tell what language it is in, and no more than is needed. */
    private static final int ENOUGH_TO_TELL = 700;

    /** What is not language, and would only mislead something working out what language is. */
    private static final Pattern NOT_WORDS = Pattern.compile(
            "(?:https?://|www\\.)\\S+|`[^`]*`|\\[[^\\]]*\\]\\([^)]*\\)|[*_~>#|^\\\\-]+");

    private static final Handler onTheMainThread = new Handler(Looper.getMainLooper());

    private WithoutTheSheet() {}

    /**
     * Called where Sync would have opened one of its sheets.
     *
     * @param what      Which sheet it is about to open.
     * @param arguments What it would have been opened with.
     * @return Whether this has been dealt with, and the sheet should not open.
     */
    public static boolean instead(Class<?> what, Object manager, Bundle arguments) {
        try {
            if (what != da.d.class || arguments == null) {
                return false;
            }

            Object about = arguments.getSerializable(THE_CONTENT);
            if (!(about instanceof xa.d)) {
                return false;
            }

            // Made here, on the thread that draws, so what a comment answers can be read.
            translate((xa.d) about, arguments.getString(THE_LANGUAGE), manager,
                    readerFor((xa.d) about));
            return true;
        } catch (Throwable ex) {
            // Let Sync open its sheet and do it the long way.
            Logger.printInfo(() -> "Leaving the translation to the sheet: " + ex);
            return false;
        }
    }

    /**
     * Translates one thing, or puts back what was written where it is already translated. For
     * anywhere that offers translating without a sheet ever having been opened.
     *
     * @param manager What a sheet would be opened with, where the language has to be asked
     *                about, or null where there is nothing to open one with.
     */
    public static void forThis(xa.d content, Object manager) {
        translate(content, null, manager, readerFor(content));
    }

    /**
     * @return A reader for the thread the content belongs to, made here because it must be made
     *         on the thread that draws, or null for a post, which answers nothing.
     */
    private static CursorLoader readerFor(xa.d content) {
        try {
            if (content.Y0() != Stored.A_COMMENT) {
                return null;
            }
            String post = content.j0();
            if (post == null) {
                return null;
            }
            int names = post.indexOf('_');
            return EveryComment.readerFor(Utils.getContext(),
                    names < 0 ? post : post.substring(names + 1));
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not make a reader for what it answers: " + ex);
            return null;
        }
    }

    /** What came of asking for one thing to be translated. */
    enum Came {
        TRANSLATED,
        PUT_BACK,
        ALREADY_IN_IT,
        NO_LANGUAGE,
        NOTHING_TO_DO,
    }

    /**
     * Called where Sync would have opened the sheet that translates a whole thread.
     *
     * <p>That sheet translates into English whatever was asked for, waits for wifi before it
     * will fetch a model, and translates the text as it is drawn rather than as it was written
     * — the same three things that were replaced for one comment. So it is replaced here too.
     *
     * @return Whether this has been dealt with, and the sheet should not open.
     */
    public static boolean insteadOfAll(Class<?> what, Object unusedManager, String about) {
        try {
            if (what != da.b.class) {
                return false;
            }

            // Made here, where there is a thread that can be told of a change, and read on one
            // of our own, since waiting on the store is not for the thread that draws.
            CursorLoader reader = EveryComment.readerFor(Utils.getContext(), about);

            new Thread(() -> {
                List<xa.d> comments = EveryComment.of(reader);
                if (comments.isEmpty()) {
                    say("No comments to translate");
                    return;
                }
                boolean back = EveryComment.translatedAmong(comments) > 0;
                if (back) {
                    Wholesale.enough(about);
                } else {
                    // Whatever else arrives in this thread is wanted translated as well.
                    Wholesale.asked(about);
                }

                EveryComment.translate(comments, back, reader, WithoutTheSheet::say);
            }, "sync-up-read-thread").start();
            return true;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Leaving translating them all to the sheet: " + ex);
            return false;
        }
    }

    /**
     * Translates the comment given and everything under it, or puts that much back.
     *
     * @param about The post the thread belongs to, which is how its comments are asked for.
     */
    public static void forThisAndUnder(xa.d one, String about) {
        CursorLoader reader = EveryComment.readerFor(Utils.getContext(), about);

        new Thread(() -> {
            List<xa.d> thread = EveryComment.under(EveryComment.of(reader), one);
            if (thread.isEmpty()) {
                say("Nothing under that comment");
                return;
            }
            boolean back = EveryComment.translatedAmong(thread) > 0;
            EveryComment.translate(thread, back, reader, WithoutTheSheet::say);
        }, "sync-up-read-thread").start();
    }

    /** Does what the sheet would have done, off the thread that draws. */
    private static void translate(xa.d content, String language, Object manager,
                                  CursorLoader reader) {
        new Thread(() -> {
            try {
                Came came = of(content, language, true, reader);
                if (came == Came.NO_LANGUAGE) {
                    // Nothing can be translated out of a language nobody can name. Sync has a
                    // sheet for choosing one, and choosing one comes back through here.
                    askWhichLanguage(content, manager);
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not translate: " + OnDeviceTranslator.because(ex));
                // A service says what was wrong with a key or an allowance, and that is worth
                // reading; anything with no message of its own is not.
                String said = ex.getMessage();
                say(said == null || said.isEmpty()
                        ? "Could not translate" : "Could not translate: " + said);
            }
        }, "sync-up-translate").start();
    }

    /**
     * Translates one thing, or puts back what was written where it is already translated.
     *
     * @param announce Whether to say what is happening. Translating many things says one thing
     *                 about all of them rather than one about each.
     * @return What came of it.
     */
    static Came of(xa.d content, String language, boolean announce, CursorLoader reader)
            throws Exception {
        Context context = Utils.getContext();
        String id = content.U();
        boolean isAComment = content.Y0() == Stored.A_COMMENT;

        // Asking a second time is asking for what was written back.
        Originals.Written wasWritten = Originals.written(id);
        if (wasWritten != null) {
            Logger.printInfo(() -> "Putting back what was written");
            Originals.forget(id);
            Stored.write(context, id, isAComment, wasWritten.title, wasWritten.body);
            return Came.PUT_BACK;
        }

        // A post has a title as well as a body, and a great many have only a title.
        String body = isAComment ? content.o() : content.P0();
        String title = isAComment ? null : content.b1();
        boolean hasBody = Markdown.worthTranslating(body);
        boolean hasTitle = Markdown.worthTranslating(title);

        if (!hasBody && !hasTitle) {
            if (announce) {
                say("Nothing to translate");
            }
            return Came.NOTHING_TO_DO;
        }

        String into = TranslationSettings.language(context);
        String service = TranslationSettings.service(context);

        String from = language == null || language.isEmpty()
                || OnDeviceTranslator.UNKNOWN.equals(language)
                ? OnDeviceTranslator.languageOf(justWords(hasBody ? body : title))
                : language;

        if (from == null || from.isEmpty()
                || OnDeviceTranslator.UNKNOWN.equals(from)) {
            return Came.NO_LANGUAGE;
        }

        if (OnDeviceTranslator.isTheSameLanguage(from, into)) {
            // Asking for English to be put into English wastes a download and ends with
            // the same text and a note saying it was translated.
            if (announce) {
                say(already(into));
            }
            return Came.ALREADY_IN_IT;
        }

        if (announce && !heldAlready(context, service, into, body, title)) {
            // Said once for the post rather than once for each part of it.
            say("Translating…");
        }

        // What the comment is answering, where the service takes such a thing and the settings
        // say to send it.
        String about = WhatItIsAbout.forThis(context, content, reader);

        String saidBody = hasBody
                ? translated(context, service, body, from, into, true, about) : null;
        String saidTitle = hasTitle
                ? translated(context, service, title, from, into, false, about) : null;

        boolean bodyChanged = saidBody != null && !saidBody.equals(body);
        boolean titleChanged = saidTitle != null && !saidTitle.equals(title);
        if (!bodyChanged && !titleChanged) {
            // Nothing came of it: either it was already in the language wanted, or the
            // service gave back what it was given. Either way there is nothing to say
            // under the author and nothing to put back later.
            Logger.printInfo(() -> "The translation says what was written");
            if (announce) {
                say(already(into));
            }
            return Came.ALREADY_IN_IT;
        }

        // Stored first, and only then remembered. What the line under an author says
        // has to follow what the post says, and it cannot lead it.
        Stored.write(context, id, isAComment, titleChanged ? saidTitle : null,
                bodyChanged ? saidBody : null);
        // Both parts are kept as they were and as they became, so that what a post
        // says can be recognised as one or the other whichever part was translated.
        Originals.remember(id, title, body, titleChanged ? saidTitle : title,
                bodyChanged ? saidBody : body, from);
        return Came.TRANSLATED;
    }

    /** @return Whether every part of this was translated before, and none of it has to wait. */
    private static boolean heldAlready(Context context, String service, String into, String body,
                                       String title) {
        return (body == null || TranslationCache.remembered(context, body, service, into) != null)
                && (title == null
                || TranslationCache.remembered(context, title, service, into) != null);
    }

    /**
     * @param asWritten Whether this part is markdown, which a title is not.
     * @return One part translated, remembered so that reading it again does not pay for it
     *         again.
     */
    private static String translated(Context context, String service, String text, String from,
                                     String into, boolean asWritten, String about)
            throws Exception {
        TranslationCache.Translated already =
                TranslationCache.remembered(context, text, service, into);
        if (already != null) {
            Logger.printInfo(() -> "Translated this before, from " + already.from);
            return already.text;
        }

        String said = TranslateNow.by(service, text, from, into, asWritten, about);
        TranslationCache.remember(context, text, service, into,
                new TranslationCache.Translated(said, from));
        return said;
    }

    /**
     * @return As much of the text as is needed to tell what language it is in, with what is not
     *         language taken out of it. An address is written the same way in every language and
     *         only makes the answer worse.
     */
    private static String justWords(String written) {
        String words = NOT_WORDS.matcher(written).replaceAll(" ").trim();
        return words.length() <= ENOUGH_TO_TELL ? words : words.substring(0, ENOUGH_TO_TELL);
    }

    /** @return What to say where there was nothing to do. */
    private static String already(String into) {
        String language = OnDeviceTranslator.nameOf(into);
        return language == null ? "Already in that language" : "Already in " + language;
    }

    /**
     * Shows Sync's own sheet for choosing what language something is written in. Choosing one
     * opens the translating sheet again with that language, which arrives back here.
     */
    private static void askWhichLanguage(xa.d content, Object manager) {
        say("Could not detect language");
        if (!(manager instanceof FragmentManager)) {
            return;
        }
        onTheMainThread.post(() -> {
            try {
                s9.g.h(da.e.class, (FragmentManager) manager, content);
            } catch (Throwable ex) {
                Logger.printInfo(() -> "Could not ask which language: " + ex);
            }
        });
    }

    private static void say(String what) {
        onTheMainThread.post(() -> {
            try {
                Toast.makeText(Utils.getContext(), what, Toast.LENGTH_SHORT).show();
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not say so: " + ex);
            }
        });
    }
}
