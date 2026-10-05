package dev.twitchpatches.extension.diagnostics;

import com.amazonaws.ivs.net.ReadCallback;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.function.Consumer;

final class PlaylistTee implements ReadCallback {
    private static final int LIMIT = 512 * 1024;
    private final ReadCallback original;
    private final Consumer<byte[]> complete;
    private ByteArrayOutputStream captured = new ByteArrayOutputStream();
    private boolean ended;

    PlaylistTee(ReadCallback original, Consumer<byte[]> complete) { this.original = original; this.complete = complete; }
    @Override public int getTimeout() { return original.getTimeout(); }
    @Override public void onData(ByteBuffer data, boolean end) {
        synchronized (this) {
            if (!ended && captured != null) {
                ByteBuffer copy = data.duplicate();
                if (captured.size() + copy.remaining() > LIMIT) captured = null;
                else {
                    byte[] bytes = new byte[copy.remaining()]; copy.get(bytes); captured.write(bytes, 0, bytes.length);
                }
            }
        }
        original.onData(data, end);
        finish(end);
    }
    @Override public void onData(byte[] data, int length, boolean end) {
        synchronized (this) {
            if (!ended && captured != null) {
                if (length < 0 || length > data.length || captured.size() + length > LIMIT) captured = null;
                else captured.write(data, 0, length);
            }
        }
        original.onData(data, length, end);
        finish(end);
    }
    private synchronized void finish(boolean end) {
        if (!end || ended) return;
        ended = true;
        if (captured != null) complete.accept(captured.toByteArray());
        captured = null;
    }
    @Override public void onError(Exception error) {
        synchronized (this) { ended = true; captured = null; }
        original.onError(error);
    }
}
