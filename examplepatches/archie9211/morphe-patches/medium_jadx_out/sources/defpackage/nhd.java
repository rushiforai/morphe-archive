package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nhd extends b43 implements u22, ygd {
    public mya q;
    public mt2 r;
    public gid s;
    public ta2 t;
    public enc u;
    public final j83 v = bjc.b(new doc(12, this));
    public zwa w = zwa.e;

    public nhd(mya myaVar, mt2 mt2Var, gid gidVar, ta2 ta2Var) {
        this.q = myaVar;
        this.r = mt2Var;
        this.s = gidVar;
        this.t = ta2Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        mya myaVar = this.q;
        myaVar.c = ynd.Detached;
        myaVar.b = null;
    }

    @Override // defpackage.ygd
    public final xgd P() {
        return (xgd) this.v.getValue();
    }

    @Override // defpackage.ygd
    public final long h(hp6 hp6Var) {
        return k(hp6Var).d();
    }

    @Override // defpackage.ygd
    public final zwa k(hp6 hp6Var) {
        if (!this.n) {
            return this.w;
        }
        zwa zwaVar = (zwa) this.t.invoke(hp6Var);
        if (zwaVar == null) {
            return this.w;
        }
        this.w = zwaVar;
        return zwaVar;
    }

    @Override // defpackage.q28
    public final void y0() {
        mya myaVar = this.q;
        myaVar.c = ynd.Attached;
        myaVar.b = this;
    }
}
