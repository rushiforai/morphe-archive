package com.bytedance.sdk.openadsdk.component.reward.view;

import android.util.DisplayMetrics;
import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.d1;
import androidx.recyclerview.widget.e1;
import androidx.recyclerview.widget.f1;
import androidx.recyclerview.widget.l2;
import androidx.recyclerview.widget.m2;
import androidx.recyclerview.widget.n2;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.x2;
import androidx.recyclerview.widget.z0;
import androidx.recyclerview.widget.z1;

/* loaded from: classes2.dex */
public class ycx extends x2 {
    private RecyclerView sya;
    private f1 ycx;

    /* renamed from: zb, reason: collision with root package name */
    private f1 f25021zb;

    private f1 zb(z1 z1Var) {
        f1 f1Var = this.f25021zb;
        if (f1Var == null || f1Var.f14956a != z1Var) {
            this.f25021zb = new d1(z1Var);
        }
        return this.f25021zb;
    }

    @Override // androidx.recyclerview.widget.x2
    public void attachToRecyclerView(RecyclerView recyclerView) throws IllegalStateException {
        this.sya = recyclerView;
        super.attachToRecyclerView(recyclerView);
    }

    @Override // androidx.recyclerview.widget.x2
    public int[] calculateDistanceToFinalSnap(z1 z1Var, View view) {
        int[] iArr = {0, 0};
        if (z1Var.canScrollHorizontally()) {
            iArr[0] = ycx(view, zb(z1Var));
            return iArr;
        }
        if (z1Var.canScrollVertically()) {
            iArr[1] = ycx(view, ycx(z1Var));
        }
        return iArr;
    }

    @Override // androidx.recyclerview.widget.x2
    public n2 createScroller(z1 z1Var) {
        if (z1Var instanceof m2) {
            return new z0(this.sya.getContext()) { // from class: com.bytedance.sdk.openadsdk.component.reward.view.ycx.1
                @Override // androidx.recyclerview.widget.z0
                public float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
                    return 100.0f / displayMetrics.densityDpi;
                }

                @Override // androidx.recyclerview.widget.z0
                public int calculateTimeForScrolling(int i5) {
                    return Math.min(100, super.calculateTimeForScrolling(i5));
                }

                @Override // androidx.recyclerview.widget.z0, androidx.recyclerview.widget.n2
                public void onTargetFound(View view, o2 o2Var, l2 l2Var) {
                    ycx ycxVar = ycx.this;
                    int[] iArrCalculateDistanceToFinalSnap = ycxVar.calculateDistanceToFinalSnap(ycxVar.sya.getLayoutManager(), view);
                    int i5 = iArrCalculateDistanceToFinalSnap[0];
                    int i11 = iArrCalculateDistanceToFinalSnap[1];
                    int iCalculateTimeForDeceleration = calculateTimeForDeceleration(Math.max(Math.abs(i5), Math.abs(i11)));
                    if (iCalculateTimeForDeceleration > 0) {
                        l2Var.b(i5, i11, this.mDecelerateInterpolator, iCalculateTimeForDeceleration);
                    }
                }
            };
        }
        return null;
    }

    @Override // androidx.recyclerview.widget.x2
    public View findSnapView(z1 z1Var) {
        int childCount = z1Var.getChildCount();
        View view = null;
        if (childCount != 0) {
            LinearLayoutManager linearLayoutManager = (LinearLayoutManager) z1Var;
            if (linearLayoutManager.findLastCompletelyVisibleItemPosition() != linearLayoutManager.getItemCount() - 1) {
                f1 f1VarYcx = ycx(z1Var);
                int i5 = LayoutNode.NotPlacedPlaceOrder;
                for (int i11 = 0; i11 < childCount; i11++) {
                    View childAt = linearLayoutManager.getChildAt(i11);
                    int iAbs = Math.abs(f1VarYcx.e(childAt));
                    if (iAbs < i5) {
                        view = childAt;
                        i5 = iAbs;
                    }
                }
                return view;
            }
        }
        return null;
    }

    @Override // androidx.recyclerview.widget.x2
    public int findTargetSnapPosition(z1 z1Var, int i5, int i11) {
        View viewFindSnapView = findSnapView(z1Var);
        int i12 = -1;
        if (viewFindSnapView == null) {
            return -1;
        }
        int position = z1Var.getPosition(viewFindSnapView);
        if (z1Var.canScrollVertically()) {
            i12 = i11 < 0 ? position - 1 : position + 1;
        }
        return Math.min(z1Var.getItemCount() - 1, Math.max(i12, 0));
    }

    private int ycx(View view, f1 f1Var) {
        int iE = f1Var.e(view);
        return iE >= f1Var.k() / 2 ? iE - f1Var.k() : iE;
    }

    private f1 ycx(z1 z1Var) {
        f1 f1Var = this.ycx;
        if (f1Var == null || f1Var.f14956a != z1Var) {
            this.ycx = new e1(z1Var);
        }
        return this.ycx;
    }
}
