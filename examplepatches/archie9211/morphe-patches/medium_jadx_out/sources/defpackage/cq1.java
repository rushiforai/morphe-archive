package defpackage;

import android.view.View;
import android.widget.AdapterView;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cq1 implements AdapterView.OnItemClickListener {
    public d34 a;
    public WeakReference b;
    public WeakReference c;
    public AdapterView.OnItemClickListener d;
    public boolean e;

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
        view.getClass();
        AdapterView.OnItemClickListener onItemClickListener = this.d;
        if (onItemClickListener != null) {
            onItemClickListener.onItemClick(adapterView, view, i, j);
        }
        View view2 = (View) this.c.get();
        AdapterView adapterView2 = (AdapterView) this.b.get();
        if (view2 == null || adapterView2 == null) {
            return;
        }
        dq1.B(this.a, view2, adapterView2);
    }
}
