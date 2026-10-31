package a80;

import t70.c0;
import y70.p;

/* loaded from: classes.dex */
public final class e extends h {

    /* renamed from: d, reason: collision with root package name */
    public static final e f490d;

    static {
        int i5 = k.f498c;
        int i11 = k.f499d;
        long j11 = k.f500e;
        String str = k.f496a;
        e eVar = new e();
        eVar.f492c = new c(i5, j11, i11, str);
        f490d = eVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new UnsupportedOperationException("Dispatchers.Default cannot be closed");
    }

    @Override // t70.c0
    public final c0 f0(int i5, String str) {
        y70.g.a(1);
        return 1 >= k.f498c ? str != null ? new p(this, str) : this : super.f0(1, str);
    }

    @Override // t70.c0
    public final String toString() {
        return "Dispatchers.Default";
    }
}
