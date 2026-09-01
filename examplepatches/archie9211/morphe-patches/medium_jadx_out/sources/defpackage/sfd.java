package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sfd implements nw {
    public final jre a;
    public final hud b;
    public Object c;
    public Object d;
    public dx e;
    public dx f;
    public final dx g;
    public long h;
    public dx i;

    public sfd(ww wwVar, hud hudVar, Object obj, Object obj2, dx dxVar) {
        this.a = wwVar.a(hudVar);
        this.b = hudVar;
        this.c = obj2;
        this.d = obj;
        this.e = (dx) hudVar.a.invoke(obj);
        x45 x45Var = hudVar.a;
        this.f = (dx) x45Var.invoke(obj2);
        this.g = dxVar != null ? nk7.m0(dxVar) : ((dx) x45Var.invoke(obj)).c();
        this.h = -1L;
    }

    public final void a(Object obj) {
        if (g76.L(obj, this.d)) {
            return;
        }
        this.d = obj;
        this.e = (dx) this.b.a.invoke(obj);
        this.i = null;
        this.h = -1L;
    }

    @Override // defpackage.nw
    public final boolean b() {
        return this.a.b();
    }

    @Override // defpackage.nw
    public final long c() {
        long j = this.h;
        if (j >= 0) {
            return j;
        }
        long jT = this.a.t(this.e, this.f, this.g);
        this.h = jT;
        return jT;
    }

    @Override // defpackage.nw
    public final hud d() {
        return this.b;
    }

    @Override // defpackage.nw
    public final dx e(long j) {
        if (!lv8.a(this, j)) {
            return this.a.j(j, this.e, this.f, this.g);
        }
        dx dxVar = this.i;
        if (dxVar != null) {
            return dxVar;
        }
        dx dxVarS = this.a.s(this.e, this.f, this.g);
        this.i = dxVarS;
        return dxVarS;
    }

    @Override // defpackage.nw
    public final /* synthetic */ boolean f(long j) {
        return lv8.a(this, j);
    }

    @Override // defpackage.nw
    public final Object g(long j) {
        if (lv8.a(this, j)) {
            return this.c;
        }
        dx dxVarR = this.a.r(j, this.e, this.f, this.g);
        int iB = dxVarR.b();
        for (int i = 0; i < iB; i++) {
            if (Float.isNaN(dxVarR.a(i))) {
                zx9.b("AnimationVector cannot contain a NaN. " + dxVarR + ". Animation: " + this + ", playTimeNanos: " + j);
            }
        }
        return this.b.b.invoke(dxVarR);
    }

    @Override // defpackage.nw
    public final Object h() {
        return this.c;
    }

    public final void i(Object obj) {
        if (g76.L(this.c, obj)) {
            return;
        }
        this.c = obj;
        this.f = (dx) this.b.a.invoke(obj);
        this.i = null;
        this.h = -1L;
    }

    public final String toString() {
        return "TargetBasedAnimation: " + this.d + " -> " + this.c + ",initial velocity: " + this.g + ", duration: " + (c() / 1000000) + " ms,animationSpec: " + this.a;
    }
}
