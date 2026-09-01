package defpackage;

import android.content.Context;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.widget.ActionBarContextView;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dnc extends l6 implements jx7 {
    public Context d;
    public ActionBarContextView e;
    public lig f;
    public WeakReference g;
    public boolean h;
    public lx7 i;

    @Override // defpackage.jx7
    public final void Y(lx7 lx7Var) {
        j();
        h6 h6Var = this.e.d;
        if (h6Var != null) {
            h6Var.l();
        }
    }

    @Override // defpackage.l6
    public final void b() {
        if (this.h) {
            return;
        }
        this.h = true;
        this.f.Z(this);
    }

    @Override // defpackage.l6
    public final View c() {
        WeakReference weakReference = this.g;
        if (weakReference != null) {
            return (View) weakReference.get();
        }
        return null;
    }

    @Override // defpackage.jx7
    public final boolean d(lx7 lx7Var, MenuItem menuItem) {
        return ((o2b) this.f.b).z(this, menuItem);
    }

    @Override // defpackage.l6
    public final lx7 f() {
        return this.i;
    }

    @Override // defpackage.l6
    public final MenuInflater g() {
        return new r2d(this.e.getContext());
    }

    @Override // defpackage.l6
    public final CharSequence h() {
        return this.e.getSubtitle();
    }

    @Override // defpackage.l6
    public final CharSequence i() {
        return this.e.getTitle();
    }

    @Override // defpackage.l6
    public final void j() {
        this.f.a0(this, this.i);
    }

    @Override // defpackage.l6
    public final boolean k() {
        return this.e.s;
    }

    @Override // defpackage.l6
    public final void m(View view) {
        this.e.setCustomView(view);
        this.g = view != null ? new WeakReference(view) : null;
    }

    @Override // defpackage.l6
    public final void n(int i) {
        o(this.d.getString(i));
    }

    @Override // defpackage.l6
    public final void o(CharSequence charSequence) {
        this.e.setSubtitle(charSequence);
    }

    @Override // defpackage.l6
    public final void p(int i) {
        q(this.d.getString(i));
    }

    @Override // defpackage.l6
    public final void q(CharSequence charSequence) {
        this.e.setTitle(charSequence);
    }

    @Override // defpackage.l6
    public final void r(boolean z) {
        this.b = z;
        this.e.setTitleOptional(z);
    }
}
