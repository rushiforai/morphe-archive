package e2;

import android.graphics.Canvas;
import android.graphics.Point;
import android.view.View;
import kotlin.jvm.functions.Function1;
import y3.n;

/* loaded from: classes2.dex */
public final class b extends View.DragShadowBuilder {

    /* renamed from: a, reason: collision with root package name */
    public final y3.d f51989a;

    /* renamed from: b, reason: collision with root package name */
    public final long f51990b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f51991c;

    public b(y3.d dVar, long j11, Function1 function1) {
        this.f51989a = dVar;
        this.f51990b = j11;
        this.f51991c = function1;
    }

    @Override // android.view.View.DragShadowBuilder
    public final void onDrawShadow(Canvas canvas) {
        k2.b bVar = new k2.b();
        n nVar = n.f96612a;
        Canvas canvas2 = i2.c.f61100a;
        i2.b bVar2 = new i2.b();
        bVar2.f61095a = canvas;
        k2.a aVar = bVar.f70865a;
        y3.c cVar = aVar.f70861a;
        n nVar2 = aVar.f70862b;
        androidx.compose.ui.graphics.Canvas canvas3 = aVar.f70863c;
        long j11 = aVar.f70864d;
        aVar.f70861a = this.f51989a;
        aVar.f70862b = nVar;
        aVar.f70863c = bVar2;
        aVar.f70864d = this.f51990b;
        bVar2.save();
        this.f51991c.invoke(bVar);
        bVar2.restore();
        aVar.f70861a = cVar;
        aVar.f70862b = nVar2;
        aVar.f70863c = canvas3;
        aVar.f70864d = j11;
    }

    @Override // android.view.View.DragShadowBuilder
    public final void onProvideShadowMetrics(Point point, Point point2) {
        long j11 = this.f51990b;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        y3.d dVar = this.f51989a;
        point.set(dVar.mo96roundToPx0680j_4(fIntBitsToFloat / dVar.getDensity()), dVar.mo96roundToPx0680j_4(Float.intBitsToFloat((int) (j11 & 4294967295L)) / dVar.getDensity()));
        point2.set(point.x / 2, point.y / 2);
    }
}
