package androidx.media3.datasource;

import android.net.Uri;

import java.io.IOException;
import java.util.*;

public interface DataSource {
    void addTransferListener(TransferListener listener);

    long open(DataSpec spec) throws IOException;

    int read(byte[] b, int o, int n) throws IOException;

    Uri getUri();

    Map<String, List<String>> getResponseHeaders();

    void close() throws IOException;
}
