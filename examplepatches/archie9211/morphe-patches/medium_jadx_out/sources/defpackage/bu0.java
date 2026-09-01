package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lbu0;", "Lu28;", "Lau0;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class bu0 extends u28 {
    public final float b;
    public final dkc c;
    public final m3c d;

    public bu0(float f, dkc dkcVar, m3c m3cVar) {
        this.b = f;
        this.c = dkcVar;
        this.d = m3cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bu0)) {
            return false;
        }
        bu0 bu0Var = (bu0) obj;
        return vj3.b(this.b, bu0Var.b) && this.c.equals(bu0Var.c) && g76.L(this.d, bu0Var.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new au0(this.b, this.c, this.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (Float.floatToIntBits(this.b) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        au0 au0Var = (au0) q28Var;
        float f = au0Var.r;
        c31 c31Var = au0Var.u;
        float f2 = this.b;
        if (!vj3.b(f, f2)) {
            au0Var.r = f2;
            c31Var.I0();
        }
        dkc dkcVar = au0Var.s;
        dkc dkcVar2 = this.c;
        if (!g76.L(dkcVar, dkcVar2)) {
            au0Var.s = dkcVar2;
            c31Var.I0();
        }
        m3c m3cVar = au0Var.t;
        m3c m3cVar2 = this.d;
        if (g76.L(m3cVar, m3cVar2)) {
            return;
        }
        au0Var.t = m3cVar2;
        c31Var.I0();
        dl7.u(au0Var);
    }

    public final String toString() {
        return "BorderModifierNodeElement(width=" + ((Object) vj3.c(this.b)) + aJzfoQ.yEMW + this.c + ", shape=" + this.d + ')';
    }
}
