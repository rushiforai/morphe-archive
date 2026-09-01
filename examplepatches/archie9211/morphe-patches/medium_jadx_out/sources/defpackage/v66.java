package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v66 {
    public final int a;
    public final int b;
    public final it6 c;

    public v66(int i, int i2, it6 it6Var) {
        this.a = i;
        this.b = i2;
        this.c = it6Var;
        if (i < 0) {
            e26.a("startIndex should be >= 0");
        }
        if (i2 > 0) {
            return;
        }
        e26.a("size should be > 0");
    }
}
