package q;

import android.view.MenuItem;

/* loaded from: classes2.dex */
public final class p implements MenuItem.OnActionExpandListener {

    /* renamed from: a, reason: collision with root package name */
    public final MenuItem.OnActionExpandListener f83285a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f83286b;

    public p(r rVar, MenuItem.OnActionExpandListener onActionExpandListener) {
        this.f83286b = rVar;
        this.f83285a = onActionExpandListener;
    }

    @Override // android.view.MenuItem.OnActionExpandListener
    public final boolean onMenuItemActionCollapse(MenuItem menuItem) {
        return this.f83285a.onMenuItemActionCollapse(this.f83286b.n(menuItem));
    }

    @Override // android.view.MenuItem.OnActionExpandListener
    public final boolean onMenuItemActionExpand(MenuItem menuItem) {
        return this.f83285a.onMenuItemActionExpand(this.f83286b.n(menuItem));
    }
}
