package r00;

import android.content.Context;
import android.content.res.Resources;
import android.util.Size;
import cw.r3;
import e10.n0;
import e10.p0;
import e10.z2;
import mx.j0;
import t00.a0;

/* loaded from: classes4.dex */
public final class p extends t00.y {

    /* renamed from: d, reason: collision with root package name */
    public final q00.l f85020d;

    /* renamed from: e, reason: collision with root package name */
    public final q00.l f85021e;

    /* renamed from: f, reason: collision with root package name */
    public final q00.l f85022f;

    /* renamed from: g, reason: collision with root package name */
    public final mx.f f85023g;

    /* renamed from: h, reason: collision with root package name */
    public final float f85024h;

    /* renamed from: i, reason: collision with root package name */
    public final Size f85025i;

    public p(Context context, j0 j0Var, p6.t tVar, a0 a0Var, q00.l lVar, q00.l lVar2, q00.l lVar3, r3 r3Var) throws Resources.NotFoundException {
        super(tVar, a0Var, r3Var);
        this.f85020d = lVar;
        this.f85021e = lVar2;
        this.f85022f = lVar3;
        mx.f fVar = new mx.f(mx.g.f77086d, (mx.j) lVar3.f83363b.getValue(), true);
        this.f85023g = fVar;
        j0Var.u();
        Size sizeI = u90.b.I(context.getResources(), new Size(j0Var.f77155m, j0Var.n), (n0) lVar2.f83363b.getValue(), j0Var.f77173w, j0Var.f77162q0, j0Var.o() ? 0 : j0Var.Y);
        this.f85025i = sizeI;
        fVar.a(context.getResources(), 1.0f);
        int iC = c();
        int iB = b();
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131165300);
        this.f85024h = Math.min((sizeI.getWidth() / iB) / dimensionPixelSize, io.sentry.config.a.z(fVar, sizeI.getHeight() / iC, dimensionPixelSize));
        fVar.a(context.getResources(), z2.C(fVar, sizeI, c(), b()));
    }

    public final int b() {
        q00.l lVar = this.f85021e;
        if (((n0) lVar.f83363b.getValue()).f51677a == p0.f51734b) {
            return 2;
        }
        return ((n0) lVar.f83363b.getValue()).f51684h;
    }

    public final int c() {
        q00.l lVar = this.f85021e;
        if (((n0) lVar.f83363b.getValue()).f51677a == p0.f51734b) {
            return 2;
        }
        return ((n0) lVar.f83363b.getValue()).f51683g;
    }
}
