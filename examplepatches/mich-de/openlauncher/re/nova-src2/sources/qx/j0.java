package qx;

import ads_mobile_sdk.bu1;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes.dex */
public final class j0 extends r {

    /* renamed from: h, reason: collision with root package name */
    public final bu1 f84534h;

    public j0(bu1 bu1Var, l lVar, sx.j jVar) {
        super(lVar, jVar);
        this.f84534h = bu1Var;
    }

    @Override // qx.r
    public final void b() {
        this.f84534h.destroy();
    }

    @Override // qx.r
    public final String d() {
        return this.f84534h.f1563d;
    }

    @Override // qx.r
    public final View g(Context context, x0 x0Var, View view) {
        ui.p pVar = view instanceof ui.p ? (ui.p) view : null;
        if (pVar == null) {
            pVar = new ui.p(context);
            pVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        }
        pVar.removeAllViews();
        long jC = x0Var.c();
        bu1 bu1Var = this.f84534h;
        if (jC != 0) {
            bu1Var.setPlacementId(jC);
        }
        pVar.addView(rx.a.b(x0Var.e()).a(context, bu1Var, pVar));
        return pVar;
    }
}
