package c1;

import android.os.CancellationSignal;
import e1.a1;
import m3.o0;
import o9.d4;
import t0.y0;
import t70.g2;

/* loaded from: classes2.dex */
public final /* synthetic */ class j implements CancellationSignal.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19095a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19096b;

    public /* synthetic */ j(Object obj, int i5) {
        this.f19095a = i5;
        this.f19096b = obj;
    }

    @Override // android.os.CancellationSignal.OnCancelListener
    public final void onCancel() {
        switch (this.f19095a) {
            case 0:
                a1 a1Var = (a1) this.f19096b;
                if (a1Var != null) {
                    y0 y0Var = a1Var.f51232d;
                    if (y0Var != null) {
                        y0Var.e(o0.f75944b);
                    }
                    y0 y0Var2 = a1Var.f51232d;
                    if (y0Var2 != null) {
                        y0Var2.f(o0.f75944b);
                        return;
                    }
                    return;
                }
                return;
            case 1:
                ((g2) this.f19096b).c(null);
                return;
            default:
                u4.a aVar = (u4.a) this.f19096b;
                synchronized (aVar) {
                    try {
                        if (aVar.f90550e) {
                            return;
                        }
                        aVar.f90550e = true;
                        aVar.f90549d = null;
                        aVar.f90546a.removeUpdates(aVar);
                        d4 d4Var = aVar.f90551f;
                        if (d4Var != null) {
                            aVar.f90548c.removeCallbacks(d4Var);
                            aVar.f90551f = null;
                            return;
                        }
                        return;
                    } finally {
                    }
                }
        }
    }
}
