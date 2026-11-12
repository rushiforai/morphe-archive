/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The app's own online player response, kept once for every video copy that plays offline.
 *
 * <p>The app's player selection reads more of a player response than its streaming data: offline a copy answered
 * with the response of the saving client (another client, with other settings and fewer fields) selected no video
 * track. The fields that are the app's and the same for every video (the response context, the playability status,
 * the whole player configuration and the other fields without a per-video meaning, see
 * {@link LiveTemplateLogic#PER_VIDEO_FIELDS}) are therefore taken from the last online response of a music video
 * with a copy, kept in one file and laid under a copy that has no online response of its own
 * ({@link VideoCopyAnswer}). Refreshed at most every {@link LiveTemplateLogic#REFRESH_MILLIS}.
 */
final class LiveTemplate {
    private static final String FILE_NAME = "rvx_live_template.pb";

    private static final Object lock = new Object();
    private static long lastChecked;
    private static boolean loaded;
    @Nullable
    private static byte[] held;

    private LiveTemplate() {}

    /**
     * Keeps the app-generic fields of an online response of a video copy when the kept ones are old or none are
     * kept. Called for every online answer of a copy, so a response that is not due costs only this check. Off the
     * main thread.
     */
    static void rememberFrom(String videoId, byte[] onlineResponse, PlayerResponse parsed) {
        try {
            synchronized (lock) {
                if (!LiveTemplateLogic.due(lastChecked, SystemClock.elapsedRealtime())) return;
            }
            if (!LiveTemplateLogic.isAppResponse(parsed)) return;

            byte[] template = ResponseFields.without(onlineResponse, LiveTemplateLogic.PER_VIDEO_FIELDS);
            boolean changed;
            synchronized (lock) {
                changed = !Arrays.equals(template, current());
                if (changed) {
                    write(template);
                    held = template;
                }
                lastChecked = SystemClock.elapsedRealtime();
            }
            if (changed) {
                Logger.printDebug(() -> "LiveTemplate: kept the app's online response of v=" + videoId + " "
                        + template.length + "B");
            }
        } catch (Exception ex) {
            Logger.printException(() -> "LiveTemplate: could not keep the online response", ex);
        }
    }

    /** The kept response without its per-video fields, or null when none was kept. Reads the file once. */
    @Nullable
    static byte[] get() {
        synchronized (lock) {
            return current();
        }
    }

    /** The kept response, read from the file the first time. Callers hold the lock. */
    @Nullable
    private static byte[] current() {
        if (loaded) return held;

        loaded = true;
        File file = file();
        if (!file.isFile()) return null;

        try {
            held = Files.readAllBytes(file.toPath());
        } catch (IOException ex) {
            Logger.printException(() -> "LiveTemplate: unreadable, dropped", ex);
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
        return held;
    }

    private static void write(byte[] template) throws IOException {
        File file = file();
        File pending = new File(file.getParentFile(), FILE_NAME + ".tmp");
        Files.write(pending.toPath(), template);
        Files.move(pending.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }

    private static File file() {
        return new File(Utils.getContext().getFilesDir(), FILE_NAME);
    }
}
