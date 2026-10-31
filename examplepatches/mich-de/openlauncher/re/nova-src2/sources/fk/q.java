package fk;

import android.view.View;
import android.widget.AdapterView;
import r.f0;
import r.t1;

/* loaded from: classes3.dex */
public final class q implements AdapterView.OnItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55253a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f55254b;

    public /* synthetic */ q(Object obj, int i5) {
        this.f55253a = i5;
        this.f55254b = obj;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        switch (this.f55253a) {
            case 0:
                s sVar = (s) this.f55254b;
                t1 t1Var = sVar.f55258e;
                s.a(sVar, i5 < 0 ? !t1Var.f84883z.isShowing() ? null : t1Var.f84862c.getSelectedItem() : sVar.getAdapter().getItem(i5));
                AdapterView.OnItemClickListener onItemClickListener = sVar.getOnItemClickListener();
                if (onItemClickListener != null) {
                    if (view == null || i5 < 0) {
                        view = !t1Var.f84883z.isShowing() ? null : t1Var.f84862c.getSelectedView();
                        i5 = !t1Var.f84883z.isShowing() ? -1 : t1Var.f84862c.getSelectedItemPosition();
                        j11 = !t1Var.f84883z.isShowing() ? Long.MIN_VALUE : t1Var.f84862c.getSelectedItemId();
                    }
                    onItemClickListener.onItemClick(t1Var.f84862c, view, i5, j11);
                }
                t1Var.dismiss();
                break;
            default:
                f0 f0Var = (f0) this.f55254b;
                f0Var.G.setSelection(i5);
                if (f0Var.G.getOnItemClickListener() != null) {
                    f0Var.G.performItemClick(view, i5, f0Var.D.getItemId(i5));
                }
                f0Var.dismiss();
                break;
        }
    }
}
