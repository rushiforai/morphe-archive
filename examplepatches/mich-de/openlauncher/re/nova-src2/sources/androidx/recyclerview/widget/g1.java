package androidx.recyclerview.widget;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.View;

/* loaded from: classes2.dex */
public final class g1 extends z0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14968a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x2 f14969b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g1(x2 x2Var, Context context, int i5) {
        super(context);
        this.f14968a = i5;
        this.f14969b = x2Var;
    }

    @Override // androidx.recyclerview.widget.z0
    public final float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
        int i5;
        switch (this.f14968a) {
            case 0:
                i5 = displayMetrics.densityDpi;
                break;
            default:
                i5 = displayMetrics.densityDpi;
                break;
        }
        return 100.0f / i5;
    }

    @Override // androidx.recyclerview.widget.z0
    public int calculateTimeForScrolling(int i5) {
        switch (this.f14968a) {
            case 0:
                return Math.min(100, super.calculateTimeForScrolling(i5));
            default:
                return super.calculateTimeForScrolling(i5);
        }
    }

    @Override // androidx.recyclerview.widget.z0, androidx.recyclerview.widget.n2
    public final void onTargetFound(View view, o2 o2Var, l2 l2Var) {
        switch (this.f14968a) {
            case 0:
                h1 h1Var = (h1) this.f14969b;
                int[] iArrCalculateDistanceToFinalSnap = h1Var.calculateDistanceToFinalSnap(h1Var.mRecyclerView.getLayoutManager(), view);
                int i5 = iArrCalculateDistanceToFinalSnap[0];
                int i11 = iArrCalculateDistanceToFinalSnap[1];
                int iCalculateTimeForDeceleration = calculateTimeForDeceleration(Math.max(Math.abs(i5), Math.abs(i11)));
                if (iCalculateTimeForDeceleration > 0) {
                    l2Var.b(i5, i11, this.mDecelerateInterpolator, iCalculateTimeForDeceleration);
                    break;
                }
                break;
            default:
                x2 x2Var = this.f14969b;
                RecyclerView recyclerView = x2Var.mRecyclerView;
                if (recyclerView != null) {
                    int[] iArrCalculateDistanceToFinalSnap2 = x2Var.calculateDistanceToFinalSnap(recyclerView.getLayoutManager(), view);
                    int i12 = iArrCalculateDistanceToFinalSnap2[0];
                    int i13 = iArrCalculateDistanceToFinalSnap2[1];
                    int iCalculateTimeForDeceleration2 = calculateTimeForDeceleration(Math.max(Math.abs(i12), Math.abs(i13)));
                    if (iCalculateTimeForDeceleration2 > 0) {
                        l2Var.b(i12, i13, this.mDecelerateInterpolator, iCalculateTimeForDeceleration2);
                        break;
                    }
                }
                break;
        }
    }
}
