package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dkc extends ez0 {
    public final long a;

    public dkc(long j) {
        this.a = j;
    }

    @Override // defpackage.ez0
    public final void a(float f, long j, uq uqVar) {
        uqVar.c(1.0f);
        long jB = this.a;
        if (f != 1.0f) {
            jB = uu1.b(uu1.c(jB) * f, jB);
        }
        uqVar.e(jB);
        if (uqVar.c != null) {
            uqVar.h(null);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dkc)) {
            return false;
        }
        long j = ((dkc) obj).a;
        int i = uu1.i;
        return ezd.a(this.a, j);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.a);
    }

    public final String toString() {
        return "SolidColor(value=" + ((Object) uu1.h(this.a)) + ')';
    }
}
