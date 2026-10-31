package io.github.emotionbug.patches.runtime;

import java.nio.ByteBuffer;

/** Interleaved PCM16 stereo to PCM16 mono; promote before adding to avoid clipping. */
public final class CloudMonoPcm {
    private CloudMonoPcm() {}

    public static int mix(ByteBuffer stereo, ByteBuffer mono) {
        int frames = Math.min(stereo.remaining() / 4, mono.remaining() / 2);
        for (int i = 0; i < frames; i++) {
            int left = stereo.getShort();
            int right = stereo.getShort();
            mono.putShort((short) ((left + right) / 2));
        }
        return frames;
    }
}
