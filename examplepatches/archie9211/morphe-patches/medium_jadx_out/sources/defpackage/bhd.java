package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bhd implements ygd {
    public final long a;
    public final /* synthetic */ chd b;

    public bhd(chd chdVar, long j) {
        this.b = chdVar;
        this.a = j;
    }

    @Override // defpackage.ygd
    public final xgd P() {
        return iq7.A(this.b);
    }

    @Override // defpackage.ygd
    public final long h(hp6 hp6Var) {
        hp6 hp6Var2 = (hp6) this.b.r.getValue();
        if (hp6Var2 != null) {
            return hp6Var.D(hp6Var2, this.a);
        }
        e26.d("Tried to open context menu before the anchor was placed.");
        z72.b();
        return 0L;
    }

    @Override // defpackage.ygd
    public final zwa k(hp6 hp6Var) {
        return lk7.l(h(hp6Var), 0L);
    }
}
