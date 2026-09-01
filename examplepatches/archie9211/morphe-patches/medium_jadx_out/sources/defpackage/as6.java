package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class as6 implements ly {
    public final n0c a;
    public final o86 b;
    public final boolean c;
    public final v67 d;

    public as6(n0c n0cVar, o86 o86Var, boolean z) {
        n0cVar.getClass();
        o86Var.getClass();
        this.a = n0cVar;
        this.b = o86Var;
        this.c = z;
        this.d = ((k96) n0cVar.b).a.c(new z(19, this));
    }

    @Override // defpackage.ly
    public final /* bridge */ boolean g(y05 y05Var) {
        return rv8.D(this, y05Var);
    }

    @Override // defpackage.ly
    public final yx i(y05 y05Var) {
        yx yxVar;
        y05Var.getClass();
        o86 o86Var = this.b;
        f0b f0bVarA = o86Var.a(y05Var);
        if (f0bVarA != null && (yxVar = (yx) this.d.invoke(f0bVarA)) != null) {
            return yxVar;
        }
        n98 n98Var = n86.a;
        return n86.a(y05Var, o86Var, this.a);
    }

    @Override // defpackage.ly
    public final boolean isEmpty() {
        return this.b.getAnnotations().isEmpty();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        o86 o86Var = this.b;
        j80 j80VarO0 = bu1.o0(o86Var.getAnnotations());
        v67 v67Var = this.d;
        v67Var.getClass();
        srd srdVar = new srd(j80VarO0, v67Var);
        n98 n98Var = n86.a;
        return new yh4(new zh4(szb.I0(k80.b0(new mzb[]{srdVar, new j80(4, n86.a(lnc.m, o86Var, this.a))})), false, new dsb(7)));
    }
}
