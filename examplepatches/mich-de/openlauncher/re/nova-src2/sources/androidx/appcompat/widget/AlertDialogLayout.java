package androidx.appcompat.widget;

import a5.a1;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import b.c0;
import java.util.WeakHashMap;
import r.j1;
import r.k1;

/* loaded from: classes2.dex */
public class AlertDialogLayout extends k1 {
    public AlertDialogLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    public static int k(View view) {
        WeakHashMap weakHashMap = a1.f250a;
        int minimumHeight = view.getMinimumHeight();
        if (minimumHeight > 0) {
            return minimumHeight;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.getChildCount() == 1) {
                return k(viewGroup.getChildAt(0));
            }
        }
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0099  */
    @Override // r.k1, android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int iC;
        int i14;
        int i15;
        int paddingLeft = getPaddingLeft();
        int i16 = i12 - i5;
        int paddingRight = i16 - getPaddingRight();
        int paddingRight2 = (i16 - paddingLeft) - getPaddingRight();
        int measuredHeight = getMeasuredHeight();
        int childCount = getChildCount();
        int i17 = this.f84773e;
        int i18 = i17 & 112;
        int i19 = i17 & 8388615;
        int paddingTop = i18 != 16 ? i18 != 80 ? getPaddingTop() : ((getPaddingTop() + i13) - i11) - measuredHeight : (((i13 - i11) - measuredHeight) / 2) + getPaddingTop();
        Drawable drawable = this.f84779k;
        int intrinsicHeight = drawable == null ? 0 : drawable.getIntrinsicHeight();
        for (int i21 = 0; i21 < childCount; i21++) {
            View childAt = getChildAt(i21);
            if (childAt != null && childAt.getVisibility() != 8) {
                int measuredWidth = childAt.getMeasuredWidth();
                int measuredHeight2 = childAt.getMeasuredHeight();
                j1 j1Var = (j1) childAt.getLayoutParams();
                int i22 = ((LinearLayout.LayoutParams) j1Var).gravity;
                if (i22 < 0) {
                    i22 = i19;
                }
                int absoluteGravity = Gravity.getAbsoluteGravity(i22, getLayoutDirection()) & 7;
                if (absoluteGravity == 1) {
                    iC = c0.c(paddingRight2, measuredWidth, 2, paddingLeft) + ((LinearLayout.LayoutParams) j1Var).leftMargin;
                    i14 = ((LinearLayout.LayoutParams) j1Var).rightMargin;
                } else if (absoluteGravity != 5) {
                    i15 = ((LinearLayout.LayoutParams) j1Var).leftMargin + paddingLeft;
                    if (j(i21)) {
                        paddingTop += intrinsicHeight;
                    }
                    int i23 = paddingTop + ((LinearLayout.LayoutParams) j1Var).topMargin;
                    childAt.layout(i15, i23, measuredWidth + i15, i23 + measuredHeight2);
                    paddingTop = measuredHeight2 + ((LinearLayout.LayoutParams) j1Var).bottomMargin + i23;
                } else {
                    iC = paddingRight - measuredWidth;
                    i14 = ((LinearLayout.LayoutParams) j1Var).rightMargin;
                }
                i15 = iC - i14;
                if (j(i21)) {
                }
                int i232 = paddingTop + ((LinearLayout.LayoutParams) j1Var).topMargin;
                childAt.layout(i15, i232, measuredWidth + i15, i232 + measuredHeight2);
                paddingTop = measuredHeight2 + ((LinearLayout.LayoutParams) j1Var).bottomMargin + i232;
            }
        }
    }

    @Override // r.k1, android.view.View
    public final void onMeasure(int i5, int i11) {
        int iCombineMeasuredStates;
        int iK;
        int measuredHeight;
        int measuredHeight2;
        AlertDialogLayout alertDialogLayout = this;
        int childCount = alertDialogLayout.getChildCount();
        View view = null;
        View view2 = null;
        View view3 = null;
        for (int i12 = 0; i12 < childCount; i12++) {
            View childAt = alertDialogLayout.getChildAt(i12);
            if (childAt.getVisibility() != 8) {
                int id2 = childAt.getId();
                if (id2 == 2131429066) {
                    view = childAt;
                } else if (id2 == 2131427613) {
                    view2 = childAt;
                } else {
                    if ((id2 != 2131427752 && id2 != 2131427801) || view3 != null) {
                        super.onMeasure(i5, i11);
                        return;
                    }
                    view3 = childAt;
                }
            }
        }
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i5);
        int paddingBottom = alertDialogLayout.getPaddingBottom() + alertDialogLayout.getPaddingTop();
        if (view != null) {
            view.measure(i5, 0);
            paddingBottom += view.getMeasuredHeight();
            iCombineMeasuredStates = View.combineMeasuredStates(0, view.getMeasuredState());
        } else {
            iCombineMeasuredStates = 0;
        }
        if (view2 != null) {
            view2.measure(i5, 0);
            iK = k(view2);
            measuredHeight = view2.getMeasuredHeight() - iK;
            paddingBottom += iK;
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, view2.getMeasuredState());
        } else {
            iK = 0;
            measuredHeight = 0;
        }
        if (view3 != null) {
            view3.measure(i5, mode == 0 ? 0 : View.MeasureSpec.makeMeasureSpec(Math.max(0, size - paddingBottom), mode));
            measuredHeight2 = view3.getMeasuredHeight();
            paddingBottom += measuredHeight2;
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, view3.getMeasuredState());
        } else {
            measuredHeight2 = 0;
        }
        int i13 = size - paddingBottom;
        if (view2 != null) {
            int i14 = paddingBottom - iK;
            int iMin = Math.min(i13, measuredHeight);
            if (iMin > 0) {
                i13 -= iMin;
                iK += iMin;
            }
            view2.measure(i5, View.MeasureSpec.makeMeasureSpec(iK, 1073741824));
            paddingBottom = i14 + view2.getMeasuredHeight();
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, view2.getMeasuredState());
        }
        if (view3 != null && i13 > 0) {
            view3.measure(i5, View.MeasureSpec.makeMeasureSpec(measuredHeight2 + i13, mode));
            paddingBottom = (paddingBottom - measuredHeight2) + view3.getMeasuredHeight();
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, view3.getMeasuredState());
        }
        int iMax = 0;
        for (int i15 = 0; i15 < childCount; i15++) {
            View childAt2 = alertDialogLayout.getChildAt(i15);
            if (childAt2.getVisibility() != 8) {
                iMax = Math.max(iMax, childAt2.getMeasuredWidth());
            }
        }
        int i16 = i11;
        alertDialogLayout.setMeasuredDimension(View.resolveSizeAndState(alertDialogLayout.getPaddingRight() + alertDialogLayout.getPaddingLeft() + iMax, i5, iCombineMeasuredStates), View.resolveSizeAndState(paddingBottom, i16, 0));
        if (mode2 != 1073741824) {
            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(alertDialogLayout.getMeasuredWidth(), 1073741824);
            int i17 = 0;
            while (i17 < childCount) {
                View childAt3 = alertDialogLayout.getChildAt(i17);
                if (childAt3.getVisibility() != 8) {
                    j1 j1Var = (j1) childAt3.getLayoutParams();
                    if (((LinearLayout.LayoutParams) j1Var).width == -1) {
                        int i18 = ((LinearLayout.LayoutParams) j1Var).height;
                        ((LinearLayout.LayoutParams) j1Var).height = childAt3.getMeasuredHeight();
                        alertDialogLayout.measureChildWithMargins(childAt3, iMakeMeasureSpec, 0, i16, 0);
                        ((LinearLayout.LayoutParams) j1Var).height = i18;
                    }
                }
                i17++;
                alertDialogLayout = this;
                i16 = i11;
            }
        }
    }
}
