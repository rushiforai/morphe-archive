package defpackage;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dvc extends lx7 implements SubMenu {
    public final sx7 A;
    public final lx7 z;

    public dvc(Context context, lx7 lx7Var, sx7 sx7Var) {
        super(context);
        this.z = lx7Var;
        this.A = sx7Var;
    }

    @Override // defpackage.lx7
    public final boolean d(sx7 sx7Var) {
        return this.z.d(sx7Var);
    }

    @Override // defpackage.lx7
    public final boolean e(lx7 lx7Var, MenuItem menuItem) {
        return super.e(lx7Var, menuItem) || this.z.e(lx7Var, menuItem);
    }

    @Override // defpackage.lx7
    public final boolean f(sx7 sx7Var) {
        return this.z.f(sx7Var);
    }

    @Override // android.view.SubMenu
    public final MenuItem getItem() {
        return this.A;
    }

    @Override // defpackage.lx7
    public final String j() {
        int i = this.A.a;
        if (i == 0) {
            return null;
        }
        return b09.w(i, "android:menu:actionviewstates:");
    }

    @Override // defpackage.lx7
    public final lx7 k() {
        return this.z.k();
    }

    @Override // defpackage.lx7
    public final boolean m() {
        return this.z.m();
    }

    @Override // defpackage.lx7
    public final boolean n() {
        return this.z.n();
    }

    @Override // defpackage.lx7
    public final boolean o() {
        return this.z.o();
    }

    @Override // defpackage.lx7, android.view.Menu
    public final void setGroupDividerEnabled(boolean z) {
        this.z.setGroupDividerEnabled(z);
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

    @Override // defpackage.lx7, android.view.Menu
    public final void setQwertyMode(boolean z) {
        this.z.setQwertyMode(z);
    }

    @Override // android.view.SubMenu
    public final SubMenu setIcon(int i) {
        this.A.setIcon(i);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderIcon(int i) {
        u(0, null, i, null, null);
        return this;
    }

    @Override // android.view.SubMenu
    public final SubMenu setHeaderTitle(int i) {
        u(i, null, 0, null, null);
        return this;
    }
}
