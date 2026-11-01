package app.noam.extension.chesscom.gamereview;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;

import app.noam.extension.chesscom.Utils;

/**
 * Reviews already run on the phone or by Lichess's servers, kept in the app's files so the same
 * game opens straight away the next time. One file per game and reviewer.
 */
final class SavedReviews {
    private static final String DIR = "morphe_reviews";

    private SavedReviews() {}

    /** The game (start position and moves) for this reviewer (GameReview.Mode's name). */
    static String key(String reviewer, String startFen, String[] moves) {
        StringBuilder game = new StringBuilder(reviewer).append('\n').append(startFen).append('\n');
        for (String move : moves) game.append(move).append(' ');
        try {
            byte[] hash = MessageDigest.getInstance("SHA-1").digest(game.toString().getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder(reviewer.toLowerCase(Locale.ROOT)).append('-');
            for (byte b : hash) hex.append(String.format(Locale.ROOT, "%02x", b));
            return hex.toString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * The saved review, when there is one searched at least {@code nodes} per move (0 for a
     * review that has no budget, Lichess's servers'); null otherwise.
     */
    static ReviewData load(Context context, String key, long nodes) {
        File file = file(context, key);
        if (file == null || !file.isFile()) return null;
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16384];
            int n;
            while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
            JSONObject json = new JSONObject(new String(out.toByteArray(), StandardCharsets.UTF_8));
            if (json.getLong("nodes") < nodes) return null;
            return ReviewData.fromJson(json.getJSONObject("review"));
        } catch (Exception e) {
            Utils.logError("A saved review could not be read", e);
            return null;
        }
    }

    static void save(Context context, String key, long nodes, ReviewData data) {
        File file = file(context, key);
        if (file == null) return;
        File temporary = new File(file.getPath() + ".tmp");
        try {
            JSONObject json = new JSONObject();
            json.put("nodes", nodes);
            json.put("review", data.toJson());
            try (OutputStream out = new FileOutputStream(temporary)) {
                out.write(json.toString().getBytes(StandardCharsets.UTF_8));
            }
            if (!temporary.renameTo(file)) throw new java.io.IOException("could not rename " + temporary);
        } catch (Exception e) {
            Utils.logError("The review could not be saved", e);
            temporary.delete();
            return;
        }
        saveMeta(context, key, data);
    }

    /**
     * A small sidecar next to the review: who played, when, and the brilliant moves it found. The
     * settings screen reads these instead of the whole review of every game.
     */
    static void saveMeta(Context context, String key, ReviewData data) {
        File file = file(context, key + ".meta");
        if (file == null) return;
        File temporary = new File(file.getPath() + ".tmp");
        try {
            JSONObject json = new JSONObject();
            putIfPresent(json, "white", data.white);
            putIfPresent(json, "black", data.black);
            putIfPresent(json, "date", data.date);
            putIfPresent(json, "result", data.result);
            putIfPresent(json, "link", data.link);
            JSONArray brilliants = new JSONArray();
            if (data.marks != null && data.sans != null) {
                for (int i = 0; i < data.marks.length && i < data.sans.length; i++) {
                    if (!"brilliant".equals(data.marks[i])) continue;
                    String san = data.sans[i] == null ? "" : data.sans[i];
                    JSONObject move = new JSONObject();
                    move.put("label", (i / 2 + 1) + (i % 2 == 0 ? "." : "...") + san);
                    move.put("ply", i);
                    brilliants.put(move);
                }
            }
            json.put("brilliants", brilliants);
            try (OutputStream out = new FileOutputStream(temporary)) {
                out.write(json.toString().getBytes(StandardCharsets.UTF_8));
            }
            if (!temporary.renameTo(file)) throw new java.io.IOException("could not rename " + temporary);
        } catch (Exception e) {
            Utils.logError("The review's summary could not be saved", e);
            temporary.delete();
        }
    }

    private static void putIfPresent(JSONObject json, String name, String value) throws Exception {
        if (value != null && !value.isEmpty()) json.put(name, value);
    }

    /** A saved review's game and the brilliant moves it found. */
    static final class Meta {
        /** One brilliant move: its label ("10.Nxb5") and its 0-based ply, -1 when unknown. */
        static final class Move {
            final String label;
            final int ply;

            Move(String label, int ply) {
                this.label = label;
                this.ply = ply;
            }
        }

        String white, black, date, result, link;
        final java.util.List<Move> brilliants = new java.util.ArrayList<>();

        /** "Morphy - Duke, 1858", or null when the game came without a header. */
        String game() {
            StringBuilder text = new StringBuilder();
            if (white != null) text.append(white);
            if (black != null) text.append(text.length() > 0 ? " - " : "").append(black);
            if (date != null) text.append(text.length() > 0 ? ", " : "").append(date);
            return text.length() == 0 ? null : text.toString();
        }
    }

    /** Every saved review's summary, newest first. */
    static java.util.List<Meta> metas(Context context) {
        java.util.List<Meta> metas = new java.util.ArrayList<>();
        File directory = directory(context);
        File[] files = directory.listFiles((dir, name) -> name.endsWith(".meta.json"));
        if (files == null) return metas;
        java.util.Arrays.sort(files, (a, b) -> Long.compare(b.lastModified(), a.lastModified()));
        for (File file : files) {
            try (InputStream in = new FileInputStream(file)) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int n;
                while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
                JSONObject json = new JSONObject(new String(out.toByteArray(), StandardCharsets.UTF_8));
                Meta meta = new Meta();
                meta.white = json.has("white") ? json.getString("white") : null;
                meta.black = json.has("black") ? json.getString("black") : null;
                meta.date = json.has("date") ? json.getString("date") : null;
                meta.result = json.has("result") ? json.getString("result") : null;
                meta.link = json.has("link") ? json.getString("link") : null;
                org.json.JSONArray brilliants = json.getJSONArray("brilliants");
                for (int i = 0; i < brilliants.length(); i++) {
                    Object item = brilliants.get(i);
                    if (item instanceof String) {
                        // Saved before the list learned to link to the move.
                        meta.brilliants.add(new Meta.Move((String) item, -1));
                    } else if (item instanceof JSONObject) {
                        JSONObject move = (JSONObject) item;
                        meta.brilliants.add(new Meta.Move(move.getString("label"),
                            move.has("ply") ? move.getInt("ply") : -1));
                    }
                }
                metas.add(meta);
            } catch (Exception e) {
                Utils.logError("A saved review's summary could not be read", e);
            }
        }
        return metas;
    }

    static int count(Context context) {
        File[] files = directory(context).listFiles((dir, name) ->
            name.endsWith(".json") && !name.endsWith(".meta.json"));
        return files == null ? 0 : files.length;
    }

    static void clear(Context context) {
        File[] files = directory(context).listFiles();
        if (files != null) for (File file : files) file.delete();
    }

    private static File directory(Context context) {
        return new File(context.getFilesDir(), DIR);
    }

    private static File file(Context context, String key) {
        if (key == null || context == null) return null;
        File directory = directory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) return null;
        return new File(directory, key + ".json");
    }
}
