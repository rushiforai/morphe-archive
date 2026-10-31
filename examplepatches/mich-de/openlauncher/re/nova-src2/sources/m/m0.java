package m;

import android.view.MenuItem;

/* loaded from: classes2.dex */
public final class m0 implements q.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n0 f75309a;

    @Override // q.i
    public boolean a(q.k kVar, MenuItem menuItem) {
        return false;
    }

    @Override // q.i
    public void c(q.k kVar) {
        n0 n0Var = this.f75309a;
        if (n0Var.f75310a.f84789a.q()) {
            n0Var.f75311b.onPanelClosed(108, kVar);
        } else if (n0Var.f75311b.onPreparePanel(0, null, kVar)) {
            n0Var.f75311b.onMenuOpened(108, kVar);
        }
    }
}
