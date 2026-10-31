package b0;

import ads_mobile_sdk.b6;
import ads_mobile_sdk.bu1;
import ads_mobile_sdk.c31;
import ads_mobile_sdk.g6;
import ads_mobile_sdk.ih0;
import ads_mobile_sdk.ue2;
import ads_mobile_sdk.vr0;
import ads_mobile_sdk.z5;
import android.app.Activity;
import android.content.res.Configuration;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.l7;
import b.ob;
import b.r2;
import b.u2;
import c3.c2;
import c3.i2;
import c3.j2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class x extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16271j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f16272k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x(Object obj, int i5) {
        super(1);
        this.f16271j = i5;
        this.f16272k = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Unit unit;
        Unit unit2;
        g6 g6Var;
        int i5 = 0;
        switch (this.f16271j) {
            case 0:
                z2.h1 h1Var = (z2.h1) obj;
                ArrayList arrayList = (ArrayList) this.f16272k;
                int size = arrayList.size();
                for (int i11 = 0; i11 < size; i11++) {
                    h1Var.i((z2.i1) arrayList.get(i11), 0, 0, 0.0f);
                }
                return Unit.f71706a;
            case 1:
                ui.e eVar = (ui.e) obj;
                ih0 ih0VarJ = ((bu1) this.f16272k).f1561b.j();
                synchronized (ih0VarJ) {
                    ih0VarJ.a(eVar);
                    unit = Unit.f71706a;
                }
                return unit;
            case 2:
                oi.c cVar = (oi.c) obj;
                ih0 ih0VarJ2 = ((c31) this.f16272k).f1648b.f1561b.j();
                synchronized (ih0VarJ2) {
                    ih0VarJ2.a(cVar);
                    unit2 = Unit.f71706a;
                }
                return unit2;
            case 3:
                l7 it = (l7) obj;
                Intrinsics.g(it, "it");
                it.onActivityStarted((Activity) this.f16272k);
                return Unit.f71706a;
            case 4:
                ads_mobile_sdk.g1 manifest = (ads_mobile_sdk.g1) obj;
                Intrinsics.g(manifest, "manifest");
                ue2 ue2Var = (ue2) this.f16272k;
                String key = ue2Var.f10325b.name();
                vr0 vr0Var = (vr0) manifest.u().get(key);
                if (vr0Var == null || (g6Var = (g6) vr0Var.o().get(ue2Var.f10326c)) == null) {
                    return manifest;
                }
                r2 r2Var = (r2) manifest.n();
                Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
                ob obVar = (ob) vr0Var.n();
                Intrinsics.f(obVar.e(), "getAdResponseListsMap(...)");
                String key2 = ue2Var.f10326c;
                u2 u2Var = (u2) g6Var.n();
                List listF = u2Var.f();
                Intrinsics.f(listF, "getResponsesList(...)");
                Iterator delegate = listF.iterator();
                Intrinsics.g(delegate, "delegate");
                while (delegate.hasNext()) {
                    Object next = delegate.next();
                    int i12 = i5 + 1;
                    if (i5 < 0) {
                        ul.b.e0();
                        throw null;
                    }
                    b6 b6Var = (b6) next;
                    if (Intrinsics.b(b6Var.q(), ue2Var.f10324a) && b6Var.r() == z5.READ) {
                        Intrinsics.f(u2Var.f(), "getResponsesList(...)");
                        b.k kVar = (b.k) b6Var.n();
                        kVar.c(z5.AVAILABLE);
                        Unit unit3 = Unit.f71706a;
                        b6 b6Var2 = (b6) kVar.a();
                        u2Var.b();
                        ((g6) u2Var.f1095b).a(i5, b6Var2);
                    }
                    i5 = i12;
                }
                g6 g6Var2 = (g6) u2Var.a();
                Intrinsics.g(key2, "key");
                obVar.d(key2, g6Var2);
                vr0 vr0Var2 = (vr0) obVar.a();
                Intrinsics.g(key, "key");
                r2Var.d(key, vr0Var2);
                return (ads_mobile_sdk.g1) r2Var.a();
            case 5:
                ((b90.j) this.f16272k).cancel();
                return Unit.f71706a;
            case 6:
                ((r1.e) this.f16272k).b((b2.s) obj);
                return Boolean.TRUE;
            case 7:
                ((LayoutNode) this.f16272k).setDensity((y3.c) obj);
                return Unit.f71706a;
            case 8:
                p1.e1 e1Var = (p1.e1) this.f16272k;
                Configuration configuration = new Configuration((Configuration) obj);
                p1.m0 m0Var = AndroidCompositionLocals_androidKt.f14165a;
                e1Var.setValue(configuration);
                return Unit.f71706a;
            case 9:
                return new c3.v0((c2) this.f16272k, i5);
            case 10:
                if (i2.f19325b.compareAndSet(false, true)) {
                    ((v70.i) this.f16272k).j(Unit.f71706a);
                }
                return Unit.f71706a;
            case 11:
                k2.f fVar = (k2.f) obj;
                j2 j2Var = (j2) this.f16272k;
                Canvas canvas = fVar.getDrawContext().getCanvas();
                Function2 function2 = j2Var.f19353d;
                if (function2 != null) {
                    function2.invoke(canvas, fVar.getDrawContext().getGraphicsLayer());
                }
                return Unit.f71706a;
            case 12:
                i2.w0 w0Var = (i2.w0) this.f16272k;
                i2.s0 s0Var = (i2.s0) ((i2.a0) obj);
                s0Var.i(w0Var.f61176a);
                s0Var.j(w0Var.f61177b);
                s0Var.a(w0Var.f61178c);
                s0Var.q(0.0f);
                s0Var.t(0.0f);
                s0Var.k(w0Var.f61179d);
                s0Var.g(w0Var.f61180e);
                float f11 = w0Var.f61181f;
                if (s0Var.f61159k != f11) {
                    s0Var.f61149a |= 2048;
                    s0Var.f61159k = f11;
                }
                s0Var.o(w0Var.f61182g);
                s0Var.m(w0Var.f61183h);
                s0Var.f(w0Var.f61184i);
                s0Var.b(w0Var.f61185j);
                s0Var.n(w0Var.f61186k);
                int i13 = w0Var.f61187l;
                if (s0Var.f61164r != i13) {
                    s0Var.f61149a |= 524288;
                    s0Var.f61164r = i13;
                }
                return Unit.f71706a;
            case 13:
                ((List) obj).add((Float) ((n0.w0) this.f16272k).invoke());
                return true;
            case 14:
                k2.f fVar2 = (k2.f) obj;
                l2.b bVar = (l2.b) this.f16272k;
                i2.n0 n0Var = bVar.f74512l;
                if (bVar.n && bVar.f74521w && n0Var != null) {
                    k2.d drawContext = fVar2.getDrawContext();
                    long jMo111getSizeNHjbRc = drawContext.mo111getSizeNHjbRc();
                    drawContext.getCanvas().save();
                    try {
                        drawContext.getTransform().mo135clipPathmtrdDE(n0Var, 1);
                        bVar.c(fVar2);
                    } finally {
                        a2.c.x(drawContext, jMo111getSizeNHjbRc);
                    }
                } else {
                    bVar.c(fVar2);
                }
                return Unit.f71706a;
            case 15:
                return Integer.valueOf(ab.e0.t(Integer.valueOf(((o0.j) obj).b()), (Integer) this.f16272k));
            default:
                o2.f0 f0Var = (o2.f0) obj;
                o2.c cVar2 = (o2.c) this.f16272k;
                cVar2.g(f0Var);
                Function1 function1 = cVar2.f79216i;
                if (function1 != null) {
                    function1.invoke(f0Var);
                }
                return Unit.f71706a;
        }
    }
}
