package defpackage;

import android.content.Context;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n2d extends ActionMode {
    public final Context a;
    public final l6 b;

    public n2d(Context context, l6 l6Var) {
        this.a = context;
        this.b = l6Var;
    }

    @Override // android.view.ActionMode
    public final void finish() {
        this.b.b();
    }

    @Override // android.view.ActionMode
    public final View getCustomView() {
        return this.b.c();
    }

    @Override // android.view.ActionMode
    public final Menu getMenu() {
        return new py7(this.a, this.b.f());
    }

    @Override // android.view.ActionMode
    public final MenuInflater getMenuInflater() {
        return this.b.g();
    }

    @Override // android.view.ActionMode
    public final CharSequence getSubtitle() {
        return this.b.h();
    }

    @Override // android.view.ActionMode
    public final Object getTag() {
        return this.b.c;
    }

    @Override // android.view.ActionMode
    public final CharSequence getTitle() {
        return this.b.i();
    }

    @Override // android.view.ActionMode
    public final boolean getTitleOptionalHint() {
        return this.b.b;
    }

    @Override // android.view.ActionMode
    public final void invalidate() {
        this.b.j();
    }

    @Override // android.view.ActionMode
    public final boolean isTitleOptional() {
        return this.b.k();
    }

    @Override // android.view.ActionMode
    public final void setCustomView(View view) {
        this.b.m(view);
    }

    @Override // android.view.ActionMode
    public final void setSubtitle(CharSequence charSequence) {
        this.b.o(charSequence);
    }

    @Override // android.view.ActionMode
    public final void setTag(Object obj) {
        this.b.c = obj;
    }

    @Override // android.view.ActionMode
    public final void setTitle(CharSequence charSequence) {
        this.b.q(charSequence);
    }

    @Override // android.view.ActionMode
    public final void setTitleOptionalHint(boolean z) {
        this.b.r(z);
    }

    @Override // android.view.ActionMode
    public final void setSubtitle(int i) {
        this.b.n(i);
    }

    @Override // android.view.ActionMode
    public final void setTitle(int i) {
        this.b.p(i);
    }
}
