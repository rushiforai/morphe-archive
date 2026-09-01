package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zse implements qp6 {
    public final eid b;
    public final int c;
    public final prd d;
    public final m45 e;

    public zse(eid eidVar, int i, prd prdVar, m45 m45Var) {
        this.b = eidVar;
        this.c = i;
        this.d = prdVar;
        this.e = m45Var;
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.c(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.r28
    public final /* synthetic */ r28 b(r28 r28Var) {
        return ev6.i(this, r28Var);
    }

    @Override // defpackage.qp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(f72.a(j, 0, 0, 0, Integer.MAX_VALUE, 7));
        int iMin = Math.min(t99VarS.b, f72.g(j));
        return bl7Var.q0(t99VarS.a, iMin, fy3.a, new lwa(this, t99VarS, iMin));
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.a(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.e(this, fb7Var, tk7Var, i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof zse) {
            zse zseVar = (zse) obj;
            if (this.b == zseVar.b && this.c == zseVar.c && this.d.equals(zseVar.d) && g76.L(this.e, zseVar.e)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.g(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.r28
    public final Object h(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + (((this.b.hashCode() * 31) + this.c) * 31)) * 31);
    }

    @Override // defpackage.r28
    public final boolean k(x45 x45Var) {
        return ((Boolean) x45Var.invoke(this)).booleanValue();
    }

    public final String toString() {
        return "VerticalScrollLayoutModifier(scrollerPosition=" + this.b + ", cursorOffset=" + this.c + ", transformedText=" + this.d + ", textLayoutResultProvider=" + this.e + ')';
    }
}
