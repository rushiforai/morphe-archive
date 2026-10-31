package io.github.emotionbug.summaryengine;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import static org.junit.Assert.*;

public class PcmChunksTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    private static short[] samples(File file) throws IOException {
        byte[] bytes = Files.readAllBytes(file.toPath());
        ByteBuffer wav = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        assertEquals(0x46464952, wav.getInt(0));
        assertEquals(bytes.length - 8, wav.getInt(4));
        assertEquals(1, wav.getShort(22));
        assertEquals(16000, wav.getInt(24));
        assertEquals(bytes.length - 44, wav.getInt(40));
        short[] result = new short[(bytes.length - 44) / 2];
        wav.position(44);
        for (int i = 0; i < result.length; i++) result[i] = wav.getShort();
        return result;
    }

    @Test public void oppositeChannelsDoNotCancelOrLeak() throws Exception {
        File directory = temporary.newFolder();
        List<short[]> output = new ArrayList<>();
        ByteBuffer pcm = ByteBuffer.allocate(400).order(ByteOrder.LITTLE_ENDIAN);
        for (int i = 0; i < 100; i++) pcm.putShort((short) 16000).putShort((short) -16000);
        pcm.flip();
        try (PcmChunks chunks = new PcmChunks(directory, 16000, 2, () -> {}, (wav, index, channel, count) -> {
            assertEquals(0, index); assertEquals(output.size(), channel); assertEquals(2, count);
            output.add(samples(wav));
        })) { chunks.add(pcm, false); chunks.finish(); }
        assertEquals(2, output.size());
        for (int channel = 0; channel < 2; channel++) {
            assertEquals(100, output.get(channel).length);
            for (short value : output.get(channel)) assertEquals(channel == 0 ? 16000 : -16000, value, 1);
        }
        assertArrayEquals(new String[0], directory.list());
    }

    @Test public void resamplingAndPartialChunksShareOneClock() throws Exception {
        for (int rate : new int[]{8000, 44100, 48000}) {
            File directory = temporary.newFolder();
            List<String> emitted = new ArrayList<>();
            ByteBuffer block = ByteBuffer.allocate(101 * 8).order(ByteOrder.LITTLE_ENDIAN);
            try (PcmChunks chunks = new PcmChunks(directory, rate, 2, () -> {}, (wav, index, channel, count) -> {
                short[] pcm = samples(wav);
                assertEquals(index == 0 ? PcmChunks.RATE * PcmChunks.CHUNK_SECONDS : 4000, pcm.length);
                for (short value : pcm) assertEquals(channel == 0 ? 8192 : -16383, value, 1);
                emitted.add(index + ":" + channel);
            })) {
                int remaining = rate * PcmChunks.CHUNK_SECONDS + rate / 4;
                while (remaining > 0) {
                    int frames = Math.min(remaining, 101);
                    block.clear();
                    for (int i = 0; i < frames; i++) block.putFloat(0.25f).putFloat(-0.5f);
                    block.flip(); chunks.add(block, true); remaining -= frames;
                }
                chunks.finish();
            }
            assertEquals(java.util.Arrays.asList("0:0", "0:1", "1:0", "1:1"), emitted);
            assertArrayEquals(new String[0], directory.list());
        }
    }

    @Test public void silentChannelIsRetainedAlongsideSpeech() throws Exception {
        File directory = temporary.newFolder();
        List<short[]> output = new ArrayList<>();
        ByteBuffer pcm = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        pcm.putShort((short) 0).putShort((short) 4000).putShort((short) 0).putShort((short) 8000);
        pcm.putShort((short) 0).putShort((short) 12000).putShort((short) 0).putShort((short) 16000).flip();
        try (PcmChunks chunks = new PcmChunks(directory, 16000, 2, () -> {},
                (wav, index, channel, count) -> output.add(samples(wav)))) {
            chunks.add(pcm, false); chunks.finish();
        }
        assertArrayEquals(new short[]{0, 0, 0, 0}, output.get(0));
        assertArrayEquals(new short[]{4000, 8000, 12000, 16000}, output.get(1));
    }

    @Test public void truncatedFrameAndNonFiniteFloatAreRejected() throws Exception {
        File directory = temporary.newFolder();
        try (PcmChunks chunks = new PcmChunks(directory, 16000, 2, () -> {},
                (wav, index, channel, count) -> fail("Malformed PCM must not be published"))) {
            assertThrows(IOException.class, () -> chunks.add(ByteBuffer.allocate(2), false));
            ByteBuffer invalid = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putFloat(Float.NaN).putFloat(1f);
            invalid.flip();
            assertThrows(IOException.class, () -> chunks.add(invalid, true));
        }
        assertArrayEquals(new String[0], directory.list());
    }

    @Test public void failedConsumerRemovesEveryChannelScratchFile() throws Exception {
        File directory = temporary.newFolder();
        assertThrows(IOException.class, () -> {
            try (PcmChunks chunks = new PcmChunks(directory, 16000, 2, () -> {},
                    (wav, index, channel, count) -> { throw new IOException("inference failed"); })) {
                chunks.add(ByteBuffer.allocate(8), false); chunks.finish();
            }
        });
        assertArrayEquals(new String[0], directory.list());
    }

    @Test public void cancellationPublishesNothingAndRemovesScratch() throws Exception {
        File directory = temporary.newFolder();
        assertThrows(CancellationException.class, () -> {
            try (PcmChunks chunks = new PcmChunks(directory, 16000, 2,
                    () -> { throw new CancellationException(); },
                    (wav, index, channel, count) -> fail("Cancelled audio must not be published"))) {
                chunks.add(ByteBuffer.allocate(8), false);
            }
        });
        assertArrayEquals(new String[0], directory.list());
    }

    @Test public void monoRemainsMonoAndEmptyAudioFails() throws Exception {
        File directory = temporary.newFolder();
        List<short[]> output = new ArrayList<>();
        try (PcmChunks chunks = new PcmChunks(directory, 16000, 1, () -> {}, (wav, index, channel, count) -> {
            assertEquals(1, count); assertEquals(0, channel); output.add(samples(wav));
        })) {
            ByteBuffer pcm = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putShort((short) 3000).putShort((short) -3000);
            pcm.flip(); chunks.add(pcm, false); chunks.finish();
        }
        assertArrayEquals(new short[]{3000, -3000}, output.get(0));
        try (PcmChunks chunks = new PcmChunks(directory, 16000, 1, () -> {},
                (wav, index, channel, count) -> fail("Empty audio must not be published"))) {
            assertThrows(IOException.class, chunks::finish);
        }
        assertArrayEquals(new String[0], directory.list());
    }
}
