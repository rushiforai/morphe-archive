package defpackage;

import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.widget.ListAdapter;
import androidx.appcompat.app.AlertController$RecycleListView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y20 implements e30, DialogInterface.OnClickListener {
    public bd a;
    public z20 b;
    public CharSequence c;
    public final /* synthetic */ f30 d;

    public y20(f30 f30Var) {
        this.d = f30Var;
    }

    @Override // defpackage.e30
    public final boolean a() {
        bd bdVar = this.a;
        if (bdVar != null) {
            return bdVar.isShowing();
        }
        return false;
    }

    @Override // defpackage.e30
    public final int b() {
        return 0;
    }

    @Override // defpackage.e30
    public final void c(int i) {
        Log.e("AppCompatSpinner", "Cannot set horizontal offset for MODE_DIALOG, ignoring");
    }

    @Override // defpackage.e30
    public final CharSequence d() {
        return this.c;
    }

    @Override // defpackage.e30
    public final void dismiss() {
        bd bdVar = this.a;
        if (bdVar != null) {
            bdVar.dismiss();
            this.a = null;
        }
    }

    @Override // defpackage.e30
    public final Drawable g() {
        return null;
    }

    @Override // defpackage.e30
    public final void h(CharSequence charSequence) {
        this.c = charSequence;
    }

    @Override // defpackage.e30
    public final void i(Drawable drawable) {
        Log.e("AppCompatSpinner", "Cannot set popup background for MODE_DIALOG, ignoring");
    }

    @Override // defpackage.e30
    public final void k(int i) {
        Log.e("AppCompatSpinner", "Cannot set vertical offset for MODE_DIALOG, ignoring");
    }

    @Override // defpackage.e30
    public final void l(int i) {
        Log.e("AppCompatSpinner", "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring");
    }

    @Override // defpackage.e30
    public final void m(int i, int i2) {
        if (this.b == null) {
            return;
        }
        f30 f30Var = this.d;
        ad adVar = new ad(f30Var.getPopupContext());
        wc wcVar = (wc) adVar.c;
        CharSequence charSequence = this.c;
        if (charSequence != null) {
            wcVar.d = charSequence;
        }
        z20 z20Var = this.b;
        int selectedItemPosition = f30Var.getSelectedItemPosition();
        wcVar.m = z20Var;
        wcVar.n = this;
        wcVar.p = selectedItemPosition;
        wcVar.o = true;
        bd bdVarH = adVar.h();
        this.a = bdVarH;
        AlertController$RecycleListView alertController$RecycleListView = bdVarH.g.f;
        alertController$RecycleListView.setTextDirection(i);
        alertController$RecycleListView.setTextAlignment(i2);
        this.a.show();
    }

    @Override // defpackage.e30
    public final int n() {
        return 0;
    }

    @Override // defpackage.e30
    public final void o(ListAdapter listAdapter) {
        this.b = (z20) listAdapter;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        f30 f30Var = this.d;
        f30Var.setSelection(i);
        if (f30Var.getOnItemClickListener() != null) {
            f30Var.performItemClick(null, i, this.b.getItemId(i));
        }
        dismiss();
    }
}
