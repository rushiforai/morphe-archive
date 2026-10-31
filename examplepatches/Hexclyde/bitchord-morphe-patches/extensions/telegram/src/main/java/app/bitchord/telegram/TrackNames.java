package app.bitchord.telegram;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.Normalizer;
import java.util.*;

/**
 * Local corrections to the title and artist of Telegram tracks, and suggested ones.
 *
 * <p>A file uploaded with a typo ("Ine More Light") never matches the song BitChord is looking for,
 * because BitChord only accepts a source whose title words agree exactly. A correction is stored
 * per Telegram message on this phone and applied to everything the patch reports, so the file is
 * found and matched under the right name without uploading it again.
 *
 * <p>Suggestions come from songs that played from another source: a Telegram file by the same
 * artist, about as long, whose title is one or two letters off. They are only applied when the user
 * accepts them.
 */
public final class TrackNames {
    static final int MAX_CORRECTIONS = 2000, MAX_SUGGESTIONS = 50, MAX_TEXT = 200, MAX_PLAYS = 200;

    /** Same limit as BitChord's own matcher. */
    static final int DURATION_LIMIT_SEC = 30;

    /** Fetches a track row by id, or null when it is no longer accessible. */
    public interface Lookup {
        JSONObject get(String id) throws Exception;
    }

    private final File file;
    private final LinkedHashMap<String, JSONObject> corrections = new LinkedHashMap<>();
    private final LinkedHashMap<String, JSONObject> suggestions = new LinkedHashMap<>();
    private final LinkedHashSet<String> dismissed = new LinkedHashSet<>();
    // Songs that recently played from another source, by BitChord's media id. Used to find
    // BitChord's saved copy of a song once a Telegram file is renamed to match it.
    private final LinkedHashMap<String, JSONObject> plays = new LinkedHashMap<>();
    private volatile int revision;

    /** Reads saved names from file; null keeps them in memory only. */
    public TrackNames(File file) {
        this.file = file;
        read();
    }

    /** Reads the names again from the file: after a restore. */
    synchronized void reload() {
        corrections.clear();
        suggestions.clear();
        dismissed.clear();
        plays.clear();
        read();
        revision++;
    }

