package q;

import android.view.MenuItem;

/* loaded from: classes2.dex */
public final class q implements MenuItem.OnMenuItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final MenuItem.OnMenuItemClickListener f83287a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f83288b;

    public q(r rVar, MenuItem.OnMenuItemClickListener onMenuItemClickListener) {
        this.f83288b = rVar;
        this.f83287a = onMenuItemClickListener;
    }

    @Override // android.view.MenuItem.OnMenuItemClickListener
    public final boolean onMenuItemClick(MenuItem menuItem) {
        return this.f83287a.onMenuItemClick(this.f83288b.n(menuItem));
    }
}
