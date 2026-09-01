package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xn0 implements vbb {
    public final va6 a;

    public /* synthetic */ xn0(va6 va6Var) {
        this.a = va6Var;
    }

    @Override // defpackage.vbb
    public final Object a(jva jvaVar) {
        return c1e.a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof xn0) {
            return this.a.equals(((xn0) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "BaseRequestDelegate(job=" + this.a + ')';
    }

    @Override // defpackage.vbb
    public final void b() {
    }

    @Override // defpackage.vbb
    public final void c() {
    }

    @Override // defpackage.vbb
    public final void start() {
    }
}
