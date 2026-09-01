package defpackage;

import android.content.DialogInterface;
import android.view.View;
import android.widget.AdapterView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vc implements AdapterView.OnItemClickListener {
    public final /* synthetic */ zc a;
    public final /* synthetic */ wc b;

    public vc(wc wcVar, zc zcVar) {
        this.b = wcVar;
        this.a = zcVar;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
        wc wcVar = this.b;
        DialogInterface.OnClickListener onClickListener = wcVar.n;
        zc zcVar = this.a;
        onClickListener.onClick(zcVar.b, i);
        if (wcVar.o) {
            return;
        }
        zcVar.b.dismiss();
    }
}
