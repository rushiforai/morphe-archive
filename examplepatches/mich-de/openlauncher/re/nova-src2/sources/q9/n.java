package q9;

import androidx.recyclerview.widget.o1;
import com.android.launcher3.allapps.AllAppsRecyclerView;

/* loaded from: classes.dex */
public final class n extends o1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AllAppsRecyclerView f83860a;

    public n(AllAppsRecyclerView allAppsRecyclerView) {
        this.f83860a = allAppsRecyclerView;
    }

    @Override // androidx.recyclerview.widget.o1
    public final void onChanged() {
        this.f83860a.f21047f.clear();
    }
}
