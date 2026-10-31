package q9;

import android.view.View;
import androidx.recyclerview.widget.b2;
import androidx.recyclerview.widget.s2;
import com.android.launcher3.allapps.AllAppsRecyclerView;

/* loaded from: classes.dex */
public final class h implements b2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ bm.a f83839a;

    public h(bm.a aVar) {
        this.f83839a = aVar;
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewAttachedToWindow(View view) {
        bm.a aVar = this.f83839a;
        s2 childViewHolder = ((AllAppsRecyclerView) aVar.f18058c).getChildViewHolder(view);
        if (childViewHolder.getAdapterPosition() == aVar.f18056a) {
            aVar.d(false);
            aVar.f18059d = childViewHolder;
            aVar.d(true);
        }
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewDetachedFromWindow(View view) {
    }
}
