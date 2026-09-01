package defpackage;

import android.content.Context;
import android.view.View;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class znd implements View.OnClickListener {
    public final b6 a;
    public final /* synthetic */ bod b;

    public znd(bod bodVar) {
        this.b = bodVar;
        Context context = bodVar.a.getContext();
        CharSequence charSequence = bodVar.h;
        b6 b6Var = new b6();
        b6Var.e = 4096;
        b6Var.g = 4096;
        b6Var.l = null;
        b6Var.m = null;
        b6Var.n = false;
        b6Var.o = false;
        b6Var.p = 16;
        b6Var.i = context;
        b6Var.a = charSequence;
        this.a = b6Var;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        bod bodVar = this.b;
        Window.Callback callback = bodVar.k;
        if (callback == null || !bodVar.l) {
            return;
        }
        callback.onMenuItemSelected(0, this.a);
    }
}
