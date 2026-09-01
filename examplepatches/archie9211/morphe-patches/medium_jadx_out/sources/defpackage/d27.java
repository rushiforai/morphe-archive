package defpackage;

import android.view.View;
import android.widget.AdapterView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d27 implements AdapterView.OnItemSelectedListener {
    public final /* synthetic */ k27 a;

    public d27(k27 k27Var) {
        this.a = k27Var;
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onItemSelected(AdapterView adapterView, View view, int i, long j) {
        ym3 ym3Var;
        if (i == -1 || (ym3Var = this.a.c) == null) {
            return;
        }
        ym3Var.setListSelectionHidden(false);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onNothingSelected(AdapterView adapterView) {
    }
}
