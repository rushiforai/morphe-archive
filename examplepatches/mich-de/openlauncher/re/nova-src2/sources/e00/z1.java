package e00;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.Size;

/* loaded from: classes4.dex */
public final class z1 extends t00.y {

    /* renamed from: d, reason: collision with root package name */
    public final q00.l f51195d;

    /* renamed from: e, reason: collision with root package name */
    public final q00.l f51196e;

    /* renamed from: f, reason: collision with root package name */
    public final q00.l f51197f;

    /* renamed from: g, reason: collision with root package name */
    public final q00.l f51198g;

    /* renamed from: h, reason: collision with root package name */
    public final q00.l f51199h;

    /* renamed from: i, reason: collision with root package name */
    public final q00.l f51200i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f51201j;

    /* renamed from: k, reason: collision with root package name */
    public final mx.f f51202k;

    /* renamed from: l, reason: collision with root package name */
    public final float f51203l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z1(Context context, mx.j0 j0Var, p6.t tVar, t00.a0 a0Var, q00.l lVar, q00.l lVar2, q00.l lVar3, q00.l lVar4, q00.l lVar5, q00.l lVar6, boolean z11, cw.r3 r3Var) throws Resources.NotFoundException {
        super(tVar, a0Var, r3Var);
        p1.y2 y2Var = lVar3.f83363b;
        p1.y2 y2Var2 = lVar4.f83363b;
        this.f51195d = lVar;
        this.f51196e = lVar2;
        this.f51197f = lVar3;
        this.f51198g = lVar4;
        this.f51199h = lVar5;
        this.f51200i = lVar6;
        this.f51201j = z11;
        mx.g gVar = mx.g.f77083a;
        mx.j jVar = (mx.j) lVar.f83363b.getValue();
        mx.f fVar = new mx.f(gVar, jVar, true);
        this.f51202k = fVar;
        fVar.a(context.getResources(), 1.0f);
        int dimensionPixelSize = lVar6.f83363b.getValue() == e10.j3.f51613f ? context.getResources().getDimensionPixelSize(2131165453) : 0;
        boolean zBooleanValue = ((Boolean) e10.y2.f51877a.X().l()).booleanValue();
        e10.i3 i3Var = (e10.i3) lVar2.f83363b.getValue();
        i3Var.getClass();
        Rect rectB = j0Var.b(dimensionPixelSize, (i3Var == e10.i3.f51594a || i3Var == e10.i3.f51595b) ? false : true, zBooleanValue, j0Var.j((e10.s1) y2Var2.getValue(), j0Var.f77131a, context.getResources()), (e10.s1) y2Var2.getValue(), context.getResources().getDimensionPixelSize(((e10.s1) lVar5.f83363b.getValue()).f51804a), null);
        Point point = new Point(rectB.left + rectB.right, rectB.top + rectB.bottom);
        int i5 = ((e10.t0) y2Var.getValue()).f51821a;
        int i11 = ((e10.t0) y2Var.getValue()).f51822b;
        Size size = new Size(j0Var.f77155m, j0Var.n);
        Size size2 = new Size(size.getWidth() - point.x, size.getHeight() - point.y);
        int dimensionPixelSize2 = context.getResources().getDimensionPixelSize(2131165300);
        float fMin = Math.min((size2.getWidth() / i11) / dimensionPixelSize2, io.sentry.config.a.z(fVar, size2.getHeight() / i5, dimensionPixelSize2));
        this.f51203l = fMin;
        fVar.a(context.getResources(), fMin < jVar.b() ? fMin / jVar.b() : 1.0f);
        fVar.f77077j = ((tz.g) e10.y2.b(context).l()).f90113b.d((g30.b) g30.b.f57016l.h(context)).f90179b;
    }
}
