package io.github.emotionbug.patches.adot.summary;

import io.github.emotionbug.patches.runtime.CloudMonoFiles;
import io.github.emotionbug.patches.runtime.CloudMonoPcm;
import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.io.RandomAccessFile;
import java.util.concurrent.TimeUnit;
import org.junit.Test;
import static org.junit.Assert.*;

public final class CloudMonoRuntimeTest {
    @Test public void averagingKeepsBothSpeakersAndCannotOverflowPcm16() {
        ByteBuffer source = ByteBuffer.allocate(24).order(ByteOrder.LITTLE_ENDIAN);
        for (short value : new short[] {32767, 32767, -32768, -32768, 32767, -32768, 16000, 0, 0, -16000, 12000, 8000}) source.putShort(value);
        source.flip();
        ByteBuffer output = ByteBuffer.allocate(12).order(ByteOrder.LITTLE_ENDIAN);
        assertEquals(6, CloudMonoPcm.mix(source, output));
        output.flip();
        for (short expected : new short[] {32767, -32768, 0, 8000, -8000, 10000}) assertEquals(expected, output.getShort());
        assertFalse(source.hasRemaining());
    }

    @Test public void boundedEncoderInputLeavesWholeUnconsumedStereoFrames() {
        ByteBuffer source = ByteBuffer.allocate(12).order(ByteOrder.LITTLE_ENDIAN);
        for (short value : new short[] {10, 20, 30, 40, 50, 60}) source.putShort(value);
        source.flip();
        ByteBuffer output = ByteBuffer.allocate(3).order(ByteOrder.LITTLE_ENDIAN);
        assertEquals(1, CloudMonoPcm.mix(source, output)); assertEquals(4, source.position());
        assertEquals(15, output.getShort(0));
        output.clear(); assertEquals(1, CloudMonoPcm.mix(source, output)); assertEquals(35, output.getShort(0));
    }

    @Test public void orphanSweepNeverDeletesLiveInputsOrUnownedRecordings() throws Exception {
        File cache = Files.createTempDirectory("cloud-mono-lease-test").toFile();
        File root = new File(cache, "ebpatcher-cloud-mono-v1");
        File master = new File(cache, "stereo-master.m4a");
        Files.write(master.toPath(), new byte[] {1, 2, 3});
        try (CloudMonoFiles.Lease first = CloudMonoFiles.create(cache)) {
            File unrelated = new File(root, "user-recording.m4a");
            Files.write(unrelated.toPath(), new byte[] {4});
            File orphan = new File(root, "audio-00000000-0000-0000-0000-000000000000.m4a");
            Files.write(orphan.toPath(), new byte[] {5}); // Unlocked: a process-death remnant.
            File orphanMarker = new File(root, orphan.getName().replace(".m4a", ".lock"));
            Files.createFile(orphanMarker.toPath());
            File unpaired = new File(root, "audio-11111111-1111-1111-1111-111111111111.m4a");
            Files.write(unpaired.toPath(), new byte[] {6});
            // Simulate MediaMuxer and the HTTP InputStream opening/closing the media inode.
            try (RandomAccessFile media = new RandomAccessFile(first.file, "rw")) { media.write(7); }
            try (CloudMonoFiles.Lease second = CloudMonoFiles.create(cache)) {
                assertTrue(first.file.exists()); assertTrue(second.file.exists());
                assertFalse(orphan.exists()); assertTrue(unrelated.exists());
                assertFalse(orphanMarker.exists()); assertTrue(unpaired.exists());
                File marker = new File(root, first.file.getName().replace(".m4a", ".lock"));
                Process probe = new ProcessBuilder(new File(System.getProperty("java.home"), "bin/java").getPath(),
                        "-cp", new File(CloudMonoRuntimeTest.class.getProtectionDomain().getCodeSource().getLocation().toURI()).getPath(),
                        LockProbe.class.getName(), marker.getPath()).start();
                try {
                    assertTrue("Lease probe did not finish", probe.waitFor(10, TimeUnit.SECONDS));
                    assertEquals("Media reads and another sweep must not release the active process lock", 0, probe.exitValue());
                } finally { probe.destroyForcibly(); }
                assertArrayEquals(new byte[] {1, 2, 3}, Files.readAllBytes(master.toPath()));
                second.close(); assertFalse(second.file.exists());
            }
            first.close(); assertFalse(first.file.exists());
            Files.delete(unrelated.toPath());
            Files.delete(unpaired.toPath());
        } finally {
            Files.deleteIfExists(master.toPath()); Files.deleteIfExists(new File(root, ".guard").toPath());
            Files.deleteIfExists(root.toPath()); Files.deleteIfExists(cache.toPath());
        }
    }
    /** Separate process observes the OS lock, not Java's same-process overlapping-lock registry. */
    public static final class LockProbe {
        public static void main(String[] args) throws Exception {
            try (RandomAccessFile file = new RandomAccessFile(args[0], "rw");
                 var lock = file.getChannel().tryLock()) {
                if (lock != null) System.exit(1);
            }
        }
    }
}
