package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kmf extends ugf {
    public int b;
    public final int c;
    public final /* synthetic */ pmf d;

    public kmf(pmf pmfVar) {
        super(1);
        this.d = pmfVar;
        this.b = 0;
        this.c = pmfVar.m();
    }

    @Override // defpackage.ugf
    public final byte a() {
        int i = this.b;
        if (i < this.c) {
            this.b = i + 1;
            return this.d.f(i);
        }
        ywb.n();
        return (byte) 0;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b < this.c;
    }
}
