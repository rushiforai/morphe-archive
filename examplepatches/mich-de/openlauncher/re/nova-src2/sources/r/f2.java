package r;

import android.view.MenuItem;
import androidx.appcompat.widget.Toolbar;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final /* synthetic */ class f2 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84705a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Toolbar f84706b;

    public /* synthetic */ f2(Toolbar toolbar, int i5) {
        this.f84705a = i5;
        this.f84706b = toolbar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f84705a) {
            case 0:
                i2 i2Var = this.f84706b.M;
                q.m mVar = i2Var == null ? null : i2Var.f84756b;
                if (mVar != null) {
                    mVar.collapseActionView();
                    break;
                }
                break;
            default:
                Toolbar toolbar = this.f84706b;
                Iterator it = toolbar.H.iterator();
                while (it.hasNext()) {
                    toolbar.m().removeItem(((MenuItem) it.next()).getItemId());
                }
                q.k kVarM = toolbar.m();
                ArrayList arrayListK = toolbar.k();
                a5.t tVar = toolbar.G;
                androidx.appcompat.view.i iVar = new androidx.appcompat.view.i(toolbar.getContext());
                Iterator it2 = tVar.f367b.iterator();
                while (it2.hasNext()) {
                    ((androidx.fragment.app.z0) ((a5.u) it2.next())).f14725a.k(kVarM, iVar);
                }
                ArrayList arrayListK2 = toolbar.k();
                arrayListK2.removeAll(arrayListK);
                toolbar.H = arrayListK2;
                break;
        }
    }
}
