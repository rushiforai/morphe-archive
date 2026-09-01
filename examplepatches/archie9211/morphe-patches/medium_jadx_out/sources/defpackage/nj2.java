package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nj2 implements yrd {
    public final int b;

    public nj2(int i) {
        this.b = i;
        if (i > 0) {
            return;
        }
        ay0.e("durationMillis must be > 0.");
        throw null;
    }

    @Override // defpackage.yrd
    public final csd a(hsd hsdVar, xx5 xx5Var) {
        return !(xx5Var instanceof w0d) ? new th8(hsdVar, xx5Var) : ((w0d) xx5Var).c == st2.MEMORY_CACHE ? new th8(hsdVar, xx5Var) : new oj2(hsdVar, xx5Var, this.b);
    }
}
