package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rp8 extends fdb {
    public final fn7 c;
    public final long d;

    public rp8(fn7 fn7Var, long j) {
        this.c = fn7Var;
        this.d = j;
    }

    @Override // defpackage.fdb
    public final long f() {
        return this.d;
    }

    @Override // defpackage.fdb
    public final fn7 m() {
        return this.c;
    }

    @Override // defpackage.fdb
    public final zz0 v0() {
        throw new IllegalStateException("Cannot read raw response body of a converted body.");
    }
}
