package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * What a post or a comment said before it was translated.
 *
 * <p>A translation is put in place of what was written rather than under it, so what was written
 * has to be kept somewhere or it is gone. It is kept here, against the id of the post or the
 * comment, and put back when a translation is asked for a second time.
 *
 * <p>Not in the cache beside the translations: that is a cache, emptied when the system wants
 * room and when the setting says it is old enough. Losing a translation there costs another
 * translation. Losing what was written would leave a post stuck in a language its author did not
 * write it in, with nothing to say so and no way back.
 *
 * <p>What is known about each is kept apart from the text of it: the text in a file, and beside
 * it only enough to recognise it. The line under an author asks about this as it draws, and must
 * not have to hold every translated post in memory to answer.
 *
 * @noinspection unused
 */
public final class Originals {
    private static final String STORE = "sync-up-translated";

    /** What is written in the file: a post has a title as well as a body. */
    private static final String TITLE = "title";
    private static final String BODY = "body";
    private static final String TRANSLATED_TITLE = "translated_title";
    private static final String TRANSLATED_BODY = "translated_body";

    /** Between the two, where they are counted as one for telling the text again. */
    private static final char BETWEEN = '\u0000';

    /**
     * Which shape the entry was written in. An earlier build kept one text rather than a title
     * and a body, and counted the text alone rather than the two as one; an entry left by it
     * says nothing here, and is read the way it was written.
     */
    private static final String VERSION = "version";

    private static final int WITH_PARTS = 2;

    /** And this one keeps the translation beside what was written, so the two are told apart. */
    private static final int WITH_BOTH = 3;

    /** What is known about one, beside the text of it. */
    private static final String FROM = "from";
    private static final String HASH = "hash";
    private static final String LENGTH = "length";
    private static final String TRANSLATED_HASH = "translated_hash";
    private static final String TRANSLATED_LENGTH = "translated_length";
    private static final String AT = "at";

    /** Enough for far more threads than are read at a sitting. */
    private static final int KEPT = 300;

    private static final int DROPPED_AT_ONCE = 50;

    /** What the app calls a comment, where it says which kind of thing it has. */
    private static final int A_COMMENT = 11;

    /** What each translated thing was written in, and how to tell that text again. */
    private static Map<String, Held> held;

    /** What is known about one thing that was translated. */
    private static final class Held {
        final String from;
        final int hash;
        final int length;
        final int translatedHash;
        final int translatedLength;
        final int version;

        Held(String from, int hash, int length, int translatedHash, int translatedLength,
             int version) {
            this.from = from;
            this.hash = hash;
            this.length = length;
            this.translatedHash = translatedHash;
            this.translatedLength = translatedLength;
            this.version = version;
        }

        boolean isWhatWasWritten(String text) {
            return text != null && text.length() == length && text.hashCode() == hash;
        }

        /** @return Whether this is the translation. Only an entry that kept one can tell. */
        boolean isTheTranslation(String text) {
            return version >= WITH_BOTH && text != null && translatedLength > 0
                    && text.length() == translatedLength && text.hashCode() == translatedHash;
        }

        /** @return The parts counted the way this entry counted them when it was written. */
        String asItWasCounted(String title, String body) {
            return version >= WITH_PARTS ? asOne(title, body) : body;
        }
    }

    private Originals() {}

    /** What a post said before it was translated, and what it was translated to. */
    static final class Written {
        final String title;
        final String body;
        final String translatedTitle;
        final String translatedBody;

        Written(String title, String body, String translatedTitle, String translatedBody) {
            this.title = title;
            this.body = body;
            this.translatedTitle = translatedTitle;
            this.translatedBody = translatedBody;
        }
    }

    /** Which posts are having their translation written back, so it is done once at a time. */
    private static final java.util.Set<String> beingPutBack = new java.util.HashSet<>();

    /** @return Whether anything at all has been translated, asked before every row is read. */
    static boolean anyKept() {
        return !held().isEmpty();
    }

    /**
     * Puts the translation into a row the app is about to store, where that row is carrying
     * what its author wrote over a translation that is standing.
     */
    static void putTheTranslationBackInto(android.content.ContentValues row) {
        if (row == null) {
            return;
        }
        String id = row.getAsString(Stored.THE_ID);
        Held about = id == null ? null : held().get(id);
        if (about == null) {
            return;
        }

        Integer kind = row.getAsInteger(Stored.THE_KIND);
        boolean isAComment = kind != null && kind == Stored.A_COMMENT;
        String body = Stored.writtenIn(row, isAComment);
        String title = isAComment ? null : Stored.titleIn(row);
        if (body == null && title == null) {
            return;
        }

        if (!about.isWhatWasWritten(about.asItWasCounted(title, body))) {
            // Either it is already the translation, or the text has moved on since.
            return;
        }

        Written was = written(id);
        if (was == null || (was.translatedTitle == null && was.translatedBody == null)) {
            return;
        }

        Logger.printInfo(() -> "Keeping " + id + " translated through a read");
        Stored.into(row, isAComment, isAComment ? null : was.translatedTitle,
                was.translatedBody);
    }

