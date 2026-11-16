/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
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
import java.util.List;

/** Complete, ordered catalogs only. Account keys are hashes, never credentials or native objects. */
final class AndroidAutoPlaylistCatalog {
    record Entry(String id, String title, String subtitle, String artwork) {}
    record Load(String account, long generation, long number) {}

    private static final int FORMAT = 1;
    private final File directory;
    private String account = "";
    private long generation;
    private long loadNumber;
    private long publishedNumber;

    AndroidAutoPlaylistCatalog(File directory) {
        this.directory = directory;
    }

    synchronized void selectAccount(String selected) {
        if (account.equals(selected)) return;

        account = selected;
        generation++;
        publishedNumber = 0;
    }

    synchronized Load begin() {
        return new Load(account, generation, ++loadNumber);
    }

    synchronized boolean owns(Load load) {
        return account.equals(load.account()) && generation == load.generation();
    }

    synchronized boolean hasSnapshot() {
        return !account.isEmpty() && file(account).isFile();
    }

    synchronized List<Entry> read() throws IOException {
        return account.isEmpty() ? List.of() : read(account);
    }

    /** A timeout, failed page, superseded account or older completion can never replace a complete catalog. */
    synchronized boolean publish(Load load, List<Entry> entries, boolean complete) throws IOException {
        if (account.isEmpty() || !complete || !owns(load) || load.number() < publishedNumber) return false;

        List<Entry> snapshot = List.copyOf(entries);
        File target = file(account);
        if (target.isFile() && read(account).equals(snapshot)) {
            publishedNumber = load.number();
            return false;
        }
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No AA catalog directory");

        File pending = new File(target.getPath() + ".part");
        try {
            try (FileOutputStream stream = new FileOutputStream(pending);
                 DataOutputStream output = new DataOutputStream(new BufferedOutputStream(stream))) {
                output.writeInt(FORMAT);
                output.writeUTF(account);
                output.writeInt(snapshot.size());
                for (Entry entry : snapshot) {
                    output.writeUTF(entry.id());
                    output.writeUTF(entry.title());
                    output.writeUTF(entry.subtitle());
                    output.writeUTF(entry.artwork());
                }
                output.flush();
                stream.getFD().sync();
            }
            Files.move(pending.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
            publishedNumber = load.number();
            return true;
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    private List<Entry> read(String key) throws IOException {
        File target = file(key);
        if (!target.isFile()) return List.of();

        try (DataInputStream input = new DataInputStream(new BufferedInputStream(new FileInputStream(target)))) {
            if (input.readInt() != FORMAT || !input.readUTF().equals(key)) throw new IOException("AA catalog identity");
            int count = input.readInt();
            if (count < 0 || count > 100_000) throw new IOException("AA catalog size");

            List<Entry> entries = new ArrayList<>(count);
            for (int index = 0; index < count; index++) {
                entries.add(new Entry(input.readUTF(), input.readUTF(), input.readUTF(), input.readUTF()));
            }
            return List.copyOf(entries);
        }
    }

    private File file(String key) {
        if (!key.matches("[a-f0-9]{64}")) throw new IllegalArgumentException("Invalid AA account key");
        return new File(directory, key + ".catalog");
    }
}
