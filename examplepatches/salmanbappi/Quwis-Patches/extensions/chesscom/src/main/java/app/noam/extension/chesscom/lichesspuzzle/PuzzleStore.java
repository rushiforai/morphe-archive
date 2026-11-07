package app.noam.extension.chesscom.lichesspuzzle;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteFullException;
import android.database.sqlite.SQLiteOpenHelper;

import java.io.BufferedReader;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;

import app.noam.extension.chesscom.Utils;

/**
 * Lichess's puzzles on the phone: a pack from Lichess's open puzzle database (CC0), downloaded
 * once. Each puzzle is new, handed to chess.com's puzzle screen, or solved.
 */
final class PuzzleStore extends SQLiteOpenHelper {
    private static final String PACK_URL =
        "https://github.com/ImNoammm/Noams-Morphe-Patches/releases/download/lichess-puzzles/lichess_offline_puzzles_";
    /** The packs: file suffix, how they are named, and roughly how much they download. */
    static final String[] PACKS = {"20k", "50k", "100k", "500k", "all"};
    static final String[] PACK_NAMES = {"20k", "50k", "100k", "500k", "All"};
    static final String[] PACK_SIZES = {"1 MB", "2 MB", "5 MB", "23 MB", "280 MB"};

    /** How far a download is, 0..100, or -1 while the size is unknown. */
    interface Progress {
        void onProgress(int percent);
    }

    private static final int NEW = 0, GIVEN = 1, SOLVED = 2;
    private static PuzzleStore instance;

    /** A puzzle as stored: its number here, Lichess's FEN and UCI moves, and its rating. */
    static final class Puzzle {
        final long number;
        final String fen;
        final String moves;
        final int rating;

        Puzzle(long number, String fen, String moves, int rating) {
            this.number = number;
            this.fen = fen;
            this.moves = moves;
            this.rating = rating;
        }
    }

    static synchronized PuzzleStore get(Context context) {
        if (instance == null) instance = new PuzzleStore(context.getApplicationContext());
        return instance;
    }