    /** @return What was written, or null where this was never translated. */
    @Nullable
    static Written written(String id) {
        if (id == null || id.isEmpty() || !held().containsKey(id)) {
            return null;
        }
        try {
            File kept = fileFor(id);
            if (!kept.exists()) {
                return null;
            }
            String kept_ = read(kept);
            try {
                JSONObject says = new JSONObject(kept_);
                if (says.has(TITLE) || says.has(BODY)) {
                    return new Written(
                            says.has(TITLE) ? says.getString(TITLE) : null,
                            says.has(BODY) ? says.getString(BODY) : null,
                            says.has(TRANSLATED_TITLE) ? says.getString(TRANSLATED_TITLE) : null,
                            says.has(TRANSLATED_BODY) ? says.getString(TRANSLATED_BODY) : null);
                }
            } catch (Exception ex) {
                // Left by a build that kept the text on its own rather than its parts.
            }
            return new Written(null, kept_, null, null);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read what was written: " + ex);
            return null;
        }
    }

    /** @return The parts counted as one, which is how the text is told again. */
    static String asOne(String title, String body) {
        return (title == null ? "" : title) + BETWEEN + (body == null ? "" : body);
    }

    /**
     * Keeps what was written, so that it can be put back.
     *
     * <p>Called only once the translation is where it can be seen. Keeping it before that would
     * leave the line under the author saying a post is translated when it is not.
     */
    static void remember(String id, String title, String body, String translatedTitle,
                         String translatedBody, String from) {
        if (id == null || id.isEmpty() || (title == null && body == null)) {
            return;
        }
        try {
            File kept = fileFor(id);
            File folder = kept.getParentFile();
            if (folder != null && !folder.exists() && !folder.mkdirs()) {
                return;
            }

            JSONObject parts = new JSONObject();
            if (title != null) {
                parts.put(TITLE, title);
            }
            if (body != null) {
                parts.put(BODY, body);
            }
            if (translatedTitle != null) {
                parts.put(TRANSLATED_TITLE, translatedTitle);
            }
            if (translatedBody != null) {
                parts.put(TRANSLATED_BODY, translatedBody);
            }
            write(kept, parts.toString());

            String asOne = asOne(title, body);
            String translated = asOne(translatedTitle, translatedBody);
            JSONObject says = new JSONObject();
            says.put(FROM, from == null ? "" : from);
            says.put(HASH, asOne.hashCode());
            says.put(LENGTH, asOne.length());
            says.put(TRANSLATED_HASH, translated.hashCode());
            says.put(TRANSLATED_LENGTH, translated.length());
            says.put(AT, System.currentTimeMillis());
            says.put(VERSION, WITH_BOTH);
            store().edit().putString(id, says.toString()).apply();

            held().put(id, new Held(from == null ? "" : from, asOne.hashCode(), asOne.length(),
                    translated.hashCode(), translated.length(), WITH_BOTH));

            makeRoom();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not keep what was written: " + ex);
        }
    }

