package d7;

import java.io.Closeable;

/* loaded from: classes.dex */
public interface e extends Closeable {
    void bindBlob(int i5, byte[] bArr);

    void bindDouble(int i5, double d5);

    void bindLong(int i5, long j11);

    void bindNull(int i5);

    void bindString(int i5, String str);
}
