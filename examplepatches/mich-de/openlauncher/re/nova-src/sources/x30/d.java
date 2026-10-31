package x30;

import android.view.View;
import android.widget.AbsListView;

/* loaded from: classes4.dex */
public final class d implements AbsListView.RecyclerListener {

    /* renamed from: a, reason: collision with root package name */
    public AbsListView.RecyclerListener f95040a;

    @Override // android.widget.AbsListView.RecyclerListener
    public final void onMovedToScrapHeap(View view) {
        AbsListView.RecyclerListener recyclerListener = this.f95040a;
        if (!(view instanceof c)) {
            recyclerListener.onMovedToScrapHeap(view);
            return;
        }
        c cVar = (c) view;
        for (int childCount = cVar.getChildCount() - 1; childCount >= 0; childCount--) {
            recyclerListener.onMovedToScrapHeap(cVar.getChildAt(childCount));
        }
    }
}
