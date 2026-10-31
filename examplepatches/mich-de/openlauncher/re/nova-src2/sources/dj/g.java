package dj;

import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

/* loaded from: classes3.dex */
public abstract class g extends l4.b {

    /* renamed from: a, reason: collision with root package name */
    public h f49259a;

    /* renamed from: b, reason: collision with root package name */
    public int f49260b = 0;

    public g() {
    }

    @Override // l4.b
    public boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        x(coordinatorLayout, view, i5);
        if (this.f49259a == null) {
            this.f49259a = new h(view);
        }
        h hVar = this.f49259a;
        View view2 = hVar.f49261a;
        hVar.f49262b = view2.getTop();
        hVar.f49263c = view2.getLeft();
        this.f49259a.a();
        int i11 = this.f49260b;
        if (i11 == 0) {
            return true;
        }
        this.f49259a.b(i11);
        this.f49260b = 0;
        return true;
    }

    public final int w() {
        h hVar = this.f49259a;
        if (hVar != null) {
            return hVar.f49264d;
        }
        return 0;
    }

    public void x(CoordinatorLayout coordinatorLayout, View view, int i5) {
        coordinatorLayout.r(i5, view);
    }

    public g(int i5) {
    }
}
