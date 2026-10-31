package za;

import android.widget.EdgeEffect;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.q1;
import com.android.launcher3.views.SpringRelativeLayout;

/* loaded from: classes.dex */
public final class x extends q1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SpringRelativeLayout f98499a;

    public x(SpringRelativeLayout springRelativeLayout) {
        this.f98499a = springRelativeLayout;
    }

    @Override // androidx.recyclerview.widget.q1
    public final EdgeEffect a(RecyclerView recyclerView, int i5) {
        if (i5 != 1) {
            return new EdgeEffect(recyclerView.getContext());
        }
        SpringRelativeLayout springRelativeLayout = this.f98499a;
        return new w(springRelativeLayout, springRelativeLayout.getContext(), springRelativeLayout.f21309a);
    }
}
