package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rwd {
    public static final rwd i = new rwd(new rwd(null, 2047), 2012);
    public final boolean a;
    public final boolean b;
    public final rwd c;
    public final boolean d;
    public final rwd e;
    public final rwd f;
    public final boolean g;
    public final boolean h;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ rwd(rwd rwdVar, int i2) {
        boolean z = (i2 & 1) != 0;
        boolean z2 = (i2 & 2) != 0;
        rwd rwdVar2 = (i2 & 32) != 0 ? null : rwdVar;
        this(z, z2, rwdVar2, true, rwdVar2, rwdVar2, (i2 & 512) == 0, (i2 & 1024) == 0);
    }

    public rwd(boolean z, boolean z2, rwd rwdVar, boolean z3, rwd rwdVar2, rwd rwdVar3, boolean z4, boolean z5) {
        this.a = z;
        this.b = z2;
        this.c = rwdVar;
        this.d = z3;
        this.e = rwdVar2;
        this.f = rwdVar3;
        this.g = z4;
        this.h = z5;
    }
}
