package androidx.appcompat.view;

import android.content.Context;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import q.z;

/* loaded from: classes2.dex */
public final class f extends ActionMode {

    /* renamed from: a, reason: collision with root package name */
    public final Context f13619a;

    /* renamed from: b, reason: collision with root package name */
    public final b f13620b;

    public f(Context context, b bVar) {
        this.f13619a = context;
        this.f13620b = bVar;
    }

    @Override // android.view.ActionMode
    public final void finish() {
        this.f13620b.b();
    }

    @Override // android.view.ActionMode
    public final View getCustomView() {
        return this.f13620b.d();
    }

    @Override // android.view.ActionMode
    public final Menu getMenu() {
        return new z(this.f13619a, this.f13620b.e());
    }

    @Override // android.view.ActionMode
    public final MenuInflater getMenuInflater() {
        return this.f13620b.f();
    }

    @Override // android.view.ActionMode
    public final CharSequence getSubtitle() {
        return this.f13620b.g();
    }

    @Override // android.view.ActionMode
    public final Object getTag() {
        return this.f13620b.f13605a;
    }

    @Override // android.view.ActionMode
    public final CharSequence getTitle() {
        return this.f13620b.h();
    }

    @Override // android.view.ActionMode
    public final boolean getTitleOptionalHint() {
        return this.f13620b.f13606b;
    }

    @Override // android.view.ActionMode
    public final void invalidate() {
        this.f13620b.i();
    }

    @Override // android.view.ActionMode
    public final boolean isTitleOptional() {
        return this.f13620b.j();
    }

    @Override // android.view.ActionMode
    public final void setCustomView(View view) {
        this.f13620b.k(view);
    }

    @Override // android.view.ActionMode
    public final void setSubtitle(CharSequence charSequence) {
        this.f13620b.m(charSequence);
    }

    @Override // android.view.ActionMode
    public final void setTag(Object obj) {
        this.f13620b.f13605a = obj;
    }

    @Override // android.view.ActionMode
    public final void setTitle(CharSequence charSequence) {
        this.f13620b.o(charSequence);
    }

    @Override // android.view.ActionMode
    public final void setTitleOptionalHint(boolean z11) {
        this.f13620b.p(z11);
    }

    @Override // android.view.ActionMode
    public final void setSubtitle(int i5) {
        this.f13620b.l(i5);
    }

    @Override // android.view.ActionMode
    public final void setTitle(int i5) {
        this.f13620b.n(i5);
    }
}