    /** Forgets it, which is what putting it back amounts to. */
    static void forget(String id) {
        if (id == null || id.isEmpty()) {
            return;
        }
        held().remove(id);
        try {
            store().edit().remove(id).apply();
            File kept = fileFor(id);
            if (kept.exists() && !kept.delete()) {
                Logger.printInfo(() -> "Could not remove what was written for " + id);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not forget what was written: " + ex);
        }
    }

    /**
     * @return What the line under the author should say, or null where this is not being read
     *         in translation.
     *
     * <p>The text is checked rather than trusted. A thread read again is written back from
     * Reddit as its author wrote it, which undoes a translation without anything here being
     * told; saying it is translated when it plainly is not is worse than saying nothing.
     */
    @Nullable
    public static String noteFor(xa.d content) {
        try {
            if (content == null) {
                return null;
            }
            String id = content.U();
            if (id == null || id.isEmpty()) {
                return null;
            }
            Held about = held().get(id);
            if (about == null) {
                return null;
            }

            boolean isAComment = content.Y0() == Stored.A_COMMENT;
            String body = isAComment ? content.o() : content.P0();
            String title = isAComment ? null : content.b1();
            String saysNow = about.asItWasCounted(title, body);

            if (about.isTheTranslation(saysNow)) {
                String language = named(about.from);
                return language == null ? "translated" : "translated from " + language;
            }

            if (about.isWhatWasWritten(saysNow)) {
                // The app has written what its author wrote back over the translation, which
                // is what reading a thread again does. Nobody asked for that, so it is put
                // back — and until it is, this says nothing rather than something untrue.
                putItBackAgain(id, isAComment);
                return null;
            }

            // Neither what was written nor what it was translated to: the text has moved on
            // and what is kept about it is of no further use.
            forgetLater(id);
            return null;
        } catch (Exception ex) {
            // Never at the cost of the thread drawing.
            return null;
        }
    }

    /**
     * Writes the translation back over what the app has just replaced it with.
     *
     * <p>Once per post at a time: this is asked as a thread draws, and a thread draws a row
     * more than once.
     */
    private static void putItBackAgain(String id, boolean isAComment) {
        synchronized (beingPutBack) {
            if (!beingPutBack.add(id)) {
                return;
            }
        }
        new Thread(() -> {
            try {
                Written was = written(id);
                if (was != null && (was.translatedTitle != null || was.translatedBody != null)) {
                    Logger.printInfo(() -> "Putting the translation back over " + id);
                    Stored.write(Utils.getContext(), id, isAComment, was.translatedTitle,
                            was.translatedBody);
                } else {
                    forget(id);
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not put the translation back: " + ex);
            } finally {
                synchronized (beingPutBack) {
                    beingPutBack.remove(id);
                }
            }
        }, "sync-up-retranslate").start();
    }

    /**
     * @return Whether this is standing translated: it was translated, and what it says now is
     *         still not what was written.
     */
    static boolean isTranslated(xa.d content) {
        return noteFor(content) != null;
    }

    /** @return What that language is called, in the reader's own language. */
    @Nullable
    private static String named(String tag) {
        if (tag == null || tag.isEmpty()) {
            return null;
        }
        String language = new Locale(tag).getDisplayLanguage();
        return language.isEmpty() || language.equalsIgnoreCase(tag) ? null : language;
    }

    /** Off the thread that draws, since a file is being removed. */
    private static void forgetLater(String id) {
        held().remove(id);
        new Thread(() -> forget(id), "sync-up-forget").start();
    }

    private static SharedPreferences store() {
        return Utils.getContext().getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    private static File folder() {
        return new File(Utils.getContext().getFilesDir(), STORE);
    }

    private static File fileFor(String id) {
        // An id is Reddit's own, which is letters and numbers, so it names a file as it is.
        return new File(folder(), id.replaceAll("[^A-Za-z0-9_]", "_"));
    }

    /** What has been translated, read once and kept, since a thread asks as it draws. */
    private static synchronized Map<String, Held> held() {
        if (held == null) {
            held = new HashMap<>();
            try {
                for (Map.Entry<String, ?> each : store().getAll().entrySet()) {
                    JSONObject says = new JSONObject(String.valueOf(each.getValue()));
                    held.put(each.getKey(), new Held(says.optString(FROM, ""),
                            says.optInt(HASH), says.optInt(LENGTH),
                            says.optInt(TRANSLATED_HASH), says.optInt(TRANSLATED_LENGTH),
                            says.optInt(VERSION, 1)));
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read what has been translated: " + ex);
            }
        }
        return held;
    }

    /** Drops the oldest where there are more than are worth keeping. */
    private static void makeRoom() {
        try {
            Map<String, ?> all = store().getAll();
            if (all.size() <= KEPT) {
                return;
            }

            List<String> oldest = new ArrayList<>(all.keySet());
            oldest.sort((one, other) -> Long.compare(at(all.get(one)), at(all.get(other))));

            for (int dropped = 0; dropped < DROPPED_AT_ONCE && dropped < oldest.size(); dropped++) {
                forget(oldest.get(dropped));
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not make room: " + ex);
        }
    }

    private static long at(Object says) {
        try {
            return new JSONObject(String.valueOf(says)).optLong(AT, 0);
        } catch (Exception ex) {
            return 0;
        }
    }

    private static String read(File kept) throws Exception {
        try (FileInputStream from = new FileInputStream(kept)) {
            ByteArrayOutputStream into = new ByteArrayOutputStream();
            byte[] block = new byte[4096];
            int read;
            while ((read = from.read(block)) > 0) {
                into.write(block, 0, read);
            }
            return into.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static void write(File kept, String what) throws Exception {
        try (FileOutputStream into = new FileOutputStream(kept)) {
            into.write(what.getBytes(StandardCharsets.UTF_8));
        }
    }
}
