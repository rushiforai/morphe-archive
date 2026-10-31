package app.bitchord.telegram;

import android.net.Uri;

import androidx.media3.datasource.*;

import java.io.IOException;
import java.util.*;

/** Media3 adapter reached after BitChord resolves a source, below its existing cache. */
public final class TelegramDataSource extends BaseDataSource {
    private NativeAudio.Reader reader;
    private Uri uri;
    private boolean started;

    public TelegramDataSource() {
        super(true);
    }

    @Override
    public long open(DataSpec spec) throws IOException {
        if (reader != null) throw new IOException("Telegram data source is already open");
        transferInitializing(spec);
        try {
            TelegramBridge bridge = InternalAddon.bridge();
            reader = bridge.audio.open(spec.uri.toString(), spec.position, spec.length);
            uri = spec.uri;
            transferStarted(spec);
            started = true;
            return reader.remaining();
        } catch (IOException | RuntimeException e) {
            close();
            throw e;
        }
    }

    @Override
    public int read(byte[] buffer, int offset, int length) throws IOException {
        if (length == 0) return 0;
        if (reader == null) throw new IOException("Telegram data source is not open");
        int read = reader.read(buffer, offset, length);
        if (read > 0) bytesTransferred(read);
        return read;
    }

    @Override
    public Uri getUri() {
        return uri;
    }

    @Override
    public Map<String, List<String>> getResponseHeaders() {
        if (reader == null) return Collections.emptyMap();
        Map<String, List<String>> headers = new HashMap<>();
        headers.put("Content-Length", Collections.singletonList(Long.toString(reader.total)));
        headers.put("Content-Type", Collections.singletonList(reader.mime));
        return Collections.unmodifiableMap(headers);
    }

    @Override
    public void close() {
        try {
            if (reader != null) reader.close();
        } finally {
            reader = null;
            uri = null;
            if (started) {
                started = false;
                transferEnded();
            }
        }
    }

    /**
     * Installed in ResolvingDataSource's constructor, so resolved native identifiers never reach
     * HTTP.
     */
    public static DataSource wrap(DataSource downstream) {
        return new Routing(downstream);
    }

    private static final class Routing implements DataSource {
        final DataSource downstream;
        final TelegramDataSource telegram = new TelegramDataSource();
        DataSource active;

        Routing(DataSource downstream) {
            this.downstream = downstream;
        }

        public void addTransferListener(TransferListener listener) {
            downstream.addTransferListener(listener);
            telegram.addTransferListener(listener);
        }

        public long open(DataSpec spec) throws IOException {
            if (active != null) throw new IOException("Data source already open");
            active = InternalAddon.reserved(spec.uri.toString()) ? telegram : downstream;
            return active.open(spec);
        }

        public int read(byte[] buffer, int offset, int length) throws IOException {
            if (active == null) throw new IOException("Data source not open");
            return active.read(buffer, offset, length);
        }

        public Uri getUri() {
            return active == null ? null : active.getUri();
        }

        public Map<String, List<String>> getResponseHeaders() {
            return active == null ? Collections.emptyMap() : active.getResponseHeaders();
        }

        public void close() throws IOException {
            try {
                if (active != null) active.close();
            } finally {
                active = null;
            }
        }
    }
}
