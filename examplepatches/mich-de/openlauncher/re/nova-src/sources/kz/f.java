package kz;

import com.android.launcher3.CellLayout;
import com.teslacoilsw.launcher.CellLayoutPagedView;
import e10.h3;
import e10.y2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends CellLayoutPagedView {

    /* renamed from: f0, reason: collision with root package name */
    public boolean f72869f0;

    /* renamed from: g0, reason: collision with root package name */
    public boolean f72870g0;

    @Override // o9.s2
    public final boolean S() {
        return this.f72870g0;
    }

    @Override // o9.s2
    public final void W() {
        y0();
    }

    @Override // o9.s2
    public final void X() {
        super.X();
        y0();
    }

    @Override // o9.s2
    public final void b0(int i5) {
        super.b0(i5);
        if (getScaleX() == 1.0f) {
            int iG = this.f80118t.g(this);
            if ((iG > this.f80109i || iG < 0 || i5 < getWidth() / 2.0f) && !this.f72870g0) {
                return;
            }
            ((h3) y2.f51877a.Q().l()).d(this, i5);
        }
    }

    @Override // o9.s2, android.view.View
    public final void onScrollChanged(int i5, int i11, int i12, int i13) {
        super.onScrollChanged(i5, i11, i12, i13);
        x0();
    }

    public final void x0() {
        if (this.f72869f0) {
            int childCount = getChildCount();
            int[] iArrP = P();
            int i5 = iArrP[0];
            int i11 = iArrP[1];
            if (i5 == i11) {
                if (i11 < childCount - 1) {
                    i11++;
                } else if (i5 > 0) {
                    i5--;
                }
            }
            int i12 = 0;
            while (i12 < childCount) {
                boolean z11 = i5 <= i12 && i12 <= i11;
                if ((i5 == -1 && i12 == childCount - 1) || (i11 == childCount && i12 == 0)) {
                    z11 = true;
                }
                CellLayout cellLayoutU0 = u0(i12);
                Intrinsics.d(cellLayoutU0);
                cellLayoutU0.s(z11);
                i12++;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void y0() {
        boolean z11;
        if (this.B) {
            h3 h3Var = (h3) y2.f51877a.Q().l();
            h3Var.getClass();
            z11 = (h3Var == h3.f51571c || h3Var == h3.f51572d) ? false : true;
        }
        if (z11 != this.f72869f0) {
            this.f72869f0 = z11;
            if (z11) {
                x0();
                return;
            }
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                CellLayout cellLayoutU0 = u0(i5);
                if (cellLayoutU0 != null) {
                    cellLayoutU0.s(false);
                }
            }
        }
    }
}
