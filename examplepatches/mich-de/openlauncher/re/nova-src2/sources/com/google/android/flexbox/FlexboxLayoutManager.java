package com.google.android.flexbox;

import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.a2;
import androidx.recyclerview.widget.d1;
import androidx.recyclerview.widget.e1;
import androidx.recyclerview.widget.f1;
import androidx.recyclerview.widget.h2;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.m2;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.y1;
import androidx.recyclerview.widget.z0;
import androidx.recyclerview.widget.z1;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public class FlexboxLayoutManager extends z1 implements ag.a, m2 {

    /* renamed from: y, reason: collision with root package name */
    public static final Rect f31627y = new Rect();

    /* renamed from: a, reason: collision with root package name */
    public int f31628a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31629b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31630c;

    /* renamed from: e, reason: collision with root package name */
    public boolean f31632e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f31633f;

    /* renamed from: i, reason: collision with root package name */
    public h2 f31636i;

    /* renamed from: j, reason: collision with root package name */
    public o2 f31637j;

    /* renamed from: k, reason: collision with root package name */
    public ag.e f31638k;

    /* renamed from: l, reason: collision with root package name */
    public final ag.d f31639l;

    /* renamed from: m, reason: collision with root package name */
    public f1 f31640m;
    public f1 n;
    public SavedState o;

    /* renamed from: p, reason: collision with root package name */
    public int f31641p;

    /* renamed from: q, reason: collision with root package name */
    public int f31642q;

    /* renamed from: r, reason: collision with root package name */
    public int f31643r;

    /* renamed from: s, reason: collision with root package name */
    public int f31644s;

    /* renamed from: t, reason: collision with root package name */
    public final SparseArray f31645t;

    /* renamed from: u, reason: collision with root package name */
    public final Context f31646u;

    /* renamed from: v, reason: collision with root package name */
    public View f31647v;

    /* renamed from: w, reason: collision with root package name */
    public int f31648w;

    /* renamed from: x, reason: collision with root package name */
    public final ag.b f31649x;

    /* renamed from: d, reason: collision with root package name */
    public final int f31631d = -1;

    /* renamed from: g, reason: collision with root package name */
    public List f31634g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public final b f31635h = new b(this);

    public static class LayoutParams extends a2 implements FlexItem {
        public static final Parcelable.Creator<LayoutParams> CREATOR = new d();

        /* renamed from: e, reason: collision with root package name */
        public float f31650e;

        /* renamed from: f, reason: collision with root package name */
        public float f31651f;

        /* renamed from: g, reason: collision with root package name */
        public int f31652g;

        /* renamed from: h, reason: collision with root package name */
        public float f31653h;

        /* renamed from: i, reason: collision with root package name */
        public int f31654i;

        /* renamed from: j, reason: collision with root package name */
        public int f31655j;

        /* renamed from: k, reason: collision with root package name */
        public int f31656k;

        /* renamed from: l, reason: collision with root package name */
        public int f31657l;

        /* renamed from: m, reason: collision with root package name */
        public boolean f31658m;

        @Override // com.google.android.flexbox.FlexItem
        public final int A0() {
            return this.f31655j;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int B() {
            return this.f31654i;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int D0() {
            return this.f31657l;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int G() {
            return ((ViewGroup.MarginLayoutParams) this).topMargin;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final void I(int i5) {
            this.f31655j = i5;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float K() {
            return this.f31650e;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float L() {
            return this.f31653h;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final boolean R() {
            return this.f31658m;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int U() {
            return this.f31656k;
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
            return 1;
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
            this.f31654i = i5;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final int t() {
            return this.f31652g;
        }

        @Override // com.google.android.flexbox.FlexItem
        public final float v() {
            return this.f31651f;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeFloat(this.f31650e);
            parcel.writeFloat(this.f31651f);
            parcel.writeInt(this.f31652g);
            parcel.writeFloat(this.f31653h);
            parcel.writeInt(this.f31654i);
            parcel.writeInt(this.f31655j);
            parcel.writeInt(this.f31656k);
            parcel.writeInt(this.f31657l);
            parcel.writeByte(this.f31658m ? (byte) 1 : (byte) 0);
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

    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public int f31659a;

        /* renamed from: b, reason: collision with root package name */
        public int f31660b;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("SavedState{mAnchorPosition=");
            sb2.append(this.f31659a);
            sb2.append(", mAnchorOffset=");
            return a2.c.m(sb2, this.f31660b, AbstractJsonLexerKt.END_OBJ);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeInt(this.f31659a);
            parcel.writeInt(this.f31660b);
        }
    }

    public FlexboxLayoutManager(Context context, AttributeSet attributeSet, int i5, int i11) {
        ag.d dVar = new ag.d(this);
        this.f31639l = dVar;
        this.f31641p = -1;
        this.f31642q = Integer.MIN_VALUE;
        this.f31643r = Integer.MIN_VALUE;
        this.f31644s = Integer.MIN_VALUE;
        this.f31645t = new SparseArray();
        this.f31648w = -1;
        this.f31649x = new ag.b();
        y1 properties = z1.getProperties(context, attributeSet, i5, i11);
        int i12 = properties.f15183a;
        if (i12 != 0) {
            if (i12 == 1) {
                if (properties.f15185c) {
                    F(3);
                } else {
                    F(2);
                }
            }
        } else if (properties.f15185c) {
            F(1);
        } else {
            F(0);
        }
        int i13 = this.f31629b;
        if (i13 != 1) {
            if (i13 == 0) {
                removeAllViews();
                this.f31634g.clear();
                ag.d.b(dVar);
                dVar.f12787d = 0;
            }
            this.f31629b = 1;
            this.f31640m = null;
            this.n = null;
            requestLayout();
        }
        if (this.f31630c != 4) {
            removeAllViews();
            this.f31634g.clear();
            ag.d.b(dVar);
            dVar.f12787d = 0;
            this.f31630c = 4;
            requestLayout();
        }
        this.f31646u = context;
    }

    public static boolean m(int i5, int i11, int i12) {
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        if (i12 > 0 && i5 != i12) {
            return false;
        }
        if (mode == Integer.MIN_VALUE) {
            return size >= i5;
        }
        if (mode != 0) {
            return mode == 1073741824 && size == i5;
        }
        return true;
    }

    public final int A(int i5, h2 h2Var, o2 o2Var, boolean z11) {
        int iB;
        int iK;
        if (k() || !this.f31632e) {
            int iK2 = i5 - this.f31640m.k();
            if (iK2 <= 0) {
                return 0;
            }
            iB = -B(iK2, h2Var, o2Var);
        } else {
            int iG = this.f31640m.g() - i5;
            if (iG <= 0) {
                return 0;
            }
            iB = B(-iG, h2Var, o2Var);
        }
        int i11 = i5 + iB;
        if (!z11 || (iK = i11 - this.f31640m.k()) <= 0) {
            return iB;
        }
        this.f31640m.p(-iK);
        return iB - iK;
    }

    /* JADX WARN: Removed duplicated region for block: B:70:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01f5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int B(int i5, h2 h2Var, o2 o2Var) {
        int iS;
        int i11;
        if (getChildCount() != 0 && i5 != 0) {
            r();
            this.f31638k.f12800i = true;
            boolean z11 = !k() && this.f31632e;
            int i12 = (!z11 ? i5 > 0 : i5 < 0) ? -1 : 1;
            int iAbs = Math.abs(i5);
            this.f31638k.f12799h = i12;
            boolean zK = k();
            int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getWidth(), getWidthMode());
            int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(getHeight(), getHeightMode());
            boolean z12 = !zK && this.f31632e;
            b bVar = this.f31635h;
            if (i12 == 1) {
                View childAt = getChildAt(getChildCount() - 1);
                if (childAt != null) {
                    this.f31638k.f12796e = this.f31640m.b(childAt);
                    int position = getPosition(childAt);
                    View viewW = w(childAt, (a) this.f31634g.get(bVar.f31679c[position]));
                    ag.e eVar = this.f31638k;
                    eVar.getClass();
                    int i13 = position + 1;
                    eVar.f12795d = i13;
                    int[] iArr = bVar.f31679c;
                    if (iArr.length <= i13) {
                        eVar.f12794c = -1;
                    } else {
                        eVar.f12794c = iArr[i13];
                    }
                    if (z12) {
                        eVar.f12796e = this.f31640m.e(viewW);
                        this.f31638k.f12797f = this.f31640m.k() + (-this.f31640m.e(viewW));
                        ag.e eVar2 = this.f31638k;
                        eVar2.f12797f = Math.max(eVar2.f12797f, 0);
                    } else {
                        eVar.f12796e = this.f31640m.b(viewW);
                        this.f31638k.f12797f = this.f31640m.b(viewW) - this.f31640m.g();
                    }
                    int i14 = this.f31638k.f12794c;
                    if ((i14 == -1 || i14 > this.f31634g.size() - 1) && this.f31638k.f12795d <= this.f31637j.b()) {
                        ag.e eVar3 = this.f31638k;
                        int i15 = iAbs - eVar3.f12797f;
                        ag.b bVar2 = this.f31649x;
                        bVar2.f12781b = null;
                        bVar2.f12780a = 0;
                        if (i15 > 0) {
                            if (zK) {
                                this.f31635h.b(bVar2, iMakeMeasureSpec, iMakeMeasureSpec2, i15, eVar3.f12795d, -1, this.f31634g);
                            } else {
                                this.f31635h.b(bVar2, iMakeMeasureSpec2, iMakeMeasureSpec, i15, eVar3.f12795d, -1, this.f31634g);
                                iMakeMeasureSpec2 = iMakeMeasureSpec2;
                                iMakeMeasureSpec = iMakeMeasureSpec;
                            }
                            bVar.h(iMakeMeasureSpec, iMakeMeasureSpec2, this.f31638k.f12795d);
                            bVar.u(this.f31638k.f12795d);
                        }
                    }
                    ag.e eVar4 = this.f31638k;
                    eVar4.f12792a = iAbs - eVar4.f12797f;
                }
                ag.e eVar5 = this.f31638k;
                iS = s(h2Var, o2Var, eVar5) + eVar5.f12797f;
                if (iS >= 0) {
                    if (z11) {
                        i11 = iAbs > iS ? (-i12) * iS : i5;
                    } else if (iAbs > iS) {
                        i11 = i12 * iS;
                    }
                    this.f31640m.p(-i11);
                    this.f31638k.f12798g = i11;
                    return i11;
                }
            } else {
                View childAt2 = getChildAt(0);
                if (childAt2 != null) {
                    this.f31638k.f12796e = this.f31640m.e(childAt2);
                    int position2 = getPosition(childAt2);
                    View viewU = u(childAt2, (a) this.f31634g.get(bVar.f31679c[position2]));
                    ag.e eVar6 = this.f31638k;
                    eVar6.getClass();
                    int i16 = bVar.f31679c[position2];
                    if (i16 == -1) {
                        i16 = 0;
                    }
                    if (i16 > 0) {
                        this.f31638k.f12795d = position2 - ((a) this.f31634g.get(i16 - 1)).f31668h;
                    } else {
                        eVar6.f12795d = -1;
                    }
                    ag.e eVar7 = this.f31638k;
                    eVar7.f12794c = i16 > 0 ? i16 - 1 : 0;
                    if (z12) {
                        eVar7.f12796e = this.f31640m.b(viewU);
                        this.f31638k.f12797f = this.f31640m.b(viewU) - this.f31640m.g();
                        ag.e eVar8 = this.f31638k;
                        eVar8.f12797f = Math.max(eVar8.f12797f, 0);
                    } else {
                        eVar7.f12796e = this.f31640m.e(viewU);
                        this.f31638k.f12797f = this.f31640m.k() + (-this.f31640m.e(viewU));
                    }
                    ag.e eVar42 = this.f31638k;
                    eVar42.f12792a = iAbs - eVar42.f12797f;
                }
                ag.e eVar52 = this.f31638k;
                iS = s(h2Var, o2Var, eVar52) + eVar52.f12797f;
                if (iS >= 0) {
                }
            }
        }
        return 0;
    }

    public final int C(int i5) {
        if (getChildCount() == 0 || i5 == 0) {
            return 0;
        }
        r();
        boolean zK = k();
        View view = this.f31647v;
        int width = zK ? view.getWidth() : view.getHeight();
        int width2 = zK ? getWidth() : getHeight();
        int layoutDirection = getLayoutDirection();
        ag.d dVar = this.f31639l;
        if (layoutDirection == 1) {
            int iAbs = Math.abs(i5);
            if (i5 < 0) {
                return -Math.min((width2 + dVar.f12787d) - width, iAbs);
            }
            int i11 = dVar.f12787d;
            if (i11 + i5 > 0) {
                return -i11;
            }
        } else {
            if (i5 > 0) {
                return Math.min((width2 - dVar.f12787d) - width, i5);
            }
            int i12 = dVar.f12787d;
            if (i12 + i5 < 0) {
                return -i12;
            }
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void D(h2 h2Var, ag.e eVar) {
        int childCount;
        int i5;
        int childCount2;
        int i11;
        View childAt;
        int i12;
        if (eVar.f12800i) {
            int i13 = eVar.f12799h;
            b bVar = this.f31635h;
            int i14 = -1;
            if (i13 == -1) {
                if (eVar.f12797f < 0 || (childCount2 = getChildCount()) == 0 || (childAt = getChildAt(childCount2 - 1)) == null || (i12 = bVar.f31679c[getPosition(childAt)]) == -1) {
                    return;
                }
                a aVar = (a) this.f31634g.get(i12);
                int i15 = i11;
                while (true) {
                    if (i15 < 0) {
                        break;
                    }
                    View childAt2 = getChildAt(i15);
                    if (childAt2 != null) {
                        int i16 = eVar.f12797f;
                        if (!k() && this.f31632e) {
                            if (this.f31640m.b(childAt2) > i16) {
                                break;
                            }
                        } else {
                            if (this.f31640m.e(childAt2) < this.f31640m.f() - i16) {
                                break;
                            }
                            if (aVar.o != getPosition(childAt2)) {
                                continue;
                            } else if (i12 <= 0) {
                                childCount2 = i15;
                                break;
                            } else {
                                i12 += eVar.f12799h;
                                aVar = (a) this.f31634g.get(i12);
                                childCount2 = i15;
                            }
                        }
                    }
                    i15--;
                }
                while (i11 >= childCount2) {
                    removeAndRecycleViewAt(i11, h2Var);
                    i11--;
                }
                return;
            }
            if (eVar.f12797f >= 0 && (childCount = getChildCount()) != 0) {
                int i17 = 0;
                View childAt3 = getChildAt(0);
                if (childAt3 == null || (i5 = bVar.f31679c[getPosition(childAt3)]) == -1) {
                    return;
                }
                a aVar2 = (a) this.f31634g.get(i5);
                while (true) {
                    if (i17 >= childCount) {
                        break;
                    }
                    View childAt4 = getChildAt(i17);
                    if (childAt4 != null) {
                        int i18 = eVar.f12797f;
                        if (!k() && this.f31632e) {
                            if (this.f31640m.f() - this.f31640m.e(childAt4) > i18) {
                                break;
                            }
                        } else {
                            if (this.f31640m.b(childAt4) > i18) {
                                break;
                            }
                            if (aVar2.f31674p != getPosition(childAt4)) {
                                continue;
                            } else if (i5 >= this.f31634g.size() - 1) {
                                i14 = i17;
                                break;
                            } else {
                                i5 += eVar.f12799h;
                                aVar2 = (a) this.f31634g.get(i5);
                                i14 = i17;
                            }
                        }
                    }
                    i17++;
                }
                while (i14 >= 0) {
                    removeAndRecycleViewAt(i14, h2Var);
                    i14--;
                }
            }
        }
    }

    public final void E() {
        int heightMode = k() ? getHeightMode() : getWidthMode();
        this.f31638k.f12793b = heightMode == 0 || heightMode == Integer.MIN_VALUE;
    }

    public final void F(int i5) {
        if (this.f31628a != i5) {
            removeAllViews();
            this.f31628a = i5;
            this.f31640m = null;
            this.n = null;
            this.f31634g.clear();
            ag.d dVar = this.f31639l;
            ag.d.b(dVar);
            dVar.f12787d = 0;
            requestLayout();
        }
    }

    public final boolean G(View view, int i5, int i11, LayoutParams layoutParams) {
        return (!view.isLayoutRequested() && isMeasurementCacheEnabled() && m(view.getWidth(), i5, ((ViewGroup.MarginLayoutParams) layoutParams).width) && m(view.getHeight(), i11, ((ViewGroup.MarginLayoutParams) layoutParams).height)) ? false : true;
    }

    public final void H(int i5) {
        View viewX = x(getChildCount() - 1, -1);
        if (i5 >= (viewX != null ? getPosition(viewX) : -1)) {
            return;
        }
        int childCount = getChildCount();
        b bVar = this.f31635h;
        bVar.j(childCount);
        bVar.k(childCount);
        bVar.i(childCount);
        if (i5 >= bVar.f31679c.length) {
            return;
        }
        this.f31648w = i5;
        View childAt = getChildAt(0);
        if (childAt == null) {
            return;
        }
        this.f31641p = getPosition(childAt);
        if (k() || !this.f31632e) {
            this.f31642q = this.f31640m.e(childAt) - this.f31640m.k();
        } else {
            this.f31642q = this.f31640m.h() + this.f31640m.b(childAt);
        }
    }

    public final void I(ag.d dVar, boolean z11, boolean z12) {
        int i5;
        if (z12) {
            E();
        } else {
            this.f31638k.f12793b = false;
        }
        if (k() || !this.f31632e) {
            this.f31638k.f12792a = this.f31640m.g() - dVar.f12786c;
        } else {
            this.f31638k.f12792a = dVar.f12786c - getPaddingRight();
        }
        ag.e eVar = this.f31638k;
        eVar.f12795d = dVar.f12784a;
        eVar.f12799h = 1;
        eVar.f12796e = dVar.f12786c;
        eVar.f12797f = Integer.MIN_VALUE;
        eVar.f12794c = dVar.f12785b;
        if (!z11 || this.f31634g.size() <= 1 || (i5 = dVar.f12785b) < 0 || i5 >= this.f31634g.size() - 1) {
            return;
        }
        a aVar = (a) this.f31634g.get(dVar.f12785b);
        ag.e eVar2 = this.f31638k;
        eVar2.f12794c++;
        eVar2.f12795d += aVar.f31668h;
    }

    public final void J(ag.d dVar, boolean z11, boolean z12) {
        if (z12) {
            E();
        } else {
            this.f31638k.f12793b = false;
        }
        if (k() || !this.f31632e) {
            this.f31638k.f12792a = dVar.f12786c - this.f31640m.k();
        } else {
            this.f31638k.f12792a = (this.f31647v.getWidth() - dVar.f12786c) - this.f31640m.k();
        }
        ag.e eVar = this.f31638k;
        eVar.f12795d = dVar.f12784a;
        eVar.f12799h = -1;
        eVar.f12796e = dVar.f12786c;
        eVar.f12797f = Integer.MIN_VALUE;
        int i5 = dVar.f12785b;
        eVar.f12794c = i5;
        if (!z11 || i5 <= 0) {
            return;
        }
        int size = this.f31634g.size();
        int i11 = dVar.f12785b;
        if (size > i11) {
            a aVar = (a) this.f31634g.get(i11);
            r4.f12794c--;
            this.f31638k.f12795d -= aVar.f31668h;
        }
    }

    @Override // ag.a
    public final void a(View view, int i5, int i11, a aVar) {
        calculateItemDecorationsForChild(view, f31627y);
        if (k()) {
            int rightDecorationWidth = getRightDecorationWidth(view) + getLeftDecorationWidth(view);
            aVar.f31665e += rightDecorationWidth;
            aVar.f31666f += rightDecorationWidth;
            return;
        }
        int bottomDecorationHeight = getBottomDecorationHeight(view) + getTopDecorationHeight(view);
        aVar.f31665e += bottomDecorationHeight;
        aVar.f31666f += bottomDecorationHeight;
    }

    @Override // ag.a
    public final int b(int i5, int i11, int i12) {
        return z1.getChildMeasureSpec(getWidth(), getWidthMode(), i11, i12, canScrollHorizontally());
    }

    @Override // ag.a
    public final View c(int i5) {
        View view = (View) this.f31645t.get(i5);
        return view != null ? view : this.f31636i.l(i5, Long.MAX_VALUE).itemView;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollHorizontally() {
        if (this.f31629b == 0) {
            return k();
        }
        if (!k()) {
            return true;
        }
        int width = getWidth();
        View view = this.f31647v;
        return width > (view != null ? view.getWidth() : 0);
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollVertically() {
        if (this.f31629b == 0) {
            return !k();
        }
        if (!k()) {
            int height = getHeight();
            View view = this.f31647v;
            if (height <= (view != null ? view.getHeight() : 0)) {
                return false;
            }
        }
        return true;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean checkLayoutParams(a2 a2Var) {
        return a2Var instanceof LayoutParams;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollExtent(o2 o2Var) {
        return o(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollRange(o2 o2Var) {
        return q(o2Var);
    }

    @Override // androidx.recyclerview.widget.m2
    public final PointF computeScrollVectorForPosition(int i5) {
        View childAt;
        if (getChildCount() == 0 || (childAt = getChildAt(0)) == null) {
            return null;
        }
        int i11 = i5 < getPosition(childAt) ? -1 : 1;
        return k() ? new PointF(0.0f, i11) : new PointF(i11, 0.0f);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollExtent(o2 o2Var) {
        return o(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollRange(o2 o2Var) {
        return q(o2Var);
    }

    @Override // ag.a
    public final int d(int i5, int i11, int i12) {
        return z1.getChildMeasureSpec(getHeight(), getHeightMode(), i11, i12, canScrollVertically());
    }

    @Override // ag.a
    public final int e(View view) {
        int leftDecorationWidth;
        int rightDecorationWidth;
        if (k()) {
            leftDecorationWidth = getTopDecorationHeight(view);
            rightDecorationWidth = getBottomDecorationHeight(view);
        } else {
            leftDecorationWidth = getLeftDecorationWidth(view);
            rightDecorationWidth = getRightDecorationWidth(view);
        }
        return rightDecorationWidth + leftDecorationWidth;
    }

    @Override // ag.a
    public final void f(a aVar) {
    }

    @Override // ag.a
    public final View g(int i5) {
        return c(i5);
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateDefaultLayoutParams() {
        LayoutParams layoutParams = new LayoutParams(-2, -2);
        layoutParams.f31650e = 0.0f;
        layoutParams.f31651f = 1.0f;
        layoutParams.f31652g = -1;
        layoutParams.f31653h = -1.0f;
        layoutParams.f31656k = 16777215;
        layoutParams.f31657l = 16777215;
        return layoutParams;
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateLayoutParams(Context context, AttributeSet attributeSet) {
        LayoutParams layoutParams = new LayoutParams(context, attributeSet);
        layoutParams.f31650e = 0.0f;
        layoutParams.f31651f = 1.0f;
        layoutParams.f31652g = -1;
        layoutParams.f31653h = -1.0f;
        layoutParams.f31656k = 16777215;
        layoutParams.f31657l = 16777215;
        return layoutParams;
    }

    @Override // ag.a
    public final int getAlignContent() {
        return 5;
    }

    @Override // ag.a
    public final int getAlignItems() {
        return this.f31630c;
    }

    @Override // ag.a
    public final int getFlexDirection() {
        return this.f31628a;
    }

    @Override // ag.a
    public final int getFlexItemCount() {
        return this.f31637j.b();
    }

    @Override // ag.a
    public final List getFlexLinesInternal() {
        return this.f31634g;
    }

    @Override // ag.a
    public final int getFlexWrap() {
        return this.f31629b;
    }

    @Override // ag.a
    public final int getLargestMainSize() {
        if (this.f31634g.size() == 0) {
            return 0;
        }
        int size = this.f31634g.size();
        int iMax = Integer.MIN_VALUE;
        for (int i5 = 0; i5 < size; i5++) {
            iMax = Math.max(iMax, ((a) this.f31634g.get(i5)).f31665e);
        }
        return iMax;
    }

    @Override // ag.a
    public final int getMaxLine() {
        return this.f31631d;
    }

    @Override // ag.a
    public final int getSumOfCrossSize() {
        int size = this.f31634g.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            i5 += ((a) this.f31634g.get(i11)).f31667g;
        }
        return i5;
    }

    @Override // ag.a
    public final void h(int i5, View view) {
        this.f31645t.put(i5, view);
    }

    @Override // ag.a
    public final void i(ArrayList arrayList) {
        this.f31634g = arrayList;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean isAutoMeasureEnabled() {
        return true;
    }

    @Override // ag.a
    public final int j(View view, int i5, int i11) {
        int topDecorationHeight;
        int bottomDecorationHeight;
        if (k()) {
            topDecorationHeight = getLeftDecorationWidth(view);
            bottomDecorationHeight = getRightDecorationWidth(view);
        } else {
            topDecorationHeight = getTopDecorationHeight(view);
            bottomDecorationHeight = getBottomDecorationHeight(view);
        }
        return bottomDecorationHeight + topDecorationHeight;
    }

    @Override // ag.a
    public final boolean k() {
        int i5 = this.f31628a;
        return i5 == 0 || i5 == 1;
    }

    public final int o(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        int iB = o2Var.b();
        r();
        View viewT = t(iB);
        View viewV = v(iB);
        if (o2Var.b() == 0 || viewT == null || viewV == null) {
            return 0;
        }
        return Math.min(this.f31640m.l(), this.f31640m.b(viewV) - this.f31640m.e(viewT));
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onAdapterChanged(m1 m1Var, m1 m1Var2) {
        removeAllViews();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onAttachedToWindow(RecyclerView recyclerView) {
        super.onAttachedToWindow(recyclerView);
        this.f31647v = (View) recyclerView.getParent();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onDetachedFromWindow(RecyclerView recyclerView, h2 h2Var) {
        onDetachedFromWindow(recyclerView);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsAdded(RecyclerView recyclerView, int i5, int i11) {
        super.onItemsAdded(recyclerView, i5, i11);
        H(i5);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsMoved(RecyclerView recyclerView, int i5, int i11, int i12) {
        super.onItemsMoved(recyclerView, i5, i11, i12);
        H(Math.min(i5, i11));
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsRemoved(RecyclerView recyclerView, int i5, int i11) {
        super.onItemsRemoved(recyclerView, i5, i11);
        H(i5);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsUpdated(RecyclerView recyclerView, int i5, int i11, Object obj) {
        super.onItemsUpdated(recyclerView, i5, i11, obj);
        H(i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0233  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00ec  */
    @Override // androidx.recyclerview.widget.z1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onLayoutChildren(h2 h2Var, o2 o2Var) {
        int i5;
        View childAt;
        boolean z11;
        int i11;
        boolean z12;
        int i12;
        int i13;
        int i14;
        this.f31636i = h2Var;
        this.f31637j = o2Var;
        int iB = o2Var.b();
        if (iB == 0 && o2Var.f15075g) {
            return;
        }
        int layoutDirection = getLayoutDirection();
        int i15 = this.f31628a;
        if (i15 == 0) {
            this.f31632e = layoutDirection == 1;
            this.f31633f = this.f31629b == 2;
        } else if (i15 == 1) {
            this.f31632e = layoutDirection != 1;
            this.f31633f = this.f31629b == 2;
        } else if (i15 == 2) {
            boolean z13 = layoutDirection == 1;
            this.f31632e = z13;
            if (this.f31629b == 2) {
                this.f31632e = !z13;
            }
            this.f31633f = false;
        } else if (i15 != 3) {
            this.f31632e = false;
            this.f31633f = false;
        } else {
            boolean z14 = layoutDirection == 1;
            this.f31632e = z14;
            if (this.f31629b == 2) {
                this.f31632e = !z14;
            }
            this.f31633f = true;
        }
        r();
        if (this.f31638k == null) {
            ag.e eVar = new ag.e();
            eVar.f12799h = 1;
            this.f31638k = eVar;
        }
        b bVar = this.f31635h;
        bVar.j(iB);
        bVar.k(iB);
        bVar.i(iB);
        this.f31638k.f12800i = false;
        SavedState savedState = this.o;
        if (savedState != null && (i14 = savedState.f31659a) >= 0 && i14 < iB) {
            this.f31641p = i14;
        }
        ag.d dVar = this.f31639l;
        if (!dVar.f12789f || this.f31641p != -1 || savedState != null) {
            ag.d.b(dVar);
            SavedState savedState2 = this.o;
            if (o2Var.f15075g || (i5 = this.f31641p) == -1) {
                if (getChildCount() != 0) {
                    View viewV = dVar.f12788e ? v(o2Var.b()) : t(o2Var.b());
                    if (viewV != null) {
                        FlexboxLayoutManager flexboxLayoutManager = dVar.f12791h;
                        f1 f1Var = flexboxLayoutManager.f31629b == 0 ? flexboxLayoutManager.n : flexboxLayoutManager.f31640m;
                        if (flexboxLayoutManager.k() || !flexboxLayoutManager.f31632e) {
                            if (dVar.f12788e) {
                                dVar.f12786c = f1Var.m() + f1Var.b(viewV);
                            } else {
                                dVar.f12786c = f1Var.e(viewV);
                            }
                        } else if (dVar.f12788e) {
                            dVar.f12786c = f1Var.m() + f1Var.e(viewV);
                        } else {
                            dVar.f12786c = f1Var.b(viewV);
                        }
                        int position = flexboxLayoutManager.getPosition(viewV);
                        dVar.f12784a = position;
                        dVar.f12790g = false;
                        int[] iArr = flexboxLayoutManager.f31635h.f31679c;
                        if (position == -1) {
                            position = 0;
                        }
                        int i16 = iArr[position];
                        if (i16 == -1) {
                            i16 = 0;
                        }
                        dVar.f12785b = i16;
                        int size = flexboxLayoutManager.f31634g.size();
                        int i17 = dVar.f12785b;
                        if (size > i17) {
                            dVar.f12784a = ((a) flexboxLayoutManager.f31634g.get(i17)).o;
                        }
                    } else {
                        ag.d.a(dVar);
                        dVar.f12784a = 0;
                        dVar.f12785b = 0;
                    }
                    dVar.f12789f = true;
                }
            } else if (i5 < 0 || i5 >= o2Var.b()) {
                this.f31641p = -1;
                this.f31642q = Integer.MIN_VALUE;
                if (getChildCount() != 0) {
                }
            } else {
                int i18 = this.f31641p;
                dVar.f12784a = i18;
                dVar.f12785b = bVar.f31679c[i18];
                SavedState savedState3 = this.o;
                if (savedState3 != null) {
                    int iB2 = o2Var.b();
                    int i19 = savedState3.f31659a;
                    if (i19 >= 0 && i19 < iB2) {
                        dVar.f12786c = this.f31640m.k() + savedState2.f31660b;
                        dVar.f12790g = true;
                        dVar.f12785b = -1;
                    } else if (this.f31642q == Integer.MIN_VALUE) {
                        View viewFindViewByPosition = findViewByPosition(this.f31641p);
                        if (viewFindViewByPosition == null) {
                            if (getChildCount() > 0 && (childAt = getChildAt(0)) != null) {
                                dVar.f12788e = this.f31641p < getPosition(childAt);
                            }
                            ag.d.a(dVar);
                        } else if (this.f31640m.c(viewFindViewByPosition) > this.f31640m.l()) {
                            ag.d.a(dVar);
                        } else if (this.f31640m.e(viewFindViewByPosition) - this.f31640m.k() < 0) {
                            dVar.f12786c = this.f31640m.k();
                            dVar.f12788e = false;
                        } else if (this.f31640m.g() - this.f31640m.b(viewFindViewByPosition) < 0) {
                            dVar.f12786c = this.f31640m.g();
                            dVar.f12788e = true;
                        } else {
                            dVar.f12786c = dVar.f12788e ? this.f31640m.m() + this.f31640m.b(viewFindViewByPosition) : this.f31640m.e(viewFindViewByPosition);
                        }
                    } else if (k() || !this.f31632e) {
                        dVar.f12786c = this.f31640m.k() + this.f31642q;
                    } else {
                        dVar.f12786c = this.f31642q - this.f31640m.h();
                    }
                    dVar.f12789f = true;
                }
            }
        }
        detachAndScrapAttachedViews(h2Var);
        if (dVar.f12788e) {
            J(dVar, false, true);
        } else {
            I(dVar, false, true);
        }
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getWidth(), getWidthMode());
        int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(getHeight(), getHeightMode());
        int width = getWidth();
        int height = getHeight();
        boolean zK = k();
        Context context = this.f31646u;
        if (zK) {
            int i21 = this.f31643r;
            z11 = (i21 == Integer.MIN_VALUE || i21 == width) ? false : true;
            ag.e eVar2 = this.f31638k;
            i11 = eVar2.f12793b ? context.getResources().getDisplayMetrics().heightPixels : eVar2.f12792a;
        } else {
            int i22 = this.f31644s;
            z11 = (i22 == Integer.MIN_VALUE || i22 == height) ? false : true;
            ag.e eVar3 = this.f31638k;
            i11 = eVar3.f12793b ? context.getResources().getDisplayMetrics().widthPixels : eVar3.f12792a;
        }
        int i23 = i11;
        this.f31643r = width;
        this.f31644s = height;
        int i24 = this.f31648w;
        ag.b bVar2 = this.f31649x;
        if (i24 != -1 || (this.f31641p == -1 && !z11)) {
            int iMin = i24 != -1 ? Math.min(i24, dVar.f12784a) : dVar.f12784a;
            bVar2.f12781b = null;
            bVar2.f12780a = 0;
            if (k()) {
                if (this.f31634g.size() > 0) {
                    bVar.d(iMin, this.f31634g);
                    this.f31635h.b(this.f31649x, iMakeMeasureSpec, iMakeMeasureSpec2, i23, iMin, dVar.f12784a, this.f31634g);
                } else {
                    bVar.i(iB);
                    this.f31635h.b(this.f31649x, iMakeMeasureSpec, iMakeMeasureSpec2, i23, 0, -1, this.f31634g);
                }
            } else if (this.f31634g.size() > 0) {
                bVar.d(iMin, this.f31634g);
                int i25 = iMin;
                this.f31635h.b(this.f31649x, iMakeMeasureSpec2, iMakeMeasureSpec, i23, i25, dVar.f12784a, this.f31634g);
                iMakeMeasureSpec2 = iMakeMeasureSpec2;
                iMakeMeasureSpec = iMakeMeasureSpec;
                iMin = i25;
            } else {
                bVar.i(iB);
                this.f31635h.b(this.f31649x, iMakeMeasureSpec2, iMakeMeasureSpec, i23, 0, -1, this.f31634g);
                iMakeMeasureSpec2 = iMakeMeasureSpec2;
                iMakeMeasureSpec = iMakeMeasureSpec;
            }
            this.f31634g = bVar2.f12781b;
            bVar.h(iMakeMeasureSpec, iMakeMeasureSpec2, iMin);
            bVar.u(iMin);
        } else if (!dVar.f12788e) {
            this.f31634g.clear();
            bVar2.f12781b = null;
            bVar2.f12780a = 0;
            if (k()) {
                this.f31635h.b(this.f31649x, iMakeMeasureSpec, iMakeMeasureSpec2, i23, 0, dVar.f12784a, this.f31634g);
            } else {
                this.f31635h.b(this.f31649x, iMakeMeasureSpec2, iMakeMeasureSpec, i23, 0, dVar.f12784a, this.f31634g);
                iMakeMeasureSpec2 = iMakeMeasureSpec2;
                iMakeMeasureSpec = iMakeMeasureSpec;
            }
            this.f31634g = bVar2.f12781b;
            bVar.h(iMakeMeasureSpec, iMakeMeasureSpec2, 0);
            bVar.u(0);
            int i26 = bVar.f31679c[dVar.f12784a];
            dVar.f12785b = i26;
            this.f31638k.f12794c = i26;
        }
        s(h2Var, o2Var, this.f31638k);
        if (dVar.f12788e) {
            i13 = this.f31638k.f12796e;
            z12 = true;
            I(dVar, true, false);
            s(h2Var, o2Var, this.f31638k);
            i12 = this.f31638k.f12796e;
        } else {
            z12 = true;
            i12 = this.f31638k.f12796e;
            J(dVar, true, false);
            s(h2Var, o2Var, this.f31638k);
            i13 = this.f31638k.f12796e;
        }
        if (getChildCount() > 0) {
            if (dVar.f12788e) {
                A(z(i12, h2Var, o2Var, z12) + i13, h2Var, o2Var, false);
            } else {
                z(A(i13, h2Var, o2Var, z12) + i12, h2Var, o2Var, false);
            }
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onLayoutCompleted(o2 o2Var) {
        this.o = null;
        this.f31641p = -1;
        this.f31642q = Integer.MIN_VALUE;
        this.f31648w = -1;
        ag.d.b(this.f31639l);
        this.f31645t.clear();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            this.o = (SavedState) parcelable;
            requestLayout();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = this.o;
        if (savedState != null) {
            SavedState savedState2 = new SavedState();
            savedState2.f31659a = savedState.f31659a;
            savedState2.f31660b = savedState.f31660b;
            return savedState2;
        }
        SavedState savedState3 = new SavedState();
        if (getChildCount() <= 0) {
            savedState3.f31659a = -1;
            return savedState3;
        }
        View childAt = getChildAt(0);
        savedState3.f31659a = getPosition(childAt);
        savedState3.f31660b = this.f31640m.e(childAt) - this.f31640m.k();
        return savedState3;
    }

    public final int p(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        int iB = o2Var.b();
        View viewT = t(iB);
        View viewV = v(iB);
        if (o2Var.b() == 0 || viewT == null || viewV == null) {
            return 0;
        }
        int position = getPosition(viewT);
        int position2 = getPosition(viewV);
        int iAbs = Math.abs(this.f31640m.b(viewV) - this.f31640m.e(viewT));
        int i5 = this.f31635h.f31679c[position];
        if (i5 == 0 || i5 == -1) {
            return 0;
        }
        return Math.round((i5 * (iAbs / ((r3[position2] - i5) + 1))) + (this.f31640m.k() - this.f31640m.e(viewT)));
    }

    public final int q(o2 o2Var) {
        if (getChildCount() != 0) {
            int iB = o2Var.b();
            View viewT = t(iB);
            View viewV = v(iB);
            if (o2Var.b() != 0 && viewT != null && viewV != null) {
                View viewX = x(0, getChildCount());
                int position = viewX == null ? -1 : getPosition(viewX);
                return (int) ((Math.abs(this.f31640m.b(viewV) - this.f31640m.e(viewT)) / (((x(getChildCount() - 1, -1) != null ? getPosition(r4) : -1) - position) + 1)) * o2Var.b());
            }
        }
        return 0;
    }

    public final void r() {
        if (this.f31640m != null) {
            return;
        }
        if (k()) {
            if (this.f31629b == 0) {
                this.f31640m = new d1(this);
                this.n = new e1(this);
                return;
            } else {
                this.f31640m = new e1(this);
                this.n = new d1(this);
                return;
            }
        }
        if (this.f31629b == 0) {
            this.f31640m = new e1(this);
            this.n = new d1(this);
        } else {
            this.f31640m = new d1(this);
            this.n = new e1(this);
        }
    }

    public final int s(h2 h2Var, o2 o2Var, ag.e eVar) {
        int i5;
        int i11;
        boolean z11;
        int i12;
        int i13;
        boolean z12;
        Rect rect;
        int i14;
        int i15;
        int i16;
        float topDecorationHeight;
        boolean z13;
        b bVar;
        int i17;
        int i18;
        int i19;
        Rect rect2;
        int i21;
        int i22 = eVar.f12797f;
        if (i22 != Integer.MIN_VALUE) {
            int i23 = eVar.f12792a;
            if (i23 < 0) {
                eVar.f12797f = i22 + i23;
            }
            D(h2Var, eVar);
        }
        int i24 = eVar.f12792a;
        boolean zK = k();
        int i25 = i24;
        int i26 = 0;
        while (true) {
            if (i25 <= 0 && !this.f31638k.f12793b) {
                break;
            }
            List list = this.f31634g;
            int i27 = eVar.f12795d;
            if (i27 < 0 || i27 >= o2Var.b() || (i5 = eVar.f12794c) < 0 || i5 >= list.size()) {
                break;
            }
            a aVar = (a) this.f31634g.get(eVar.f12794c);
            eVar.f12795d = aVar.o;
            boolean zK2 = k();
            ag.d dVar = this.f31639l;
            Rect rect3 = f31627y;
            b bVar2 = this.f31635h;
            if (zK2) {
                int paddingLeft = getPaddingLeft();
                int paddingRight = getPaddingRight();
                int width = getWidth();
                int i28 = eVar.f12796e;
                if (eVar.f12799h == -1) {
                    i28 -= aVar.f31667g;
                }
                int i29 = eVar.f12795d;
                float f11 = dVar.f12787d;
                float rightDecorationWidth = paddingLeft - f11;
                float leftDecorationWidth = (width - paddingRight) - f11;
                float fMax = Math.max(0.0f, 0.0f);
                int i31 = aVar.f31668h;
                i11 = i24;
                int i32 = i28;
                int i33 = i29;
                int i34 = 0;
                while (i33 < i29 + i31) {
                    int i35 = i29;
                    View viewC = c(i33);
                    if (viewC == null) {
                        i17 = i34;
                        z13 = zK;
                        bVar = bVar2;
                        i18 = i31;
                        i19 = i33;
                        rect2 = rect3;
                        i21 = i35;
                    } else {
                        z13 = zK;
                        if (eVar.f12799h == 1) {
                            calculateItemDecorationsForChild(viewC, rect3);
                            addView(viewC);
                        } else {
                            calculateItemDecorationsForChild(viewC, rect3);
                            addView(viewC, i34);
                            i34++;
                        }
                        bVar = bVar2;
                        long j11 = bVar2.f31680d[i33];
                        int i36 = (int) j11;
                        int i37 = (int) (j11 >> 32);
                        if (G(viewC, i36, i37, (LayoutParams) viewC.getLayoutParams())) {
                            viewC.measure(i36, i37);
                        }
                        float leftDecorationWidth2 = rightDecorationWidth + getLeftDecorationWidth(viewC) + ((ViewGroup.MarginLayoutParams) r6).leftMargin;
                        float rightDecorationWidth2 = leftDecorationWidth - (getRightDecorationWidth(viewC) + ((ViewGroup.MarginLayoutParams) r6).rightMargin);
                        int topDecorationHeight2 = getTopDecorationHeight(viewC) + i32;
                        if (this.f31632e) {
                            int iRound = Math.round(rightDecorationWidth2) - viewC.getMeasuredWidth();
                            Rect rect4 = rect3;
                            int iRound2 = Math.round(rightDecorationWidth2);
                            int measuredHeight = viewC.getMeasuredHeight() + topDecorationHeight2;
                            i18 = i31;
                            i19 = i33;
                            rect2 = rect4;
                            i17 = i34;
                            i21 = i35;
                            this.f31635h.o(viewC, aVar, iRound, topDecorationHeight2, iRound2, measuredHeight);
                        } else {
                            i17 = i34;
                            i18 = i31;
                            i19 = i33;
                            rect2 = rect3;
                            i21 = i35;
                            this.f31635h.o(viewC, aVar, Math.round(leftDecorationWidth2), topDecorationHeight2, viewC.getMeasuredWidth() + Math.round(leftDecorationWidth2), viewC.getMeasuredHeight() + topDecorationHeight2);
                        }
                        leftDecorationWidth = rightDecorationWidth2 - ((getLeftDecorationWidth(viewC) + (viewC.getMeasuredWidth() + ((ViewGroup.MarginLayoutParams) r6).leftMargin)) + fMax);
                        rightDecorationWidth = getRightDecorationWidth(viewC) + viewC.getMeasuredWidth() + ((ViewGroup.MarginLayoutParams) r6).rightMargin + fMax + leftDecorationWidth2;
                    }
                    i33 = i19 + 1;
                    i29 = i21;
                    bVar2 = bVar;
                    zK = z13;
                    i34 = i17;
                    i31 = i18;
                    rect3 = rect2;
                }
                z11 = zK;
                eVar.f12794c += this.f31638k.f12799h;
                i13 = aVar.f31667g;
            } else {
                i11 = i24;
                z11 = zK;
                Rect rect5 = rect3;
                boolean z14 = true;
                int paddingTop = getPaddingTop();
                int paddingBottom = getPaddingBottom();
                int height = getHeight();
                int i38 = eVar.f12796e;
                if (eVar.f12799h == -1) {
                    int i39 = aVar.f31667g;
                    i12 = i38 + i39;
                    i38 -= i39;
                } else {
                    i12 = i38;
                }
                int i40 = eVar.f12795d;
                float f12 = height - paddingBottom;
                float f13 = dVar.f12787d;
                float bottomDecorationHeight = paddingTop - f13;
                float f14 = f12 - f13;
                float fMax2 = Math.max(0.0f, 0.0f);
                int i41 = aVar.f31668h;
                int i42 = i40;
                int i43 = 0;
                while (i42 < i40 + i41) {
                    int i44 = i40;
                    View viewC2 = c(i42);
                    if (viewC2 == null) {
                        i14 = i41;
                        i15 = i44;
                        topDecorationHeight = f14;
                        z12 = z14;
                        rect = rect5;
                        i16 = i42;
                    } else {
                        float f15 = bottomDecorationHeight;
                        long j12 = bVar2.f31680d[i42];
                        float f16 = f14;
                        int i45 = (int) j12;
                        int i46 = (int) (j12 >> 32);
                        if (G(viewC2, i45, i46, (LayoutParams) viewC2.getLayoutParams())) {
                            viewC2.measure(i45, i46);
                        }
                        float topDecorationHeight3 = f15 + getTopDecorationHeight(viewC2) + ((ViewGroup.MarginLayoutParams) r4).topMargin;
                        float bottomDecorationHeight2 = f16 - (getBottomDecorationHeight(viewC2) + ((ViewGroup.MarginLayoutParams) r4).rightMargin);
                        z12 = true;
                        if (eVar.f12799h == 1) {
                            rect = rect5;
                            calculateItemDecorationsForChild(viewC2, rect);
                            addView(viewC2);
                        } else {
                            rect = rect5;
                            calculateItemDecorationsForChild(viewC2, rect);
                            addView(viewC2, i43);
                            i43++;
                        }
                        int i47 = i43;
                        int leftDecorationWidth3 = getLeftDecorationWidth(viewC2) + i38;
                        int rightDecorationWidth3 = i12 - getRightDecorationWidth(viewC2);
                        int i48 = i42;
                        boolean z15 = this.f31632e;
                        if (!z15) {
                            i14 = i41;
                            i15 = i44;
                            i16 = i48;
                            if (this.f31633f) {
                                this.f31635h.p(viewC2, aVar, z15, leftDecorationWidth3, Math.round(bottomDecorationHeight2) - viewC2.getMeasuredHeight(), viewC2.getMeasuredWidth() + leftDecorationWidth3, Math.round(bottomDecorationHeight2));
                            } else {
                                this.f31635h.p(viewC2, aVar, z15, leftDecorationWidth3, Math.round(topDecorationHeight3), viewC2.getMeasuredWidth() + leftDecorationWidth3, viewC2.getMeasuredHeight() + Math.round(topDecorationHeight3));
                            }
                        } else if (this.f31633f) {
                            i16 = i48;
                            i14 = i41;
                            i15 = i44;
                            this.f31635h.p(viewC2, aVar, z15, rightDecorationWidth3 - viewC2.getMeasuredWidth(), Math.round(bottomDecorationHeight2) - viewC2.getMeasuredHeight(), rightDecorationWidth3, Math.round(bottomDecorationHeight2));
                        } else {
                            i14 = i41;
                            i15 = i44;
                            i16 = i48;
                            this.f31635h.p(viewC2, aVar, z15, rightDecorationWidth3 - viewC2.getMeasuredWidth(), Math.round(topDecorationHeight3), rightDecorationWidth3, viewC2.getMeasuredHeight() + Math.round(topDecorationHeight3));
                        }
                        topDecorationHeight = bottomDecorationHeight2 - ((getTopDecorationHeight(viewC2) + (viewC2.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) r4).bottomMargin)) + fMax2);
                        bottomDecorationHeight = getBottomDecorationHeight(viewC2) + viewC2.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) r4).topMargin + fMax2 + topDecorationHeight3;
                        i43 = i47;
                    }
                    i42 = i16 + 1;
                    rect5 = rect;
                    z14 = z12;
                    f14 = topDecorationHeight;
                    i40 = i15;
                    i41 = i14;
                }
                eVar.f12794c += this.f31638k.f12799h;
                i13 = aVar.f31667g;
            }
            i26 += i13;
            if (z11 || !this.f31632e) {
                eVar.f12796e += aVar.f31667g * eVar.f12799h;
            } else {
                eVar.f12796e -= aVar.f31667g * eVar.f12799h;
            }
            i25 -= aVar.f31667g;
            i24 = i11;
            zK = z11;
        }
        int i49 = i24;
        int i51 = eVar.f12792a - i26;
        eVar.f12792a = i51;
        int i52 = eVar.f12797f;
        if (i52 != Integer.MIN_VALUE) {
            int i53 = i52 + i26;
            eVar.f12797f = i53;
            if (i51 < 0) {
                eVar.f12797f = i53 + i51;
            }
            D(h2Var, eVar);
        }
        return i49 - eVar.f12792a;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (!k() || this.f31629b == 0) {
            int iB = B(i5, h2Var, o2Var);
            this.f31645t.clear();
            return iB;
        }
        int iC = C(i5);
        this.f31639l.f12787d += iC;
        this.n.p(-iC);
        return iC;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void scrollToPosition(int i5) {
        this.f31641p = i5;
        this.f31642q = Integer.MIN_VALUE;
        SavedState savedState = this.o;
        if (savedState != null) {
            savedState.f31659a = -1;
        }
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (k() || (this.f31629b == 0 && !k())) {
            int iB = B(i5, h2Var, o2Var);
            this.f31645t.clear();
            return iB;
        }
        int iC = C(i5);
        this.f31639l.f12787d += iC;
        this.n.p(-iC);
        return iC;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5) {
        z0 z0Var = new z0(recyclerView.getContext());
        z0Var.setTargetPosition(i5);
        startSmoothScroll(z0Var);
    }

    public final View t(int i5) {
        View viewY = y(0, getChildCount(), i5);
        if (viewY == null) {
            return null;
        }
        int i11 = this.f31635h.f31679c[getPosition(viewY)];
        if (i11 == -1) {
            return null;
        }
        return u(viewY, (a) this.f31634g.get(i11));
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View u(View view, a aVar) {
        boolean zK = k();
        int i5 = aVar.f31668h;
        for (int i11 = 1; i11 < i5; i11++) {
            View childAt = getChildAt(i11);
            if (childAt != null && childAt.getVisibility() != 8) {
                if (!this.f31632e || zK) {
                    if (this.f31640m.e(view) > this.f31640m.e(childAt)) {
                        view = childAt;
                    }
                } else if (this.f31640m.b(view) < this.f31640m.b(childAt)) {
                }
            }
        }
        return view;
    }

    public final View v(int i5) {
        View viewY = y(getChildCount() - 1, -1, i5);
        if (viewY == null) {
            return null;
        }
        return w(viewY, (a) this.f31634g.get(this.f31635h.f31679c[getPosition(viewY)]));
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0047  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View w(View view, a aVar) {
        boolean zK = k();
        int childCount = (getChildCount() - aVar.f31668h) - 1;
        for (int childCount2 = getChildCount() - 2; childCount2 > childCount; childCount2--) {
            View childAt = getChildAt(childCount2);
            if (childAt != null && childAt.getVisibility() != 8) {
                if (!this.f31632e || zK) {
                    if (this.f31640m.b(view) < this.f31640m.b(childAt)) {
                        view = childAt;
                    }
                } else if (this.f31640m.e(view) > this.f31640m.e(childAt)) {
                }
            }
        }
        return view;
    }

    public final View x(int i5, int i11) {
        int i12 = i11 > i5 ? 1 : -1;
        while (i5 != i11) {
            View childAt = getChildAt(i5);
            int paddingLeft = getPaddingLeft();
            int paddingTop = getPaddingTop();
            int width = getWidth() - getPaddingRight();
            int height = getHeight() - getPaddingBottom();
            int decoratedLeft = getDecoratedLeft(childAt) - ((ViewGroup.MarginLayoutParams) ((a2) childAt.getLayoutParams())).leftMargin;
            int decoratedTop = getDecoratedTop(childAt) - ((ViewGroup.MarginLayoutParams) ((a2) childAt.getLayoutParams())).topMargin;
            int decoratedRight = getDecoratedRight(childAt) + ((ViewGroup.MarginLayoutParams) ((a2) childAt.getLayoutParams())).rightMargin;
            int decoratedBottom = getDecoratedBottom(childAt) + ((ViewGroup.MarginLayoutParams) ((a2) childAt.getLayoutParams())).bottomMargin;
            boolean z11 = decoratedLeft >= width || decoratedRight >= paddingLeft;
            boolean z12 = decoratedTop >= height || decoratedBottom >= paddingTop;
            if (z11 && z12) {
                return childAt;
            }
            i5 += i12;
        }
        return null;
    }

    public final View y(int i5, int i11, int i12) {
        int position;
        r();
        if (this.f31638k == null) {
            ag.e eVar = new ag.e();
            eVar.f12799h = 1;
            this.f31638k = eVar;
        }
        int iK = this.f31640m.k();
        int iG = this.f31640m.g();
        int i13 = i11 <= i5 ? -1 : 1;
        View view = null;
        View view2 = null;
        while (i5 != i11) {
            View childAt = getChildAt(i5);
            if (childAt != null && (position = getPosition(childAt)) >= 0 && position < i12) {
                if (((a2) childAt.getLayoutParams()).f14880a.isRemoved()) {
                    if (view2 == null) {
                        view2 = childAt;
                    }
                } else {
                    if (this.f31640m.e(childAt) >= iK && this.f31640m.b(childAt) <= iG) {
                        return childAt;
                    }
                    if (view == null) {
                        view = childAt;
                    }
                }
            }
            i5 += i13;
        }
        return view != null ? view : view2;
    }

    public final int z(int i5, h2 h2Var, o2 o2Var, boolean z11) {
        int iB;
        int iG;
        if (k() || !this.f31632e) {
            int iG2 = this.f31640m.g() - i5;
            if (iG2 <= 0) {
                return 0;
            }
            iB = -B(-iG2, h2Var, o2Var);
        } else {
            int iK = i5 - this.f31640m.k();
            if (iK <= 0) {
                return 0;
            }
            iB = B(iK, h2Var, o2Var);
        }
        int i11 = i5 + iB;
        if (!z11 || (iG = this.f31640m.g() - i11) <= 0) {
            return iB;
        }
        this.f31640m.p(iG);
        return iG + iB;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsUpdated(RecyclerView recyclerView, int i5, int i11) {
        super.onItemsUpdated(recyclerView, i5, i11);
        H(i5);
    }
}
