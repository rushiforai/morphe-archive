package com.google.android.flexbox;

import a5.a1;
import ag.f;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public class FlexboxLayout extends ViewGroup implements ag.a {

    /* renamed from: a, reason: collision with root package name */
    public final int f31602a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31603b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31604c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31605d;

    /* renamed from: e, reason: collision with root package name */
    public final int f31606e;

    /* renamed from: f, reason: collision with root package name */
    public final int f31607f;

    /* renamed from: g, reason: collision with root package name */
    public final Drawable f31608g;

    /* renamed from: h, reason: collision with root package name */
    public final Drawable f31609h;

    /* renamed from: i, reason: collision with root package name */
    public final int f31610i;

    /* renamed from: j, reason: collision with root package name */
    public final int f31611j;

    /* renamed from: k, reason: collision with root package name */
    public final int f31612k;

    /* renamed from: l, reason: collision with root package name */
    public final int f31613l;

    /* renamed from: m, reason: collision with root package name */
    public int[] f31614m;
    public SparseIntArray n;
    public final b o;

    /* renamed from: p, reason: collision with root package name */
    public List f31615p;

    /* renamed from: q, reason: collision with root package name */
    public final ag.b f31616q;

    public static class LayoutParams extends ViewGroup.MarginLayoutParams implements FlexItem {
        public static final Parcelable.Creator<LayoutParams> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public int f31617a;

        /* renamed from: b, reason: collision with root package name */
        public float f31618b;

        /* renamed from: c, reason: collision with root package name */
        public float f31619c;

        /* renamed from: d, reason: collision with root package name */
        public int f31620d;

        /* renamed from: e, reason: collision with root package name */
        public float f31621e;

        /* renamed from: f, reason: collision with root package name */
        public int f31622f;

        /* renamed from: g, reason: collision with root package name */
        public int f31623g;

        /* renamed from: h, reason: collision with root package name */
        public int f31624h;

        /* renamed from: i, reason: collision with root package name */
        public int f31625i;

        /* renamed from: j, reason: collision with root package name */
        public boolean f31626j;

        public LayoutParams() {
            super(new ViewGroup.LayoutParams(-2, -2));
            this.f31617a = 1;
            this.f31618b = 0.0f;
            this.f31619c = 1.0f;
            this.f31620d = -1;
            this.f31621e = -1.0f;
            this.f31622f = -1;
            this.f31623g = -1;
            this.f31624h = 16777215;
            this.f31625i = 16777215;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int A0() {
            return this.f31623g;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int B() {
            return this.f31622f;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int D0() {
            return this.f31625i;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int G() {
            return ((ViewGroup.MarginLayoutParams) this).topMargin;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final void I(int i5) {
            this.f31623g = i5;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float K() {
            return this.f31618b;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float L() {
            return this.f31621e;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final boolean R() {
            return this.f31626j;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int U() {
            return this.f31624h;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int getHeight() {
            return ((ViewGroup.MarginLayoutParams) this).height;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int getOrder() {
            return this.f31617a;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int getWidth() {
            return ((ViewGroup.MarginLayoutParams) this).width;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int l0() {
            return ((ViewGroup.MarginLayoutParams) this).bottomMargin;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int n0() {
            return ((ViewGroup.MarginLayoutParams) this).leftMargin;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final void setMinWidth(int i5) {
            this.f31622f = i5;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int t() {
            return this.f31620d;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float v() {
            return this.f31619c;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeInt(this.f31617a);
            parcel.writeFloat(this.f31618b);
            parcel.writeFloat(this.f31619c);
            parcel.writeInt(this.f31620d);
            parcel.writeFloat(this.f31621e);
            parcel.writeInt(this.f31622f);
            parcel.writeInt(this.f31623g);
            parcel.writeInt(this.f31624h);
            parcel.writeInt(this.f31625i);
            parcel.writeByte(this.f31626j ? (byte) 1 : (byte) 0);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).bottomMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).leftMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).rightMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).topMargin);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).height);
            parcel.writeInt(((ViewGroup.MarginLayoutParams) this).width);
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int z0() {
            return ((ViewGroup.MarginLayoutParams) this).rightMargin;
        }
    }

    public FlexboxLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f31607f = -1;
        this.o = new b(this);
        this.f31615p = new ArrayList();
        this.f31616q = new ag.b();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, f.f12801a, 0, 0);
        this.f31602a = typedArrayObtainStyledAttributes.getInt(5, 0);
        this.f31603b = typedArrayObtainStyledAttributes.getInt(6, 0);
        this.f31604c = typedArrayObtainStyledAttributes.getInt(7, 0);
        this.f31605d = typedArrayObtainStyledAttributes.getInt(1, 0);
        this.f31606e = typedArrayObtainStyledAttributes.getInt(0, 0);
        this.f31607f = typedArrayObtainStyledAttributes.getInt(8, -1);
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(2);
        if (drawable != null) {
            if (drawable != this.f31608g) {
                this.f31608g = drawable;
                this.f31612k = drawable.getIntrinsicHeight();
                if (this.f31608g == null && this.f31609h == null) {
                    setWillNotDraw(true);
                } else {
                    setWillNotDraw(false);
                }
                requestLayout();
            }
            if (drawable != this.f31609h) {
                this.f31609h = drawable;
                this.f31613l = drawable.getIntrinsicWidth();
                if (this.f31608g == null && this.f31609h == null) {
                    setWillNotDraw(true);
                } else {
                    setWillNotDraw(false);
                }
                requestLayout();
            }
        }
        Drawable drawable2 = typedArrayObtainStyledAttributes.getDrawable(3);
        if (drawable2 != null && drawable2 != this.f31608g) {
            this.f31608g = drawable2;
            this.f31612k = drawable2.getIntrinsicHeight();
            if (this.f31608g == null && this.f31609h == null) {
                setWillNotDraw(true);
            } else {
                setWillNotDraw(false);
            }
            requestLayout();
        }
        Drawable drawable3 = typedArrayObtainStyledAttributes.getDrawable(4);
        if (drawable3 != null && drawable3 != this.f31609h) {
            this.f31609h = drawable3;
            this.f31613l = drawable3.getIntrinsicWidth();
            if (this.f31608g == null && this.f31609h == null) {
                setWillNotDraw(true);
            } else {
                setWillNotDraw(false);
            }
            requestLayout();
        }
        int i5 = typedArrayObtainStyledAttributes.getInt(9, 0);
        if (i5 != 0) {
            this.f31611j = i5;
            this.f31610i = i5;
        }
        int i11 = typedArrayObtainStyledAttributes.getInt(11, 0);
        if (i11 != 0) {
            this.f31611j = i11;
        }
        int i12 = typedArrayObtainStyledAttributes.getInt(10, 0);
        if (i12 != 0) {
            this.f31610i = i12;
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // ag.a
    public final void a(View view, int i5, int i11, a aVar) {
        if (q(i5, i11)) {
            if (k()) {
                int i12 = aVar.f31665e;
                int i13 = this.f31613l;
                aVar.f31665e = i12 + i13;
                aVar.f31666f += i13;
                return;
            }
            int i14 = aVar.f31665e;
            int i15 = this.f31612k;
            aVar.f31665e = i14 + i15;
            aVar.f31666f += i15;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        if (this.n == null) {
            this.n = new SparseIntArray(getChildCount());
        }
        SparseIntArray sparseIntArray = this.n;
        b bVar = this.o;
        ag.a aVar = bVar.f31677a;
        int flexItemCount = aVar.getFlexItemCount();
        ArrayList arrayListF = bVar.f(flexItemCount);
        ag.c cVar = new ag.c();
        if (view == null || !(layoutParams instanceof FlexItem)) {
            cVar.f12783b = 1;
        } else {
            cVar.f12783b = ((FlexItem) layoutParams).getOrder();
        }
        if (i5 == -1 || i5 == flexItemCount || i5 >= aVar.getFlexItemCount()) {
            cVar.f12782a = flexItemCount;
        } else {
            cVar.f12782a = i5;
            for (int i11 = i5; i11 < flexItemCount; i11++) {
                ((ag.c) arrayListF.get(i11)).f12782a++;
            }
        }
        arrayListF.add(cVar);
        this.f31614m = b.r(flexItemCount + 1, arrayListF, sparseIntArray);
        super.addView(view, i5, layoutParams);
    }

    @Override // ag.a
    public final int b(int i5, int i11, int i12) {
        return ViewGroup.getChildMeasureSpec(i5, i11, i12);
    }

    @Override // ag.a
    public final View c(int i5) {
        return getChildAt(i5);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    @Override // ag.a
    public final int d(int i5, int i11, int i12) {
        return ViewGroup.getChildMeasureSpec(i5, i11, i12);
    }

    @Override // ag.a
    public final int e(View view) {
        return 0;
    }

    @Override // ag.a
    public final void f(a aVar) {
        if (k()) {
            if ((this.f31611j & 4) > 0) {
                int i5 = aVar.f31665e;
                int i11 = this.f31613l;
                aVar.f31665e = i5 + i11;
                aVar.f31666f += i11;
                return;
            }
            return;
        }
        if ((this.f31610i & 4) > 0) {
            int i12 = aVar.f31665e;
            int i13 = this.f31612k;
            aVar.f31665e = i12 + i13;
            aVar.f31666f += i13;
        }
    }

    @Override // ag.a
    public final View g(int i5) {
        return p(i5);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        LayoutParams layoutParams = new LayoutParams(context, attributeSet);
        layoutParams.f31617a = 1;
        layoutParams.f31618b = 0.0f;
        layoutParams.f31619c = 1.0f;
        layoutParams.f31620d = -1;
        layoutParams.f31621e = -1.0f;
        layoutParams.f31622f = -1;
        layoutParams.f31623g = -1;
        layoutParams.f31624h = 16777215;
        layoutParams.f31625i = 16777215;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, f.f12802b);
        layoutParams.f31617a = typedArrayObtainStyledAttributes.getInt(8, 1);
        layoutParams.f31618b = typedArrayObtainStyledAttributes.getFloat(2, 0.0f);
        layoutParams.f31619c = typedArrayObtainStyledAttributes.getFloat(3, 1.0f);
        layoutParams.f31620d = typedArrayObtainStyledAttributes.getInt(0, -1);
        layoutParams.f31621e = typedArrayObtainStyledAttributes.getFraction(1, 1, 1, -1.0f);
        layoutParams.f31622f = typedArrayObtainStyledAttributes.getDimensionPixelSize(7, -1);
        layoutParams.f31623g = typedArrayObtainStyledAttributes.getDimensionPixelSize(6, -1);
        layoutParams.f31624h = typedArrayObtainStyledAttributes.getDimensionPixelSize(5, 16777215);
        layoutParams.f31625i = typedArrayObtainStyledAttributes.getDimensionPixelSize(4, 16777215);
        layoutParams.f31626j = typedArrayObtainStyledAttributes.getBoolean(9, false);
        typedArrayObtainStyledAttributes.recycle();
        return layoutParams;
    }

    @Override // ag.a
    public final int getAlignContent() {
        return this.f31606e;
    }

    @Override // ag.a
    public final int getAlignItems() {
        return this.f31605d;
    }

    @Override // ag.a
    public final int getFlexDirection() {
        return this.f31602a;
    }

    @Override // ag.a
    public final int getFlexItemCount() {
        return getChildCount();
    }

    @Override // ag.a
    public final List getFlexLinesInternal() {
        return this.f31615p;
    }

    @Override // ag.a
    public final int getFlexWrap() {
        return this.f31603b;
    }

    @Override // ag.a
    public final int getLargestMainSize() {
        Iterator it = this.f31615p.iterator();
        int iMax = Integer.MIN_VALUE;
        while (it.hasNext()) {
            iMax = Math.max(iMax, ((a) it.next()).f31665e);
        }
        return iMax;
    }

    @Override // ag.a
    public final int getMaxLine() {
        return this.f31607f;
    }

    @Override // ag.a
    public final int getSumOfCrossSize() {
        int size = this.f31615p.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            a aVar = (a) this.f31615p.get(i11);
            if (r(i11)) {
                i5 += k() ? this.f31612k : this.f31613l;
            }
            if (s(i11)) {
                i5 += k() ? this.f31612k : this.f31613l;
            }
            i5 += aVar.f31667g;
        }
        return i5;
    }

    @Override // ag.a
    public final void h(int i5, View view) {
    }

    @Override // ag.a
    public final void i(ArrayList arrayList) {
        this.f31615p = arrayList;
    }

    @Override // ag.a
    public final int j(View view, int i5, int i11) {
        int i12;
        int i13;
        if (k()) {
            i12 = q(i5, i11) ? this.f31613l : 0;
            if ((this.f31611j & 4) <= 0) {
                return i12;
            }
            i13 = this.f31613l;
        } else {
            i12 = q(i5, i11) ? this.f31612k : 0;
            if ((this.f31610i & 4) <= 0) {
                return i12;
            }
            i13 = this.f31612k;
        }
        return i12 + i13;
    }

    @Override // ag.a
    public final boolean k() {
        int i5 = this.f31602a;
        return i5 == 0 || i5 == 1;
    }

    public final void l(Canvas canvas, boolean z11, boolean z12) {
        int paddingLeft = getPaddingLeft();
        int iMax = Math.max(0, (getWidth() - getPaddingRight()) - paddingLeft);
        int size = this.f31615p.size();
        for (int i5 = 0; i5 < size; i5++) {
            a aVar = (a) this.f31615p.get(i5);
            for (int i11 = 0; i11 < aVar.f31668h; i11++) {
                int i12 = aVar.o + i11;
                View viewP = p(i12);
                if (viewP != null && viewP.getVisibility() != 8) {
                    LayoutParams layoutParams = (LayoutParams) viewP.getLayoutParams();
                    if (q(i12, i11)) {
                        o(canvas, z11 ? viewP.getRight() + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin : (viewP.getLeft() - ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin) - this.f31613l, aVar.f31662b, aVar.f31667g);
                    }
                    if (i11 == aVar.f31668h - 1 && (this.f31611j & 4) > 0) {
                        o(canvas, z11 ? (viewP.getLeft() - ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin) - this.f31613l : viewP.getRight() + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin, aVar.f31662b, aVar.f31667g);
                    }
                }
            }
            if (r(i5)) {
                n(canvas, paddingLeft, z12 ? aVar.f31664d : aVar.f31662b - this.f31612k, iMax);
            }
            if (s(i5) && (this.f31610i & 4) > 0) {
                n(canvas, paddingLeft, z12 ? aVar.f31662b - this.f31612k : aVar.f31664d, iMax);
            }
        }
    }

    public final void m(Canvas canvas, boolean z11, boolean z12) {
        int paddingTop = getPaddingTop();
        int iMax = Math.max(0, (getHeight() - getPaddingBottom()) - paddingTop);
        int size = this.f31615p.size();
        for (int i5 = 0; i5 < size; i5++) {
            a aVar = (a) this.f31615p.get(i5);
            for (int i11 = 0; i11 < aVar.f31668h; i11++) {
                int i12 = aVar.o + i11;
                View viewP = p(i12);
                if (viewP != null && viewP.getVisibility() != 8) {
                    LayoutParams layoutParams = (LayoutParams) viewP.getLayoutParams();
                    if (q(i12, i11)) {
                        n(canvas, aVar.f31661a, z12 ? viewP.getBottom() + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin : (viewP.getTop() - ((ViewGroup.MarginLayoutParams) layoutParams).topMargin) - this.f31612k, aVar.f31667g);
                    }
                    if (i11 == aVar.f31668h - 1 && (this.f31610i & 4) > 0) {
                        n(canvas, aVar.f31661a, z12 ? (viewP.getTop() - ((ViewGroup.MarginLayoutParams) layoutParams).topMargin) - this.f31612k : viewP.getBottom() + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin, aVar.f31667g);
                    }
                }
            }
            if (r(i5)) {
                o(canvas, z11 ? aVar.f31663c : aVar.f31661a - this.f31613l, paddingTop, iMax);
            }
            if (s(i5) && (this.f31611j & 4) > 0) {
                o(canvas, z11 ? aVar.f31661a - this.f31613l : aVar.f31663c, paddingTop, iMax);
            }
        }
    }

    public final void n(Canvas canvas, int i5, int i11, int i12) {
        Drawable drawable = this.f31608g;
        if (drawable == null) {
            return;
        }
        drawable.setBounds(i5, i11, i12 + i5, this.f31612k + i11);
        this.f31608g.draw(canvas);
    }

    public final void o(Canvas canvas, int i5, int i11, int i12) {
        Drawable drawable = this.f31609h;
        if (drawable == null) {
            return;
        }
        drawable.setBounds(i5, i11, this.f31613l + i5, i12 + i11);
        this.f31609h.draw(canvas);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.f31609h == null && this.f31608g == null) {
            return;
        }
        if (this.f31610i == 0 && this.f31611j == 0) {
            return;
        }
        WeakHashMap weakHashMap = a1.f250a;
        int layoutDirection = getLayoutDirection();
        int i5 = this.f31603b;
        int i11 = this.f31602a;
        if (i11 == 0) {
            l(canvas, layoutDirection == 1, i5 == 2);
            return;
        }
        if (i11 == 1) {
            l(canvas, layoutDirection != 1, i5 == 2);
            return;
        }
        if (i11 == 2) {
            boolean z11 = layoutDirection == 1;
            if (i5 == 2) {
                z11 = !z11;
            }
            m(canvas, z11, false);
            return;
        }
        if (i11 != 3) {
            return;
        }
        boolean z12 = layoutDirection == 1;
        if (i5 == 2) {
            z12 = !z12;
        }
        m(canvas, z12, true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        boolean z12;
        FlexboxLayout flexboxLayout;
        int i14;
        int i15;
        int i16;
        int i17;
        boolean z13;
        FlexboxLayout flexboxLayout2;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z14;
        WeakHashMap weakHashMap = a1.f250a;
        int layoutDirection = getLayoutDirection();
        int i23 = this.f31602a;
        if (i23 == 0) {
            if (layoutDirection == 1) {
                z12 = true;
                flexboxLayout = this;
                i14 = i5;
                i17 = i11;
                i16 = i13;
                i15 = i12;
            } else {
                z12 = false;
                flexboxLayout = this;
                i14 = i5;
                i15 = i12;
                i16 = i13;
                i17 = i11;
            }
            flexboxLayout.t(i14, i17, i15, i16, z12);
            return;
        }
        if (i23 == 1) {
            if (layoutDirection != 1) {
                z13 = true;
                flexboxLayout2 = this;
                i18 = i5;
                i22 = i11;
                i21 = i13;
                i19 = i12;
            } else {
                z13 = false;
                flexboxLayout2 = this;
                i18 = i5;
                i19 = i12;
                i21 = i13;
                i22 = i11;
            }
            flexboxLayout2.t(i18, i22, i19, i21, z13);
            return;
        }
        int i24 = this.f31603b;
        if (i23 == 2) {
            z14 = layoutDirection == 1;
            if (i24 == 2) {
                z14 = !z14;
            }
            u(z14, false, i5, i11, i12, i13);
            return;
        }
        if (i23 != 3) {
            throw new IllegalStateException("Invalid flex direction is set: " + i23);
        }
        z14 = layoutDirection == 1;
        if (i24 == 2) {
            z14 = !z14;
        }
        u(z14, true, i5, i11, i12, i13);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        if (this.n == null) {
            this.n = new SparseIntArray(getChildCount());
        }
        SparseIntArray sparseIntArray = this.n;
        b bVar = this.o;
        ag.a aVar = bVar.f31677a;
        int flexItemCount = aVar.getFlexItemCount();
        if (sparseIntArray.size() != flexItemCount) {
            SparseIntArray sparseIntArray2 = this.n;
            int flexItemCount2 = bVar.f31677a.getFlexItemCount();
            this.f31614m = b.r(flexItemCount2, bVar.f(flexItemCount2), sparseIntArray2);
            break;
        }
        for (int i12 = 0; i12 < flexItemCount; i12++) {
            View viewC = aVar.c(i12);
            if (viewC != null && ((FlexItem) viewC.getLayoutParams()).getOrder() != sparseIntArray.get(i12)) {
                SparseIntArray sparseIntArray22 = this.n;
                int flexItemCount22 = bVar.f31677a.getFlexItemCount();
                this.f31614m = b.r(flexItemCount22, bVar.f(flexItemCount22), sparseIntArray22);
                break;
            }
        }
        ag.b bVar2 = this.f31616q;
        int i13 = this.f31602a;
        if (i13 != 0 && i13 != 1) {
            if (i13 != 2 && i13 != 3) {
                throw new IllegalStateException(c0.h(i13, "Invalid value for the flex direction is set: "));
            }
            this.f31615p.clear();
            bVar2.f12781b = null;
            bVar2.f12780a = 0;
            this.o.b(this.f31616q, i11, i5, LayoutNode.NotPlacedPlaceOrder, 0, -1, null);
            this.f31615p = bVar2.f12781b;
            bVar.h(i5, i11, 0);
            bVar.g(i5, i11, getPaddingRight() + getPaddingLeft());
            bVar.u(0);
            v(i13, i5, i11, bVar2.f12780a);
            return;
        }
        this.f31615p.clear();
        bVar2.f12781b = null;
        bVar2.f12780a = 0;
        this.o.b(this.f31616q, i5, i11, LayoutNode.NotPlacedPlaceOrder, 0, -1, null);
        this.f31615p = bVar2.f12781b;
        bVar.h(i5, i11, 0);
        if (this.f31605d == 3) {
            for (a aVar2 : this.f31615p) {
                int iMax = Integer.MIN_VALUE;
                for (int i14 = 0; i14 < aVar2.f31668h; i14++) {
                    View viewP = p(aVar2.o + i14);
                    if (viewP != null && viewP.getVisibility() != 8) {
                        LayoutParams layoutParams = (LayoutParams) viewP.getLayoutParams();
                        iMax = this.f31603b != 2 ? Math.max(iMax, viewP.getMeasuredHeight() + Math.max(aVar2.f31672l - viewP.getBaseline(), ((ViewGroup.MarginLayoutParams) layoutParams).topMargin) + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin) : Math.max(iMax, viewP.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin + Math.max(viewP.getBaseline() + (aVar2.f31672l - viewP.getMeasuredHeight()), ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin));
                    }
                }
                aVar2.f31667g = iMax;
            }
        }
        bVar.g(i5, i11, getPaddingBottom() + getPaddingTop());
        bVar.u(0);
        v(i13, i5, i11, bVar2.f12780a);
    }

    public final View p(int i5) {
        if (i5 < 0) {
            return null;
        }
        int[] iArr = this.f31614m;
        if (i5 >= iArr.length) {
            return null;
        }
        return getChildAt(iArr[i5]);
    }

    public final boolean q(int i5, int i11) {
        int i12 = 1;
        while (true) {
            int i13 = this.f31610i;
            int i14 = this.f31611j;
            if (i12 > i11) {
                return k() ? (i14 & 1) != 0 : (i13 & 1) != 0;
            }
            View viewP = p(i5 - i12);
            if (viewP != null && viewP.getVisibility() != 8) {
                return k() ? (i14 & 2) != 0 : (i13 & 2) != 0;
            }
            i12++;
        }
    }

    public final boolean r(int i5) {
        if (i5 >= 0 && i5 < this.f31615p.size()) {
            int i11 = 0;
            while (true) {
                int i12 = this.f31611j;
                int i13 = this.f31610i;
                if (i11 < i5) {
                    if (((a) this.f31615p.get(i11)).a() > 0) {
                        return k() ? (i13 & 2) != 0 : (i12 & 2) != 0;
                    }
                    i11++;
                } else {
                    if (k()) {
                        return (i13 & 1) != 0;
                    }
                    if ((i12 & 1) != 0) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final boolean s(int i5) {
        if (i5 >= 0 && i5 < this.f31615p.size()) {
            for (int i11 = i5 + 1; i11 < this.f31615p.size(); i11++) {
                if (((a) this.f31615p.get(i11)).a() > 0) {
                    return false;
                }
            }
            if (k()) {
                return (this.f31610i & 4) != 0;
            }
            if ((this.f31611j & 4) != 0) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x00de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void t(int i5, int i11, int i12, int i13, boolean z11) {
        float f11;
        int i14;
        float f12;
        float f13;
        int i15;
        boolean z12;
        int i16;
        int i17;
        int i18;
        View view;
        a aVar;
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int i19 = i12 - i5;
        int paddingBottom = (i13 - i11) - getPaddingBottom();
        int paddingTop = getPaddingTop();
        int size = this.f31615p.size();
        for (int i21 = 0; i21 < size; i21++) {
            a aVar2 = (a) this.f31615p.get(i21);
            if (r(i21)) {
                int i22 = this.f31612k;
                paddingBottom -= i22;
                paddingTop += i22;
            }
            int i23 = paddingBottom;
            int i24 = this.f31604c;
            boolean z13 = true;
            if (i24 == 0) {
                f11 = paddingLeft;
                i14 = i19 - paddingRight;
            } else if (i24 == 1) {
                int i25 = aVar2.f31665e;
                f11 = (i19 - i25) + paddingRight;
                i14 = i25 - paddingLeft;
            } else if (i24 != 2) {
                if (i24 == 3) {
                    f11 = paddingLeft;
                    f13 = (i19 - aVar2.f31665e) / (aVar2.a() != 1 ? r3 - 1 : 1.0f);
                    f12 = i19 - paddingRight;
                } else if (i24 == 4) {
                    int iA = aVar2.a();
                    float f14 = iA != 0 ? (i19 - aVar2.f31665e) / iA : 0.0f;
                    float f15 = f14 / 2.0f;
                    f11 = paddingLeft + f15;
                    float f16 = (i19 - paddingRight) - f15;
                    f13 = f14;
                    f12 = f16;
                } else {
                    if (i24 != 5) {
                        throw new IllegalStateException("Invalid justifyContent is set: " + i24);
                    }
                    f13 = aVar2.a() != 0 ? (i19 - aVar2.f31665e) / (r10 + 1) : 0.0f;
                    f11 = paddingLeft + f13;
                    f12 = (i19 - paddingRight) - f13;
                }
                float fMax = Math.max(f13, 0.0f);
                i15 = 0;
                while (i15 < aVar2.f31668h) {
                    int i26 = aVar2.o + i15;
                    View viewP = p(i26);
                    if (viewP != null) {
                        boolean z14 = z13;
                        if (viewP.getVisibility() == 8) {
                            z12 = z14;
                        } else {
                            LayoutParams layoutParams = (LayoutParams) viewP.getLayoutParams();
                            float f17 = f11 + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin;
                            float f18 = f12 - ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin;
                            if (q(i26, i15)) {
                                int i27 = this.f31613l;
                                float f19 = i27;
                                f17 += f19;
                                f18 -= f19;
                                i18 = i27;
                            } else {
                                i18 = 0;
                            }
                            float f21 = f17;
                            float f22 = f18;
                            int i28 = (i15 != aVar2.f31668h + (-1) || (this.f31611j & 4) <= 0) ? 0 : this.f31613l;
                            if (this.f31603b == 2) {
                                if (z11) {
                                    i17 = i15;
                                    view = viewP;
                                    z12 = z14;
                                    this.o.o(view, aVar2, Math.round(f22) - viewP.getMeasuredWidth(), i23 - viewP.getMeasuredHeight(), Math.round(f22), i23);
                                } else {
                                    i17 = i15;
                                    view = viewP;
                                    z12 = z14;
                                    this.o.o(view, aVar2, Math.round(f21), i23 - view.getMeasuredHeight(), view.getMeasuredWidth() + Math.round(f21), i23);
                                }
                                i16 = i23;
                            } else {
                                i17 = i15;
                                view = viewP;
                                z12 = z14;
                                i16 = i23;
                                if (z11) {
                                    this.o.o(view, aVar2, Math.round(f22) - view.getMeasuredWidth(), paddingTop, Math.round(f22), view.getMeasuredHeight() + paddingTop);
                                } else {
                                    int i29 = paddingTop;
                                    this.o.o(view, aVar2, Math.round(f21), i29, view.getMeasuredWidth() + Math.round(f21), view.getMeasuredHeight() + i29);
                                    paddingTop = i29;
                                }
                            }
                            float measuredWidth = view.getMeasuredWidth() + fMax + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin + f21;
                            float measuredWidth2 = f22 - ((view.getMeasuredWidth() + fMax) + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin);
                            if (z11) {
                                aVar = aVar2;
                                aVar.b(view, i28, 0, i18, 0);
                            } else {
                                aVar = aVar2;
                                aVar.b(view, i18, 0, i28, 0);
                            }
                            aVar2 = aVar;
                            f11 = measuredWidth;
                            f12 = measuredWidth2;
                            i15 = i17 + 1;
                            z13 = z12;
                            i23 = i16;
                        }
                    } else {
                        z12 = z13;
                    }
                    i17 = i15;
                    i16 = i23;
                    i15 = i17 + 1;
                    z13 = z12;
                    i23 = i16;
                }
                int i31 = aVar2.f31667g;
                paddingTop += i31;
                paddingBottom = i23 - i31;
            } else {
                int i32 = aVar2.f31665e;
                f12 = (i19 - paddingRight) - ((i19 - i32) / 2.0f);
                f11 = paddingLeft + ((i19 - i32) / 2.0f);
                f13 = 0.0f;
                float fMax2 = Math.max(f13, 0.0f);
                i15 = 0;
                while (i15 < aVar2.f31668h) {
                }
                int i312 = aVar2.f31667g;
                paddingTop += i312;
                paddingBottom = i23 - i312;
            }
            f12 = i14;
            f13 = 0.0f;
            float fMax22 = Math.max(f13, 0.0f);
            i15 = 0;
            while (i15 < aVar2.f31668h) {
            }
            int i3122 = aVar2.f31667g;
            paddingTop += i3122;
            paddingBottom = i23 - i3122;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00c6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void u(boolean z11, boolean z12, int i5, int i11, int i12, int i13) {
        float measuredHeight;
        float f11;
        float f12;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        a aVar;
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int paddingRight = getPaddingRight();
        int paddingLeft = getPaddingLeft();
        int i19 = i13 - i11;
        int i21 = (i12 - i5) - paddingRight;
        int size = this.f31615p.size();
        for (int i22 = 0; i22 < size; i22++) {
            a aVar2 = (a) this.f31615p.get(i22);
            if (r(i22)) {
                int i23 = this.f31613l;
                paddingLeft += i23;
                i21 -= i23;
            }
            int i24 = i21;
            char c11 = 4;
            int i25 = this.f31604c;
            int i26 = 1;
            if (i25 == 0) {
                measuredHeight = paddingTop;
                f11 = i19 - paddingBottom;
            } else if (i25 == 1) {
                int i27 = aVar2.f31665e;
                f11 = i27 - paddingTop;
                measuredHeight = (i19 - i27) + paddingBottom;
            } else if (i25 != 2) {
                if (i25 == 3) {
                    measuredHeight = paddingTop;
                    f12 = (i19 - aVar2.f31665e) / (aVar2.a() != 1 ? r13 - 1 : 1.0f);
                    f11 = i19 - paddingBottom;
                } else if (i25 == 4) {
                    int iA = aVar2.a();
                    f12 = iA != 0 ? (i19 - aVar2.f31665e) / iA : 0.0f;
                    float f13 = f12 / 2.0f;
                    measuredHeight = paddingTop + f13;
                    f11 = (i19 - paddingBottom) - f13;
                } else {
                    if (i25 != 5) {
                        throw new IllegalStateException(c0.h(i25, "Invalid justifyContent is set: "));
                    }
                    f12 = aVar2.a() != 0 ? (i19 - aVar2.f31665e) / (r9 + 1) : 0.0f;
                    measuredHeight = paddingTop + f12;
                    f11 = (i19 - paddingBottom) - f12;
                }
                float fMax = Math.max(f12, 0.0f);
                i14 = 0;
                while (i14 < aVar2.f31668h) {
                    int i28 = aVar2.o + i14;
                    int i29 = i26;
                    View viewP = p(i28);
                    char c12 = c11;
                    if (viewP == null || viewP.getVisibility() == 8) {
                        i15 = i14;
                        i16 = i29;
                        i17 = i24;
                    } else {
                        LayoutParams layoutParams = (LayoutParams) viewP.getLayoutParams();
                        float f14 = measuredHeight + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin;
                        float f15 = f11 - ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
                        if (q(i28, i14)) {
                            i18 = this.f31612k;
                            float f16 = i18;
                            f14 += f16;
                            f15 -= f16;
                        } else {
                            i18 = 0;
                        }
                        float f17 = f15;
                        int i31 = (i14 != aVar2.f31668h - i29 || (this.f31610i & 4) <= 0) ? 0 : this.f31612k;
                        if (z11) {
                            if (z12) {
                                i15 = i14;
                                i16 = i29;
                                this.o.p(viewP, aVar2, true, i24 - viewP.getMeasuredWidth(), Math.round(f17) - viewP.getMeasuredHeight(), i24, Math.round(f17));
                            } else {
                                i15 = i14;
                                i16 = i29;
                                this.o.p(viewP, aVar2, true, i24 - viewP.getMeasuredWidth(), Math.round(f14), i24, viewP.getMeasuredHeight() + Math.round(f14));
                            }
                            i17 = i24;
                        } else {
                            i15 = i14;
                            i16 = i29;
                            i17 = i24;
                            if (z12) {
                                this.o.p(viewP, aVar2, false, paddingLeft, Math.round(f17) - viewP.getMeasuredHeight(), viewP.getMeasuredWidth() + paddingLeft, Math.round(f17));
                            } else {
                                int i32 = paddingLeft;
                                this.o.p(viewP, aVar2, false, i32, Math.round(f14), viewP.getMeasuredWidth() + i32, viewP.getMeasuredHeight() + Math.round(f14));
                                paddingLeft = i32;
                            }
                        }
                        measuredHeight = f14 + viewP.getMeasuredHeight() + fMax + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
                        float measuredHeight2 = f17 - ((viewP.getMeasuredHeight() + fMax) + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin);
                        if (z12) {
                            aVar = aVar2;
                            aVar.b(viewP, 0, i31, 0, i18);
                        } else {
                            aVar = aVar2;
                            aVar.b(viewP, 0, i18, 0, i31);
                        }
                        aVar2 = aVar;
                        f11 = measuredHeight2;
                    }
                    i14 = i15 + 1;
                    c11 = c12;
                    i26 = i16;
                    i24 = i17;
                }
                int i33 = aVar2.f31667g;
                paddingLeft += i33;
                i21 = i24 - i33;
            } else {
                float f18 = (i19 - aVar2.f31665e) / 2.0f;
                measuredHeight = paddingTop + f18;
                f11 = (i19 - paddingBottom) - f18;
            }
            f12 = 0.0f;
            float fMax2 = Math.max(f12, 0.0f);
            i14 = 0;
            while (i14 < aVar2.f31668h) {
            }
            int i332 = aVar2.f31667g;
            paddingLeft += i332;
            i21 = i24 - i332;
        }
    }

    public final void v(int i5, int i11, int i12, int i13) {
        int paddingBottom;
        int largestMainSize;
        int iResolveSizeAndState;
        int iResolveSizeAndState2;
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i12);
        int size2 = View.MeasureSpec.getSize(i12);
        if (i5 == 0 || i5 == 1) {
            paddingBottom = getPaddingBottom() + getPaddingTop() + getSumOfCrossSize();
            largestMainSize = getLargestMainSize();
        } else {
            if (i5 != 2 && i5 != 3) {
                throw new IllegalArgumentException(c0.h(i5, "Invalid flex direction: "));
            }
            paddingBottom = getLargestMainSize();
            largestMainSize = getPaddingRight() + getPaddingLeft() + getSumOfCrossSize();
        }
        if (mode == Integer.MIN_VALUE) {
            if (size < largestMainSize) {
                i13 = View.combineMeasuredStates(i13, 16777216);
            } else {
                size = largestMainSize;
            }
            iResolveSizeAndState = View.resolveSizeAndState(size, i11, i13);
        } else if (mode == 0) {
            iResolveSizeAndState = View.resolveSizeAndState(largestMainSize, i11, i13);
        } else {
            if (mode != 1073741824) {
                throw new IllegalStateException(c0.h(mode, "Unknown width mode is set: "));
            }
            if (size < largestMainSize) {
                i13 = View.combineMeasuredStates(i13, 16777216);
            }
            iResolveSizeAndState = View.resolveSizeAndState(size, i11, i13);
        }
        if (mode2 == Integer.MIN_VALUE) {
            if (size2 < paddingBottom) {
                i13 = View.combineMeasuredStates(i13, 256);
            } else {
                size2 = paddingBottom;
            }
            iResolveSizeAndState2 = View.resolveSizeAndState(size2, i12, i13);
        } else if (mode2 == 0) {
            iResolveSizeAndState2 = View.resolveSizeAndState(paddingBottom, i12, i13);
        } else {
            if (mode2 != 1073741824) {
                throw new IllegalStateException(c0.h(mode2, "Unknown height mode is set: "));
            }
            if (size2 < paddingBottom) {
                i13 = View.combineMeasuredStates(i13, 256);
            }
            iResolveSizeAndState2 = View.resolveSizeAndState(size2, i12, i13);
        }
        setMeasuredDimension(iResolveSizeAndState, iResolveSizeAndState2);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof LayoutParams) {
            LayoutParams layoutParams2 = (LayoutParams) layoutParams;
            LayoutParams layoutParams3 = new LayoutParams(layoutParams2);
            layoutParams3.f31617a = 1;
            layoutParams3.f31618b = 0.0f;
            layoutParams3.f31619c = 1.0f;
            layoutParams3.f31620d = -1;
            layoutParams3.f31621e = -1.0f;
            layoutParams3.f31622f = -1;
            layoutParams3.f31623g = -1;
            layoutParams3.f31624h = 16777215;
            layoutParams3.f31625i = 16777215;
            layoutParams3.f31617a = layoutParams2.f31617a;
            layoutParams3.f31618b = layoutParams2.f31618b;
            layoutParams3.f31619c = layoutParams2.f31619c;
            layoutParams3.f31620d = layoutParams2.f31620d;
            layoutParams3.f31621e = layoutParams2.f31621e;
            layoutParams3.f31622f = layoutParams2.f31622f;
            layoutParams3.f31623g = layoutParams2.f31623g;
            layoutParams3.f31624h = layoutParams2.f31624h;
            layoutParams3.f31625i = layoutParams2.f31625i;
            layoutParams3.f31626j = layoutParams2.f31626j;
            return layoutParams3;
        }
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            LayoutParams layoutParams4 = new LayoutParams((ViewGroup.MarginLayoutParams) layoutParams);
            layoutParams4.f31617a = 1;
            layoutParams4.f31618b = 0.0f;
            layoutParams4.f31619c = 1.0f;
            layoutParams4.f31620d = -1;
            layoutParams4.f31621e = -1.0f;
            layoutParams4.f31622f = -1;
            layoutParams4.f31623g = -1;
            layoutParams4.f31624h = 16777215;
            layoutParams4.f31625i = 16777215;
            return layoutParams4;
        }
        LayoutParams layoutParams5 = new LayoutParams(layoutParams);
        layoutParams5.f31617a = 1;
        layoutParams5.f31618b = 0.0f;
        layoutParams5.f31619c = 1.0f;
        layoutParams5.f31620d = -1;
        layoutParams5.f31621e = -1.0f;
        layoutParams5.f31622f = -1;
        layoutParams5.f31623g = -1;
        layoutParams5.f31624h = 16777215;
        layoutParams5.f31625i = 16777215;
        return layoutParams5;
    }
}
