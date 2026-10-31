package q9;

import android.view.View;
import com.android.launcher3.allapps.FloatingHeaderView;
import com.android.systemui.plugins.AllAppsRow;
import mx.j0;

/* loaded from: classes2.dex */
public final class x implements v {

    /* renamed from: a, reason: collision with root package name */
    public final AllAppsRow f83899a;

    /* renamed from: b, reason: collision with root package name */
    public final View f83900b;

    public x(AllAppsRow allAppsRow, FloatingHeaderView floatingHeaderView) {
        this.f83899a = allAppsRow;
        this.f83900b = allAppsRow.setup(floatingHeaderView);
    }

    @Override // q9.v
    /* renamed from: a */
    public final boolean getF46270i() {
        return true;
    }

    @Override // q9.v
    public final void c(int i5, boolean z11) {
        int i11 = z11 ? 4 : 0;
        View view = this.f83900b;
        view.setVisibility(i11);
        if (z11) {
            return;
        }
        view.setTranslationY(i5);
    }

    @Override // q9.v
    public final Class d() {
        return x.class;
    }

    @Override // q9.v
    public final boolean e() {
        return true;
    }

    @Override // q9.v
    public final void f(FloatingHeaderView floatingHeaderView, v[] vVarArr, boolean z11) {
    }

    @Override // q9.v
    public final void g(j0 j0Var) {
    }

    @Override // q9.v
    public final int getExpectedHeight() {
        return this.f83899a.getExpectedHeight();
    }

    @Override // q9.v
    public final View getFocusedChild() {
        return null;
    }
}
