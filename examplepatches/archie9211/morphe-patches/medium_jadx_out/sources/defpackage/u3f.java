package defpackage;

import android.content.Context;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import androidx.appcompat.widget.ActionBarContextView;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u3f extends l6 implements jx7 {
    public final Context d;
    public final lx7 e;
    public lig f;
    public WeakReference g;
    public final /* synthetic */ v3f h;

    public u3f(v3f v3fVar, Context context, lig ligVar) {
        this.h = v3fVar;
        this.d = context;
        this.f = ligVar;
        lx7 lx7Var = new lx7(context);
        lx7Var.l = 1;
        this.e = lx7Var;
        lx7Var.e = this;
    }

    @Override // defpackage.jx7
    public final void Y(lx7 lx7Var) {
        if (this.f == null) {
            return;
        }
        j();
        h6 h6Var = this.h.f.d;
        if (h6Var != null) {
            h6Var.l();
        }
    }

    @Override // defpackage.l6
    public final void b() {
        v3f v3fVar = this.h;
        if (v3fVar.i != this) {
            return;
        }
        if (v3fVar.p) {
            v3fVar.j = this;
            v3fVar.k = this.f;
        } else {
            this.f.Z(this);
        }
        this.f = null;
        v3fVar.a(false);
        ActionBarContextView actionBarContextView = v3fVar.f;
        if (actionBarContextView.k == null) {
            actionBarContextView.e();
        }
        v3fVar.c.setHideOnContentScrollEnabled(v3fVar.u);
        v3fVar.i = null;
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
        lig ligVar = this.f;
        if (ligVar != null) {
            return ((o2b) ligVar.b).z(this, menuItem);
        }
        return false;
    }

    @Override // defpackage.l6
    public final lx7 f() {
        return this.e;
    }

    @Override // defpackage.l6
    public final MenuInflater g() {
        return new r2d(this.d);
    }

    @Override // defpackage.l6
    public final CharSequence h() {
        return this.h.f.getSubtitle();
    }

    @Override // defpackage.l6
    public final CharSequence i() {
        return this.h.f.getTitle();
    }

    @Override // defpackage.l6
    public final void j() {
        if (this.h.i != this) {
            return;
        }
        lx7 lx7Var = this.e;
        lx7Var.w();
        try {
            this.f.a0(this, lx7Var);
        } finally {
            lx7Var.v();
        }
    }

    @Override // defpackage.l6
    public final boolean k() {
        return this.h.f.s;
    }

    @Override // defpackage.l6
    public final void m(View view) {
        this.h.f.setCustomView(view);
        this.g = new WeakReference(view);
    }

    @Override // defpackage.l6
    public final void n(int i) {
        o(this.h.a.getResources().getString(i));
    }

    @Override // defpackage.l6
    public final void o(CharSequence charSequence) {
        this.h.f.setSubtitle(charSequence);
    }

    @Override // defpackage.l6
    public final void p(int i) {
        q(this.h.a.getResources().getString(i));
    }

    @Override // defpackage.l6
    public final void q(CharSequence charSequence) {
        this.h.f.setTitle(charSequence);
    }

    @Override // defpackage.l6
    public final void r(boolean z) {
        this.b = z;
        this.h.f.setTitleOptional(z);
    }
}
