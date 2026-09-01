package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import defpackage.ay0;
import defpackage.b09;
import defpackage.ev6;
import defpackage.eya;
import defpackage.gg5;
import defpackage.gy6;
import defpackage.hg5;
import defpackage.ho2;
import defpackage.ik4;
import defpackage.kxa;
import defpackage.olb;
import defpackage.op8;
import defpackage.rz6;
import defpackage.sxa;
import defpackage.sz6;
import defpackage.t4;
import defpackage.txa;
import defpackage.tz6;
import defpackage.ute;
import defpackage.y4;
import defpackage.ym0;
import defpackage.yxa;
import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GridLayoutManager extends LinearLayoutManager {
    public static final Set P = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList(17, 66, 33, Integer.valueOf(NikonType2MakernoteDirectory.TAG_ADAPTER))));
    public boolean E;
    public final int F;
    public int[] G;
    public View[] H;
    public final SparseIntArray I;
    public final SparseIntArray J;
    public final gg5 K;
    public final Rect L;
    public int M;
    public int N;
    public int O;

    public GridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.E = false;
        this.F = -1;
        this.I = new SparseIntArray();
        this.J = new SparseIntArray();
        gg5 gg5Var = new gg5(0);
        this.K = gg5Var;
        this.L = new Rect();
        this.M = -1;
        this.N = -1;
        this.O = -1;
        int i3 = sxa.I(context, attributeSet, i, i2).b;
        if (i3 == this.F) {
            return;
        }
        this.E = true;
        if (i3 < 1) {
            ay0.e(b09.w(i3, "Span count should be at least 1. Provided "));
            throw null;
        }
        this.F = i3;
        gg5Var.F();
        p0();
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final boolean D0() {
        return this.z == null && !this.E;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void E0(eya eyaVar, tz6 tz6Var, ym0 ym0Var) {
        int i = this.F;
        int i2 = i;
        for (int i3 = 0; i3 < i; i3++) {
            int i4 = tz6Var.d;
            if (i4 < 0 || i4 >= eyaVar.b() || i2 <= 0) {
                return;
            }
            ym0Var.c(tz6Var.d, Math.max(0, tz6Var.g));
            this.K.getClass();
            i2--;
            tz6Var.d += tz6Var.e;
        }
    }

    @Override // defpackage.sxa
    public final int J(yxa yxaVar, eya eyaVar) {
        if (this.p == 0) {
            return Math.min(this.F, C());
        }
        if (eyaVar.b() < 1) {
            return 0;
        }
        return p1(eyaVar.b() - 1, yxaVar, eyaVar) + 1;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final View Q0(yxa yxaVar, eya eyaVar, boolean z, boolean z2) {
        int i;
        int iV;
        int iV2 = v();
        int i2 = 1;
        if (z2) {
            iV = v() - 1;
            i = -1;
            i2 = -1;
        } else {
            i = iV2;
            iV = 0;
        }
        int iB = eyaVar.b();
        J0();
        int iM = this.r.m();
        int i3 = this.r.i();
        View view = null;
        View view2 = null;
        while (iV != i) {
            View viewU = u(iV);
            int iH = sxa.H(viewU);
            if (iH >= 0 && iH < iB && q1(iH, yxaVar, eyaVar) == 0) {
                if (((txa) viewU.getLayoutParams()).a.g()) {
                    if (view2 == null) {
                        view2 = viewU;
                    }
                } else {
                    if (this.r.g(viewU) < i3 && this.r.d(viewU) >= iM) {
                        return viewU;
                    }
                    if (view == null) {
                        view = viewU;
                    }
                }
            }
            iV += i2;
        }
        return view != null ? view : view2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:62:0x00e2, code lost:
    
        if (r13 == (r2 > r15)) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x013f, code lost:
    
        if (r16 == null) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0141, code lost:
    
        return r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0142, code lost:
    
        return r17;
     */
    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View U(android.view.View r23, int r24, defpackage.yxa r25, defpackage.eya r26) {
        /*
            Method dump skipped, instruction units count: 323
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.GridLayoutManager.U(android.view.View, int, yxa, eya):android.view.View");
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final void W(yxa yxaVar, eya eyaVar, y4 y4Var) {
        super.W(yxaVar, eyaVar, y4Var);
        y4Var.i("android.widget.GridView");
        kxa kxaVar = this.b.m;
        if (kxaVar == null || op8.Y(((gy6) kxaVar).c) <= 1) {
            return;
        }
        y4Var.b(t4.p);
    }

    @Override // defpackage.sxa
    public final void X(yxa yxaVar, eya eyaVar, View view, y4 y4Var) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof hg5)) {
            Y(view, y4Var);
            return;
        }
        hg5 hg5Var = (hg5) layoutParams;
        int iP1 = p1(hg5Var.a.b(), yxaVar, eyaVar);
        int i = this.p;
        int i2 = hg5Var.e;
        int i3 = hg5Var.f;
        if (i == 0) {
            y4Var.j(olb.p(false, i2, i3, iP1, 1));
        } else {
            y4Var.j(olb.p(false, iP1, 1, i2, i3));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v19 */
    /* JADX WARN: Type inference failed for: r14v20, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r14v23 */
    /* JADX WARN: Type inference failed for: r14v24 */
    /* JADX WARN: Type inference failed for: r14v31 */
    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void X0(yxa yxaVar, eya eyaVar, tz6 tz6Var, sz6 sz6Var) {
        int i;
        int i2;
        int i3;
        int iF;
        int iG;
        int iE;
        int iW;
        int iW2;
        ?? r14;
        View viewB;
        int iL = this.r.l();
        boolean z = iL != 1073741824;
        int iV = v();
        int i4 = this.F;
        int i5 = iV > 0 ? this.G[i4] : 0;
        if (z) {
            t1();
        }
        boolean z2 = tz6Var.e == 1;
        int iR1 = !z2 ? r1(tz6Var.d, yxaVar, eyaVar) + q1(tz6Var.d, yxaVar, eyaVar) : i4;
        int i6 = 0;
        while (i6 < i4) {
            int i7 = tz6Var.d;
            if (i7 < 0 || i7 >= eyaVar.b() || iR1 <= 0) {
                break;
            }
            int i8 = tz6Var.d;
            int iR12 = r1(i8, yxaVar, eyaVar);
            if (iR12 > i4) {
                ay0.e(ho2.H(ev6.B(i8, iR12, "Item at position ", " requires ", " spans but GridLayoutManager has only "), i4, " spans."));
                return;
            }
            iR1 -= iR12;
            if (iR1 < 0 || (viewB = tz6Var.b(yxaVar)) == null) {
                break;
            }
            this.H[i6] = viewB;
            i6++;
        }
        if (i6 == 0) {
            sz6Var.b = true;
            return;
        }
        if (z2) {
            i3 = 1;
            i2 = i6;
            i = 0;
        } else {
            i = i6 - 1;
            i2 = -1;
            i3 = -1;
        }
        int i9 = 0;
        while (i != i2) {
            View view = this.H[i];
            hg5 hg5Var = (hg5) view.getLayoutParams();
            int iR13 = r1(sxa.H(view), yxaVar, eyaVar);
            hg5Var.f = iR13;
            hg5Var.e = i9;
            i9 += iR13;
            i += i3;
        }
        float f = 0.0f;
        int i10 = 0;
        for (int i11 = 0; i11 < i6; i11++) {
            View view2 = this.H[i11];
            if (tz6Var.k != null) {
                r14 = 0;
                r14 = 0;
                if (z2) {
                    b(view2, -1, true);
                } else {
                    b(view2, 0, true);
                }
            } else if (z2) {
                r14 = 0;
                b(view2, -1, false);
            } else {
                r14 = 0;
                b(view2, 0, false);
            }
            RecyclerView recyclerView = this.b;
            Rect rect = this.L;
            if (recyclerView == null) {
                rect.set(r14, r14, r14, r14);
            } else {
                rect.set(recyclerView.L(view2));
            }
            s1(view2, iL, r14);
            int iE2 = this.r.e(view2);
            if (iE2 > i10) {
                i10 = iE2;
            }
            float f2 = (this.r.f(view2) * 1.0f) / ((hg5) view2.getLayoutParams()).f;
            if (f2 > f) {
                f = f2;
            }
        }
        if (z) {
            i1(Math.max(Math.round(f * i4), i5));
            i10 = 0;
            for (int i12 = 0; i12 < i6; i12++) {
                View view3 = this.H[i12];
                s1(view3, 1073741824, true);
                int iE3 = this.r.e(view3);
                if (iE3 > i10) {
                    i10 = iE3;
                }
            }
        }
        for (int i13 = 0; i13 < i6; i13++) {
            View view4 = this.H[i13];
            if (this.r.e(view4) != i10) {
                hg5 hg5Var2 = (hg5) view4.getLayoutParams();
                Rect rect2 = hg5Var2.b;
                int i14 = rect2.top + rect2.bottom + ((ViewGroup.MarginLayoutParams) hg5Var2).topMargin + ((ViewGroup.MarginLayoutParams) hg5Var2).bottomMargin;
                int i15 = rect2.left + rect2.right + ((ViewGroup.MarginLayoutParams) hg5Var2).leftMargin + ((ViewGroup.MarginLayoutParams) hg5Var2).rightMargin;
                int iO1 = o1(hg5Var2.e, hg5Var2.f);
                if (this.p == 1) {
                    iW2 = sxa.w(false, iO1, 1073741824, i15, ((ViewGroup.MarginLayoutParams) hg5Var2).width);
                    iW = View.MeasureSpec.makeMeasureSpec(i10 - i14, 1073741824);
                } else {
                    int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i10 - i15, 1073741824);
                    iW = sxa.w(false, iO1, 1073741824, i14, ((ViewGroup.MarginLayoutParams) hg5Var2).height);
                    iW2 = iMakeMeasureSpec;
                }
                if (A0(view4, iW2, iW, (txa) view4.getLayoutParams())) {
                    view4.measure(iW2, iW);
                }
            }
        }
        sz6Var.a = i10;
        int i16 = this.p;
        int i17 = tz6Var.f;
        int iF2 = tz6Var.b;
        if (i16 != 1) {
            if (i17 == -1) {
                iE = iF2 - i10;
                iG = 0;
                iF = iF2;
            } else {
                iF = iF2 + i10;
                iG = 0;
                iE = iF2;
            }
            iF2 = iG;
        } else if (i17 == -1) {
            iG = iF2 - i10;
            iE = 0;
            iF = 0;
        } else {
            iF = 0;
            iG = iF2;
            iF2 += i10;
            iE = 0;
        }
        int i18 = 0;
        while (true) {
            View[] viewArr = this.H;
            if (i18 >= i6) {
                Arrays.fill(viewArr, (Object) null);
                return;
            }
            View view5 = viewArr[i18];
            hg5 hg5Var3 = (hg5) view5.getLayoutParams();
            if (this.p != 1) {
                iG = G() + this.G[hg5Var3.e];
                iF2 = this.r.f(view5) + iG;
            } else if (W0()) {
                int iE4 = E() + this.G[i4 - hg5Var3.e];
                iF = iE4;
                iE = iE4 - this.r.f(view5);
            } else {
                iE = E() + this.G[hg5Var3.e];
                iF = this.r.f(view5) + iE;
            }
            sxa.O(view5, iE, iG, iF, iF2);
            if (hg5Var3.a.g() || hg5Var3.a.j()) {
                sz6Var.c = true;
            }
            sz6Var.d = view5.hasFocusable() | sz6Var.d;
            i18++;
        }
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void Y0(yxa yxaVar, eya eyaVar, rz6 rz6Var, int i) {
        t1();
        if (eyaVar.b() > 0 && !eyaVar.g) {
            boolean z = i == 1;
            int iQ1 = q1(rz6Var.b, yxaVar, eyaVar);
            if (z) {
                while (iQ1 > 0) {
                    int i2 = rz6Var.b;
                    if (i2 <= 0) {
                        break;
                    }
                    int i3 = i2 - 1;
                    rz6Var.b = i3;
                    iQ1 = q1(i3, yxaVar, eyaVar);
                }
            } else {
                int iB = eyaVar.b() - 1;
                int i4 = rz6Var.b;
                while (i4 < iB) {
                    int i5 = i4 + 1;
                    int iQ12 = q1(i5, yxaVar, eyaVar);
                    if (iQ12 <= iQ1) {
                        break;
                    }
                    i4 = i5;
                    iQ1 = iQ12;
                }
                rz6Var.b = i4;
            }
        }
        j1();
    }

    @Override // defpackage.sxa
    public final void Z(int i, int i2) {
        gg5 gg5Var = this.K;
        gg5Var.F();
        ((SparseIntArray) gg5Var.c).clear();
    }

    @Override // defpackage.sxa
    public final void a0() {
        gg5 gg5Var = this.K;
        gg5Var.F();
        ((SparseIntArray) gg5Var.c).clear();
    }

    @Override // defpackage.sxa
    public final void b0(int i, int i2) {
        gg5 gg5Var = this.K;
        gg5Var.F();
        ((SparseIntArray) gg5Var.c).clear();
    }

    @Override // defpackage.sxa
    public final void c0(int i, int i2) {
        gg5 gg5Var = this.K;
        gg5Var.F();
        ((SparseIntArray) gg5Var.c).clear();
    }

    @Override // defpackage.sxa
    public final void d0(int i, int i2) {
        gg5 gg5Var = this.K;
        gg5Var.F();
        ((SparseIntArray) gg5Var.c).clear();
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final void e0(yxa yxaVar, eya eyaVar) {
        boolean z = eyaVar.g;
        SparseIntArray sparseIntArray = this.J;
        SparseIntArray sparseIntArray2 = this.I;
        if (z) {
            int iV = v();
            for (int i = 0; i < iV; i++) {
                hg5 hg5Var = (hg5) u(i).getLayoutParams();
                int iB = hg5Var.a.b();
                sparseIntArray2.put(iB, hg5Var.f);
                sparseIntArray.put(iB, hg5Var.e);
            }
        }
        super.e0(yxaVar, eyaVar);
        sparseIntArray2.clear();
        sparseIntArray.clear();
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void e1(boolean z) {
        if (z) {
            ik4.k("GridLayoutManager does not support stack from end. Consider using reverse layout");
        } else {
            super.e1(false);
        }
    }

    @Override // defpackage.sxa
    public final boolean f(txa txaVar) {
        return txaVar instanceof hg5;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final void f0(eya eyaVar) {
        View viewQ;
        super.f0(eyaVar);
        this.E = false;
        int i = this.M;
        if (i == -1 || (viewQ = q(i)) == null) {
            return;
        }
        viewQ.sendAccessibilityEvent(67108864);
        this.M = -1;
    }

    public final void i1(int i) {
        int i2;
        int[] iArr = this.G;
        int i3 = this.F;
        if (iArr == null || iArr.length != i3 + 1 || iArr[iArr.length - 1] != i) {
            iArr = new int[i3 + 1];
        }
        int i4 = 0;
        iArr[0] = 0;
        int i5 = i / i3;
        int i6 = i % i3;
        int i7 = 0;
        for (int i8 = 1; i8 <= i3; i8++) {
            i4 += i6;
            if (i4 <= 0 || i3 - i4 >= i6) {
                i2 = i5;
            } else {
                i2 = i5 + 1;
                i4 -= i3;
            }
            i7 += i2;
            iArr[i8] = i7;
        }
        this.G = iArr;
    }

    /* JADX WARN: Removed duplicated region for block: B:122:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x01ad  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x01af A[EDGE_INSN: B:214:0x01af->B:126:0x01af BREAK  A[LOOP:2: B:130:0x01bf->B:139:0x01e8, LOOP_LABEL: LOOP:2: B:130:0x01bf->B:139:0x01e8], EDGE_INSN: B:220:0x01af->B:126:0x01af BREAK  A[LOOP:5: B:152:0x0227->B:163:0x0257, LOOP_LABEL: LOOP:5: B:152:0x0227->B:163:0x0257]] */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0284  */
    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean j0(int r12, android.os.Bundle r13) {
        /*
            Method dump skipped, instruction units count: 749
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.GridLayoutManager.j0(int, android.os.Bundle):boolean");
    }

    public final void j1() {
        View[] viewArr = this.H;
        if (viewArr == null || viewArr.length != this.F) {
            this.H = new View[this.F];
        }
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int k(eya eyaVar) {
        return G0(eyaVar);
    }

    public final int k1(int i) {
        int i2 = this.p;
        RecyclerView recyclerView = this.b;
        return i2 == 0 ? p1(i, recyclerView.c, recyclerView.u0) : q1(i, recyclerView.c, recyclerView.u0);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int l(eya eyaVar) {
        return H0(eyaVar);
    }

    public final int l1(int i) {
        int i2 = this.p;
        RecyclerView recyclerView = this.b;
        return i2 == 1 ? p1(i, recyclerView.c, recyclerView.u0) : q1(i, recyclerView.c, recyclerView.u0);
    }

    public final HashSet m1(int i) {
        return n1(l1(i), i);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int n(eya eyaVar) {
        return G0(eyaVar);
    }

    public final HashSet n1(int i, int i2) {
        HashSet hashSet = new HashSet();
        RecyclerView recyclerView = this.b;
        int iR1 = r1(i2, recyclerView.c, recyclerView.u0);
        for (int i3 = i; i3 < i + iR1; i3++) {
            hashSet.add(Integer.valueOf(i3));
        }
        return hashSet;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int o(eya eyaVar) {
        return H0(eyaVar);
    }

    public final int o1(int i, int i2) {
        if (this.p != 1 || !W0()) {
            int[] iArr = this.G;
            return iArr[i2 + i] - iArr[i];
        }
        int[] iArr2 = this.G;
        int i3 = this.F;
        return iArr2[i3 - i] - iArr2[(i3 - i) - i2];
    }

    public final int p1(int i, yxa yxaVar, eya eyaVar) {
        boolean z = eyaVar.g;
        int i2 = this.F;
        gg5 gg5Var = this.K;
        if (!z) {
            gg5Var.getClass();
            return gg5.D(i, i2);
        }
        int iB = yxaVar.b(i);
        if (iB != -1) {
            gg5Var.getClass();
            return gg5.D(iB, i2);
        }
        Log.w("GridLayoutManager", "Cannot find span size for pre layout position. " + i);
        return 0;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int q0(int i, yxa yxaVar, eya eyaVar) {
        t1();
        j1();
        return super.q0(i, yxaVar, eyaVar);
    }

    public final int q1(int i, yxa yxaVar, eya eyaVar) {
        boolean z = eyaVar.g;
        int i2 = this.F;
        gg5 gg5Var = this.K;
        if (!z) {
            gg5Var.getClass();
            return i % i2;
        }
        int i3 = this.J.get(i, -1);
        if (i3 != -1) {
            return i3;
        }
        int iB = yxaVar.b(i);
        if (iB != -1) {
            gg5Var.getClass();
            return iB % i2;
        }
        Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + i);
        return 0;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final txa r() {
        return this.p == 0 ? new hg5(-2, -1) : new hg5(-1, -2);
    }

    public final int r1(int i, yxa yxaVar, eya eyaVar) {
        boolean z = eyaVar.g;
        gg5 gg5Var = this.K;
        if (!z) {
            gg5Var.getClass();
            return 1;
        }
        int i2 = this.I.get(i, -1);
        if (i2 != -1) {
            return i2;
        }
        if (yxaVar.b(i) != -1) {
            gg5Var.getClass();
            return 1;
        }
        Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + i);
        return 1;
    }

    @Override // defpackage.sxa
    public final txa s(Context context, AttributeSet attributeSet) {
        hg5 hg5Var = new hg5(context, attributeSet);
        hg5Var.e = -1;
        hg5Var.f = 0;
        return hg5Var;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int s0(int i, yxa yxaVar, eya eyaVar) {
        t1();
        j1();
        return super.s0(i, yxaVar, eyaVar);
    }

    public final void s1(View view, int i, boolean z) {
        int iW;
        int iW2;
        hg5 hg5Var = (hg5) view.getLayoutParams();
        Rect rect = hg5Var.b;
        int i2 = rect.top + rect.bottom + ((ViewGroup.MarginLayoutParams) hg5Var).topMargin + ((ViewGroup.MarginLayoutParams) hg5Var).bottomMargin;
        int i3 = rect.left + rect.right + ((ViewGroup.MarginLayoutParams) hg5Var).leftMargin + ((ViewGroup.MarginLayoutParams) hg5Var).rightMargin;
        int iO1 = o1(hg5Var.e, hg5Var.f);
        if (this.p == 1) {
            iW2 = sxa.w(false, iO1, i, i3, ((ViewGroup.MarginLayoutParams) hg5Var).width);
            iW = sxa.w(true, this.r.n(), this.m, i2, ((ViewGroup.MarginLayoutParams) hg5Var).height);
        } else {
            int iW3 = sxa.w(false, iO1, i, i2, ((ViewGroup.MarginLayoutParams) hg5Var).height);
            int iW4 = sxa.w(true, this.r.n(), this.l, i3, ((ViewGroup.MarginLayoutParams) hg5Var).width);
            iW = iW3;
            iW2 = iW4;
        }
        txa txaVar = (txa) view.getLayoutParams();
        if (z ? A0(view, iW2, iW, txaVar) : y0(view, iW2, iW, txaVar)) {
            view.measure(iW2, iW);
        }
    }

    @Override // defpackage.sxa
    public final txa t(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            hg5 hg5Var = new hg5((ViewGroup.MarginLayoutParams) layoutParams);
            hg5Var.e = -1;
            hg5Var.f = 0;
            return hg5Var;
        }
        hg5 hg5Var2 = new hg5(layoutParams);
        hg5Var2.e = -1;
        hg5Var2.f = 0;
        return hg5Var2;
    }

    public final void t1() {
        int iD;
        int iG;
        if (this.p == 1) {
            iD = this.n - F();
            iG = E();
        } else {
            iD = this.o - D();
            iG = G();
        }
        i1(iD - iG);
    }

    @Override // defpackage.sxa
    public final void v0(Rect rect, int i, int i2) {
        int iG;
        int iG2;
        if (this.G == null) {
            super.v0(rect, i, i2);
        }
        int iF = F() + E();
        int iD = D() + G();
        if (this.p == 1) {
            int iHeight = rect.height() + iD;
            RecyclerView recyclerView = this.b;
            WeakHashMap weakHashMap = ute.a;
            iG2 = sxa.g(i2, iHeight, recyclerView.getMinimumHeight());
            int[] iArr = this.G;
            iG = sxa.g(i, iArr[iArr.length - 1] + iF, this.b.getMinimumWidth());
        } else {
            int iWidth = rect.width() + iF;
            RecyclerView recyclerView2 = this.b;
            WeakHashMap weakHashMap2 = ute.a;
            iG = sxa.g(i, iWidth, recyclerView2.getMinimumWidth());
            int[] iArr2 = this.G;
            iG2 = sxa.g(i2, iArr2[iArr2.length - 1] + iD, this.b.getMinimumHeight());
        }
        this.b.setMeasuredDimension(iG, iG2);
    }

    @Override // defpackage.sxa
    public final int x(yxa yxaVar, eya eyaVar) {
        if (this.p == 1) {
            return Math.min(this.F, C());
        }
        if (eyaVar.b() < 1) {
            return 0;
        }
        return p1(eyaVar.b() - 1, yxaVar, eyaVar) + 1;
    }
}
