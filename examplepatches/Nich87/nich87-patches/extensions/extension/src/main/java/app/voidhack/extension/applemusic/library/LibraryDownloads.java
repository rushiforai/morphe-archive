package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

import static app.voidhack.extension.applemusic.library.MusicReflection.call;
import static app.voidhack.extension.applemusic.library.MusicReflection.invoke;

final class LibraryDownloads {
    private static final String CONTROLLER = "com.apple.android.music.download.controller.a";

    static List<Object> pending(AtomicBoolean cancelled) throws ReflectiveOperationException, IOException {
        if (!(Boolean) invoke("Pb.a", "j")) throw new LibraryFailure("subscription_required");
        if (!(Boolean) invoke(CONTROLLER, "k")) {
            throw new LibraryFailure("download_connection");
        }
        List<Object> pending = new ArrayList<>();
        Set<Long> ids = new HashSet<>();
        boolean explicitAllowed = (Boolean) invoke("ja.U", "c");
        MusicLibrary music = new MusicLibrary(cancelled);
        for (Object song : music.songs()) {
            music.checkCancelled();
            if (!(Boolean) call(song, "isAvailable") || (Boolean) call(song, "isDownloaded")
                    || (Boolean) call(song, "isDownloading")) continue;
            if (!explicitAllowed && (Boolean) call(song, "isExplicit")) continue;
            if (ids.add((Long) call(song, "getPersistentId"))) pending.add(song);
        }
        return pending;
    }

    private LibraryDownloads() {}

    private static void checkPolicy(Activity activity) throws ReflectiveOperationException, IOException {
        if (!(Boolean) invoke("Pb.a", "j")) throw new LibraryFailure("subscription_required");
        Object library = invoke("com.apple.android.medialibrary.library.a", "d0");
        if (library == null || !(Boolean) call(library, "isReady")) throw new LibraryFailure("sync_required");
        String transfer = "com.apple.android.music.settings.services.MediaTransferService";
        if (Class.forName(transfer).getField("f").get(null) == Class.forName(transfer + "$b").getField("ONGOING").get(null)) {
            throw new LibraryFailure("download_moving");
        }
        if (!(Boolean) invoke(CONTROLLER, "k") || !(Boolean) invoke("fc.d", "f", activity)) {
            throw new LibraryFailure("download_connection");
        }
        if (!(Boolean) invoke("fc.d", "g") && (Boolean) call(invoke("ja.u0", "j"), "d",
                Class.forName("ja.u0").getField("o").get(null), false)) {
            throw new LibraryFailure("download_data_saver");
        }
    }

    static final class Queue {
        private final LibraryTools tools;
        private final List<Object> songs;
        private final Handler main = new Handler(Looper.getMainLooper());
        private int requested;
        private int position;

        Queue(LibraryTools tools, List<Object> songs) { this.tools = tools; this.songs = songs; }

        void next() {
            Activity activity = tools.getActivity();
            if (activity == null || !tools.isResumed()) { tools.resumeDownloads = this; return; }
            try {
                checkPolicy(activity);
                boolean explicitAllowed = (Boolean) invoke("ja.U", "c");
                for (int end = Math.min(position + 16, songs.size()); position < end; position++) {
                    if (tools.cancelled.get()) break;
                    Object song = songs.get(position);
                    if (!explicitAllowed && (Boolean) call(song, "isExplicit")) continue;
                    if ((Boolean) invoke(CONTROLLER, "n", song)) continue;
                    invoke(CONTROLLER, "c", activity, song, false, false, false);
                    requested++;
                }
                tools.setProgress("download_progress", requested, songs.size());
                if (!tools.cancelled.get() && position < songs.size()) main.post(this::next);
                else tools.finishDownloads(requested);
            } catch (ReflectiveOperationException | IOException | RuntimeException exception) {
                tools.failDownloads(requested, exception);
            }
        }
    }
}
