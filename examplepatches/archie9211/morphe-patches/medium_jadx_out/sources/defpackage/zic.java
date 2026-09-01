package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zic extends fqc {
    public Object c;

    public zic(long j, Object obj) {
        super(j);
        this.c = obj;
    }

    @Override // defpackage.fqc
    public final void a(fqc fqcVar) {
        fqcVar.getClass();
        this.c = ((zic) fqcVar).c;
    }

    @Override // defpackage.fqc
    public final fqc b(long j) {
        return new zic(uic.h().g(), this.c);
    }
}
