package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sof extends ugf {
    public final rlb b;
    public ugf c;

    public sof(uof uofVar) {
        super(1);
        this.b = new rlb(uofVar);
        this.c = b();
    }

    @Override // defpackage.ugf
    public final byte a() {
        ugf ugfVar = this.c;
        if (ugfVar == null) {
            ywb.n();
            return (byte) 0;
        }
        byte bA = ugfVar.a();
        if (!this.c.hasNext()) {
            this.c = b();
        }
        return bA;
    }

    public final kmf b() {
        rlb rlbVar = this.b;
        if (rlbVar.hasNext()) {
            return new kmf(rlbVar.b());
        }
        return null;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.c != null;
    }
}
