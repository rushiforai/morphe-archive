package androidx.recyclerview.widget;

import com.teslacoilsw.launcher.theme.ThemeListFragment;

/* loaded from: classes2.dex */
public final class y extends e2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15181a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15182b;

    public /* synthetic */ y(Object obj, int i5) {
        this.f15181a = i5;
        this.f15182b = obj;
    }

    @Override // androidx.recyclerview.widget.e2
    public void onScrollStateChanged(RecyclerView recyclerView, int i5) {
        switch (this.f15181a) {
            case 1:
                ((ThemeListFragment) this.f15182b).f46336i = false;
                break;
            default:
                super.onScrollStateChanged(recyclerView, i5);
                break;
        }
    }

    @Override // androidx.recyclerview.widget.e2
    public final void onScrolled(RecyclerView recyclerView, int i5, int i11) {
        switch (this.f15181a) {
            case 0:
                b0 b0Var = (b0) this.f15182b;
                int iComputeHorizontalScrollOffset = recyclerView.computeHorizontalScrollOffset();
                int iComputeVerticalScrollOffset = recyclerView.computeVerticalScrollOffset();
                int i12 = b0Var.f14890a;
                int iComputeVerticalScrollRange = b0Var.f14906s.computeVerticalScrollRange();
                int i13 = b0Var.f14905r;
                b0Var.f14907t = iComputeVerticalScrollRange - i13 > 0 && i13 >= i12;
                int iComputeHorizontalScrollRange = b0Var.f14906s.computeHorizontalScrollRange();
                int i14 = b0Var.f14904q;
                boolean z11 = iComputeHorizontalScrollRange - i14 > 0 && i14 >= i12;
                b0Var.f14908u = z11;
                boolean z12 = b0Var.f14907t;
                if (!z12 && !z11) {
                    if (b0Var.f14909v != 0) {
                        b0Var.f(0);
                        break;
                    }
                } else {
                    if (z12) {
                        float f11 = i13;
                        b0Var.f14901l = (int) ((((f11 / 2.0f) + iComputeVerticalScrollOffset) * f11) / iComputeVerticalScrollRange);
                        b0Var.f14900k = Math.min(i13, (i13 * i13) / iComputeVerticalScrollRange);
                    }
                    if (b0Var.f14908u) {
                        float f12 = iComputeHorizontalScrollOffset;
                        float f13 = i14;
                        b0Var.o = (int) ((((f13 / 2.0f) + f12) * f13) / iComputeHorizontalScrollRange);
                        b0Var.n = Math.min(i14, (i14 * i14) / iComputeHorizontalScrollRange);
                    }
                    int i15 = b0Var.f14909v;
                    if (i15 == 0 || i15 == 1) {
                        b0Var.f(1);
                        break;
                    }
                }
                break;
            default:
                ((ThemeListFragment) this.f15182b).f46336i = false;
                break;
        }
    }
}
