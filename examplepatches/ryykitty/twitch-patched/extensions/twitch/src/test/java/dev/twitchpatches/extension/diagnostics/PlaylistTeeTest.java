package dev.twitchpatches.extension.diagnostics;

import com.amazonaws.ivs.net.ReadCallback;
import java.nio.ByteBuffer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

public final class PlaylistTeeTest {
    private static final class Sink implements ReadCallback {
        ByteBuffer seen;
        Exception error;
        int bytes, callbacks;
        @Override public int getTimeout() { return 17; }
        @Override public void onData(ByteBuffer data, boolean end) {
            seen = data; callbacks++; bytes += data.remaining(); data.position(data.limit());
        }
        @Override public void onData(byte[] data, int length, boolean end) { bytes += length; callbacks++; }
        @Override public void onError(Exception exception) { error = exception; }
    }

    @Test public void callbackReceivesOriginalBufferWithPositionAndTimeoutPreserved() {
        Sink sink = new Sink(); List<byte[]> captured = new ArrayList<>();
        PlaylistTee tee = new PlaylistTee(sink, captured::add);
        ByteBuffer buffer = ByteBuffer.allocateDirect(8); buffer.put(new byte[] {9, 8, 1, 2, 3, 4});
        buffer.flip(); buffer.position(2); buffer.limit(5);
        assertEquals(17, tee.getTimeout()); tee.onData(buffer, false);
        assertSame(buffer, sink.seen); assertEquals(3, sink.bytes); assertTrue(captured.isEmpty());
        tee.onData(new byte[] {5, 6, 99}, 2, true);
        assertArrayEquals(new byte[] {1, 2, 3, 5, 6}, captured.get(0));
        assertEquals(2, sink.callbacks);
    }

    @Test public void oversizedCaptureIsDroppedButOriginalContentStillArrives() {
        Sink sink = new Sink(); List<byte[]> captured = new ArrayList<>();
        PlaylistTee tee = new PlaylistTee(sink, captured::add);
        byte[] data = new byte[512 * 1024 + 1]; tee.onData(data, data.length, true);
        assertEquals(data.length, sink.bytes); assertEquals(1, sink.callbacks); assertTrue(captured.isEmpty());
    }

    @Test public void OriginalErrorRemainsTheSameAndDoesNotBecomeCompletedObservation() {
        Sink sink = new Sink(); List<byte[]> captured = new ArrayList<>();
        PlaylistTee tee = new PlaylistTee(sink, captured::add);
        tee.onData(new byte[] {1}, 1, false); IOException error = new IOException("test failure");
        tee.onError(error); assertSame(error, sink.error); assertTrue(captured.isEmpty());
    }
}
