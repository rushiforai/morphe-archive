package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xic extends fqc {
    public long c;

    public xic(long j, long j2) {
        super(j);
        this.c = j2;
    }

    @Override // defpackage.fqc
    public final void a(fqc fqcVar) {
        fqcVar.getClass();
        this.c = ((xic) fqcVar).c;
    }

    @Override // defpackage.fqc
    public final fqc b(long j) {
        return new xic(j, this.c);
    }
}
