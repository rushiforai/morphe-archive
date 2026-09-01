package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pv1 implements wid {
    public final long a;

    public pv1(long j) {
        this.a = j;
        if (j != 16) {
            return;
        }
        c26.a("ColorStyle value must be specified, use TextForegroundStyle.Unspecified instead.");
    }

    @Override // defpackage.wid
    public final float a() {
        return uu1.c(this.a);
    }

    @Override // defpackage.wid
    public final long b() {
        return this.a;
    }

    @Override // defpackage.wid
    public final /* synthetic */ wid c(wid widVar) {
        return wgd.b(this, widVar);
    }

    @Override // defpackage.wid
    public final wid d(m45 m45Var) {
        return !equals(vid.a) ? this : (wid) m45Var.invoke();
    }

    @Override // defpackage.wid
    public final ez0 e() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pv1)) {
            return false;
        }
        long j = ((pv1) obj).a;
        int i = uu1.i;
        return ezd.a(this.a, j);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.a);
    }

    public final String toString() {
        return "ColorStyle(value=" + ((Object) uu1.h(this.a)) + ')';
    }
}
