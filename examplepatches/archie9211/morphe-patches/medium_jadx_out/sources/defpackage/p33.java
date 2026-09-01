package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p33 implements ib2 {
    public final ib2 a;

    public p33(ib2 ib2Var) {
        this.a = ib2Var;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return this.a.N(b55Var, obj);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        ib2 ib2VarT = this.a.T(hb2Var);
        int i = ppe.b;
        jb2 jb2Var = kb2.b;
        kb2 kb2Var = (kb2) o0(jb2Var);
        kb2 kb2Var2 = (kb2) ib2VarT.o0(jb2Var);
        if ((kb2Var instanceof q33) && kb2Var != kb2Var2) {
            ((q33) kb2Var).d = 0;
        }
        return new p33(ib2VarT);
    }

    public final boolean equals(Object obj) {
        return g76.L(this.a, obj);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        ib2 ib2VarJ0 = this.a.j0(ib2Var);
        int i = ppe.b;
        jb2 jb2Var = kb2.b;
        kb2 kb2Var = (kb2) o0(jb2Var);
        kb2 kb2Var2 = (kb2) ib2VarJ0.o0(jb2Var);
        if ((kb2Var instanceof q33) && kb2Var != kb2Var2) {
            ((q33) kb2Var).d = 0;
        }
        return new p33(ib2VarJ0);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        return this.a.o0(hb2Var);
    }

    public final String toString() {
        return "ForwardingCoroutineContext(delegate=" + this.a + ")";
    }
}
