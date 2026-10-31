package r;

import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.widget.ListAdapter;
import androidx.appcompat.app.AlertController$RecycleListView;

/* loaded from: classes2.dex */
public final class c0 implements g0, DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public m.k f84679a;

    /* renamed from: b, reason: collision with root package name */
    public d0 f84680b;

    /* renamed from: c, reason: collision with root package name */
    public CharSequence f84681c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ androidx.appcompat.widget.b f84682d;

    public c0(androidx.appcompat.widget.b bVar) {
        this.f84682d = bVar;
    }

    @Override // r.g0
    public final int a() {
        return 0;
    }

    @Override // r.g0
    public final void b(int i5) {
        Log.e("AppCompatSpinner", "Cannot set horizontal offset for MODE_DIALOG, ignoring");
    }

    @Override // r.g0
    public final CharSequence c() {
        return this.f84681c;
    }

    @Override // r.g0
    public final Drawable d() {
        return null;
    }

    @Override // r.g0
    public final void dismiss() {
        m.k kVar = this.f84679a;
        if (kVar != null) {
            kVar.dismiss();
            this.f84679a = null;
        }
    }

    @Override // r.g0
    public final void e(CharSequence charSequence) {
        this.f84681c = charSequence;
    }

    @Override // r.g0
    public final void f(int i5) {
        Log.e("AppCompatSpinner", "Cannot set vertical offset for MODE_DIALOG, ignoring");
    }

    @Override // r.g0
    public final void g(int i5) {
        Log.e("AppCompatSpinner", "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring");
    }

    @Override // r.g0
    public final void h(int i5, int i11) {
        if (this.f84680b == null) {
            return;
        }
        androidx.appcompat.widget.b bVar = this.f84682d;
        m.j jVar = new m.j(bVar.f13832b);
        CharSequence charSequence = this.f84681c;
        if (charSequence != null) {
            jVar.setTitle(charSequence);
        }
        d0 d0Var = this.f84680b;
        int selectedItemPosition = bVar.getSelectedItemPosition();
        m.g gVar = jVar.f75297a;
        gVar.o = d0Var;
        gVar.f75257p = this;
        gVar.f75262u = selectedItemPosition;
        gVar.f75261t = true;
        m.k kVarCreate = jVar.create();
        this.f84679a = kVarCreate;
        AlertController$RecycleListView alertController$RecycleListView = kVarCreate.f75307f.f75274f;
        alertController$RecycleListView.setTextDirection(i5);
        alertController$RecycleListView.setTextAlignment(i11);
        this.f84679a.show();
    }

    @Override // r.g0
    public final int i() {
        return 0;
    }

    @Override // r.g0
    public final boolean isShowing() {
        m.k kVar = this.f84679a;
        if (kVar != null) {
            return kVar.isShowing();
        }
        return false;
    }

    @Override // r.g0
    public final void j(ListAdapter listAdapter) {
        this.f84680b = (d0) listAdapter;
    }

    @Override // r.g0
    public final void l(Drawable drawable) {
        Log.e("AppCompatSpinner", "Cannot set popup background for MODE_DIALOG, ignoring");
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        androidx.appcompat.widget.b bVar = this.f84682d;
        bVar.setSelection(i5);
        if (bVar.getOnItemClickListener() != null) {
            bVar.performItemClick(null, i5, this.f84680b.getItemId(i5));
        }
        dismiss();
    }
}
