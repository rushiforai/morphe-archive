package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ld8c;", "Lu28;", "Le8c;", "shimmer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class d8c extends u28 {
    public y7c b;
    public c8c c;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d8c)) {
            return false;
        }
        d8c d8cVar = (d8c) obj;
        return g76.L(this.b, d8cVar.b) && g76.L(this.c, d8cVar.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        y7c y7cVar = this.b;
        c8c c8cVar = this.c;
        y7cVar.getClass();
        c8cVar.getClass();
        e8c e8cVar = new e8c();
        e8cVar.o = y7cVar;
        e8cVar.p = c8cVar;
        return e8cVar;
    }

    public final int hashCode() {
        return this.c.hashCode() + (this.b.hashCode() * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        e8c e8cVar = (e8c) q28Var;
        e8cVar.getClass();
        y7c y7cVar = this.b;
        y7cVar.getClass();
        e8cVar.o = y7cVar;
        c8c c8cVar = this.c;
        c8cVar.getClass();
        e8cVar.p = c8cVar;
    }

    public final String toString() {
        return "ShimmerElement(area=" + this.b + ", effect=" + this.c + ')';
    }
}
