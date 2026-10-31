package qx;

import ads_mobile_sdk.el;
import ads_mobile_sdk.vw2;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
public final class s extends r {

    /* renamed from: h, reason: collision with root package name */
    public final el f84598h;

    /* renamed from: i, reason: collision with root package name */
    public final WeakReference f84599i;

    /* renamed from: j, reason: collision with root package name */
    public vw2 f84600j;

    public s(el elVar, Activity activity, l lVar, sx.j jVar) {
        super(lVar, jVar);
        this.f84598h = elVar;
        this.f84599i = new WeakReference(activity);
    }

    @Override // qx.r
    public final void b() {
        this.f84600j = null;
        this.f84598h.destroy();
    }

    @Override // qx.r
    public final String d() {
        return null;
    }

    @Override // qx.r
    public final View g(Context context, x0 x0Var, View view) {
        long jC = x0Var.c();
        el elVar = this.f84598h;
        if (jC != 0) {
            elVar.setPlacementId(jC);
        }
        vw2 vw2Var = this.f84600j;
        if (vw2Var != null && view == vw2Var) {
            return vw2Var;
        }
        Activity activity = (Activity) this.f84599i.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return view == null ? new View(context) : view;
        }
        vw2 vw2Var2 = this.f84600j;
        if (vw2Var2 != null) {
            return vw2Var2;
        }
        vw2 view2 = elVar.getView(activity);
        view2.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        this.f84600j = view2;
        return view2;
    }
}
