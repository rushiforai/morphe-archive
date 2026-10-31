package b00;

import android.view.View;
import c0.c2;
import c0.u1;
import c0.v1;
import c0.y1;
import c3.m3;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import k0.h2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;

/* loaded from: classes4.dex */
public final class g0 implements p1.k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16354a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16355b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16356c;

    public /* synthetic */ g0(int i5, Object obj, Object obj2) {
        this.f16354a = i5;
        this.f16355b = obj;
        this.f16356c = obj2;
    }

    @Override // p1.k0
    public final void dispose() {
        int i5 = this.f16354a;
        Object obj = this.f16356c;
        Object obj2 = this.f16355b;
        switch (i5) {
            case 0:
                ((h6.a0) obj2).getLifecycle().c((a0) obj);
                break;
            case 1:
                ((h6.a0) obj2).getLifecycle().c((a5.q) obj);
                break;
            case 2:
                ((c0.n0) obj2).f18883a.j((c0.j0) obj);
                break;
            case 3:
                ((c2) obj2).f18739j.remove((c2) obj);
                break;
            case 4:
                c2 c2Var = (c2) obj2;
                c2Var.getClass();
                u1 u1VarB = ((v1) obj).b();
                if (u1VarB != null) {
                    c2Var.f18738i.remove(u1VarB.f18981a);
                    break;
                }
                break;
            case 5:
                ((c2) obj2).f18738i.remove((y1) obj);
                break;
            case 6:
                ((k30.h0) obj2).g((a1.g) obj);
                break;
            case 7:
                ((h6.a0) obj2).getLifecycle().c((dv.j) obj);
                break;
            case 8:
                ((k30.h0) obj2).g((a1.g) obj);
                break;
            case 9:
                ((h6.a0) obj2).getLifecycle().c((m3) obj);
                break;
            case 10:
                h2 h2Var = (h2) obj2;
                View view = (View) obj;
                int i11 = h2Var.f70635t - 1;
                h2Var.f70635t = i11;
                if (i11 == 0) {
                    WeakHashMap weakHashMap = a5.a1.f250a;
                    a5.s0.l(view, null);
                    a5.a1.n(view, null);
                    view.removeOnAttachStateChangeListener(h2Var.f70636u);
                    break;
                }
                break;
            case 11:
                ((n0.y0) obj2).f77535c.j(obj);
                break;
            case 12:
                ((h6.a0) obj2).getLifecycle().c((a0) obj);
                break;
            case 13:
                ((p6.n) obj2).f82198h.c((q6.m) obj);
                break;
            case 14:
                Iterator it = ((List) ((y2) obj2).getValue()).iterator();
                while (it.hasNext()) {
                    ((q6.i) obj).b().b((p6.n) it.next());
                }
                break;
            case 15:
                ((View) obj2).getViewTreeObserver().removeOnGlobalLayoutListener((io.sentry.android.core.internal.util.h) obj);
                break;
            case 16:
                p1.e1 e1Var = (p1.e1) obj2;
                i0.k kVar = (i0.k) e1Var.getValue();
                if (kVar != null) {
                    i0.j jVar = new i0.j(kVar);
                    i0.i iVar = (i0.i) obj;
                    if (iVar != null) {
                        iVar.b(jVar);
                    }
                    e1Var.setValue(null);
                    break;
                }
                break;
            case 17:
                ((t0.y1) obj2).f88305c.remove((Function1) obj);
                break;
            case 18:
                ((h6.a0) obj2).getLifecycle().c((m3) obj);
                break;
            default:
                ((zu.m) obj2).f98625q.invoke(zu.i.f98610a);
                com.stripe.android.paymentsheet.paymentdatacollection.ach.g gVar = (com.stripe.android.paymentsheet.paymentdatacollection.ach.g) obj;
                if (Intrinsics.b(gVar.f44879d.a("should_reset"), Boolean.TRUE)) {
                    gVar.j(null);
                } else {
                    gVar.k(false);
                }
                eu.d dVar = gVar.E;
                if (dVar != null) {
                    dVar.a();
                }
                gVar.E = null;
                break;
        }
    }
}
