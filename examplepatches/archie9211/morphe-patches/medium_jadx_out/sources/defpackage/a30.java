package defpackage;

import android.view.View;
import android.widget.AdapterView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a30 implements AdapterView.OnItemClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ a30(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                c30 c30Var = (c30) obj;
                f30 f30Var = c30Var.H;
                f30Var.setSelection(i);
                if (f30Var.getOnItemClickListener() != null) {
                    f30Var.performItemClick(view, i, c30Var.E.getItemId(i));
                }
                c30Var.dismiss();
                break;
            default:
                kj7 kj7Var = (kj7) obj;
                k27 k27Var = kj7Var.e;
                kj7Var.setText(kj7Var.convertSelectionToString(i < 0 ? !k27Var.z.isShowing() ? null : k27Var.c.getSelectedItem() : kj7Var.getAdapter().getItem(i)), false);
                AdapterView.OnItemClickListener onItemClickListener = kj7Var.getOnItemClickListener();
                if (onItemClickListener != null) {
                    if (view == null || i < 0) {
                        view = !k27Var.z.isShowing() ? null : k27Var.c.getSelectedView();
                        i = !k27Var.z.isShowing() ? -1 : k27Var.c.getSelectedItemPosition();
                        j = !k27Var.z.isShowing() ? Long.MIN_VALUE : k27Var.c.getSelectedItemId();
                    }
                    onItemClickListener.onItemClick(k27Var.c, view, i, j);
                }
                k27Var.dismiss();
                break;
        }
    }
}
