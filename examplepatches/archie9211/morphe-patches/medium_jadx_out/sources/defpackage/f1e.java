package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f1e extends kb2 {
    public static final f1e c = new f1e();

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        r13.d.c.m(runnable, true, false);
    }

    @Override // defpackage.kb2
    public final void F0(ib2 ib2Var, Runnable runnable) {
        r13.d.c.m(runnable, true, true);
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        wgf.f(i);
        return i >= dgd.d ? this : super.H0(i);
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "Dispatchers.IO";
    }
}
