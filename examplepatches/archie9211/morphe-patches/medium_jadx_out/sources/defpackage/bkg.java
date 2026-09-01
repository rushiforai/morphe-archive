package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bkg extends akg {
    public final long[] d;

    /* JADX WARN: Illegal instructions before constructor call */
    public bkg(zjf zjfVar) {
        long[] jArr = new long[10];
        long[] jArr2 = new long[10];
        long[] jArr3 = new long[10];
        long[] jArr4 = new long[10];
        super(jArr, jArr2, jArr4);
        this.d = jArr3;
        tag tagVar = (tag) zjfVar.b;
        vv2.f0(jArr, (long[]) tagVar.b, (long[]) tagVar.a);
        vv2.g0(jArr2, (long[]) tagVar.b, (long[]) tagVar.a);
        System.arraycopy((long[]) tagVar.c, 0, jArr3, 0, 10);
        vv2.j0(jArr4, (long[]) zjfVar.c, ekg.b);
    }

    @Override // defpackage.akg
    public final void a(long[] jArr, long[] jArr2) {
        vv2.j0(jArr, jArr2, this.d);
    }
}
