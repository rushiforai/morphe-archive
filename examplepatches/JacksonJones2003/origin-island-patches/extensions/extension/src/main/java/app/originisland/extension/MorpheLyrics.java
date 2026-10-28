package app.originisland.extension;

import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Reads the lyrics of the current track from the "Third-party lyrics" patch of Morphe.
 *
 * That patch is part of another patch bundle and may not be applied, or may change,
 * so it is only reached through reflection and everything here fails quietly.
 */
final class MorpheLyrics {

    interface Listener {
        /**
         * Called on the main thread.
         *
         * @param lrc Synced lyrics of the current track in the LRC format,
         *            or an empty string if there are none.
         */
        void onLyricsChanged(String lrc);
    }

    /**
     * A word of a line, or a part of one, with the time it is sung.
     */
    static final class Word {
        final long startTimeMs;
        final long endTimeMs;
        final String text;
        /**
         * If the next word is apart from this one, and not another part of the same word.
         */
        final boolean endsWithSpace;

        Word(long startTimeMs, long endTimeMs, String text, boolean endsWithSpace) {
            this.startTimeMs = startTimeMs;
            this.endTimeMs = endTimeMs;
            this.text = text;
            this.endsWithSpace = endsWithSpace;
        }
    }

    static final class Line {
        final long startTimeMs;
        final String text;
        /**
         * Words of the line, or none if the lyrics only have the times of the lines.
         */
        final List<Word> words;

        Line(long startTimeMs, String text, List<Word> words) {
            this.startTimeMs = startTimeMs;
            this.text = text;
            this.words = words;
        }
    }

    interface LinesListener {
        /**
         * Called on the main thread.
         *
         * @param lines Lines of the synced lyrics of the current track, or none if there are none.
         * @param credit Who wrote the song, or empty if that is not known.
         */
        void onLyricsChanged(List<Line> lines, String credit);
    }

    private static final String TAG = "OriginIslandMusicCard";

    private static final String LYRICS_PACKAGE = "app.morphe.extension.music.patches.lyrics.";

    private static Method lyricsSynced;
    private static Method lyricsLines;
    private static Method lineStartTimeMs;
    private static Method lineText;

    private MorpheLyrics() {
    }

    /**
     * Must be called on the main thread.
     *
     * @return If the lyrics patch is applied and the listener was added to it.
     */
    static boolean addListener(Listener listener) {
        return addListener(listener, null);
    }

    /**
     * Must be called on the main thread.
     *
     * @return If the lyrics patch is applied and the listener was added to it.
     */
    static boolean addLinesListener(LinesListener listener) {
        return addListener(null, listener);
    }

    private static boolean addListener(Listener listener, LinesListener linesListener) {
        try {
            Class<?> managerClass = Class.forName(LYRICS_PACKAGE + "LyricsManager");
            Class<?> listenerClass = Class.forName(LYRICS_PACKAGE + "LyricsManager$Listener");
            Class<?> lyricsClass = Class.forName(LYRICS_PACKAGE + "model.Lyrics");
            Class<?> lineClass = Class.forName(LYRICS_PACKAGE + "model.LyricsLine");

            lyricsSynced = lyricsClass.getMethod("synced");
            lyricsLines = lyricsClass.getMethod("lines");
            lineStartTimeMs = lineClass.getMethod("startTimeMs");
            lineText = lineClass.getMethod("text");

            InvocationHandler handler = (proxy, method, args) -> {
                switch (method.getName()) {
                    case "onLyricsChanged":
                        // onLyricsChanged(State state, Lyrics lyrics)
                        if (listener != null) {
                            listener.onLyricsChanged(toLrc(args[1]));
                        }
                        if (linesListener != null) {
                            linesListener.onLyricsChanged(toLines(args[1]), toCredit(args[1]));
                        }
                        return null;
                    // The manager keeps its listeners in a list.
                    case "equals":
                        return proxy == args[0];
                    case "hashCode":
                        return System.identityHashCode(proxy);
                    default:
                        return null;
                }
            };

            Object manager = managerClass.getMethod("getInstance").invoke(null);
            managerClass.getMethod("addListener", listenerClass).invoke(manager,
                    Proxy.newProxyInstance(listenerClass.getClassLoader(), new Class<?>[]{listenerClass}, handler));

            return true;
        } catch (ClassNotFoundException ex) {
            Log.i(TAG, "Third-party lyrics patch is not applied");
        } catch (Exception ex) {
            Log.e(TAG, "Could not listen to the third-party lyrics patch", ex);
        }

        return false;
    }

    private static String toCredit(Object lyrics) {
        try {
            if (lyrics == null) {
                return "";
            }

            List<?> songwriters = (List<?>) lyrics.getClass().getMethod("songwriters").invoke(lyrics);
            if (songwriters != null && !songwriters.isEmpty()) {
                StringBuilder credit = new StringBuilder("Written by ");
                for (int i = 0; i < songwriters.size(); i++) {
                    credit.append(i == 0 ? "" : ", ").append(songwriters.get(i));
                }
                return credit.toString();
            }

        } catch (Exception ex) {
            // The credit is left out.
        }

        return "";
    }

    private static List<Line> toLines(Object lyrics) {
        List<Line> lines = new ArrayList<>();
        try {
            if (lyrics == null || !((boolean) lyricsSynced.invoke(lyrics))) {
                return lines;
            }

            for (Object line : (List<?>) lyricsLines.invoke(lyrics)) {
                long startTimeMs = (long) lineStartTimeMs.invoke(line);
                String text = (String) lineText.invoke(line);
                if (startTimeMs < 0 || text == null || text.trim().isEmpty()) {
                    continue;
                }

                lines.add(new Line(startTimeMs, text.replace('\n', ' ').trim(), toWords(line)));
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the lyrics", ex);
        }

        return lines;
    }

    /**
     * @return The words of a line, or none if they have no times or cannot be read.
     */
    private static List<Word> toWords(Object line) {
        List<Word> words = new ArrayList<>();
        try {
            for (Object word : (List<?>) line.getClass().getMethod("words").invoke(line)) {
                Class<?> wordClass = word.getClass();
                long startTimeMs = (long) wordClass.getMethod("startMs").invoke(word);
                long endTimeMs = (long) wordClass.getMethod("endMs").invoke(word);
                String text = (String) wordClass.getMethod("text").invoke(word);
                boolean endsWithSpace = (boolean) wordClass.getMethod("endsWithSpace").invoke(word);
                if (startTimeMs < 0 || endTimeMs < startTimeMs || text == null) {
                    return new ArrayList<>();
                }

                words.add(new Word(startTimeMs, endTimeMs, text, endsWithSpace || text.endsWith(" ")));
            }
        } catch (Exception ex) {
            return new ArrayList<>();
        }

        return words;
    }

    private static String toLrc(Object lyrics) {
        try {
            if (lyrics == null || !((boolean) lyricsSynced.invoke(lyrics))) {
                return "";
            }

            StringBuilder lrc = new StringBuilder();
            for (Object line : (List<?>) lyricsLines.invoke(lyrics)) {
                long startTimeMs = (long) lineStartTimeMs.invoke(line);
                String text = (String) lineText.invoke(line);
                if (startTimeMs < 0 || text == null || text.trim().isEmpty()) {
                    continue;
                }

                lrc.append(String.format(Locale.US, "[%02d:%02d.%02d]",
                        startTimeMs / 60000, (startTimeMs / 1000) % 60, (startTimeMs % 1000) / 10));
                lrc.append(text.replace('\n', ' ')).append('\n');
            }

            return lrc.toString();
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the lyrics", ex);
        }

        return "";
    }
}
