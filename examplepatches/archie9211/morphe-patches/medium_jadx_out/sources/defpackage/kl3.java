package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Lkl3;", "T", "Lu28;", "Lml3;", "material"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class kl3<T> extends u28 {
    public final sl b;
    public final b55 c;
    public final hw8 d;

    public kl3(sl slVar, b55 b55Var, hw8 hw8Var) {
        this.b = slVar;
        this.c = b55Var;
        this.d = hw8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof kl3) {
            kl3 kl3Var = (kl3) obj;
            if (this.b == kl3Var.b && this.c == kl3Var.c && this.d == kl3Var.d) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ml3 ml3Var = new ml3();
        ml3Var.o = this.b;
        ml3Var.p = this.c;
        ml3Var.q = this.d;
        return ml3Var;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ml3 ml3Var = (ml3) q28Var;
        ml3Var.o = this.b;
        ml3Var.p = this.c;
        ml3Var.q = this.d;
    }
}
