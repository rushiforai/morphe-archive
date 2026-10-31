package q;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

/* loaded from: classes2.dex */
public final class c0 extends k implements SubMenu {
    public final m A;

    /* renamed from: z, reason: collision with root package name */
    public final k f83190z;

    public c0(Context context, k kVar, m mVar) {
        super(context);
        this.f83190z = kVar;
        this.A = mVar;
    }

    @Override // q.k
    public final boolean d(m mVar) {
        return this.f83190z.d(mVar);
    }

    @Override // q.k
    public final boolean e(k kVar, MenuItem menuItem) {
        return super.e(kVar, menuItem) || this.f83190z.e(kVar, menuItem);
    }

    @Override // q.k
    public final boolean f(m mVar) {
        return this.f83190z.f(mVar);
    }

    @Override // android.view.SubMenu
    public final MenuItem getItem() {
        return this.A;
    }

    @Override // q.k
    public final String j() {
        m mVar = this.A;
        int i5 = mVar != null ? mVar.f83257a : 0;
        if (i5 == 0) {
            return null;
        }
        return b.c0.h(i5, "android:menu:actionviewstates:");
    }

    @Override // q.k
    public final k k() {
        return this.f83190z.k();
    }

    @Override // q.k
    public final boolean m() {
        return this.f83190z.m();
    }

    @Override // q.k
    public final boolean n() {
        return this.f83190z.n();
    }

    @Override // q.k
    public final boolean o() {
        return this.f83190z.o();
    }

    @Override // q.k, android.view.Menu
    public final void setGroupDividerEnabled(boolean z11) {
        this.f83190z.setGroupDividerEnabled(z11);
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderIcon(Drawable drawable) {
        u(0, null, 0, drawable, null);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderTitle(CharSequence charSequence) {
        u(0, charSequence, 0, null, null);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderView(View view) {
        u(0, null, 0, null, view);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setIcon(Drawable drawable) {
        this.A.setIcon(drawable);
        return this;
    }

    @Override // q.k, android.view.Menu
    public final void setQwertyMode(boolean z11) {
        this.f83190z.setQwertyMode(z11);
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderIcon(int i5) {
        u(0, null, i5, null, null);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderTitle(int i5) {
        u(i5, null, 0, null, null);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setIcon(int i5) {
        this.A.setIcon(i5);
        return this;
    }
}
