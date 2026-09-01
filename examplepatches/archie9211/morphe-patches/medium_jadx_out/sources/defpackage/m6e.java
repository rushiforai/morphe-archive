package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m6e {
    public final boolean a;
    public final int b;
    public final Throwable c;

    public m6e(boolean z, int i, Throwable th, int i2) {
        i = (i2 & 2) != 0 ? 0 : i;
        th = (i2 & 4) != 0 ? null : th;
        this.a = z;
        this.b = i;
        this.c = th;
    }
}
