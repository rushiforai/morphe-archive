package defpackage;

import android.graphics.Canvas;
import android.graphics.Point;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z02 extends View.DragShadowBuilder {
    public final p73 a;
    public final long b;
    public final x45 c;

    public z02(p73 p73Var, long j, x45 x45Var) {
        this.a = p73Var;
        this.b = j;
        this.c = x45Var;
    }

    @Override // android.view.View.DragShadowBuilder
    public final void onDrawShadow(Canvas canvas) {
        g61 g61Var = new g61();
        ip6 ip6Var = ip6.Ltr;
        Canvas canvas2 = qm.a;
        pm pmVar = new pm();
        pmVar.a = canvas;
        f61 f61Var = g61Var.a;
        m73 m73Var = f61Var.a;
        ip6 ip6Var2 = f61Var.b;
        e61 e61Var = f61Var.c;
        long j = f61Var.d;
        f61Var.a = this.a;
        f61Var.b = ip6Var;
        f61Var.c = pmVar;
        f61Var.d = this.b;
        pmVar.h();
        this.c.invoke(g61Var);
        pmVar.q();
        f61Var.a = m73Var;
        f61Var.b = ip6Var2;
        f61Var.c = e61Var;
        f61Var.d = j;
    }

    @Override // android.view.View.DragShadowBuilder
    public final void onProvideShadowMetrics(Point point, Point point2) {
        long j = this.b;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        p73 p73Var = this.a;
        point.set(ho2.d(p73Var, fIntBitsToFloat / p73Var.b()), ho2.d(p73Var, Float.intBitsToFloat((int) (j & 4294967295L)) / p73Var.b()));
        point2.set(point.x / 2, point.y / 2);
    }
}
