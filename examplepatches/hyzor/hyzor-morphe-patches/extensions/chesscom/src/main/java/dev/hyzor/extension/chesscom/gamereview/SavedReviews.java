package dev.hyzor.extension.chesscom.gamereview;

import android.content.Context;

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

import dev.hyzor.extension.chesscom.Utils;

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
        }
    }

    static int count(Context context) {
        File[] files = directory(context).listFiles((dir, name) -> name.endsWith(".json"));
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
