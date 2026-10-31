package r;

import android.view.MenuItem;
import androidx.appcompat.widget.Toolbar;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class g2 implements q.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Toolbar f84721a;

    public /* synthetic */ g2(Toolbar toolbar) {
        this.f84721a = toolbar;
    }

    @Override // q.i
    public boolean a(q.k kVar, MenuItem menuItem) {
        return false;
    }

    @Override // q.i
    public void c(q.k kVar) {
        Toolbar toolbar = this.f84721a;
        i iVar = toolbar.f13800a.f13746t;
        if (iVar == null || !iVar.k()) {
            Iterator it = toolbar.G.f367b.iterator();
            while (it.hasNext()) {
                ((androidx.fragment.app.z0) ((a5.u) it.next())).f14725a.t(kVar);
            }
        }
        m.m0 m0Var = toolbar.O;
        if (m0Var != null) {
            m0Var.c(kVar);
        }
    }
}
