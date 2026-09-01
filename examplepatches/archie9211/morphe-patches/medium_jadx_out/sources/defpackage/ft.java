package defpackage;

import android.view.Choreographer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ft implements gb2 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public ft(nwa nwaVar) {
        this.a = 1;
        this.b = nwaVar;
        this.c = new iq1(5);
    }

    private final Object b(x45 x45Var, n92 n92Var) {
        dt dtVar = (dt) this.c;
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        et etVar = new et(x51Var, this, x45Var);
        if (g76.L(dtVar.c, (Choreographer) this.b)) {
            synchronized (dtVar.e) {
                dtVar.g.add(etVar);
                if (!dtVar.j) {
                    dtVar.j = true;
                    dtVar.c.postFrameCallback(dtVar.k);
                }
            }
            x51Var.v(new jr(dtVar, 3, etVar));
        } else {
            ((Choreographer) this.b).postFrameCallback(etVar);
            x51Var.v(new jr(this, 4, etVar));
        }
        return x51Var.q();
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        switch (this.a) {
        }
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        switch (this.a) {
        }
        return flb.n0(this, hb2Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.x45 r8, defpackage.n92 r9) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ft.a(x45, n92):java.lang.Object");
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        switch (this.a) {
        }
        return tz7.j;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        switch (this.a) {
        }
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        switch (this.a) {
        }
        return flb.i0(this, hb2Var);
    }

    public ft(ft ftVar) {
        this.a = 2;
        this.b = ftVar;
        this.c = new zf3();
    }

    public ft(Choreographer choreographer, dt dtVar) {
        this.a = 0;
        this.b = choreographer;
        this.c = dtVar;
    }
}
