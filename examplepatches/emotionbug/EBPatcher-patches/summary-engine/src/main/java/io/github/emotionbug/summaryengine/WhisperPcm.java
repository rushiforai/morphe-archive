package io.github.emotionbug.summaryengine;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;

/** Reads only the canonical bounded PCM16 WAVs emitted by PcmChunks. */
final class WhisperPcm {
    final ByteBuffer data = ByteBuffer.allocateDirect(PcmChunks.RATE * PcmChunks.CHUNK_SECONDS * 4)
            .order(ByteOrder.nativeOrder());
    private final FloatBuffer floats = data.asFloatBuffer();
    private final byte[] bytes = new byte[8192];
    private final ByteBuffer header = ByteBuffer.wrap(new byte[44]).order(ByteOrder.LITTLE_ENDIAN);

    int read(File wav, PcmChunks.Cancellation cancelled) throws IOException {
        try (RandomAccessFile input = new RandomAccessFile(wav, "r")) {
            input.readFully(header.array());
            int size = header.getInt(40);
            if (header.getInt(0) != 0x46464952 || header.getInt(8) != 0x45564157
                    || header.getInt(12) != 0x20746d66 || header.getInt(16) != 16
                    || header.getShort(20) != 1 || header.getShort(22) != 1
                    || header.getInt(24) != PcmChunks.RATE || header.getInt(28) != PcmChunks.RATE * 2
                    || header.getShort(32) != 2 || header.getShort(34) != 16
                    || header.getInt(36) != 0x61746164 || size <= 0 || (size & 1) != 0
                    || size > PcmChunks.RATE * PcmChunks.CHUNK_SECONDS * 2
                    || header.getInt(4) != size + 36 || input.length() != size + 44L)
                throw new IOException("Whisper requires a bounded 16 kHz mono PCM16 chunk");
            floats.clear();
            for (int remaining = size; remaining > 0;) {
                cancelled.check();
                int count = Math.min(remaining, bytes.length);
                input.readFully(bytes, 0, count);
                for (int i = 0; i < count; i += 2)
                    floats.put((short) ((bytes[i] & 255) | (bytes[i + 1] << 8)) / 32768.0f);
                remaining -= count;
            }
            return size / 2;
        }
    }
}
