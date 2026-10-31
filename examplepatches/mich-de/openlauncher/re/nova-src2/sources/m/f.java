package m;

import android.view.View;
import android.widget.AdapterView;
import androidx.appcompat.app.AlertController$RecycleListView;

/* loaded from: classes2.dex */
public final class f implements AdapterView.OnItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AlertController$RecycleListView f75216a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f75217b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g f75218c;

    public f(g gVar, AlertController$RecycleListView alertController$RecycleListView, i iVar) {
        this.f75218c = gVar;
        this.f75216a = alertController$RecycleListView;
        this.f75217b = iVar;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        g gVar = this.f75218c;
        boolean[] zArr = gVar.f75259r;
        AlertController$RecycleListView alertController$RecycleListView = this.f75216a;
        if (zArr != null) {
            zArr[i5] = alertController$RecycleListView.isItemChecked(i5);
        }
        gVar.f75263v.onClick(this.f75217b.f75270b, i5, alertController$RecycleListView.isItemChecked(i5));
    }
}
