package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qz6 extends ViewGroup {
    public boolean a;
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public float g;
    public boolean h;
    public int[] i;
    public int[] j;
    public Drawable k;
    public int l;
    public int m;
    public int n;
    public int o;

    public qz6(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.a = true;
        this.b = -1;
        this.c = 0;
        this.e = 8388659;
        int[] iArr = esa.n;
        vwa vwaVarX = vwa.x(context, attributeSet, iArr, 0);
        ute.n(this, context, iArr, attributeSet, (TypedArray) vwaVarX.c, 0);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        int i = typedArray.getInt(1, -1);
        if (i >= 0) {
            setOrientation(i);
        }
        int i2 = typedArray.getInt(0, -1);
        if (i2 >= 0) {
            setGravity(i2);
        }
        boolean z = typedArray.getBoolean(2, true);
        if (!z) {
            setBaselineAligned(z);
        }
        this.g = typedArray.getFloat(4, -1.0f);
        this.b = typedArray.getInt(3, -1);
        this.h = typedArray.getBoolean(7, false);
        setDividerDrawable(vwaVarX.q(5));
        this.n = typedArray.getInt(8, 0);
        this.o = typedArray.getDimensionPixelSize(6, 0);
        vwaVarX.C();
    }

    public final void c(Canvas canvas, int i) {
        this.k.setBounds(getPaddingLeft() + this.o, i, (getWidth() - getPaddingRight()) - this.o, this.m + i);
        this.k.draw(canvas);
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof pz6;
    }

    public final void d(Canvas canvas, int i) {
        this.k.setBounds(i, getPaddingTop() + this.o, this.l + i, (getHeight() - getPaddingBottom()) - this.o);
        this.k.draw(canvas);
    }

    @Override // android.view.ViewGroup
    /* JADX INFO: renamed from: e, reason: merged with bridge method [inline-methods] */
    public pz6 generateDefaultLayoutParams() {
        int i = this.d;
        if (i == 0) {
            return new pz6(-2, -2);
        }
        if (i == 1) {
            return new pz6(-1, -2);
        }
        return null;
    }

    @Override // android.view.ViewGroup
    /* JADX INFO: renamed from: f, reason: merged with bridge method [inline-methods] */
    public pz6 generateLayoutParams(AttributeSet attributeSet) {
        return new pz6(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    /* JADX INFO: renamed from: g, reason: merged with bridge method [inline-methods] */
    public pz6 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof pz6 ? new pz6((pz6) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new pz6((ViewGroup.MarginLayoutParams) layoutParams) : new pz6(layoutParams);
    }

    @Override // android.view.View
    public int getBaseline() {
        int i;
        if (this.b < 0) {
            return super.getBaseline();
        }
        int childCount = getChildCount();
        int i2 = this.b;
        if (childCount <= i2) {
            ygf.i("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
            return 0;
        }
        View childAt = getChildAt(i2);
        int baseline = childAt.getBaseline();
        if (baseline == -1) {
            if (this.b == 0) {
                return -1;
            }
            ygf.i("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
            return 0;
        }
        int bottom = this.c;
        if (this.d == 1 && (i = this.e & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) != 48) {
            if (i == 16) {
                bottom += ((((getBottom() - getTop()) - getPaddingTop()) - getPaddingBottom()) - this.f) / 2;
            } else if (i == 80) {
                bottom = ((getBottom() - getTop()) - getPaddingBottom()) - this.f;
            }
        }
        return bottom + ((LinearLayout.LayoutParams) ((pz6) childAt.getLayoutParams())).topMargin + baseline;
    }

    public int getBaselineAlignedChildIndex() {
        return this.b;
    }

    public Drawable getDividerDrawable() {
        return this.k;
    }

    public int getDividerPadding() {
        return this.o;
    }

    public int getDividerWidth() {
        return this.l;
    }

    public int getGravity() {
        return this.e;
    }

    public int getOrientation() {
        return this.d;
    }

    public int getShowDividers() {
        return this.n;
    }

    public int getVirtualChildCount() {
        return getChildCount();
    }

    public float getWeightSum() {
        return this.g;
    }

    public final boolean h(int i) {
        if (i == 0) {
            return (this.n & 1) != 0;
        }
        int childCount = getChildCount();
        int i2 = this.n;
        if (i == childCount) {
            return (i2 & 4) != 0;
        }
        if ((i2 & 2) != 0) {
            for (int i3 = i - 1; i3 >= 0; i3--) {
                if (getChildAt(i3).getVisibility() != 8) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        int right;
        int left;
        int i;
        if (this.k == null) {
            return;
        }
        int i2 = 0;
        if (this.d == 1) {
            int virtualChildCount = getVirtualChildCount();
            while (i2 < virtualChildCount) {
                View childAt = getChildAt(i2);
                if (childAt != null && childAt.getVisibility() != 8 && h(i2)) {
                    c(canvas, (childAt.getTop() - ((LinearLayout.LayoutParams) ((pz6) childAt.getLayoutParams())).topMargin) - this.m);
                }
                i2++;
            }
            if (h(virtualChildCount)) {
                View childAt2 = getChildAt(virtualChildCount - 1);
                c(canvas, childAt2 == null ? (getHeight() - getPaddingBottom()) - this.m : childAt2.getBottom() + ((LinearLayout.LayoutParams) ((pz6) childAt2.getLayoutParams())).bottomMargin);
                return;
            }
            return;
        }
        int virtualChildCount2 = getVirtualChildCount();
        boolean z = bwe.a;
        boolean z2 = getLayoutDirection() == 1;
        while (i2 < virtualChildCount2) {
            View childAt3 = getChildAt(i2);
            if (childAt3 != null && childAt3.getVisibility() != 8 && h(i2)) {
                pz6 pz6Var = (pz6) childAt3.getLayoutParams();
                d(canvas, z2 ? childAt3.getRight() + ((LinearLayout.LayoutParams) pz6Var).rightMargin : (childAt3.getLeft() - ((LinearLayout.LayoutParams) pz6Var).leftMargin) - this.l);
            }
            i2++;
        }
        if (h(virtualChildCount2)) {
            View childAt4 = getChildAt(virtualChildCount2 - 1);
            if (childAt4 != null) {
                pz6 pz6Var2 = (pz6) childAt4.getLayoutParams();
                if (z2) {
                    left = childAt4.getLeft() - ((LinearLayout.LayoutParams) pz6Var2).leftMargin;
                    i = this.l;
                    right = left - i;
                } else {
                    right = childAt4.getRight() + ((LinearLayout.LayoutParams) pz6Var2).rightMargin;
                }
            } else if (z2) {
                right = getPaddingLeft();
            } else {
                left = getWidth() - getPaddingRight();
                i = this.l;
                right = left - i;
            }
            d(canvas, right);
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName("androidx.appcompat.widget.LinearLayoutCompat");
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName("androidx.appcompat.widget.LinearLayoutCompat");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0191  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01a9  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onLayout(boolean r23, int r24, int r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 461
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qz6.onLayout(boolean, int, int, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:231:0x04dd  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x04f2  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x0520  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x0530  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x0537  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0541  */
    /* JADX WARN: Removed duplicated region for block: B:370:0x0792  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0146  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onMeasure(int r39, int r40) {
        /*
            Method dump skipped, instruction units count: 2140
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qz6.onMeasure(int, int):void");
    }

    public void setBaselineAligned(boolean z) {
        this.a = z;
    }

    public void setBaselineAlignedChildIndex(int i) {
        if (i >= 0 && i < getChildCount()) {
            this.b = i;
            return;
        }
        throw new IllegalArgumentException("base aligned child index out of range (0, " + getChildCount() + ")");
    }

    public void setDividerDrawable(Drawable drawable) {
        if (drawable == this.k) {
            return;
        }
        this.k = drawable;
        if (drawable != null) {
            this.l = drawable.getIntrinsicWidth();
            this.m = drawable.getIntrinsicHeight();
        } else {
            this.l = 0;
            this.m = 0;
        }
        setWillNotDraw(drawable == null);
        requestLayout();
    }

    public void setDividerPadding(int i) {
        this.o = i;
    }

    public void setGravity(int i) {
        if (this.e != i) {
            if ((8388615 & i) == 0) {
                i |= 8388611;
            }
            if ((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 0) {
                i |= 48;
            }
            this.e = i;
            requestLayout();
        }
    }

    public void setHorizontalGravity(int i) {
        int i2 = i & 8388615;
        int i3 = this.e;
        if ((8388615 & i3) != i2) {
            this.e = i2 | ((-8388616) & i3);
            requestLayout();
        }
    }

    public void setMeasureWithLargestChildEnabled(boolean z) {
        this.h = z;
    }

    public void setOrientation(int i) {
        if (this.d != i) {
            this.d = i;
            requestLayout();
        }
    }

    public void setShowDividers(int i) {
        if (i != this.n) {
            requestLayout();
        }
        this.n = i;
    }

    public void setVerticalGravity(int i) {
        int i2 = i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        int i3 = this.e;
        if ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) != i2) {
            this.e = i2 | (i3 & (-113));
            requestLayout();
        }
    }

    public void setWeightSum(float f) {
        this.g = Math.max(0.0f, f);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }
}
