package app.bitchord.telegram;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;

import kotlinx.coroutines.JobKt;

import java.io.*;

/** The host's explicit-download flow uses the same private reader as playback. */
public final class NativeDownloads {
    private NativeDownloads() {}

    public static Long fetch(
            String url,
            OutputStream sink,
            Function2<Long, Long, ?> progress,
            CoroutineContext context)
            throws IOException {
        JobKt.ensureActive(context);
        TelegramBridge bridge = InternalAddon.bridge();
        try (NativeAudio.Reader reader = bridge.audio.open(url, 0, -1)) {
            reader.cancellation = () -> JobKt.ensureActive(context);
            byte[] buffer = new byte[64 * 1024];
            long written = 0;
            int count;
            while ((count = reader.read(buffer, 0, buffer.length)) != -1) {
                JobKt.ensureActive(context);
                sink.write(buffer, 0, count);
                written += count;
                progress.invoke(written, reader.total);
            }
            JobKt.ensureActive(context);
            sink.flush();
            if (written == 0) throw new IOException("Telegram audio file is empty");
            return written;
        }
    }
}
