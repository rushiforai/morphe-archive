package b10;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.Size;
import e10.i3;
import e10.j3;
import e10.y2;

/* loaded from: classes4.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public final p1.e1 f16703a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f16704b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f16705c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f16706d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f16707e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f16708f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f16709g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.e1 f16710h;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f16711i;

    /* renamed from: j, reason: collision with root package name */
    public final p1.e1 f16712j;

    /* renamed from: k, reason: collision with root package name */
    public final p1.e1 f16713k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.e1 f16714l;

    /* renamed from: m, reason: collision with root package name */
    public final float f16715m;
    public boolean n;

    public h1(Context context, mx.j0 j0Var, p1.e1 e1Var, p1.e1 e1Var2, p1.e1 e1Var3, p1.e1 e1Var4, p1.e1 e1Var5, p1.e1 e1Var6, p1.e1 e1Var7, p1.e1 e1Var8, p1.e1 e1Var9, p1.e1 e1Var10, p1.e1 e1Var11, p1.e1 e1Var12) throws Resources.NotFoundException {
        this.f16703a = e1Var;
        this.f16704b = e1Var2;
        this.f16705c = e1Var3;
        this.f16706d = e1Var4;
        this.f16707e = e1Var5;
        this.f16708f = e1Var6;
        this.f16709g = e1Var7;
        this.f16710h = e1Var8;
        this.f16711i = e1Var9;
        this.f16712j = e1Var10;
        this.f16713k = e1Var11;
        this.f16714l = e1Var12;
        mx.f fVar = new mx.f(mx.g.f77083a, (mx.j) ((p1.s2) e1Var).getValue(), true);
        y2 y2Var = y2.f51877a;
        e10.s2 s2VarU = y2Var.u();
        int dimensionPixelSize = y2Var.q1().l() == j3.f51613f ? context.getResources().getDimensionPixelSize(2131165453) : 0;
        e10.s2 s2VarA = y2Var.A();
        i3 i3Var = (i3) y2Var.y().l();
        i3Var.getClass();
        Rect rectB = j0Var.b(dimensionPixelSize, (i3Var == i3.f51594a || i3Var == i3.f51595b) ? false : true, ((Boolean) y2Var.X().l()).booleanValue(), j0Var.j((e10.s1) s2VarA.l(), j0Var.f77131a, context.getResources()), (e10.s1) s2VarA.l(), context.getResources().getDimensionPixelSize(((e10.s1) y2.v().l()).f51804a), null);
        Point point = new Point(rectB.left + rectB.right, rectB.top + rectB.bottom);
        int i5 = ((e10.t0) s2VarU.l()).f51821a;
        int i11 = ((e10.t0) s2VarU.l()).f51822b;
        Size size = new Size(j0Var.f77155m, j0Var.n);
        Size size2 = new Size(size.getWidth() - point.x, size.getHeight() - point.y);
        int dimensionPixelSize2 = context.getResources().getDimensionPixelSize(2131165300);
        this.f16715m = Math.min((size2.getWidth() / i11) / dimensionPixelSize2, io.sentry.config.a.z(fVar, size2.getHeight() / i5, dimensionPixelSize2));
    }
}