    private void read() {
        if (file == null || !file.isFile()) return;
        try {
            JSONObject saved =
                    new JSONObject(
                            new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
            load(saved.optJSONObject("corrections"), corrections);
            load(saved.optJSONObject("suggestions"), suggestions);
            JSONObject played = saved.optJSONObject("plays");
            if (played != null)
                for (Iterator<String> keys = played.keys(); keys.hasNext(); ) {
                    String id = keys.next();
                    JSONObject play = played.optJSONObject(id);
                    if (validMediaId(id) && play != null && !play.optString("title").isEmpty())
                        plays.put(id, play);
                }
            JSONArray gone = saved.optJSONArray("dismissed");
            if (gone != null)
                for (int i = 0; i < gone.length(); i++) dismissed.add(gone.getString(i));
        } catch (Exception e) {
            corrections.clear();
            suggestions.clear();
            dismissed.clear();
            plays.clear();
        }
    }

    /** Changes whenever corrections or suggestions change; lets the settings page refresh. */
    public int revision() {
        return revision;
    }

    private static void load(JSONObject from, Map<String, JSONObject> into) {
        if (from == null) return;
        for (Iterator<String> keys = from.keys(); keys.hasNext(); ) {
            String id = keys.next();
            JSONObject value = from.optJSONObject(id);
            if (validId(id) && value != null && !value.optString("title").isEmpty())
                into.put(id, value);
        }
    }

    static boolean validId(String id) {
        return id != null
                && (id.length() <= 42 && id.matches("-?[0-9]+_[0-9]+") || ZipAlbums.validId(id));
    }

    static boolean validMediaId(String id) {
        return id != null && !id.isEmpty() && id.length() <= 128 && !id.matches(".*\\p{Cntrl}.*");
    }

    // ── Corrections ─────────────────────────────────────────────────────────

    /** The row with its corrected title and artist, or the row unchanged. */
    public synchronized JSONObject apply(JSONObject row) throws Exception {
        JSONObject fix = corrections.get(row.optString("id"));
        if (fix == null) return row;
        JSONObject copy = new JSONObject(row.toString());
        copy.put("fileTitle", row.optString("title"));
        copy.put("fileArtist", row.optString("artist"));
        copy.put("title", fix.getString("title"));
        copy.put("artist", fix.optString("artist"));
        return copy;
    }

    /**
     * Search results with corrections applied, plus corrected tracks that the query only matches
     * under their new name. Telegram's own search still knows them by the old one.
     */
    public List<JSONObject> merge(List<JSONObject> found, String query, Lookup lookup)
            throws Exception {
        List<JSONObject> result = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        for (String id : matching(query)) {
            JSONObject row = null;
            for (JSONObject candidate : found)
                if (id.equals(candidate.optString("id"))) row = candidate;
            if (row == null) row = lookup.get(id);
            if (row != null && seen.add(id)) result.add(apply(row));
        }
        for (JSONObject row : found) if (seen.add(row.optString("id"))) result.add(apply(row));
        return result;
    }

    /** Ids of corrected tracks whose new title and artist contain every word of the query. */
    synchronized List<String> matching(String query) {
        List<String> wanted = words(query);
        List<String> ids = new ArrayList<>();
        if (wanted.isEmpty()) return ids;
        for (Map.Entry<String, JSONObject> entry : corrections.entrySet()) {
            JSONObject fix = entry.getValue();
            Set<String> have = new HashSet<>(words(fix.optString("title")));
            have.addAll(words(fix.optString("artist")));
            if (have.containsAll(wanted)) ids.add(entry.getKey());
            if (ids.size() >= 20) break;
        }
        return ids;
    }

    public synchronized void correct(JSONObject row, String title, String artist) throws Exception {
        String id = row.optString("id");
        if (!validId(id)) throw new IOException("This track can't be renamed.");
        title = clean(title);
        artist = clean(artist);
        if (title.isEmpty()) throw new IOException("Enter a title.");
        String fileTitle = row.optString("fileTitle", row.optString("title"));
        String fileArtist = row.optString("fileArtist", row.optString("artist"));
        suggestions.remove(id);
        if (title.equals(fileTitle) && artist.equals(fileArtist)) corrections.remove(id);
        else {
            if (!corrections.containsKey(id) && corrections.size() >= MAX_CORRECTIONS)
                throw new IOException("Too many corrected names. Remove some first.");
            corrections.put(
                    id,
                    new JSONObject()
                            .put("title", title)
                            .put("artist", artist)
                            .put("fileTitle", fileTitle)
                            .put("fileArtist", fileArtist)
                            .put("duration", row.optInt("duration")));
        }
        save();
    }

    public synchronized void remove(String id) throws IOException {
        if (corrections.remove(id) != null) save();
    }

    /** Corrections as rows: id, title, artist, fileTitle, fileArtist, duration. */
    public synchronized List<JSONObject> corrections() throws Exception {
        return rows(corrections);
    }

    // ── Suggestions ─────────────────────────────────────────────────────────

    /**
     * Records Telegram tracks that look like a misnamed copy of a song that played from another
     * source. Returns how many new suggestions were added.
     */
    public synchronized int consider(
            String title, String artist, int durationSec, List<JSONObject> candidates)
            throws Exception {
        title = clean(title);
        artist = clean(artist);
        if (title.isEmpty() || artist.isEmpty()) return 0;
        int added = 0;
        for (JSONObject row : candidates) {
            String id = row.optString("id");
            int length = row.optInt("duration");
            if (!validId(id)
                    || corrections.containsKey(id)
                    || suggestions.containsKey(id)
                    || dismissed.contains(dismissKey(id, title))
                    || !sharesArtist(artist, row.optString("artist"))
                    || (durationSec > 0
                            && length > 0
                            && Math.abs(durationSec - length) > DURATION_LIMIT_SEC)
                    || !nearMiss(title, row.optString("title"))) continue;
            if (suggestions.size() >= MAX_SUGGESTIONS)
                suggestions.remove(suggestions.keySet().iterator().next());
            suggestions.put(
                    id,
                    new JSONObject()
                            .put("title", title)
                            .put("artist", artist)
                            .put("fileTitle", row.optString("title"))
                            .put("fileArtist", row.optString("artist"))
                            .put("duration", length));
            added++;
        }
        if (added > 0) save();
        return added;
    }

    /** Suggestions as rows: id, title and artist to use, fileTitle, fileArtist, duration. */
    public synchronized List<JSONObject> suggestions() throws Exception {
        return rows(suggestions);
    }

    public synchronized void accept(String id) throws Exception {
        JSONObject suggestion = suggestions.get(id);
        if (suggestion == null) return;
        JSONObject row =
                new JSONObject()
                        .put("id", id)
                        .put("title", suggestion.optString("fileTitle"))
                        .put("artist", suggestion.optString("fileArtist"))
                        .put("duration", suggestion.optInt("duration"));
        correct(row, suggestion.getString("title"), suggestion.optString("artist"));
    }

    public synchronized void dismiss(String id) throws IOException {
        JSONObject suggestion = suggestions.remove(id);
        if (suggestion == null) return;
        dismissed.add(dismissKey(id, suggestion.optString("title")));
        while (dismissed.size() > 500) dismissed.remove(dismissed.iterator().next());
        save();
    }

    public synchronized void clear() throws IOException {
        corrections.clear();
        suggestions.clear();
        dismissed.clear();
        plays.clear();
        save();
    }

    // ── Plays from other sources ────────────────────────────────────────────

    /** Remembers a song that played from another source. Keeps the most recent 200. */
    public synchronized void played(String mediaId, String title, String artist, int durationSec)
            throws IOException {
        title = clean(title);
        artist = clean(artist);
        if (!validMediaId(mediaId) || title.isEmpty()) return;
        try {
            JSONObject play =
                    new JSONObject()
                            .put("title", title)
                            .put("artist", artist)
                            .put("duration", durationSec);
            JSONObject before = plays.remove(mediaId);
            plays.put(mediaId, play);
            while (plays.size() > MAX_PLAYS) plays.remove(plays.keySet().iterator().next());
            if (before == null || !before.toString().equals(play.toString())) save(false);
        } catch (org.json.JSONException e) {
            throw new IOException("Could not record the song.", e);
        }
    }

    /**
     * Media ids of recent plays from other sources that are the song now named [title] by [artist]:
     * the same title words, as BitChord's matcher requires, and a shared artist.
     */
    public synchronized List<String> playedAs(String title, String artist) {
        List<String> wanted = words(title), ids = new ArrayList<>();
        if (wanted.isEmpty()) return ids;
        for (Map.Entry<String, JSONObject> entry : plays.entrySet()) {
            JSONObject play = entry.getValue();
            String other = play.optString("artist");
            if (words(play.optString("title")).equals(wanted)
                    && (artist.isEmpty() || other.isEmpty() || sharesArtist(artist, other)))
                ids.add(entry.getKey());
        }
        return ids;
    }

    static String dismissKey(String id, String title) {
        return id + "|" + String.join(" ", words(title));
    }

    // ── Matching ────────────────────────────────────────────────────────────

    /** Lower case, accents and punctuation removed, split into words. */
    static List<String> words(String text) {
        if (text == null) return Collections.emptyList();
        String plain =
                Normalizer.normalize(text, Normalizer.Form.NFKD)
                        .replaceAll("\\p{M}+", "")
                        .toLowerCase(Locale.ROOT)
                        .replaceAll("[^\\p{L}\\p{N}]+", " ")
                        .trim();
        return plain.isEmpty() ? Collections.emptyList() : Arrays.asList(plain.split(" "));
    }

    /**
     * True when two titles are the same words apart from a few typos: same number of words, at most
     * two changed letters in any word and one per ten letters overall. Identical titles are not a
     * near miss; BitChord already matches those.
     */
    static boolean nearMiss(String wanted, String got) {
        List<String> a = words(wanted), b = words(got);
        if (a.isEmpty() || a.size() != b.size() || a.equals(b)) return false;
        int letters = 0, edits = 0;
        for (int i = 0; i < a.size(); i++) {
            int d = distance(a.get(i), b.get(i));
            if (d > 2 || (d > 0 && Math.min(a.get(i).length(), b.get(i).length()) < 3))
                return false;
            letters += Math.max(a.get(i).length(), b.get(i).length());
            edits += d;
        }
        return edits <= Math.max(1, letters / 10);
    }

    /** The first credited artist: "A, B" and "A feat. B" both give "A". */
    static String primaryArtist(String artist) {
        return artist.split("(?i)\\s*(,|&|;|/|\\bfeat\\.?|\\bft\\.?|\\bx\\b)\\s*")[0].trim();
    }

    /** True when one artist credit contains the other, after normalizing. */
    static boolean sharesArtist(String a, String b) {
        String x = String.join(" ", words(a)), y = String.join(" ", words(b));
        if (x.isEmpty() || y.isEmpty()) return false;
        return (" " + x + " ").contains(" " + y + " ") || (" " + y + " ").contains(" " + x + " ");
    }

    static int distance(String a, String b) {
        int[] previous = new int[b.length() + 1], current = new int[b.length() + 1];
        for (int j = 0; j <= b.length(); j++) previous[j] = j;
        for (int i = 1; i <= a.length(); i++) {
            current[0] = i;
            for (int j = 1; j <= b.length(); j++)
                current[j] =
                        Math.min(
                                Math.min(current[j - 1], previous[j]) + 1,
                                previous[j - 1] + (a.charAt(i - 1) == b.charAt(j - 1) ? 0 : 1));
            int[] swap = previous;
            previous = current;
            current = swap;
        }
        return previous[b.length()];
    }

    // ── Storage ─────────────────────────────────────────────────────────────

    static String clean(String text) {
        if (text == null) return "";
        String value = text.replaceAll("\\p{Cntrl}", " ").replaceAll("\\s+", " ").trim();
        return value.length() > MAX_TEXT ? value.substring(0, MAX_TEXT).trim() : value;
    }

    private static List<JSONObject> rows(Map<String, JSONObject> from) throws Exception {
        List<JSONObject> result = new ArrayList<>();
        for (Map.Entry<String, JSONObject> entry : from.entrySet())
            result.add(new JSONObject(entry.getValue().toString()).put("id", entry.getKey()));
        return result;
    }

    private void save() throws IOException {
        save(true);
    }

    private void save(boolean visible) throws IOException {
        if (visible) revision++;
        if (file == null) return;
        try {
            JSONObject state =
                    new JSONObject()
                            .put("corrections", new JSONObject(corrections))
                            .put("suggestions", new JSONObject(suggestions))
                            .put("dismissed", new JSONArray(dismissed))
                            .put("plays", new JSONObject(plays));
            File temporary = new File(file.getPath() + ".tmp");
            try (FileOutputStream out = new FileOutputStream(temporary)) {
                out.write(state.toString().getBytes(StandardCharsets.UTF_8));
                out.getFD().sync();
            }
            if (!temporary.renameTo(file)) throw new IOException("Could not save track names.");
        } catch (org.json.JSONException e) {
            throw new IOException("Could not save track names.", e);
        }
    }
}
