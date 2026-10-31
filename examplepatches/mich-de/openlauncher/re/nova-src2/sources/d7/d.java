package d7;

import java.io.Closeable;

/* loaded from: classes.dex */
public interface d extends Closeable {
    a getWritableDatabase();

    void setWriteAheadLoggingEnabled(boolean z11);
}
