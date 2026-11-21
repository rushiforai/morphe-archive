package app.morphed.extension.twitch.musicfilter;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.function.BiConsumer;

import app.morphed.extension.twitch.net.JsonParser;

/**
 * The clean copies: where each song's matched copy is, the downloads themselves and their prints. Copies are kept
 * up to KEEP_BYTES all told (the oldest used go first), and so is which copy matched which song (the latest
 * INDEX_MAX), so a song heard before needs neither a search nor a download.
 */
public final class SongLibrary implements Tracker.Library {
    static final long KEEP_BYTES = 1024L * 1024 * 1024; // the copies and their prints, all told
    static final int INDEX_MAX = 2000; // songs remembered in the index
    static final String PRINT = ".print";

    /** Searching and downloading, replaced in tests. */
    public interface Source {
        List<String> search(Song song, boolean music) throws SongProblem;

        File download(String videoId, File folder) throws SongProblem;
    }

    /** Turns a downloaded file into 16-bit stereo at 48 kHz. */
    public interface Decoder {
        SongCopy decode(String videoId, File file) throws SongProblem;
    }

    private final File root;
    private final File indexFile;
    private final Source source;
    private final Decoder decoder;
    private final LinkedHashMap<String, String[]> index = new LinkedHashMap<>(); // key -> id, title, artist

    public SongLibrary(File root, Source source, Decoder decoder) {
        this.root = root;
        this.indexFile = new File(root, "songs.json");
        this.source = source;
        this.decoder = decoder;
        readIndex();
    }

    /** Where a failure to keep something goes (the app's log, and the screen for saves); nowhere in tests. */
    private volatile BiConsumer<String, Boolean> problems = (text, lasting) -> { };
    private boolean saveFailTold;
    private String indexProblem; // the index is read before anyone listens: told once someone does

    /** Where problems go: (text, whether it stays true for the launch). */
    void onProblem(BiConsumer<String, Boolean> problems) {
        this.problems = problems;
        String waiting;
        synchronized (this) {
            waiting = indexProblem;
            indexProblem = null;
        }
        if (waiting != null) problems.accept(waiting, false); // (songs are looked up afresh: over once told)
    }

