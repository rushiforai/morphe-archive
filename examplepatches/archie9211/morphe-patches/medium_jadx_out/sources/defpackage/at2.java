package defpackage;

import java.io.Closeable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class at2 implements Closeable {
    public g8a a;
    public ng2 b;
    public g8a c;
    public s34 d;
    public g8a e;
    public g8a f;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        ((fnb) this.e.get()).close();
    }
}
