package app.ayham.extension.music.features;

import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Prism's video gate for the music-video canvas (canvas.md §5 rules 7-11, ClipFinder and ClipGate):
 * not a song is never looked up; the video found must be YouTube Music's official type and its
 * title must not say it is something else; refused for type or title, a second search tries up to
 * 2 more; none passing, the first video as it is, refused only when it can't make a loop.
 */
final class ClipGate {
    static final String OMV = "MUSIC_VIDEO_TYPE_OMV";
    static final String NOT_A_SONG = "NOT_A_SONG", NO_VIDEO = "NO_VIDEO", NOT_OFFICIAL = "NOT_OFFICIAL", TITLE = "TITLE",
            RESTRICTED = "RESTRICTED", STILL = "STILL";

    private ClipGate() {
    }

    /** One video as the gate sees it; still is asked only when the rest passed (it costs a storyboard). */
    static final class Video {
        String type, title, status;
        java.util.function.BooleanSupplier still = () -> false;
    }

    static final class Result {
        String videoId, why;
        int otherSearches;

        @Override
        public String toString() {
            return videoId != null ? videoId + (otherSearches > 0 ? " (after a second search)" : "") : "none (" + why + ")";
        }
    }

    interface Look {
        /** The video's type, title, status and still check; null when it can't be read. */
        Video video(String id);

        /** The second search's videos ("title artist official video"), picked by rules 2-5, in order. */
        List<String> others();
    }

    /** Rule 8 in order: type, title, playable, then a still upload. Null: it passes. */
    static String strict(String songTitle, Video v) {
        if (v == null) return RESTRICTED;
        if (!OMV.equals(v.type)) return NOT_OFFICIAL;
        if (titleSays(songTitle, v.title)) return TITLE;
        return own(v);
    }

    /** Rule 11: the song's own video as it is: only what can't make a loop refuses it. */
    static String own(Video v) {
        if (v == null || !"OK".equals(v.status)) return RESTRICTED;
        return v.still.getAsBoolean() ? STILL : null;
    }

    /** Rules 7-11. [firstId]: what the search found (null: nothing). */
    static Result find(String songTitle, boolean notASong, String firstId, Look look) {
        return find(songTitle, notASong, firstId, look, null, false, false);
    }

    /**
     * With the listener's video ([picked], canvas.md §15 rule 6: asked first, as it is; one that can't
     * make a loop gives way to the search, unless the pick is being tried, [only]) and rule 12's lyric
     * video ([lyricFirst]: what the search found is the artist's lyric video, taken as it is).
     * A turned-away pick is passed as null.
     */
    static Result find(String songTitle, boolean notASong, String firstId, Look look, String picked, boolean only, boolean lyricFirst) {
        Result r = new Result();
        if (notASong) {
            r.why = NOT_A_SONG;
            return r;
        }
        if (picked != null) {
            String w = own(look.video(picked));
            if (w == null || only) {
                if (w == null) r.videoId = picked;
                else r.why = w;
                return r;
            }
        }
        if (lyricFirst && firstId != null) {
            String w = own(look.video(firstId));
            if (w == null) r.videoId = firstId;
            else r.why = w;
            return r;
        }
        if (firstId == null) {
            r.why = NO_VIDEO;
            return r;
        }
        Video first = look.video(firstId);
        String why = strict(songTitle, first);
        if (why == null) {
            r.videoId = firstId;
            return r;
        }
        if (TITLE.equals(why) || NOT_OFFICIAL.equals(why)) {
            r.otherSearches = 1;
            int tried = 0;
            for (String id : look.others()) {
                if (tried >= 2) break;
                if (id == null || id.equals(firstId)) continue;
                Video v = look.video(id);
                if (v == null || titleSays(songTitle, v.title)) continue;
                tried++;
                if (strict(songTitle, v) == null) {
                    r.videoId = id;
                    return r;
                }
            }
            String mine = own(first);
            if (mine == null) r.videoId = firstId;
            else r.why = mine;
            return r;
        }
        r.why = why;
        return r;
    }

    // ---- rule 9: the title says it is something else

    private static final String[] WORDS = {"audio", "karaoke", "chords", "performance", "live", "stage", "cover", "fancam", "fan cam",
            "recording", "jukebox", "bgm", "en vivo", "ao vivo", "en directo"};
    private static final String[] LYRIC_WORDS = {"lyric", "lyrics", "lyrical", "letra", "letras", "paroles", "testo"};
    private static final String[] CJK = {"직캠", "무대", "가사", "라이브", "推しカメラ", "歌詞", "ライブ", "歌ってみた", "歌词", "现场", "翻唱"};

    static boolean titleSays(String songTitle, String videoTitle) {
        return titleSays(songTitle, videoTitle, false);
    }

    /** [lyricsOk]: a lyric video is not held against it (rule 12's fallback). */
    static boolean titleSays(String songTitle, String videoTitle, boolean lyricsOk) {
        if (videoTitle == null) return false;
        String v = videoTitle.toLowerCase(Locale.ROOT), s = songTitle == null ? "" : songTitle.toLowerCase(Locale.ROOT);
        for (String w : WORDS) if (word(v, w) && !word(s, w)) return true;
        if (!lyricsOk) for (String w : LYRIC_WORDS) if (word(v, w) && !word(s, w)) return true;
        if (word(v, "full song") && !word(v, "video") && !word(s, "full song")) return true;
        for (String w : CJK) if (v.contains(w) && !s.contains(w)) return true;
        return false;
    }

    private static boolean word(String text, String w) {
        return Pattern.compile("(?<![\\p{L}\\p{N}])" + Pattern.quote(w) + "(?![\\p{L}\\p{N}])").matcher(text).find();
    }
}