    private PuzzleStore(Context context) {
        super(context, "morphe_lichess_puzzles.db", null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE puzzles (number INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT UNIQUE, fen TEXT, "
            + "moves TEXT, rating INTEGER, state INTEGER DEFAULT 0)");
        db.execSQL("CREATE INDEX puzzles_pick ON puzzles (state, rating)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

    int count() {
        return number("SELECT COUNT(*) FROM puzzles");
    }

    /** Whether any puzzle is on the phone, without counting them all. */
    boolean any() {
        return number("SELECT EXISTS (SELECT 1 FROM puzzles)") == 1;
    }

    int solvedCount() {
        return number("SELECT COUNT(*) FROM puzzles WHERE state = " + SOLVED);
    }

    private int number(String query) {
        try (Cursor cursor = getReadableDatabase().rawQuery(query, null)) {
            return cursor.moveToFirst() ? cursor.getInt(0) : 0;
        }
    }

    /** Removes every puzzle from the phone. */
    void clear() {
        getWritableDatabase().execSQL("DELETE FROM puzzles");
    }

    /** Puzzles stored per transaction, so nothing else waits on the database for longer than one. */
    private static final int BATCH = 2_000;

    /**
     * Downloads and imports a pack (puzzles already here keep whether they were solved); never on
     * the main thread. Returns null when it worked, or what went wrong.
     */
    String download(int pack, Progress progress) {
        HttpURLConnection connection = null;
        SQLiteDatabase db = null;
        try {
            db = getWritableDatabase();
            connection = (HttpURLConnection) new URL(PACK_URL + PACKS[pack] + ".csv.gz").openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                Utils.log("Lichess puzzle pack answered " + connection.getResponseCode());
                return OFFLINE;
            }
            long total = connection.getContentLength();
            try (CountingStream in = new CountingStream(connection.getInputStream(), total, progress);
                 BufferedReader reader = new BufferedReader(new InputStreamReader(new GZIPInputStream(in)))) {
                reader.readLine();
                db.beginTransaction();
                ContentValues values = new ContentValues();
                int batch = 0;
                String line;
                while ((line = reader.readLine()) != null) {
                    // PuzzleId,FEN,Moves,Rating,Themes
                    String[] f = line.split(",");
                    if (f.length < 4) continue;
                    values.put("id", f[0]);
                    values.put("fen", f[1]);
                    values.put("moves", f[2]);
                    values.put("rating", Integer.parseInt(f[3]));
                    db.insertWithOnConflict("puzzles", null, values, SQLiteDatabase.CONFLICT_IGNORE);
                    if (++batch == BATCH) {
                        db.setTransactionSuccessful();
                        db.endTransaction();
                        db.beginTransaction();
                        batch = 0;
                    }
                }
                db.setTransactionSuccessful();
            }
            return null;
        } catch (SQLiteFullException e) {
            Utils.logError("Lichess puzzle pack failed", e);
            return "Not enough free space on this phone for that pack.";
        } catch (IOException e) {
            Utils.logError("Lichess puzzle pack failed", e);
            return OFFLINE;
        } catch (Throwable e) {
            Utils.logError("Lichess puzzle pack failed", e);
            return "Couldn't store the Lichess puzzles.";
        } finally {
            try {
                if (db != null && db.inTransaction()) db.endTransaction();
            } catch (Throwable e) {
                Utils.logError("Lichess puzzle pack not finished", e);
            }
            if (connection != null) connection.disconnect();
        }
    }

    private static final String OFFLINE = "Couldn't download Lichess puzzles. Check your connection.";

    /** The download's bytes as they arrive, reported as a percentage. */
    private static final class CountingStream extends FilterInputStream {
        private final long total;
        private final Progress progress;
        private long read;
        private int reported = -2;

        CountingStream(InputStream in, long total, Progress progress) {
            super(in);
            this.total = total;
            this.progress = progress;
        }

        @Override
        public int read() throws IOException {
            int b = super.read();
            if (b >= 0) advance(1);
            return b;
        }

        @Override
        public int read(byte[] buffer, int offset, int length) throws IOException {
            int n = super.read(buffer, offset, length);
            if (n > 0) advance(n);
            return n;
        }

        private void advance(int n) {
            read += n;
            int percent = total > 0 ? (int) Math.min(100, read * 100 / total) : -1;
            if (percent != reported && progress != null) {
                reported = percent;
                progress.onProgress(percent);
            }
        }
    }

    /** New puzzles nearest the rating, now marked as given. */
    List<Puzzle> take(int rating, int count) {
        List<Puzzle> puzzles = new ArrayList<>();
        SQLiteDatabase db = getWritableDatabase();
        for (int window = 100; window <= 3200 && puzzles.size() < count; window *= 2) {
            try (Cursor cursor = db.rawQuery("SELECT number, fen, moves, rating FROM puzzles WHERE state = " + NEW
                    + " AND rating BETWEEN ? AND ? ORDER BY RANDOM() LIMIT ?", new String[]{
                    String.valueOf(rating - window), String.valueOf(rating + window),
                    String.valueOf(count - puzzles.size())})) {
                while (cursor.moveToNext()) {
                    Puzzle puzzle = new Puzzle(cursor.getLong(0), cursor.getString(1), cursor.getString(2), cursor.getInt(3));
                    puzzles.add(puzzle);
                    db.execSQL("UPDATE puzzles SET state = " + GIVEN + " WHERE number = " + puzzle.number);
                }
            }
        }
        return puzzles;
    }

    int rating(long number) {
        try (Cursor cursor = getReadableDatabase().rawQuery("SELECT rating FROM puzzles WHERE number = " + number, null)) {
            return cursor.moveToFirst() ? cursor.getInt(0) : -1;
        }
    }

    void solved(long number) {
        getWritableDatabase().execSQL("UPDATE puzzles SET state = " + SOLVED + " WHERE number = " + number);
    }

    /** The given puzzles, once chess.com's queue no longer has them: new again. */
    void ungive() {
        getWritableDatabase().execSQL("UPDATE puzzles SET state = " + NEW + " WHERE state = " + GIVEN);
    }
}
