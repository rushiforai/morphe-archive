package androidx.recyclerview.widget;

import android.graphics.PointF;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes2.dex */
public final class h1 extends x2 {

    /* renamed from: a, reason: collision with root package name */
    public e1 f14979a;

    /* renamed from: b, reason: collision with root package name */
    public d1 f14980b;

    public static int a(View view, f1 f1Var) {
        return ((f1Var.c(view) / 2) + f1Var.e(view)) - ((f1Var.l() / 2) + f1Var.k());
    }

    public static View b(z1 z1Var, f1 f1Var) {
        int childCount = z1Var.getChildCount();
        View view = null;
        if (childCount == 0) {
            return null;
        }
        int iL = (f1Var.l() / 2) + f1Var.k();
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt = z1Var.getChildAt(i11);
            int iAbs = Math.abs(((f1Var.c(childAt) / 2) + f1Var.e(childAt)) - iL);
            if (iAbs < i5) {
                view = childAt;
                i5 = iAbs;
            }
        }
        return view;
    }

    public final f1 c(z1 z1Var) {
        d1 d1Var = this.f14980b;
        if (d1Var == null || d1Var.f14956a != z1Var) {
            this.f14980b = new d1(z1Var);
        }
        return this.f14980b;
    }

    @Override // androidx.recyclerview.widget.x2
    public final int[] calculateDistanceToFinalSnap(z1 z1Var, View view) {
        int[] iArr = new int[2];
        if (z1Var.canScrollHorizontally()) {
            iArr[0] = a(view, c(z1Var));
        } else {
            iArr[0] = 0;
        }
        if (z1Var.canScrollVertically()) {
            iArr[1] = a(view, d(z1Var));
            return iArr;
        }
        iArr[1] = 0;
        return iArr;
    }

    @Override // androidx.recyclerview.widget.x2
    public final n2 createScroller(z1 z1Var) {
        if (z1Var instanceof m2) {
            return new g1(this, this.mRecyclerView.getContext(), 0);
        }
        return null;
    }

    public final f1 d(z1 z1Var) {
        e1 e1Var = this.f14979a;
        if (e1Var == null || e1Var.f14956a != z1Var) {
            this.f14979a = new e1(z1Var);
        }
        return this.f14979a;
    }

    @Override // androidx.recyclerview.widget.x2
    public final View findSnapView(z1 z1Var) {
        if (z1Var.canScrollVertically()) {
            return b(z1Var, d(z1Var));
        }
        if (z1Var.canScrollHorizontally()) {
            return b(z1Var, c(z1Var));
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.recyclerview.widget.x2
    public final int findTargetSnapPosition(z1 z1Var, int i5, int i11) {
        PointF pointFComputeScrollVectorForPosition;
        int itemCount = z1Var.getItemCount();
        if (itemCount != 0) {
            View view = null;
            f1 f1VarD = z1Var.canScrollVertically() ? d(z1Var) : z1Var.canScrollHorizontally() ? c(z1Var) : null;
            if (f1VarD != null) {
                int childCount = z1Var.getChildCount();
                boolean z11 = false;
                int i12 = Integer.MAX_VALUE;
                int i13 = Integer.MIN_VALUE;
                View view2 = null;
                for (int i14 = 0; i14 < childCount; i14++) {
                    View childAt = z1Var.getChildAt(i14);
                    if (childAt != null) {
                        int iA = a(childAt, f1VarD);
                        if (iA <= 0 && iA > i13) {
                            view2 = childAt;
                            i13 = iA;
                        }
                        if (iA >= 0 && iA < i12) {
                            view = childAt;
                            i12 = iA;
                        }
                    }
                }
                boolean z12 = !z1Var.canScrollHorizontally() ? i11 <= 0 : i5 <= 0;
                if (z12 && view != null) {
                    return z1Var.getPosition(view);
                }
                if (!z12 && view2 != null) {
                    return z1Var.getPosition(view2);
                }
                if (z12) {
                    view = view2;
                }
                if (view != null) {
                    int position = z1Var.getPosition(view);
                    int itemCount2 = z1Var.getItemCount();
                    if ((z1Var instanceof m2) && (pointFComputeScrollVectorForPosition = ((m2) z1Var).computeScrollVectorForPosition(itemCount2 - 1)) != null && (pointFComputeScrollVectorForPosition.x < 0.0f || pointFComputeScrollVectorForPosition.y < 0.0f)) {
                        z11 = true;
                    }
                    int i15 = position + (z11 == z12 ? -1 : 1);
                    if (i15 >= 0 && i15 < itemCount) {
                        return i15;
                    }
                }
            }
        }
        return -1;
    }
}
