/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.androidauto;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/** Complete AA track pages are account-scoped, unlike the shared local copy index. Never persist availability. */
final class AndroidAutoPlaylistTrackStore {
    private final File directory;
    private final Map<String, Long> published = new HashMap<>();

    AndroidAutoPlaylistTrackStore(File directory) {
        this.directory = directory;
    }

    synchronized AndroidAutoPlaylistChildren.Page read(String account, String sourceId) throws IOException {
        File target = file(account, sourceId);
        if (!target.isFile()) return null;
        try (DataInputStream input = new DataInputStream(new BufferedInputStream(new FileInputStream(target)))) {
            if (input.readInt() != 1 || !input.readUTF().equals(account)) throw new IOException("AA track identity");
            String playlistId = input.readUTF();
            int count = input.readInt();
            if (count < 0 || count > 100_000) throw new IOException("AA track count");
            var tracks = new ArrayList<AndroidAutoPlaylistChildren.Track>(count);
            for (int index = 0; index < count; index++) {
                String id = input.readUTF();
                String title = input.readUTF();
                String artist = input.readUTF();
                String artwork = input.readUTF();
                int bytes = input.readInt();
                if (bytes < 0 || bytes > 16 * 1024) throw new IOException("AA track command size");
                byte[] command = new byte[bytes];
                input.readFully(command);
                tracks.add(new AndroidAutoPlaylistChildren.Track(id, title, artist, artwork, command));
            }
            return new AndroidAutoPlaylistChildren.Page(playlistId, java.util.List.copyOf(tracks), "");
        }
    }

    synchronized boolean publish(String account, String sourceId, long loadNumber,
                                 AndroidAutoPlaylistChildren.Page page, boolean complete) throws IOException {
        if (!complete || !page.continuation().isEmpty()) return false;
        File target = file(account, sourceId);
        String key = target.getName();
        if (loadNumber < published.getOrDefault(key, 0L)) return false;
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No AA track directory");

        File pending = new File(target.getPath() + ".part");
        try {
            try (FileOutputStream stream = new FileOutputStream(pending);
                 DataOutputStream output = new DataOutputStream(new BufferedOutputStream(stream))) {
                output.writeInt(1);
                output.writeUTF(account);
                output.writeUTF(page.playlistId());
                output.writeInt(page.tracks().size());
                for (var track : page.tracks()) {
                    output.writeUTF(track.videoId());
                    output.writeUTF(track.title());
                    output.writeUTF(track.artist());
                    output.writeUTF(track.artwork());
                    if (track.command().length > 16 * 1024) throw new IOException("AA track command size");
                    output.writeInt(track.command().length);
                    output.write(track.command());
                }
                output.flush();
                stream.getFD().sync();
            }
            Files.move(pending.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
            published.put(key, loadNumber);
            return true;
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    private File file(String account, String sourceId) {
        if (!account.matches("[a-f0-9]{64}") || !sourceId.matches("[A-Za-z0-9_-]{1,128}")) {
            throw new IllegalArgumentException("Invalid AA track snapshot key");
        }
        return new File(directory, account + "-" + sourceId + ".tracks");
    }
}
