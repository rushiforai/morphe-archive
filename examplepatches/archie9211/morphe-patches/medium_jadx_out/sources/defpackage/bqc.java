package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bqc extends fqc {
    public y1 c;
    public int d;
    public int e;

    public bqc(long j, y1 y1Var) {
        super(j);
        this.c = y1Var;
    }

    @Override // defpackage.fqc
    public final void a(fqc fqcVar) {
        synchronized (g01.r) {
            fqcVar.getClass();
            this.c = ((bqc) fqcVar).c;
            this.d = ((bqc) fqcVar).d;
            this.e = ((bqc) fqcVar).e;
        }
    }

    @Override // defpackage.fqc
    public final fqc b(long j) {
        return new bqc(j, this.c);
    }
}
