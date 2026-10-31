package io.github.emotionbug.summaryengine;

import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;

/** Private per-recording state. Parent owns deletion, including after successful inference. */
final class TranscriptCheckpoints implements AutoCloseable {
    private final File directory;
    private final FileDescriptor audio;
    private final String identity;
    private final RandomAccessFile lockFile;
    private final FileLock lock;

    TranscriptCheckpoints(File cache, FileDescriptor audio) throws Exception {
        this.audio = audio;
        this.identity = identity(audio);
        directory = new File(cache, "transcript-checkpoints");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Cannot create transcript checkpoint directory");
        lockFile = new RandomAccessFile(new File(directory, "lock"), "rw");
        FileLock acquired;
        try { acquired = lockFile.getChannel().tryLock(); }
        catch (OverlappingFileLockException e) { lockFile.close(); throw new IOException("Another summary is using this recording", e); }
        catch (Exception e) { lockFile.close(); throw e; }
        if (acquired == null) { lockFile.close(); throw new IOException("Another summary is using this recording"); }
        lock = acquired;
        try {
            File manifest = new File(directory, "identity");
            String previous = null;
            if (manifest.exists()) try (DataInputStream input = new DataInputStream(new FileInputStream(manifest))) {
                previous = input.readUTF();
            }
            if (!identity.equals(previous)) {
                File[] files = directory.listFiles();
                if (files == null) throw new IOException("Cannot enumerate stale transcript checkpoints");
                for (File file : files) if (!file.getName().equals("lock") && !file.delete())
                    throw new IOException("Cannot invalidate checkpoints for a changed recording");
                atomicWrite(manifest, identity);
            }
        } catch (Exception e) { close(); throw e; }
    }

    private static String identity(FileDescriptor descriptor) throws Exception {
        StructStat stat = Os.fstat(descriptor);
        if (!OsConstants.S_ISREG(stat.st_mode) || stat.st_size <= 0)
            throw new IOException("Recording must be a non-empty seekable local file");
        return WhisperAsr.IDENTITY
                + ":pcm16-separate-channels16k-area-" + PcmChunks.CHUNK_SECONDS + "s-segments-v4:"
                + stat.st_dev + ":" + stat.st_ino + ":"
                + stat.st_size + ":" + stat.st_mtime + ":" + stat.st_ctime;
    }

    void checkUnchanged() throws Exception {
        if (!identity.equals(identity(audio))) throw new IOException("Recording changed during transcription; no partial summary was accepted");
    }

    WhisperAsr.Result read(long index) throws Exception {
        checkUnchanged();
        File file = new File(directory, index + ".chunk");
        if (!file.exists()) return null;
        try (DataInputStream input = new DataInputStream(new FileInputStream(file))) {
            WhisperAsr.Result result = WhisperAsr.Result.read(input, PcmChunks.CHUNK_SECONDS * 1000L);
            if (input.read() != -1)
                throw new IOException("Invalid transcript checkpoint; remove this recording's local summary data and retry");
            return result;
        }
    }

    void save(long index, WhisperAsr.Result result) throws Exception {
        checkUnchanged();
        atomicWrite(new File(directory, index + ".chunk"), result::write);
    }

    private interface Writer { void write(DataOutputStream output) throws IOException; }

    private void atomicWrite(File destination, String value) throws Exception {
        atomicWrite(destination, output -> output.writeUTF(value));
    }

    private void atomicWrite(File destination, Writer writer) throws Exception {
        File temporary = new File(directory, destination.getName() + ".pending");
        try (FileOutputStream file = new FileOutputStream(temporary); DataOutputStream output = new DataOutputStream(file)) {
            writer.write(output); output.flush(); file.getFD().sync();
        }
        Os.rename(temporary.getAbsolutePath(), destination.getAbsolutePath());
        FileDescriptor dir = Os.open(directory.getAbsolutePath(), OsConstants.O_RDONLY, 0);
        try {
            if (!OsConstants.S_ISDIR(Os.fstat(dir).st_mode)) throw new IOException("Checkpoint parent is not a directory");
            Os.fsync(dir);
        } finally { Os.close(dir); }
    }

    @Override public void close() throws IOException {
        try { lock.release(); } finally { lockFile.close(); }
    }
}
