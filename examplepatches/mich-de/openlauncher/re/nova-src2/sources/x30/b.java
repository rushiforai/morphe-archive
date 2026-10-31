package x30;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: classes4.dex */
public final class b implements AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener {
    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        c cVar;
        int i11;
        e eVar = (e) adapterView;
        if (eVar.f95049h.getItemViewType(i5) == 0 && (i11 = (cVar = (c) view).f95037a) != -1) {
            View childAt = cVar.getChildAt(i11);
            int iB = eVar.f95049h.b(i5, i11);
            eVar.f95050i.onItemClick(eVar, childAt, iB, eVar.f95049h.f95057b.getItemId(iB));
        }
    }

    @Override // android.widget.AdapterView.OnItemLongClickListener
    public final boolean onItemLongClick(AdapterView adapterView, View view, int i5, long j11) {
        e eVar = (e) adapterView;
        c cVar = (c) view;
        int i11 = cVar.f95037a;
        if (i11 == -1) {
            return false;
        }
        View childAt = cVar.getChildAt(i11);
        int iB = eVar.f95049h.b(i5, i11);
        return eVar.f95051j.onItemLongClick(eVar, childAt, iB, eVar.f95049h.f95057b.getItemId(iB));
    }
}