    private synchronized void readIndex() {
        try {
            if (!indexFile.isFile()) return;
            byte[] bytes = readFile(indexFile);
            Object parsed = JsonParser.parse(new String(bytes, StandardCharsets.UTF_8));
            if (!(parsed instanceof Map)) throw new IllegalArgumentException("it isn't a list");
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) parsed).entrySet()) {
                String id = JsonParser.string(entry.getValue(), "id");
                if (id == null) continue;
                String title = JsonParser.string(entry.getValue(), "title");
                String artist = JsonParser.string(entry.getValue(), "artist");
                index.put(String.valueOf(entry.getKey()), new String[]{id, title == null ? "" : title, artist == null ? "" : artist});
            }
        } catch (IOException | IllegalArgumentException broken) {
            index.clear(); // a broken index: songs are told again by Shazam
            indexProblem = "Song list unreadable | The list of songs found before couldn't be read (" + broken.getMessage()
                    + "), songs are looked up afresh";
        }
    }

    private static byte[] readFile(File file) throws IOException {
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            new DataInputStream(in).readFully(bytes);
            return bytes;
        }
    }

    /** The YouTube id that matched this song before, or null. */
    synchronized String knownId(Song song) {
        String[] entry = index.get(song.key);
        return entry == null ? null : entry[0];
    }

    @Override
    public Iterator<String> candidates(Song song) {
        String first = knownId(song);
        return new Iterator<String>() {
            private final List<String> tried = new ArrayList<>();
            private final List<String> queue = new ArrayList<>();
            private int source = first != null ? -1 : 0; // -1: the known one, 0: YouTube Music, 1: YouTube, 2: done
            private SongProblem failed;

            {
                if (first != null) {
                    queue.add(first);
                    tried.add(first);
                }
            }

            @Override
            public boolean hasNext() {
                while (queue.isEmpty() && source < 2) {
                    if (source >= 0) {
                        try {
                            for (String id : SongLibrary.this.source.search(song, source == 0)) {
                                if (!tried.contains(id)) {
                                    tried.add(id);
                                    queue.add(id);
                                }
                            }
                        } catch (SongProblem problem) {
                            if (failed == null) failed = problem;
                        }
                    }
                    source++;
                }
                if (queue.isEmpty() && failed != null) {
                    SongProblem problem = failed;
                    failed = null;
                    throw new Tracker.SearchFailed(problem);
                }
                return !queue.isEmpty();
            }

            @Override
            public String next() {
                if (!hasNext()) throw new NoSuchElementException();
                return queue.remove(0);
            }
        };
    }

    @Override
    public synchronized void remember(Song song, String videoId) {
        index.remove(song.key); // to the end: the latest
        index.put(song.key, new String[]{videoId, song.title, song.artist});
        Iterator<String> oldest = index.keySet().iterator();
        while (index.size() > INDEX_MAX && oldest.hasNext()) {
            oldest.next();
            oldest.remove();
        }
        StringBuilder json = new StringBuilder("{");
        boolean first = true;
        for (Map.Entry<String, String[]> entry : index.entrySet()) {
            if (!first) json.append(',');
            first = false;
            json.append(JsonParser.quote(entry.getKey())).append(":{\"id\":").append(JsonParser.quote(entry.getValue()[0]))
                    .append(",\"title\":").append(JsonParser.quote(entry.getValue()[1]))
                    .append(",\"artist\":").append(JsonParser.quote(entry.getValue()[2])).append('}');
        }
        json.append('}');
        try {
            writeAtomically(indexFile, json.toString().getBytes(StandardCharsets.UTF_8));
        } catch (IOException failed) { // the copy still plays; it's searched for again next time
            saveFailed("the list of songs", failed);
        }
    }

    private void writeAtomically(File target, byte[] bytes) throws IOException {
        if (!root.isDirectory() && !root.mkdirs()) throw new IOException("no folder");
        File tmp = new File(target.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(bytes);
        }
        if (!tmp.renameTo(target)) {
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            if (!tmp.renameTo(target)) throw new IOException("couldn't save " + target.getName());
        }
    }

    @Override
    public synchronized List<Tracker.Known> heardBefore() {
        List<Tracker.Known> found = new ArrayList<>();
        List<Map.Entry<String, String[]>> entries = new ArrayList<>(index.entrySet());
        Collections.reverse(entries);
        for (Map.Entry<String, String[]> entry : entries) {
            if (found.size() >= Tracker.KNOWN_MAX) break; // (only the latest are looked through)
            String id = entry.getValue()[0];
            File print = new File(root, id + PRINT);
            if (!print.isFile() || print.length() == 0 || path(id) == null) continue;
            found.add(new Tracker.Known(new Song(entry.getKey(), entry.getValue()[1], entry.getValue()[2]), id,
                    () -> readPrint(print)));
        }
        return found;
    }

    static float[] readPrint(File file) throws IOException {
        byte[] bytes = readFile(file);
        java.nio.FloatBuffer floats = java.nio.ByteBuffer.wrap(bytes).order(java.nio.ByteOrder.LITTLE_ENDIAN).asFloatBuffer();
        float[] out = new float[floats.remaining()];
        floats.get(out);
        return out;
    }

    @Override
    public void keepPrint(String videoId, float[] print) {
        if (print.length == 0) return; // nothing to tell it by
        java.nio.ByteBuffer bytes = java.nio.ByteBuffer.allocate(print.length * 4).order(java.nio.ByteOrder.LITTLE_ENDIAN);
        bytes.asFloatBuffer().put(print);
        try {
            writeAtomically(new File(root, videoId + PRINT), bytes.array());
        } catch (IOException failed) { // without a print the song is told by Shazam next time
            saveFailed("a song's print", failed);
        }
    }

    /** Told once a launch: storage full means every song is looked up and downloaded again. */
    private synchronized void saveFailed(String what, IOException failed) {
        if (saveFailTold) return;
        saveFailTold = true;
        problems.accept("Can't keep songs | Songs can't be kept (saving " + what + " failed: " + failed.getMessage()
                + "), they're looked up again each time. Is the phone's storage full?", true);
    }

    /** The downloaded copy of this video, if it's here. */
    File path(String videoId) {
        for (String extension : new String[]{"webm", "m4a"}) {
            File file = new File(root, videoId + "." + extension);
            if (file.isFile() && file.length() > 0) return file;
        }
        return null;
    }

    @Override
    public SongCopy load(String videoId, Tracker.Stages stages) throws SongProblem {
        File file = path(videoId);
        if (file != null) {
            //noinspection ResultOfMethodCallIgnored
            file.setLastModified(System.currentTimeMillis()); // used: the last to go when making room
        } else {
            stages.downloading();
            file = source.download(videoId, root);
            makeRoom(KEEP_BYTES);
        }
        stages.decoding();
        return decoder.decode(videoId, file);
    }

    @Override
    public void drop(String videoId) {
        File file = path(videoId);
        //noinspection ResultOfMethodCallIgnored
        if (file != null) file.delete();
    }

    /** Drops the copies used longest ago (each with its print) until what's kept fits in keep bytes. */
    void makeRoom(long keep) {
        File[] files = root.listFiles();
        if (files == null) return;
        Map<String, List<File>> groups = new HashMap<>();
        for (File file : files) {
            if (!file.isFile() || file.getName().startsWith("songs.json")) continue;
            String id = file.getName().substring(0, file.getName().indexOf('.') < 0 ? file.getName().length()
                    : file.getName().indexOf('.'));
            groups.computeIfAbsent(id, k -> new ArrayList<>()).add(file);
        }
        List<List<File>> used = new ArrayList<>(groups.values());
        used.sort((a, b) -> Long.compare(newest(b), newest(a)));
        long total = 0;
        for (List<File> group : used) {
            for (File file : group) total += file.length();
            if (total > keep) {
                //noinspection ResultOfMethodCallIgnored
                for (File file : group) file.delete();
            }
        }
    }

    private static long newest(List<File> files) {
        long newest = 0;
        for (File file : files) newest = Math.max(newest, file.lastModified());
        return newest;
    }

}
