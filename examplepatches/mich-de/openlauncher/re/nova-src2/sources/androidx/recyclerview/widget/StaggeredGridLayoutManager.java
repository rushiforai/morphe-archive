package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;

/* loaded from: classes2.dex */
public class StaggeredGridLayoutManager extends z1 implements m2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f14839a;

    /* renamed from: b, reason: collision with root package name */
    public final d3[] f14840b;

    /* renamed from: c, reason: collision with root package name */
    public final f1 f14841c;

    /* renamed from: d, reason: collision with root package name */
    public final f1 f14842d;

    /* renamed from: e, reason: collision with root package name */
    public final int f14843e;

    /* renamed from: f, reason: collision with root package name */
    public int f14844f;

    /* renamed from: g, reason: collision with root package name */
    public final u0 f14845g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14846h;

    /* renamed from: j, reason: collision with root package name */
    public final BitSet f14848j;

    /* renamed from: m, reason: collision with root package name */
    public final b3 f14851m;
    public final int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f14852p;

    /* renamed from: q, reason: collision with root package name */
    public SavedState f14853q;

    /* renamed from: r, reason: collision with root package name */
    public final Rect f14854r;

    /* renamed from: s, reason: collision with root package name */
    public final y2 f14855s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f14856t;

    /* renamed from: u, reason: collision with root package name */
    public int[] f14857u;

    /* renamed from: v, reason: collision with root package name */
    public final ai.h f14858v;

    /* renamed from: i, reason: collision with root package name */
    public boolean f14847i = false;

    /* renamed from: k, reason: collision with root package name */
    public int f14849k = -1;

    /* renamed from: l, reason: collision with root package name */
    public int f14850l = Integer.MIN_VALUE;

    @SuppressLint({"BanParcelableUsage"})
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new c3();

        /* renamed from: a, reason: collision with root package name */
        public int f14863a;

        /* renamed from: b, reason: collision with root package name */
        public int f14864b;

        /* renamed from: c, reason: collision with root package name */
        public int f14865c;

        /* renamed from: d, reason: collision with root package name */
        public int[] f14866d;

        /* renamed from: e, reason: collision with root package name */
        public int f14867e;

        /* renamed from: f, reason: collision with root package name */
        public int[] f14868f;

        /* renamed from: g, reason: collision with root package name */
        public ArrayList f14869g;

        /* renamed from: h, reason: collision with root package name */
        public boolean f14870h;

        /* renamed from: i, reason: collision with root package name */
        public boolean f14871i;

        /* renamed from: j, reason: collision with root package name */
        public boolean f14872j;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeInt(this.f14863a);
            parcel.writeInt(this.f14864b);
            parcel.writeInt(this.f14865c);
            if (this.f14865c > 0) {
                parcel.writeIntArray(this.f14866d);
            }
            parcel.writeInt(this.f14867e);
            if (this.f14867e > 0) {
                parcel.writeIntArray(this.f14868f);
            }
            parcel.writeInt(this.f14870h ? 1 : 0);
            parcel.writeInt(this.f14871i ? 1 : 0);
            parcel.writeInt(this.f14872j ? 1 : 0);
            parcel.writeList(this.f14869g);
        }
    }

    public StaggeredGridLayoutManager(Context context, AttributeSet attributeSet, int i5, int i11) {
        this.f14839a = -1;
        this.f14846h = false;
        b3 b3Var = new b3();
        this.f14851m = b3Var;
        this.n = 2;
        this.f14854r = new Rect();
        this.f14855s = new y2(this);
        this.f14856t = true;
        this.f14858v = new ai.h(this, 10);
        y1 properties = z1.getProperties(context, attributeSet, i5, i11);
        int i12 = properties.f15183a;
        if (i12 != 0 && i12 != 1) {
            throw new IllegalArgumentException("invalid orientation.");
        }
        assertNotInLayoutOrScroll(null);
        if (i12 != this.f14843e) {
            this.f14843e = i12;
            f1 f1Var = this.f14841c;
            this.f14841c = this.f14842d;
            this.f14842d = f1Var;
            requestLayout();
        }
        int i13 = properties.f15184b;
        assertNotInLayoutOrScroll(null);
        if (i13 != this.f14839a) {
            b3Var.a();
            requestLayout();
            this.f14839a = i13;
            this.f14848j = new BitSet(this.f14839a);
            this.f14840b = new d3[this.f14839a];
            for (int i14 = 0; i14 < this.f14839a; i14++) {
                this.f14840b[i14] = new d3(this, i14);
            }
            requestLayout();
        }
        boolean z11 = properties.f15185c;
        assertNotInLayoutOrScroll(null);
        SavedState savedState = this.f14853q;
        if (savedState != null && savedState.f14870h != z11) {
            savedState.f14870h = z11;
        }
        this.f14846h = z11;
        requestLayout();
        u0 u0Var = new u0();
        u0Var.f15132a = true;
        u0Var.f15137f = 0;
        u0Var.f15138g = 0;
        this.f14845g = u0Var;
        this.f14841c = f1.a(this, this.f14843e);
        this.f14842d = f1.a(this, 1 - this.f14843e);
    }

    public static int M(int i5, int i11, int i12) {
        int mode;
        return (!(i11 == 0 && i12 == 0) && ((mode = View.MeasureSpec.getMode(i5)) == Integer.MIN_VALUE || mode == 1073741824)) ? View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i5) - i11) - i12), mode) : i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00f8 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x002c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View A() {
        int childCount = getChildCount();
        int i5 = childCount - 1;
        BitSet bitSet = new BitSet(this.f14839a);
        bitSet.set(0, this.f14839a, true);
        char c11 = (this.f14843e == 1 && isLayoutRTL()) ? (char) 1 : (char) 65535;
        if (this.f14847i) {
            childCount = -1;
        } else {
            i5 = 0;
        }
        int i11 = i5 < childCount ? 1 : -1;
        while (i5 != childCount) {
            View childAt = getChildAt(i5);
            z2 z2Var = (z2) childAt.getLayoutParams();
            if (bitSet.get(z2Var.f15197e.f14928e)) {
                d3 d3Var = z2Var.f15197e;
                if (this.f14847i) {
                    int i12 = d3Var.f14926c;
                    if (i12 == Integer.MIN_VALUE) {
                        d3Var.a();
                        i12 = d3Var.f14926c;
                    }
                    if (i12 < this.f14841c.g()) {
                        ((z2) ((View) h6.c1.l(d3Var.f14924a, 1)).getLayoutParams()).getClass();
                        return childAt;
                    }
                } else {
                    int i13 = d3Var.f14925b;
                    ArrayList arrayList = d3Var.f14924a;
                    if (i13 == Integer.MIN_VALUE) {
                        View view = (View) arrayList.get(0);
                        z2 z2Var2 = (z2) view.getLayoutParams();
                        d3Var.f14925b = d3Var.f14929f.f14841c.e(view);
                        z2Var2.getClass();
                        i13 = d3Var.f14925b;
                    }
                    if (i13 > this.f14841c.k()) {
                        ((z2) ((View) arrayList.get(0)).getLayoutParams()).getClass();
                        return childAt;
                    }
                }
                bitSet.clear(z2Var.f15197e.f14928e);
            }
            i5 += i11;
            if (i5 != childCount) {
                View childAt2 = getChildAt(i5);
                if (this.f14847i) {
                    int iB = this.f14841c.b(childAt);
                    int iB2 = this.f14841c.b(childAt2);
                    if (iB < iB2) {
                        return childAt;
                    }
                    if (iB == iB2) {
                        if ((z2Var.f15197e.f14928e - ((z2) childAt2.getLayoutParams()).f15197e.f14928e >= 0) == (c11 >= 0)) {
                            return childAt;
                        }
                    } else {
                        continue;
                    }
                } else {
                    int iE = this.f14841c.e(childAt);
                    int iE2 = this.f14841c.e(childAt2);
                    if (iE > iE2) {
                        return childAt;
                    }
                    if (iE == iE2) {
                        if ((z2Var.f15197e.f14928e - ((z2) childAt2.getLayoutParams()).f15197e.f14928e >= 0) == (c11 >= 0)) {
                        }
                    } else {
                        continue;
                    }
                }
            }
        }
        return null;
    }

    public final void B(View view, int i5, int i11) {
        Rect rect = this.f14854r;
        calculateItemDecorationsForChild(view, rect);
        z2 z2Var = (z2) view.getLayoutParams();
        int iM = M(i5, ((ViewGroup.MarginLayoutParams) z2Var).leftMargin + rect.left, ((ViewGroup.MarginLayoutParams) z2Var).rightMargin + rect.right);
        int iM2 = M(i11, ((ViewGroup.MarginLayoutParams) z2Var).topMargin + rect.top, ((ViewGroup.MarginLayoutParams) z2Var).bottomMargin + rect.bottom);
        if (shouldMeasureChild(view, iM, iM2, z2Var)) {
            view.measure(iM, iM2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x01fe  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x0413  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void C(h2 h2Var, o2 o2Var, boolean z11) {
        SavedState savedState;
        int position;
        int i5;
        boolean z12;
        SavedState savedState2 = this.f14853q;
        y2 y2Var = this.f14855s;
        if (!(savedState2 == null && this.f14849k == -1) && o2Var.b() == 0) {
            removeAndRecycleAllViews(h2Var);
            y2Var.a();
            return;
        }
        boolean z13 = y2Var.f15191e;
        StaggeredGridLayoutManager staggeredGridLayoutManager = y2Var.f15193g;
        boolean z14 = true;
        boolean z15 = (z13 && this.f14849k == -1 && this.f14853q == null) ? false : true;
        b3 b3Var = this.f14851m;
        if (z15) {
            y2Var.a();
            SavedState savedState3 = this.f14853q;
            if (savedState3 != null) {
                int i11 = savedState3.f14865c;
                if (i11 > 0) {
                    if (i11 == this.f14839a) {
                        for (int i12 = 0; i12 < this.f14839a; i12++) {
                            this.f14840b[i12].b();
                            SavedState savedState4 = this.f14853q;
                            int iG = savedState4.f14866d[i12];
                            if (iG != Integer.MIN_VALUE) {
                                iG += savedState4.f14871i ? this.f14841c.g() : this.f14841c.k();
                            }
                            d3 d3Var = this.f14840b[i12];
                            d3Var.f14925b = iG;
                            d3Var.f14926c = iG;
                        }
                    } else {
                        savedState3.f14866d = null;
                        savedState3.f14865c = 0;
                        savedState3.f14867e = 0;
                        savedState3.f14868f = null;
                        savedState3.f14869g = null;
                        savedState3.f14863a = savedState3.f14864b;
                    }
                }
                SavedState savedState5 = this.f14853q;
                this.f14852p = savedState5.f14872j;
                boolean z16 = savedState5.f14870h;
                assertNotInLayoutOrScroll(null);
                SavedState savedState6 = this.f14853q;
                if (savedState6 != null && savedState6.f14870h != z16) {
                    savedState6.f14870h = z16;
                }
                this.f14846h = z16;
                requestLayout();
                I();
                SavedState savedState7 = this.f14853q;
                int i13 = savedState7.f14863a;
                if (i13 != -1) {
                    this.f14849k = i13;
                    y2Var.f15189c = savedState7.f14871i;
                } else {
                    y2Var.f15189c = this.f14847i;
                }
                if (savedState7.f14867e > 1) {
                    b3Var.f14914a = savedState7.f14868f;
                    b3Var.f14915b = savedState7.f14869g;
                }
            } else {
                I();
                y2Var.f15189c = this.f14847i;
            }
            if (o2Var.f15075g || (i5 = this.f14849k) == -1) {
                if (this.o) {
                    int iB = o2Var.b();
                    int childCount = getChildCount();
                    for (int i14 = 0; i14 < childCount; i14++) {
                        int position2 = getPosition(getChildAt(i14));
                        if (position2 >= 0 && position2 < iB) {
                            position = position2;
                            break;
                        }
                    }
                    position = 0;
                    y2Var.f15187a = position;
                    y2Var.f15188b = Integer.MIN_VALUE;
                    y2Var.f15191e = true;
                } else {
                    int iB2 = o2Var.b();
                    for (int childCount2 = getChildCount() - 1; childCount2 >= 0; childCount2--) {
                        position = getPosition(getChildAt(childCount2));
                        if (position >= 0 && position < iB2) {
                            break;
                        }
                    }
                    position = 0;
                    y2Var.f15187a = position;
                    y2Var.f15188b = Integer.MIN_VALUE;
                    y2Var.f15191e = true;
                }
            } else if (i5 < 0 || i5 >= o2Var.b()) {
                this.f14849k = -1;
                this.f14850l = Integer.MIN_VALUE;
                if (this.o) {
                }
            } else {
                SavedState savedState8 = this.f14853q;
                if (savedState8 == null || savedState8.f14863a == -1 || savedState8.f14865c < 1) {
                    View viewFindViewByPosition = findViewByPosition(this.f14849k);
                    if (viewFindViewByPosition != null) {
                        y2Var.f15187a = this.f14847i ? w() : v();
                        if (this.f14850l != Integer.MIN_VALUE) {
                            if (y2Var.f15189c) {
                                y2Var.f15188b = (this.f14841c.g() - this.f14850l) - this.f14841c.b(viewFindViewByPosition);
                            } else {
                                y2Var.f15188b = (this.f14841c.k() + this.f14850l) - this.f14841c.e(viewFindViewByPosition);
                            }
                        } else if (this.f14841c.c(viewFindViewByPosition) > this.f14841c.l()) {
                            y2Var.f15188b = y2Var.f15189c ? this.f14841c.g() : this.f14841c.k();
                        } else {
                            int iE = this.f14841c.e(viewFindViewByPosition) - this.f14841c.k();
                            if (iE < 0) {
                                y2Var.f15188b = -iE;
                            } else {
                                int iG2 = this.f14841c.g() - this.f14841c.b(viewFindViewByPosition);
                                if (iG2 < 0) {
                                    y2Var.f15188b = iG2;
                                } else {
                                    y2Var.f15188b = Integer.MIN_VALUE;
                                }
                            }
                        }
                    } else {
                        int i15 = this.f14849k;
                        y2Var.f15187a = i15;
                        int i16 = this.f14850l;
                        if (i16 == Integer.MIN_VALUE) {
                            if (getChildCount() == 0) {
                                z12 = this.f14847i;
                            } else if ((i15 < v()) != this.f14847i) {
                            }
                            y2Var.f15189c = z12;
                            y2Var.f15188b = z12 ? staggeredGridLayoutManager.f14841c.g() : staggeredGridLayoutManager.f14841c.k();
                        } else if (y2Var.f15189c) {
                            y2Var.f15188b = staggeredGridLayoutManager.f14841c.g() - i16;
                        } else {
                            y2Var.f15188b = staggeredGridLayoutManager.f14841c.k() + i16;
                        }
                        y2Var.f15190d = true;
                    }
                } else {
                    y2Var.f15188b = Integer.MIN_VALUE;
                    y2Var.f15187a = this.f14849k;
                }
                y2Var.f15191e = true;
            }
        }
        if (this.f14853q == null && this.f14849k == -1 && (y2Var.f15189c != this.o || isLayoutRTL() != this.f14852p)) {
            b3Var.a();
            y2Var.f15190d = true;
        }
        if (getChildCount() > 0 && ((savedState = this.f14853q) == null || savedState.f14865c < 1)) {
            if (y2Var.f15190d) {
                for (int i17 = 0; i17 < this.f14839a; i17++) {
                    this.f14840b[i17].b();
                    int i18 = y2Var.f15188b;
                    if (i18 != Integer.MIN_VALUE) {
                        d3 d3Var2 = this.f14840b[i17];
                        d3Var2.f14925b = i18;
                        d3Var2.f14926c = i18;
                    }
                }
            } else if (z15 || y2Var.f15192f == null) {
                for (int i19 = 0; i19 < this.f14839a; i19++) {
                    d3 d3Var3 = this.f14840b[i19];
                    boolean z17 = this.f14847i;
                    int i21 = y2Var.f15188b;
                    StaggeredGridLayoutManager staggeredGridLayoutManager2 = d3Var3.f14929f;
                    int iF = z17 ? d3Var3.f(Integer.MIN_VALUE) : d3Var3.h(Integer.MIN_VALUE);
                    d3Var3.b();
                    if (iF != Integer.MIN_VALUE && ((!z17 || iF >= staggeredGridLayoutManager2.f14841c.g()) && (z17 || iF <= staggeredGridLayoutManager2.f14841c.k()))) {
                        if (i21 != Integer.MIN_VALUE) {
                            iF += i21;
                        }
                        d3Var3.f14926c = iF;
                        d3Var3.f14925b = iF;
                    }
                }
                d3[] d3VarArr = this.f14840b;
                int length = d3VarArr.length;
                int[] iArr = y2Var.f15192f;
                if (iArr == null || iArr.length < length) {
                    y2Var.f15192f = new int[staggeredGridLayoutManager.f14840b.length];
                }
                for (int i22 = 0; i22 < length; i22++) {
                    y2Var.f15192f[i22] = d3VarArr[i22].h(Integer.MIN_VALUE);
                }
            } else {
                for (int i23 = 0; i23 < this.f14839a; i23++) {
                    d3 d3Var4 = this.f14840b[i23];
                    d3Var4.b();
                    int i24 = y2Var.f15192f[i23];
                    d3Var4.f14925b = i24;
                    d3Var4.f14926c = i24;
                }
            }
        }
        detachAndScrapAttachedViews(h2Var);
        u0 u0Var = this.f14845g;
        u0Var.f15132a = false;
        int iL = this.f14842d.l();
        this.f14844f = iL / this.f14839a;
        View.MeasureSpec.makeMeasureSpec(iL, this.f14842d.i());
        K(y2Var.f15187a, o2Var);
        if (y2Var.f15189c) {
            J(-1);
            q(h2Var, u0Var, o2Var);
            J(1);
            u0Var.f15134c = y2Var.f15187a + u0Var.f15135d;
            q(h2Var, u0Var, o2Var);
        } else {
            J(1);
            q(h2Var, u0Var, o2Var);
            J(-1);
            u0Var.f15134c = y2Var.f15187a + u0Var.f15135d;
            q(h2Var, u0Var, o2Var);
        }
        if (this.f14842d.i() != 1073741824) {
            int childCount3 = getChildCount();
            float fMax = 0.0f;
            for (int i25 = 0; i25 < childCount3; i25++) {
                View childAt = getChildAt(i25);
                float fC = this.f14842d.c(childAt);
                if (fC >= fMax) {
                    ((z2) childAt.getLayoutParams()).getClass();
                    fMax = Math.max(fMax, fC);
                }
            }
            int i26 = this.f14844f;
            int iRound = Math.round(fMax * this.f14839a);
            if (this.f14842d.i() == Integer.MIN_VALUE) {
                iRound = Math.min(iRound, this.f14842d.l());
            }
            this.f14844f = iRound / this.f14839a;
            View.MeasureSpec.makeMeasureSpec(iRound, this.f14842d.i());
            if (this.f14844f != i26) {
                for (int i27 = 0; i27 < childCount3; i27++) {
                    View childAt2 = getChildAt(i27);
                    z2 z2Var = (z2) childAt2.getLayoutParams();
                    z2Var.getClass();
                    if (isLayoutRTL() && this.f14843e == 1) {
                        int i28 = -((this.f14839a - 1) - z2Var.f15197e.f14928e);
                        childAt2.offsetLeftAndRight((this.f14844f * i28) - (i28 * i26));
                    } else {
                        int i29 = z2Var.f15197e.f14928e;
                        int i31 = this.f14844f * i29;
                        int i32 = i29 * i26;
                        if (this.f14843e == 1) {
                            childAt2.offsetLeftAndRight(i31 - i32);
                        } else {
                            childAt2.offsetTopAndBottom(i31 - i32);
                        }
                    }
                }
            }
        }
        if (getChildCount() > 0) {
            if (this.f14847i) {
                t(h2Var, o2Var, true);
                u(h2Var, o2Var, false);
            } else {
                u(h2Var, o2Var, true);
                t(h2Var, o2Var, false);
            }
        }
        if (!z11 || o2Var.f15075g || this.n == 0 || getChildCount() <= 0 || A() == null) {
            z14 = false;
        } else {
            removeCallbacks(this.f14858v);
            if (!o()) {
            }
        }
        if (o2Var.f15075g) {
            y2Var.a();
        }
        this.o = y2Var.f15189c;
        this.f14852p = isLayoutRTL();
        if (z14) {
            y2Var.a();
            C(h2Var, o2Var, false);
        }
    }

    public final boolean D(int i5) {
        if (this.f14843e == 0) {
            return (i5 == -1) != this.f14847i;
        }
        return ((i5 == -1) == this.f14847i) == isLayoutRTL();
    }

    public final void E(int i5, o2 o2Var) {
        int iV;
        int i11;
        if (i5 > 0) {
            iV = w();
            i11 = 1;
        } else {
            iV = v();
            i11 = -1;
        }
        u0 u0Var = this.f14845g;
        u0Var.f15132a = true;
        K(iV, o2Var);
        J(i11);
        u0Var.f15134c = iV + u0Var.f15135d;
        u0Var.f15133b = Math.abs(i5);
    }

    public final void F(h2 h2Var, u0 u0Var) {
        if (!u0Var.f15132a || u0Var.f15140i) {
            return;
        }
        if (u0Var.f15133b == 0) {
            if (u0Var.f15136e == -1) {
                G(u0Var.f15138g, h2Var);
                return;
            } else {
                H(u0Var.f15137f, h2Var);
                return;
            }
        }
        int i5 = 1;
        if (u0Var.f15136e == -1) {
            int i11 = u0Var.f15137f;
            int iH = this.f14840b[0].h(i11);
            while (i5 < this.f14839a) {
                int iH2 = this.f14840b[i5].h(i11);
                if (iH2 > iH) {
                    iH = iH2;
                }
                i5++;
            }
            int i12 = i11 - iH;
            G(i12 < 0 ? u0Var.f15138g : u0Var.f15138g - Math.min(i12, u0Var.f15133b), h2Var);
            return;
        }
        int i13 = u0Var.f15138g;
        int iF = this.f14840b[0].f(i13);
        while (i5 < this.f14839a) {
            int iF2 = this.f14840b[i5].f(i13);
            if (iF2 < iF) {
                iF = iF2;
            }
            i5++;
        }
        int i14 = iF - u0Var.f15138g;
        H(i14 < 0 ? u0Var.f15137f : Math.min(i14, u0Var.f15133b) + u0Var.f15137f, h2Var);
    }

    public final void G(int i5, h2 h2Var) {
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            if (this.f14841c.e(childAt) < i5 || this.f14841c.o(childAt) < i5) {
                return;
            }
            z2 z2Var = (z2) childAt.getLayoutParams();
            z2Var.getClass();
            if (z2Var.f15197e.f14924a.size() == 1) {
                return;
            }
            d3 d3Var = z2Var.f15197e;
            ArrayList arrayList = d3Var.f14924a;
            int size = arrayList.size();
            View view = (View) arrayList.remove(size - 1);
            z2 z2Var2 = (z2) view.getLayoutParams();
            z2Var2.f15197e = null;
            if (z2Var2.f14880a.isRemoved() || z2Var2.f14880a.isUpdated()) {
                d3Var.f14927d -= d3Var.f14929f.f14841c.c(view);
            }
            if (size == 1) {
                d3Var.f14925b = Integer.MIN_VALUE;
            }
            d3Var.f14926c = Integer.MIN_VALUE;
            removeAndRecycleView(childAt, h2Var);
        }
    }

    public final void H(int i5, h2 h2Var) {
        while (getChildCount() > 0) {
            View childAt = getChildAt(0);
            if (this.f14841c.b(childAt) > i5 || this.f14841c.n(childAt) > i5) {
                return;
            }
            z2 z2Var = (z2) childAt.getLayoutParams();
            z2Var.getClass();
            if (z2Var.f15197e.f14924a.size() == 1) {
                return;
            }
            d3 d3Var = z2Var.f15197e;
            ArrayList arrayList = d3Var.f14924a;
            View view = (View) arrayList.remove(0);
            z2 z2Var2 = (z2) view.getLayoutParams();
            z2Var2.f15197e = null;
            if (arrayList.size() == 0) {
                d3Var.f14926c = Integer.MIN_VALUE;
            }
            if (z2Var2.f14880a.isRemoved() || z2Var2.f14880a.isUpdated()) {
                d3Var.f14927d -= d3Var.f14929f.f14841c.c(view);
            }
            d3Var.f14925b = Integer.MIN_VALUE;
            removeAndRecycleView(childAt, h2Var);
        }
    }

    public final void I() {
        if (this.f14843e == 1 || !isLayoutRTL()) {
            this.f14847i = this.f14846h;
        } else {
            this.f14847i = !this.f14846h;
        }
    }

    public final void J(int i5) {
        u0 u0Var = this.f14845g;
        u0Var.f15136e = i5;
        u0Var.f15135d = this.f14847i != (i5 == -1) ? -1 : 1;
    }

    public final void K(int i5, o2 o2Var) {
        int iL;
        int iL2;
        int i11;
        u0 u0Var = this.f14845g;
        boolean z11 = false;
        u0Var.f15133b = 0;
        u0Var.f15134c = i5;
        if (!isSmoothScrolling() || (i11 = o2Var.f15069a) == -1) {
            iL = 0;
            iL2 = 0;
        } else {
            if (this.f14847i == (i11 < i5)) {
                iL = this.f14841c.l();
                iL2 = 0;
            } else {
                iL2 = this.f14841c.l();
                iL = 0;
            }
        }
        if (getClipToPadding()) {
            u0Var.f15137f = this.f14841c.k() - iL2;
            u0Var.f15138g = this.f14841c.g() + iL;
        } else {
            u0Var.f15138g = this.f14841c.f() + iL;
            u0Var.f15137f = -iL2;
        }
        u0Var.f15139h = false;
        u0Var.f15132a = true;
        if (this.f14841c.i() == 0 && this.f14841c.f() == 0) {
            z11 = true;
        }
        u0Var.f15140i = z11;
    }

    public final void L(d3 d3Var, int i5, int i11) {
        int i12 = d3Var.f14927d;
        int i13 = d3Var.f14928e;
        if (i5 != -1) {
            int i14 = d3Var.f14926c;
            if (i14 == Integer.MIN_VALUE) {
                d3Var.a();
                i14 = d3Var.f14926c;
            }
            if (i14 - i12 >= i11) {
                this.f14848j.set(i13, false);
                return;
            }
            return;
        }
        int i15 = d3Var.f14925b;
        if (i15 == Integer.MIN_VALUE) {
            View view = (View) d3Var.f14924a.get(0);
            z2 z2Var = (z2) view.getLayoutParams();
            d3Var.f14925b = d3Var.f14929f.f14841c.e(view);
            z2Var.getClass();
            i15 = d3Var.f14925b;
        }
        if (i15 + i12 <= i11) {
            this.f14848j.set(i13, false);
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void assertNotInLayoutOrScroll(String str) {
        if (this.f14853q == null) {
            super.assertNotInLayoutOrScroll(str);
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollHorizontally() {
        return this.f14843e == 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollVertically() {
        return this.f14843e == 1;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean checkLayoutParams(a2 a2Var) {
        return a2Var instanceof z2;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void collectAdjacentPrefetchPositions(int i5, int i11, o2 o2Var, x1 x1Var) {
        u0 u0Var;
        int iF;
        int iH;
        if (this.f14843e != 0) {
            i5 = i11;
        }
        if (getChildCount() == 0 || i5 == 0) {
            return;
        }
        E(i5, o2Var);
        int[] iArr = this.f14857u;
        if (iArr == null || iArr.length < this.f14839a) {
            this.f14857u = new int[this.f14839a];
        }
        int i12 = 0;
        int i13 = 0;
        while (true) {
            int i14 = this.f14839a;
            u0Var = this.f14845g;
            if (i12 >= i14) {
                break;
            }
            if (u0Var.f15135d == -1) {
                iF = u0Var.f15137f;
                iH = this.f14840b[i12].h(iF);
            } else {
                iF = this.f14840b[i12].f(u0Var.f15138g);
                iH = u0Var.f15138g;
            }
            int i15 = iF - iH;
            if (i15 >= 0) {
                this.f14857u[i13] = i15;
                i13++;
            }
            i12++;
        }
        Arrays.sort(this.f14857u, 0, i13);
        for (int i16 = 0; i16 < i13; i16++) {
            int i17 = u0Var.f15134c;
            if (i17 < 0 || i17 >= o2Var.b()) {
                return;
            }
            ((d0) x1Var).a(u0Var.f15134c, this.f14857u[i16]);
            u0Var.f15134c += u0Var.f15135d;
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollExtent(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        boolean z11 = !this.f14856t;
        return c.a(o2Var, this.f14841c, s(z11), r(z11), this, this.f14856t);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollRange(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        boolean z11 = !this.f14856t;
        return c.c(o2Var, this.f14841c, s(z11), r(z11), this, this.f14856t);
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000c  */
    @Override // androidx.recyclerview.widget.m2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final PointF computeScrollVectorForPosition(int i5) {
        int i11 = -1;
        if (getChildCount() != 0) {
            if ((i5 < v()) == this.f14847i) {
            }
        } else if (this.f14847i) {
            i11 = 1;
        }
        PointF pointF = new PointF();
        if (i11 == 0) {
            return null;
        }
        if (this.f14843e == 0) {
            pointF.x = i11;
            pointF.y = 0.0f;
            return pointF;
        }
        pointF.x = 0.0f;
        pointF.y = i11;
        return pointF;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollExtent(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        boolean z11 = !this.f14856t;
        return c.a(o2Var, this.f14841c, s(z11), r(z11), this, this.f14856t);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollOffset(o2 o2Var) {
        return p(o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollRange(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        boolean z11 = !this.f14856t;
        return c.c(o2Var, this.f14841c, s(z11), r(z11), this, this.f14856t);
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateDefaultLayoutParams() {
        return this.f14843e == 0 ? new z2(-2, -1) : new z2(-1, -2);
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateLayoutParams(Context context, AttributeSet attributeSet) {
        return new z2(context, attributeSet);
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean isAutoMeasureEnabled() {
        return this.n != 0;
    }

    public final boolean isLayoutRTL() {
        return getLayoutDirection() == 1;
    }

    public final boolean o() {
        int iV;
        if (getChildCount() != 0 && this.n != 0 && isAttachedToWindow()) {
            if (this.f14847i) {
                iV = w();
                v();
            } else {
                iV = v();
                w();
            }
            if (iV == 0 && A() != null) {
                this.f14851m.a();
                requestSimpleAnimationsInNextLayout();
                requestLayout();
                return true;
            }
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void offsetChildrenHorizontal(int i5) {
        super.offsetChildrenHorizontal(i5);
        for (int i11 = 0; i11 < this.f14839a; i11++) {
            d3 d3Var = this.f14840b[i11];
            int i12 = d3Var.f14925b;
            if (i12 != Integer.MIN_VALUE) {
                d3Var.f14925b = i12 + i5;
            }
            int i13 = d3Var.f14926c;
            if (i13 != Integer.MIN_VALUE) {
                d3Var.f14926c = i13 + i5;
            }
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void offsetChildrenVertical(int i5) {
        super.offsetChildrenVertical(i5);
        for (int i11 = 0; i11 < this.f14839a; i11++) {
            d3 d3Var = this.f14840b[i11];
            int i12 = d3Var.f14925b;
            if (i12 != Integer.MIN_VALUE) {
                d3Var.f14925b = i12 + i5;
            }
            int i13 = d3Var.f14926c;
            if (i13 != Integer.MIN_VALUE) {
                d3Var.f14926c = i13 + i5;
            }
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onAdapterChanged(m1 m1Var, m1 m1Var2) {
        this.f14851m.a();
        for (int i5 = 0; i5 < this.f14839a; i5++) {
            this.f14840b[i5].b();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onDetachedFromWindow(RecyclerView recyclerView, h2 h2Var) {
        onDetachedFromWindow(recyclerView);
        removeCallbacks(this.f14858v);
        for (int i5 = 0; i5 < this.f14839a; i5++) {
            this.f14840b[i5].b();
        }
        recyclerView.requestLayout();
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x003c  */
    @Override // androidx.recyclerview.widget.z1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View onFocusSearchFailed(View view, int i5, h2 h2Var, o2 o2Var) {
        View viewFindContainingItemView;
        int i11;
        if (getChildCount() == 0 || (viewFindContainingItemView = findContainingItemView(view)) == null) {
            return null;
        }
        I();
        if (i5 != 1) {
            if (i5 != 2) {
                if (i5 != 17) {
                    if (i5 != 33) {
                        if (i5 == 66 ? this.f14843e == 0 : !(i5 != 130 || this.f14843e != 1)) {
                            i11 = 1;
                        }
                    } else if (this.f14843e == 1) {
                        i11 = -1;
                    }
                    i11 = Integer.MIN_VALUE;
                } else if (this.f14843e != 0) {
                    i11 = Integer.MIN_VALUE;
                }
            } else if (this.f14843e != 1 && isLayoutRTL()) {
            }
        } else if (this.f14843e != 1 && isLayoutRTL()) {
        }
        if (i11 == Integer.MIN_VALUE) {
            return null;
        }
        z2 z2Var = (z2) viewFindContainingItemView.getLayoutParams();
        z2Var.getClass();
        d3 d3Var = z2Var.f15197e;
        int iW = i11 == 1 ? w() : v();
        K(iW, o2Var);
        J(i11);
        u0 u0Var = this.f14845g;
        u0Var.f15134c = u0Var.f15135d + iW;
        u0Var.f15133b = (int) (this.f14841c.l() * 0.33333334f);
        u0Var.f15139h = true;
        u0Var.f15132a = false;
        q(h2Var, u0Var, o2Var);
        this.o = this.f14847i;
        View viewG = d3Var.g(iW, i11);
        if (viewG != null && viewG != viewFindContainingItemView) {
            return viewG;
        }
        if (D(i11)) {
            for (int i12 = this.f14839a - 1; i12 >= 0; i12--) {
                View viewG2 = this.f14840b[i12].g(iW, i11);
                if (viewG2 != null && viewG2 != viewFindContainingItemView) {
                    return viewG2;
                }
            }
        } else {
            for (int i13 = 0; i13 < this.f14839a; i13++) {
                View viewG3 = this.f14840b[i13].g(iW, i11);
                if (viewG3 != null && viewG3 != viewFindContainingItemView) {
                    return viewG3;
                }
            }
        }
        boolean z11 = (this.f14846h ^ true) == (i11 == -1);
        View viewFindViewByPosition = findViewByPosition(z11 ? d3Var.c() : d3Var.d());
        if (viewFindViewByPosition != null && viewFindViewByPosition != viewFindContainingItemView) {
            return viewFindViewByPosition;
        }
        if (D(i11)) {
            for (int i14 = this.f14839a - 1; i14 >= 0; i14--) {
                if (i14 != d3Var.f14928e) {
                    View viewFindViewByPosition2 = findViewByPosition(z11 ? this.f14840b[i14].c() : this.f14840b[i14].d());
                    if (viewFindViewByPosition2 != null && viewFindViewByPosition2 != viewFindContainingItemView) {
                        return viewFindViewByPosition2;
                    }
                }
            }
        } else {
            for (int i15 = 0; i15 < this.f14839a; i15++) {
                View viewFindViewByPosition3 = findViewByPosition(z11 ? this.f14840b[i15].c() : this.f14840b[i15].d());
                if (viewFindViewByPosition3 != null && viewFindViewByPosition3 != viewFindContainingItemView) {
                    return viewFindViewByPosition3;
                }
            }
        }
        return null;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (getChildCount() > 0) {
            View viewS = s(false);
            View viewR = r(false);
            if (viewS == null || viewR == null) {
                return;
            }
            int position = getPosition(viewS);
            int position2 = getPosition(viewR);
            if (position < position2) {
                accessibilityEvent.setFromIndex(position);
                accessibilityEvent.setToIndex(position2);
            } else {
                accessibilityEvent.setFromIndex(position2);
                accessibilityEvent.setToIndex(position);
            }
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsAdded(RecyclerView recyclerView, int i5, int i11) {
        z(i5, i11, 1);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsChanged(RecyclerView recyclerView) {
        this.f14851m.a();
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsMoved(RecyclerView recyclerView, int i5, int i11, int i12) {
        z(i5, i11, 8);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsRemoved(RecyclerView recyclerView, int i5, int i11) {
        z(i5, i11, 2);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsUpdated(RecyclerView recyclerView, int i5, int i11, Object obj) {
        z(i5, i11, 4);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onLayoutChildren(h2 h2Var, o2 o2Var) {
        C(h2Var, o2Var, true);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onLayoutCompleted(o2 o2Var) {
        this.f14849k = -1;
        this.f14850l = Integer.MIN_VALUE;
        this.f14853q = null;
        this.f14855s.a();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            SavedState savedState = (SavedState) parcelable;
            this.f14853q = savedState;
            if (this.f14849k != -1) {
                savedState.f14863a = -1;
                savedState.f14864b = -1;
                savedState.f14866d = null;
                savedState.f14865c = 0;
                savedState.f14867e = 0;
                savedState.f14868f = null;
                savedState.f14869g = null;
            }
            requestLayout();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final Parcelable onSaveInstanceState() {
        int iH;
        int iK;
        int[] iArr;
        SavedState savedState = this.f14853q;
        if (savedState != null) {
            SavedState savedState2 = new SavedState();
            savedState2.f14865c = savedState.f14865c;
            savedState2.f14863a = savedState.f14863a;
            savedState2.f14864b = savedState.f14864b;
            savedState2.f14866d = savedState.f14866d;
            savedState2.f14867e = savedState.f14867e;
            savedState2.f14868f = savedState.f14868f;
            savedState2.f14870h = savedState.f14870h;
            savedState2.f14871i = savedState.f14871i;
            savedState2.f14872j = savedState.f14872j;
            savedState2.f14869g = savedState.f14869g;
            return savedState2;
        }
        SavedState savedState3 = new SavedState();
        savedState3.f14870h = this.f14846h;
        savedState3.f14871i = this.o;
        savedState3.f14872j = this.f14852p;
        b3 b3Var = this.f14851m;
        if (b3Var == null || (iArr = (int[]) b3Var.f14914a) == null) {
            savedState3.f14867e = 0;
        } else {
            savedState3.f14868f = iArr;
            savedState3.f14867e = iArr.length;
            savedState3.f14869g = (ArrayList) b3Var.f14915b;
        }
        if (getChildCount() <= 0) {
            savedState3.f14863a = -1;
            savedState3.f14864b = -1;
            savedState3.f14865c = 0;
            return savedState3;
        }
        savedState3.f14863a = this.o ? w() : v();
        View viewR = this.f14847i ? r(true) : s(true);
        savedState3.f14864b = viewR != null ? getPosition(viewR) : -1;
        int i5 = this.f14839a;
        savedState3.f14865c = i5;
        savedState3.f14866d = new int[i5];
        for (int i11 = 0; i11 < this.f14839a; i11++) {
            if (this.o) {
                iH = this.f14840b[i11].f(Integer.MIN_VALUE);
                if (iH != Integer.MIN_VALUE) {
                    iK = this.f14841c.g();
                    iH -= iK;
                }
            } else {
                iH = this.f14840b[i11].h(Integer.MIN_VALUE);
                if (iH != Integer.MIN_VALUE) {
                    iK = this.f14841c.k();
                    iH -= iK;
                }
            }
            savedState3.f14866d[i11] = iH;
        }
        return savedState3;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onScrollStateChanged(int i5) {
        if (i5 == 0) {
            o();
        }
    }

    public final int p(o2 o2Var) {
        if (getChildCount() == 0) {
            return 0;
        }
        boolean z11 = !this.f14856t;
        return c.b(o2Var, this.f14841c, s(z11), r(z11), this, this.f14856t, this.f14847i);
    }

    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7, types: [boolean, int] */
    public final int q(h2 h2Var, u0 u0Var, o2 o2Var) {
        d3 d3Var;
        ?? r32;
        int iH;
        int iC;
        int iK;
        int iC2;
        int i5;
        int i11;
        StaggeredGridLayoutManager staggeredGridLayoutManager = this;
        int i12 = 0;
        int i13 = 1;
        staggeredGridLayoutManager.f14848j.set(0, staggeredGridLayoutManager.f14839a, true);
        u0 u0Var2 = staggeredGridLayoutManager.f14845g;
        int i14 = u0Var2.f15140i ? u0Var.f15136e == 1 ? LayoutNode.NotPlacedPlaceOrder : Integer.MIN_VALUE : u0Var.f15136e == 1 ? u0Var.f15138g + u0Var.f15133b : u0Var.f15137f - u0Var.f15133b;
        int i15 = u0Var.f15136e;
        for (int i16 = 0; i16 < staggeredGridLayoutManager.f14839a; i16++) {
            if (!staggeredGridLayoutManager.f14840b[i16].f14924a.isEmpty()) {
                staggeredGridLayoutManager.L(staggeredGridLayoutManager.f14840b[i16], i15, i14);
            }
        }
        int iG = staggeredGridLayoutManager.f14847i ? staggeredGridLayoutManager.f14841c.g() : staggeredGridLayoutManager.f14841c.k();
        boolean z11 = false;
        while (true) {
            int i17 = u0Var.f15134c;
            int i18 = -1;
            if (i17 < 0 || i17 >= o2Var.b() || (!u0Var2.f15140i && staggeredGridLayoutManager.f14848j.isEmpty())) {
                break;
            }
            View view = h2Var.l(u0Var.f15134c, Long.MAX_VALUE).itemView;
            u0Var.f15134c += u0Var.f15135d;
            z2 z2Var = (z2) view.getLayoutParams();
            int layoutPosition = z2Var.f14880a.getLayoutPosition();
            b3 b3Var = staggeredGridLayoutManager.f14851m;
            int[] iArr = (int[]) b3Var.f14914a;
            int i19 = (iArr == null || layoutPosition >= iArr.length) ? -1 : iArr[layoutPosition];
            if (i19 == -1) {
                if (staggeredGridLayoutManager.D(u0Var.f15136e)) {
                    i5 = staggeredGridLayoutManager.f14839a - i13;
                    i11 = -1;
                } else {
                    i18 = staggeredGridLayoutManager.f14839a;
                    i5 = i12;
                    i11 = i13;
                }
                d3 d3Var2 = null;
                if (u0Var.f15136e == i13) {
                    int iK2 = staggeredGridLayoutManager.f14841c.k();
                    int i21 = LayoutNode.NotPlacedPlaceOrder;
                    while (i5 != i18) {
                        d3 d3Var3 = staggeredGridLayoutManager.f14840b[i5];
                        int i22 = i11;
                        int iF = d3Var3.f(iK2);
                        if (iF < i21) {
                            d3Var2 = d3Var3;
                            i21 = iF;
                        }
                        i5 += i22;
                        i11 = i22;
                    }
                } else {
                    int i23 = i11;
                    int iG2 = staggeredGridLayoutManager.f14841c.g();
                    int i24 = Integer.MIN_VALUE;
                    while (i5 != i18) {
                        d3 d3Var4 = staggeredGridLayoutManager.f14840b[i5];
                        int iH2 = d3Var4.h(iG2);
                        if (iH2 > i24) {
                            d3Var2 = d3Var4;
                            i24 = iH2;
                        }
                        i5 += i23;
                    }
                }
                d3Var = d3Var2;
                b3Var.b(layoutPosition);
                ((int[]) b3Var.f14914a)[layoutPosition] = d3Var.f14928e;
            } else {
                d3Var = staggeredGridLayoutManager.f14840b[i19];
            }
            d3 d3Var5 = d3Var;
            z2Var.f15197e = d3Var5;
            if (u0Var.f15136e == 1) {
                staggeredGridLayoutManager.addView(view);
                r32 = 0;
            } else {
                r32 = 0;
                staggeredGridLayoutManager.addView(view, 0);
            }
            if (staggeredGridLayoutManager.f14843e == 1) {
                staggeredGridLayoutManager.B(view, z1.getChildMeasureSpec(staggeredGridLayoutManager.f14844f, staggeredGridLayoutManager.getWidthMode(), r32, ((ViewGroup.MarginLayoutParams) z2Var).width, r32), z1.getChildMeasureSpec(staggeredGridLayoutManager.getHeight(), staggeredGridLayoutManager.getHeightMode(), staggeredGridLayoutManager.getPaddingBottom() + staggeredGridLayoutManager.getPaddingTop(), ((ViewGroup.MarginLayoutParams) z2Var).height, true));
            } else {
                staggeredGridLayoutManager.B(view, z1.getChildMeasureSpec(staggeredGridLayoutManager.getWidth(), staggeredGridLayoutManager.getWidthMode(), staggeredGridLayoutManager.getPaddingRight() + staggeredGridLayoutManager.getPaddingLeft(), ((ViewGroup.MarginLayoutParams) z2Var).width, true), z1.getChildMeasureSpec(staggeredGridLayoutManager.f14844f, staggeredGridLayoutManager.getHeightMode(), 0, ((ViewGroup.MarginLayoutParams) z2Var).height, false));
            }
            if (u0Var.f15136e == 1) {
                iC = d3Var5.f(iG);
                iH = staggeredGridLayoutManager.f14841c.c(view) + iC;
            } else {
                iH = d3Var5.h(iG);
                iC = iH - staggeredGridLayoutManager.f14841c.c(view);
            }
            if (u0Var.f15136e == 1) {
                d3 d3Var6 = z2Var.f15197e;
                d3Var6.getClass();
                z2 z2Var2 = (z2) view.getLayoutParams();
                z2Var2.f15197e = d3Var6;
                ArrayList arrayList = d3Var6.f14924a;
                arrayList.add(view);
                d3Var6.f14926c = Integer.MIN_VALUE;
                if (arrayList.size() == 1) {
                    d3Var6.f14925b = Integer.MIN_VALUE;
                }
                if (z2Var2.f14880a.isRemoved() || z2Var2.f14880a.isUpdated()) {
                    d3Var6.f14927d = d3Var6.f14929f.f14841c.c(view) + d3Var6.f14927d;
                }
            } else {
                d3 d3Var7 = z2Var.f15197e;
                d3Var7.getClass();
                z2 z2Var3 = (z2) view.getLayoutParams();
                z2Var3.f15197e = d3Var7;
                ArrayList arrayList2 = d3Var7.f14924a;
                arrayList2.add(0, view);
                d3Var7.f14925b = Integer.MIN_VALUE;
                if (arrayList2.size() == 1) {
                    d3Var7.f14926c = Integer.MIN_VALUE;
                }
                if (z2Var3.f14880a.isRemoved() || z2Var3.f14880a.isUpdated()) {
                    d3Var7.f14927d = d3Var7.f14929f.f14841c.c(view) + d3Var7.f14927d;
                }
            }
            if (staggeredGridLayoutManager.isLayoutRTL() && staggeredGridLayoutManager.f14843e == 1) {
                iC2 = staggeredGridLayoutManager.f14842d.g() - (((staggeredGridLayoutManager.f14839a - 1) - d3Var5.f14928e) * staggeredGridLayoutManager.f14844f);
                iK = iC2 - staggeredGridLayoutManager.f14842d.c(view);
            } else {
                iK = staggeredGridLayoutManager.f14842d.k() + (d3Var5.f14928e * staggeredGridLayoutManager.f14844f);
                iC2 = staggeredGridLayoutManager.f14842d.c(view) + iK;
            }
            int i25 = iK;
            int i26 = iC2;
            if (staggeredGridLayoutManager.f14843e == 1) {
                staggeredGridLayoutManager.layoutDecoratedWithMargins(view, i25, iC, i26, iH);
                staggeredGridLayoutManager = this;
            } else {
                staggeredGridLayoutManager.layoutDecoratedWithMargins(view, iC, i25, iH, i26);
            }
            staggeredGridLayoutManager.L(d3Var5, u0Var2.f15136e, i14);
            staggeredGridLayoutManager.F(h2Var, u0Var2);
            if (u0Var2.f15139h && view.hasFocusable()) {
                staggeredGridLayoutManager.f14848j.set(d3Var5.f14928e, false);
            }
            z11 = true;
            i13 = 1;
            i12 = 0;
        }
        if (!z11) {
            staggeredGridLayoutManager.F(h2Var, u0Var2);
        }
        int iK3 = u0Var2.f15136e == -1 ? staggeredGridLayoutManager.f14841c.k() - staggeredGridLayoutManager.y(staggeredGridLayoutManager.f14841c.k()) : staggeredGridLayoutManager.x(staggeredGridLayoutManager.f14841c.g()) - staggeredGridLayoutManager.f14841c.g();
        if (iK3 > 0) {
            return Math.min(u0Var.f15133b, iK3);
        }
        return 0;
    }

    public final View r(boolean z11) {
        int iK = this.f14841c.k();
        int iG = this.f14841c.g();
        View view = null;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            int iE = this.f14841c.e(childAt);
            int iB = this.f14841c.b(childAt);
            if (iB > iK && iE < iG) {
                if (iB <= iG || !z11) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public final View s(boolean z11) {
        int iK = this.f14841c.k();
        int iG = this.f14841c.g();
        int childCount = getChildCount();
        View view = null;
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            int iE = this.f14841c.e(childAt);
            if (this.f14841c.b(childAt) > iK && iE < iG) {
                if (iE >= iK || !z11) {
                    return childAt;
                }
                if (view == null) {
                    view = childAt;
                }
            }
        }
        return view;
    }

    public final int scrollBy(int i5, h2 h2Var, o2 o2Var) {
        if (getChildCount() == 0 || i5 == 0) {
            return 0;
        }
        E(i5, o2Var);
        u0 u0Var = this.f14845g;
        int iQ = q(h2Var, u0Var, o2Var);
        if (u0Var.f15133b >= iQ) {
            i5 = i5 < 0 ? -iQ : iQ;
        }
        this.f14841c.p(-i5);
        this.o = this.f14847i;
        u0Var.f15133b = 0;
        F(h2Var, u0Var);
        return i5;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var) {
        return scrollBy(i5, h2Var, o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void scrollToPosition(int i5) {
        SavedState savedState = this.f14853q;
        if (savedState != null && savedState.f14863a != i5) {
            savedState.f14866d = null;
            savedState.f14865c = 0;
            savedState.f14863a = -1;
            savedState.f14864b = -1;
        }
        this.f14849k = i5;
        this.f14850l = Integer.MIN_VALUE;
        requestLayout();
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var) {
        return scrollBy(i5, h2Var, o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void setMeasuredDimension(Rect rect, int i5, int i11) {
        int iChooseSize;
        int iChooseSize2;
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        if (this.f14843e == 1) {
            iChooseSize2 = z1.chooseSize(i11, rect.height() + paddingBottom, getMinimumHeight());
            iChooseSize = z1.chooseSize(i5, (this.f14844f * this.f14839a) + paddingRight, getMinimumWidth());
        } else {
            iChooseSize = z1.chooseSize(i5, rect.width() + paddingRight, getMinimumWidth());
            iChooseSize2 = z1.chooseSize(i11, (this.f14844f * this.f14839a) + paddingBottom, getMinimumHeight());
        }
        setMeasuredDimension(iChooseSize, iChooseSize2);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5) {
        z0 z0Var = new z0(recyclerView.getContext());
        z0Var.setTargetPosition(i5);
        startSmoothScroll(z0Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean supportsPredictiveItemAnimations() {
        return this.f14853q == null;
    }

    public final void t(h2 h2Var, o2 o2Var, boolean z11) {
        int iG;
        int iX = x(Integer.MIN_VALUE);
        if (iX != Integer.MIN_VALUE && (iG = this.f14841c.g() - iX) > 0) {
            int i5 = iG - (-scrollBy(-iG, h2Var, o2Var));
            if (!z11 || i5 <= 0) {
                return;
            }
            this.f14841c.p(i5);
        }
    }

    public final void u(h2 h2Var, o2 o2Var, boolean z11) {
        int iK;
        int iY = y(LayoutNode.NotPlacedPlaceOrder);
        if (iY != Integer.MAX_VALUE && (iK = iY - this.f14841c.k()) > 0) {
            int iScrollBy = iK - scrollBy(iK, h2Var, o2Var);
            if (!z11 || iScrollBy <= 0) {
                return;
            }
            this.f14841c.p(-iScrollBy);
        }
    }

    public final int v() {
        if (getChildCount() == 0) {
            return 0;
        }
        return getPosition(getChildAt(0));
    }

    public final int w() {
        int childCount = getChildCount();
        if (childCount == 0) {
            return 0;
        }
        return getPosition(getChildAt(childCount - 1));
    }

    public final int x(int i5) {
        int iF = this.f14840b[0].f(i5);
        for (int i11 = 1; i11 < this.f14839a; i11++) {
            int iF2 = this.f14840b[i11].f(i5);
            if (iF2 > iF) {
                iF = iF2;
            }
        }
        return iF;
    }

    public final int y(int i5) {
        int iH = this.f14840b[0].h(i5);
        for (int i11 = 1; i11 < this.f14839a; i11++) {
            int iH2 = this.f14840b[i11].h(i5);
            if (iH2 < iH) {
                iH = iH2;
            }
        }
        return iH;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x007a A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void z(int i5, int i11, int i12) {
        int i13;
        int i14;
        b3 b3Var;
        int[] iArr;
        ArrayList arrayList;
        StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem staggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
        int size;
        int i15;
        int i16;
        int iW = this.f14847i ? w() : v();
        if (i12 != 8) {
            i13 = i5 + i11;
        } else {
            if (i5 >= i11) {
                i13 = i5 + 1;
                i14 = i11;
                b3Var = this.f14851m;
                iArr = (int[]) b3Var.f14914a;
                if (iArr != null && i14 < iArr.length) {
                    arrayList = (ArrayList) b3Var.f14915b;
                    if (arrayList != null) {
                        if (arrayList == null) {
                            staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = null;
                            if (staggeredGridLayoutManager$LazySpanLookup$FullSpanItem != null) {
                                ((ArrayList) b3Var.f14915b).remove(staggeredGridLayoutManager$LazySpanLookup$FullSpanItem);
                            }
                            size = ((ArrayList) b3Var.f14915b).size();
                            i15 = 0;
                            while (true) {
                                if (i15 < size) {
                                    i15 = -1;
                                    break;
                                } else if (((StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem) ((ArrayList) b3Var.f14915b).get(i15)).f14859a >= i14) {
                                    break;
                                } else {
                                    i15++;
                                }
                            }
                            if (i15 == -1) {
                                StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem staggeredGridLayoutManager$LazySpanLookup$FullSpanItem2 = (StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem) ((ArrayList) b3Var.f14915b).get(i15);
                                ((ArrayList) b3Var.f14915b).remove(i15);
                                i16 = staggeredGridLayoutManager$LazySpanLookup$FullSpanItem2.f14859a;
                            } else {
                                i16 = -1;
                            }
                            if (i16 != -1) {
                                int[] iArr2 = (int[]) b3Var.f14914a;
                                Arrays.fill(iArr2, i14, iArr2.length, -1);
                                int length = ((int[]) b3Var.f14914a).length;
                            } else {
                                Arrays.fill((int[]) b3Var.f14914a, i14, Math.min(i16 + 1, ((int[]) b3Var.f14914a).length), -1);
                            }
                        } else {
                            for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
                                staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = (StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem) ((ArrayList) b3Var.f14915b).get(size2);
                                if (staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a == i14) {
                                    break;
                                }
                            }
                            staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = null;
                            if (staggeredGridLayoutManager$LazySpanLookup$FullSpanItem != null) {
                            }
                            size = ((ArrayList) b3Var.f14915b).size();
                            i15 = 0;
                            while (true) {
                                if (i15 < size) {
                                }
                                i15++;
                            }
                            if (i15 == -1) {
                            }
                            if (i16 != -1) {
                            }
                        }
                    }
                }
                if (i12 != 1) {
                    b3Var.c(i5, i11);
                } else if (i12 == 2) {
                    b3Var.d(i5, i11);
                } else if (i12 == 8) {
                    b3Var.d(i5, 1);
                    b3Var.c(i11, 1);
                }
                if (i13 > iW) {
                    return;
                }
                if (i14 <= (this.f14847i ? v() : w())) {
                    requestLayout();
                    return;
                }
                return;
            }
            i13 = i11 + 1;
        }
        i14 = i5;
        b3Var = this.f14851m;
        iArr = (int[]) b3Var.f14914a;
        if (iArr != null) {
            arrayList = (ArrayList) b3Var.f14915b;
            if (arrayList != null) {
            }
        }
        if (i12 != 1) {
        }
        if (i13 > iW) {
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            return new z2((ViewGroup.MarginLayoutParams) layoutParams);
        }
        return new z2(layoutParams);
    }
}
