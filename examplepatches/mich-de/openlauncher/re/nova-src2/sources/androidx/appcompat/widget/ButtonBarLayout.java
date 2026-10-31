package androidx.appcompat.widget;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public class ButtonBarLayout extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f13762a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f13763b;

    /* renamed from: c, reason: collision with root package name */
    public int f13764c;

    public ButtonBarLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f13764c = -1;
        int[] iArr = l.a.f72898k;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr);
        a1.j(this, context, iArr, attributeSet, typedArrayObtainStyledAttributes, 0);
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(0, true);
        this.f13762a = z11;
        typedArrayObtainStyledAttributes.recycle();
        if (getOrientation() == 1) {
            a(z11);
        }
    }

    public final void a(boolean z11) {
        if (this.f13763b != z11) {
            if (!z11 || this.f13762a) {
                this.f13763b = z11;
                setOrientation(z11 ? 1 : 0);
                setGravity(z11 ? 8388613 : 80);
                View viewFindViewById = findViewById(2131428891);
                if (viewFindViewById != null) {
                    viewFindViewById.setVisibility(z11 ? 8 : 4);
                }
                for (int childCount = getChildCount() - 2; childCount >= 0; childCount--) {
                    bringChildToFront(getChildAt(childCount));
                }
            }
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int iMakeMeasureSpec;
        boolean z11;
        int i12;
        int paddingBottom;
        int size = View.MeasureSpec.getSize(i5);
        int i13 = 0;
        boolean z12 = this.f13762a;
        if (z12) {
            if (size > this.f13764c && this.f13763b) {
                a(false);
            }
            this.f13764c = size;
        }
        if (this.f13763b || View.MeasureSpec.getMode(i5) != 1073741824) {
            iMakeMeasureSpec = i5;
            z11 = false;
        } else {
            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(size, Integer.MIN_VALUE);
            z11 = true;
        }
        super.onMeasure(iMakeMeasureSpec, i11);
        if (z12 && !this.f13763b && (getMeasuredWidthAndState() & (-16777216)) == 16777216) {
            a(true);
            z11 = true;
        }
        if (z11) {
            super.onMeasure(i5, i11);
        }
        int childCount = getChildCount();
        int i14 = 0;
        while (true) {
            i12 = -1;
            if (i14 >= childCount) {
                i14 = -1;
                break;
            } else if (getChildAt(i14).getVisibility() == 0) {
                break;
            } else {
                i14++;
            }
        }
        if (i14 >= 0) {
            View childAt = getChildAt(i14);
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt.getLayoutParams();
            int measuredHeight = childAt.getMeasuredHeight() + getPaddingTop() + layoutParams.topMargin + layoutParams.bottomMargin;
            if (this.f13763b) {
                int i15 = i14 + 1;
                int childCount2 = getChildCount();
                while (true) {
                    if (i15 >= childCount2) {
                        break;
                    }
                    if (getChildAt(i15).getVisibility() == 0) {
                        i12 = i15;
                        break;
                    }
                    i15++;
                }
                if (i12 >= 0) {
                    paddingBottom = getChildAt(i12).getPaddingTop() + ((int) (getResources().getDisplayMetrics().density * 16.0f));
                } else {
                    i13 = measuredHeight;
                }
            } else {
                paddingBottom = getPaddingBottom();
            }
            i13 = paddingBottom + measuredHeight;
        }
        WeakHashMap weakHashMap = a1.f250a;
        if (getMinimumHeight() != i13) {
            setMinimumHeight(i13);
            if (i11 == 0) {
                super.onMeasure(i5, i11);
            }
        }
    }
}
