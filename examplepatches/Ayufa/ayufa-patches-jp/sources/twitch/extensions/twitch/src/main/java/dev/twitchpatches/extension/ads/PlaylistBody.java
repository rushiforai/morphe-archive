package dev.twitchpatches.extension.ads;

import com.amazonaws.ivs.net.ReadCallback;
import com.amazonaws.ivs.net.Request;
import com.amazonaws.ivs.net.Response;
import com.amazonaws.ivs.net.StreamConsumer;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

final class PlaylistBody implements ReadCallback {
    static final int LIMIT = 512 * 1024;
    interface Completion { void complete(byte[] body); void error(Exception error); }
    private final ByteArrayOutputStream bytes = new ByteArrayOutputStream();
    private final Completion completion;
    private boolean ended;

    PlaylistBody(Completion completion) { this.completion = completion; }
    @Override public int getTimeout() { return 2; }
    @Override public synchronized void onData(ByteBuffer data, boolean end) {
        byte[] chunk = new byte[data.remaining()];
        data.get(chunk);
        onData(chunk, chunk.length, end);
    }
    @Override public synchronized void onData(byte[] data, int length, boolean end) {
        if (ended) return;
        if (length < 0 || length > data.length || bytes.size() + length > LIMIT) {
            onError(new IOException("Playlist exceeds the supported size"));
            return;
        }
        bytes.write(data, 0, length);
        if (end) { ended = true; completion.complete(bytes.toByteArray()); }
    }
    @Override public synchronized void onError(Exception error) {
        if (!ended) { ended = true; completion.error(error); }
    }

    static Response response(Request request, Response original, byte[] body) {
        Response response = new Response(original.getStatus(), original.getUrl());
        response.setHeader("Content-Type", "application/vnd.apple.mpegurl");
        response.setHeader("Content-Length", Integer.toString(body.length));
        response.setHeader("Cache-Control", "no-store");
        for (String name : new String[] {"Date", "Last-Modified", "ETag"}) {
            String value = original.getHeader(name);
            if (value != null) response.setHeader(name, value);
        }
        response.setConsumer(null, new StreamConsumer() {
            @Override public void consume(ReadCallback callback) {
                synchronized (request.lock()) {
                    if (request.isCancelled()) return;
                    ByteBuffer buffer = ByteBuffer.allocateDirect(body.length);
                    buffer.put(body);
                    ((java.nio.Buffer) buffer).flip();
                    callback.onData(buffer, true);
                }
            }
        });
        return response;
    }

    static String text(byte[] body) { return new String(body, StandardCharsets.UTF_8); }
}
