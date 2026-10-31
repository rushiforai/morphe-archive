package m;

import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import androidx.appcompat.app.AlertController$RecycleListView;

/* loaded from: classes2.dex */
public final class d extends ArrayAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AlertController$RecycleListView f75196a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f75197b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(g gVar, ContextThemeWrapper contextThemeWrapper, int i5, CharSequence[] charSequenceArr, AlertController$RecycleListView alertController$RecycleListView) {
        super(contextThemeWrapper, i5, 16908308, charSequenceArr);
        this.f75197b = gVar;
        this.f75196a = alertController$RecycleListView;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        View view2 = super.getView(i5, view, viewGroup);
        boolean[] zArr = this.f75197b.f75259r;
        if (zArr != null && zArr[i5]) {
            this.f75196a.setItemChecked(i5, true);
        }
        return view2;
    }
}
