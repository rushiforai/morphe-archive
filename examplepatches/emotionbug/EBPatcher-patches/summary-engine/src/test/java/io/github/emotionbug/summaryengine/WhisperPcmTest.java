package io.github.emotionbug.summaryengine;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.util.concurrent.CancellationException;
import static org.junit.Assert.*;

public class WhisperPcmTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    private File wav(short... samples) throws IOException {
        ByteBuffer bytes = ByteBuffer.allocate(44 + samples.length * 2).order(ByteOrder.LITTLE_ENDIAN);
        bytes.putInt(0x46464952).putInt(36 + samples.length * 2).putInt(0x45564157);
        bytes.putInt(0x20746d66).putInt(16).putShort((short) 1).putShort((short) 1);
        bytes.putInt(16000).putInt(32000).putShort((short) 2).putShort((short) 16);
        bytes.putInt(0x61746164).putInt(samples.length * 2);
        for (short sample : samples) bytes.putShort(sample);
        File file = temporary.newFile();
        Files.write(file.toPath(), bytes.array());
        return file;
    }

    @Test public void signedPcmConversionIsExactAndReusesNativeBuffer() throws Exception {
        WhisperPcm reader = new WhisperPcm();
        ByteBuffer original = reader.data;
        assertTrue(original.isDirect());
        assertEquals(4, reader.read(wav(Short.MIN_VALUE, (short) 0, (short) 16384, Short.MAX_VALUE), () -> {}));
        assertEquals(-1f, original.getFloat(0), 0f);
        assertEquals(0f, original.getFloat(4), 0f);
        assertEquals(0.5f, original.getFloat(8), 0f);
        assertEquals(32767f / 32768f, original.getFloat(12), 0f);
        assertEquals(1, reader.read(wav((short) -16384), () -> {}));
        assertSame(original, reader.data);
        assertEquals(-0.5f, original.getFloat(0), 0f);
    }

    @Test public void fullWindowRetainsLastSampleAndCancellationCanStopMidRead() throws Exception {
        WhisperPcm reader = new WhisperPcm();
        short[] samples = new short[PcmChunks.RATE * PcmChunks.CHUNK_SECONDS];
        samples[0] = 8192;
        samples[samples.length - 1] = -16384;
        File file = wav(samples);
        assertEquals(samples.length, reader.read(file, () -> {}));
        assertEquals(0.25f, reader.data.getFloat(0), 0f);
        assertEquals(-0.5f, reader.data.getFloat((samples.length - 1) * 4), 0f);
        int[] checks = {0};
        assertThrows(CancellationException.class, () -> reader.read(file, () -> {
            if (++checks[0] == 2) throw new CancellationException();
        }));
        assertEquals(2, checks[0]);
    }

    @Test public void rejectsStereoWrongRateTruncationAndOversizedChunk() throws Exception {
        WhisperPcm reader = new WhisperPcm();
        for (int offset : new int[]{22, 24, 40}) {
            File file = wav((short) 1);
            byte[] bytes = Files.readAllBytes(file.toPath());
            bytes[offset] ^= 3;
            Files.write(file.toPath(), bytes);
            assertThrows(IOException.class, () -> reader.read(file, () -> {}));
        }
        File truncated = wav((short) 1);
        Files.write(truncated.toPath(), new byte[43]);
        assertThrows(IOException.class, () -> reader.read(truncated, () -> {}));
        File oversized = wav(new short[PcmChunks.RATE * PcmChunks.CHUNK_SECONDS + 1]);
        assertThrows(IOException.class, () -> reader.read(oversized, () -> {}));
    }

    @Test public void cancellationPreventsPcmConsumption() throws Exception {
        WhisperPcm reader = new WhisperPcm();
        assertThrows(CancellationException.class, () -> reader.read(wav((short) 1),
                () -> { throw new CancellationException(); }));
    }

    @Test public void emittedChannelChunksAreDirectWhisperInputs() throws Exception {
        WhisperPcm reader = new WhisperPcm();
        int[] count = {0};
        ByteBuffer source = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        for (int i = 0; i < 4; i++) source.putShort((short) 8000).putShort((short) -8000);
        source.flip();
        try (PcmChunks chunks = new PcmChunks(temporary.newFolder(), 16000, 2, () -> {},
                (file, index, channel, channels) -> {
                    assertEquals(0, index); assertEquals(2, channels);
                    assertEquals(4, reader.read(file, () -> {}));
                    for (int i = 0; i < 4; i++)
                        assertEquals((channel == 0 ? 8000f : -8000f) / 32768f, reader.data.getFloat(i * 4), 1f / 32768f);
                    count[0]++;
                })) {
            chunks.add(source, false); chunks.finish();
        }
        assertEquals(2, count[0]);
    }
}
