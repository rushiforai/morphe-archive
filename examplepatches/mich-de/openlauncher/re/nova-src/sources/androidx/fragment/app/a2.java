package androidx.fragment.app;

import java.io.Writer;

/* loaded from: classes2.dex */
public final class a2 extends Writer {

    /* renamed from: a, reason: collision with root package name */
    public final StringBuilder f14492a = new StringBuilder(128);

    public final void a() {
        StringBuilder sb2 = this.f14492a;
        if (sb2.length() > 0) {
            sb2.toString();
            sb2.delete(0, sb2.length());
        }
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        a();
    }

    @Override // java.io.Writer, java.io.Flushable
    public final void flush() {
        a();
    }

    @Override // java.io.Writer
    public final void write(char[] cArr, int i5, int i11) {
        for (int i12 = 0; i12 < i11; i12++) {
            char c11 = cArr[i5 + i12];
            if (c11 == '\n') {
                a();
            } else {
                this.f14492a.append(c11);
            }
        }
    }
}
