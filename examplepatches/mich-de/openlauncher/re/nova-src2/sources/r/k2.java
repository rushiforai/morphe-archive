package r;

import android.content.Context;
import android.view.View;
import android.view.Window;

/* loaded from: classes2.dex */
public final class k2 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final q.a f84782a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l2 f84783b;

    public k2(l2 l2Var) {
        this.f84783b = l2Var;
        Context context = l2Var.f84789a.getContext();
        CharSequence charSequence = l2Var.f84796h;
        q.a aVar = new q.a();
        aVar.f83159e = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        aVar.f83161g = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        aVar.f83166l = null;
        aVar.f83167m = null;
        aVar.n = false;
        aVar.o = false;
        aVar.f83168p = 16;
        aVar.f83163i = context;
        aVar.f83155a = charSequence;
        this.f84782a = aVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        l2 l2Var = this.f84783b;
        Window.Callback callback = l2Var.f84799k;
        if (callback == null || !l2Var.f84800l) {
            return;
        }
        callback.onMenuItemSelected(0, this.f84782a);
    }
}
