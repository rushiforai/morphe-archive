package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.Rect;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import defpackage.anc;
import defpackage.ay0;
import defpackage.bd7;
import defpackage.cnc;
import defpackage.dya;
import defpackage.eya;
import defpackage.jn;
import defpackage.jq7;
import defpackage.mya;
import defpackage.olb;
import defpackage.rq6;
import defpackage.rxa;
import defpackage.sxa;
import defpackage.txa;
import defpackage.ute;
import defpackage.vw3;
import defpackage.vz6;
import defpackage.y4;
import defpackage.ym0;
import defpackage.yxa;
import defpackage.zmc;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class StaggeredGridLayoutManager extends sxa implements dya {
    public final mya B;
    public final int C;
    public boolean D;
    public boolean E;
    public cnc F;
    public final Rect G;
    public final zmc H;
    public final boolean I;
    public int[] J;
    public final jn K;
    public final int p;
    public final bd7[] q;
    public final vw3 r;
    public final vw3 s;
    public final int t;
    public int u;
    public final rq6 v;
    public boolean w;
    public final BitSet y;
    public boolean x = false;
    public int z = -1;
    public int A = Integer.MIN_VALUE;

    public StaggeredGridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        this.p = -1;
        this.w = false;
        mya myaVar = new mya(9, false);
        this.B = myaVar;
        this.C = 2;
        this.G = new Rect();
        this.H = new zmc(this);
        this.I = true;
        this.K = new jn(14, this);
        rxa rxaVarI = sxa.I(context, attributeSet, i, i2);
        int i3 = rxaVarI.a;
        if (i3 != 0 && i3 != 1) {
            ay0.e("invalid orientation.");
            throw null;
        }
        c(null);
        if (i3 != this.t) {
            this.t = i3;
            vw3 vw3Var = this.r;
            this.r = this.s;
            this.s = vw3Var;
            p0();
        }
        int i4 = rxaVarI.b;
        c(null);
        if (i4 != this.p) {
            myaVar.e();
            p0();
            this.p = i4;
            this.y = new BitSet(this.p);
            this.q = new bd7[this.p];
            for (int i5 = 0; i5 < this.p; i5++) {
                this.q[i5] = new bd7(this, i5);
            }
            p0();
        }
        boolean z = rxaVarI.c;
        c(null);
        cnc cncVar = this.F;
        if (cncVar != null && cncVar.h != z) {
            cncVar.h = z;
        }
        this.w = z;
        p0();
        rq6 rq6Var = new rq6();
        rq6Var.a = true;
        rq6Var.f = 0;
        rq6Var.g = 0;
        this.v = rq6Var;
        this.r = vw3.b(this, this.t);
        this.s = vw3.b(this, 1 - this.t);
    }

    public static int e1(int i, int i2, int i3) {
        int mode;
        return (!(i2 == 0 && i3 == 0) && ((mode = View.MeasureSpec.getMode(i)) == Integer.MIN_VALUE || mode == 1073741824)) ? View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i) - i2) - i3), mode) : i;
    }

    @Override // defpackage.sxa
    public final void B0(RecyclerView recyclerView, int i) {
        vz6 vz6Var = new vz6(recyclerView.getContext());
        vz6Var.a = i;
        C0(vz6Var);
    }

    @Override // defpackage.sxa
    public final boolean D0() {
        return this.F == null;
    }

    public final boolean E0() {
        int iL0;
        if (v() != 0 && this.C != 0 && this.g) {
            if (this.x) {
                iL0 = M0();
                L0();
            } else {
                iL0 = L0();
                M0();
            }
            if (iL0 == 0 && Q0() != null) {
                this.B.e();
                this.f = true;
                p0();
                return true;
            }
        }
        return false;
    }

    public final int F0(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        boolean z = !this.I;
        return jq7.k(eyaVar, this.r, I0(z), H0(z), this, this.I, this.x);
    }

    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [boolean, int] */
    public final int G0(yxa yxaVar, rq6 rq6Var, eya eyaVar) {
        int i;
        int i2;
        bd7[] bd7VarArr;
        BitSet bitSet;
        int i3;
        bd7[] bd7VarArr2;
        bd7 bd7Var;
        ?? r5;
        int iK;
        int iE;
        int iE2;
        int i4;
        BitSet bitSet2;
        int i5;
        int i6;
        yxa yxaVar2 = yxaVar;
        BitSet bitSet3 = this.y;
        int i7 = this.p;
        bitSet3.set(0, i7, true);
        rq6 rq6Var2 = this.v;
        if (rq6Var2.i) {
            i = rq6Var.e;
            i2 = i == 1 ? Integer.MAX_VALUE : Integer.MIN_VALUE;
        } else {
            i = rq6Var.e;
            i2 = i == 1 ? rq6Var.g + rq6Var.b : rq6Var.f - rq6Var.b;
        }
        int i8 = 0;
        while (true) {
            bd7VarArr = this.q;
            if (i8 >= i7) {
                break;
            }
            if (!((ArrayList) bd7VarArr[i8].f).isEmpty()) {
                d1(bd7VarArr[i8], i, i2);
            }
            i8++;
        }
        boolean z = this.x;
        vw3 vw3Var = this.r;
        int i9 = z ? vw3Var.i() : vw3Var.m();
        boolean z2 = false;
        while (true) {
            int i10 = rq6Var.c;
            if (i10 < 0 || i10 >= eyaVar.b() || (!rq6Var2.i && bitSet3.isEmpty())) {
                break;
            }
            View viewD = yxaVar2.d(rq6Var.c);
            rq6Var.c += rq6Var.d;
            anc ancVar = (anc) viewD.getLayoutParams();
            int iB = ancVar.a.b();
            mya myaVar = this.B;
            int[] iArr = (int[]) myaVar.b;
            int i11 = (iArr == null || iB >= iArr.length) ? -1 : iArr[iB];
            if (i11 == -1) {
                if (U0(rq6Var.e)) {
                    i3 = i7;
                    i6 = i7 - 1;
                    i7 = -1;
                    i5 = -1;
                } else {
                    i3 = i7;
                    i5 = 1;
                    i6 = 0;
                }
                bd7 bd7Var2 = null;
                int i12 = i5;
                if (rq6Var.e == 1) {
                    int iM = vw3Var.m();
                    bd7VarArr2 = bd7VarArr;
                    int i13 = i6;
                    int i14 = Integer.MAX_VALUE;
                    while (i13 != i7) {
                        int i15 = i13;
                        bd7 bd7Var3 = bd7VarArr2[i15];
                        BitSet bitSet4 = bitSet3;
                        int i16 = bd7Var3.i(iM);
                        if (i16 < i14) {
                            i14 = i16;
                            bd7Var2 = bd7Var3;
                        }
                        i13 = i15 + i12;
                        bitSet3 = bitSet4;
                    }
                    bitSet = bitSet3;
                } else {
                    bitSet = bitSet3;
                    bd7VarArr2 = bd7VarArr;
                    int i17 = vw3Var.i();
                    int i18 = i6;
                    int i19 = Integer.MIN_VALUE;
                    while (i18 != i7) {
                        bd7 bd7Var4 = bd7VarArr2[i18];
                        int i20 = i7;
                        int iK2 = bd7Var4.k(i17);
                        if (iK2 > i19) {
                            i19 = iK2;
                            bd7Var2 = bd7Var4;
                        }
                        i18 += i12;
                        i7 = i20;
                    }
                }
                bd7Var = bd7Var2;
                myaVar.k(iB);
                ((int[]) myaVar.b)[iB] = bd7Var.e;
            } else {
                bitSet = bitSet3;
                i3 = i7;
                bd7VarArr2 = bd7VarArr;
                bd7Var = bd7VarArr2[i11];
            }
            ancVar.e = bd7Var;
            if (rq6Var.e == 1) {
                r5 = 0;
                b(viewD, -1, false);
            } else {
                r5 = 0;
                b(viewD, 0, false);
            }
            int i21 = this.t;
            if (i21 == 1) {
                S0(viewD, sxa.w(r5, this.u, this.l, r5, ((ViewGroup.MarginLayoutParams) ancVar).width), sxa.w(true, this.o, this.m, D() + G(), ((ViewGroup.MarginLayoutParams) ancVar).height));
            } else {
                S0(viewD, sxa.w(true, this.n, this.l, F() + E(), ((ViewGroup.MarginLayoutParams) ancVar).width), sxa.w(false, this.u, this.m, 0, ((ViewGroup.MarginLayoutParams) ancVar).height));
            }
            if (rq6Var.e == 1) {
                iE = bd7Var.i(i9);
                iK = vw3Var.e(viewD) + iE;
            } else {
                iK = bd7Var.k(i9);
                iE = iK - vw3Var.e(viewD);
            }
            int i22 = rq6Var.e;
            bd7 bd7Var5 = ancVar.e;
            if (i22 == 1) {
                bd7Var5.getClass();
                anc ancVar2 = (anc) viewD.getLayoutParams();
                ancVar2.e = bd7Var5;
                ArrayList arrayList = (ArrayList) bd7Var5.f;
                arrayList.add(viewD);
                bd7Var5.c = Integer.MIN_VALUE;
                if (arrayList.size() == 1) {
                    bd7Var5.b = Integer.MIN_VALUE;
                }
                if (ancVar2.a.g() || ancVar2.a.j()) {
                    bd7Var5.d = ((StaggeredGridLayoutManager) bd7Var5.g).r.e(viewD) + bd7Var5.d;
                }
            } else {
                bd7Var5.getClass();
                anc ancVar3 = (anc) viewD.getLayoutParams();
                ancVar3.e = bd7Var5;
                ArrayList arrayList2 = (ArrayList) bd7Var5.f;
                arrayList2.add(0, viewD);
                bd7Var5.b = Integer.MIN_VALUE;
                if (arrayList2.size() == 1) {
                    bd7Var5.c = Integer.MIN_VALUE;
                }
                if (ancVar3.a.g() || ancVar3.a.j()) {
                    bd7Var5.d = ((StaggeredGridLayoutManager) bd7Var5.g).r.e(viewD) + bd7Var5.d;
                }
            }
            boolean zR0 = R0();
            vw3 vw3Var2 = this.s;
            if (zR0 && i21 == 1) {
                i4 = vw3Var2.i() - (((i3 - 1) - bd7Var.e) * this.u);
                iE2 = i4 - vw3Var2.e(viewD);
            } else {
                int iM2 = (bd7Var.e * this.u) + vw3Var2.m();
                int iE3 = vw3Var2.e(viewD) + iM2;
                iE2 = iM2;
                i4 = iE3;
            }
            z2 = true;
            if (i21 == 1) {
                sxa.O(viewD, iE2, iE, i4, iK);
            } else {
                sxa.O(viewD, iE, iE2, iK, i4);
            }
            d1(bd7Var, rq6Var2.e, i2);
            yxaVar2 = yxaVar;
            W0(yxaVar2, rq6Var2);
            if (rq6Var2.h && viewD.hasFocusable()) {
                bitSet2 = bitSet;
                bitSet2.set(bd7Var.e, false);
            } else {
                bitSet2 = bitSet;
            }
            bitSet3 = bitSet2;
            i7 = i3;
            bd7VarArr = bd7VarArr2;
        }
        if (!z2) {
            W0(yxaVar2, rq6Var2);
        }
        int iM3 = rq6Var2.e == -1 ? vw3Var.m() - O0(vw3Var.m()) : N0(vw3Var.i()) - vw3Var.i();
        if (iM3 > 0) {
            return Math.min(rq6Var.b, iM3);
        }
        return 0;
    }

    public final View H0(boolean z) {
        vw3 vw3Var = this.r;
        int iM = vw3Var.m();
        int i = vw3Var.i();
        View view = null;
        for (int iV = v() - 1; iV >= 0; iV--) {
            View viewU = u(iV);
            int iG = vw3Var.g(viewU);
            int iD = vw3Var.d(viewU);
            if (iD > iM && iG < i) {
                if (iD <= i || !z) {
                    return viewU;
                }
                if (view == null) {
                    view = viewU;
                }
            }
        }
        return view;
    }

    public final View I0(boolean z) {
        vw3 vw3Var = this.r;
        int iM = vw3Var.m();
        int i = vw3Var.i();
        int iV = v();
        View view = null;
        for (int i2 = 0; i2 < iV; i2++) {
            View viewU = u(i2);
            int iG = vw3Var.g(viewU);
            if (vw3Var.d(viewU) > iM && iG < i) {
                if (iG >= iM || !z) {
                    return viewU;
                }
                if (view == null) {
                    view = viewU;
                }
            }
        }
        return view;
    }

    @Override // defpackage.sxa
    public final int J(yxa yxaVar, eya eyaVar) {
        if (this.t == 0) {
            return Math.min(this.p, eyaVar.b());
        }
        return -1;
    }

    public final void J0(yxa yxaVar, eya eyaVar, boolean z) {
        int i;
        int iN0 = N0(Integer.MIN_VALUE);
        if (iN0 != Integer.MIN_VALUE && (i = this.r.i() - iN0) > 0) {
            int i2 = i - (-a1(-i, yxaVar, eyaVar));
            if (!z || i2 <= 0) {
                return;
            }
            this.r.q(i2);
        }
    }

    public final void K0(yxa yxaVar, eya eyaVar, boolean z) {
        int iM;
        int iO0 = O0(Integer.MAX_VALUE);
        if (iO0 != Integer.MAX_VALUE && (iM = iO0 - this.r.m()) > 0) {
            int iA1 = iM - a1(iM, yxaVar, eyaVar);
            if (!z || iA1 <= 0) {
                return;
            }
            this.r.q(-iA1);
        }
    }

    @Override // defpackage.sxa
    public final boolean L() {
        return this.C != 0;
    }

    public final int L0() {
        if (v() == 0) {
            return 0;
        }
        return sxa.H(u(0));
    }

    @Override // defpackage.sxa
    public final boolean M() {
        return this.w;
    }

    public final int M0() {
        int iV = v();
        if (iV == 0) {
            return 0;
        }
        return sxa.H(u(iV - 1));
    }

    public final int N0(int i) {
        int i2 = this.q[0].i(i);
        for (int i3 = 1; i3 < this.p; i3++) {
            int i4 = this.q[i3].i(i);
            if (i4 > i2) {
                i2 = i4;
            }
        }
        return i2;
    }

    public final int O0(int i) {
        int iK = this.q[0].k(i);
        for (int i2 = 1; i2 < this.p; i2++) {
            int iK2 = this.q[i2].k(i);
            if (iK2 < iK) {
                iK = iK2;
            }
        }
        return iK;
    }

    @Override // defpackage.sxa
    public final void P(int i) {
        super.P(i);
        for (int i2 = 0; i2 < this.p; i2++) {
            bd7 bd7Var = this.q[i2];
            int i3 = bd7Var.b;
            if (i3 != Integer.MIN_VALUE) {
                bd7Var.b = i3 + i;
            }
            int i4 = bd7Var.c;
            if (i4 != Integer.MIN_VALUE) {
                bd7Var.c = i4 + i;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void P0(int r11, int r12, int r13) {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.P0(int, int, int):void");
    }

    @Override // defpackage.sxa
    public final void Q(int i) {
        super.Q(i);
        for (int i2 = 0; i2 < this.p; i2++) {
            bd7 bd7Var = this.q[i2];
            int i3 = bd7Var.b;
            if (i3 != Integer.MIN_VALUE) {
                bd7Var.b = i3 + i;
            }
            int i4 = bd7Var.c;
            if (i4 != Integer.MIN_VALUE) {
                bd7Var.c = i4 + i;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00f2 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x002a A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View Q0() {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.Q0():android.view.View");
    }

    @Override // defpackage.sxa
    public final void R() {
        this.B.e();
        for (int i = 0; i < this.p; i++) {
            this.q[i].b();
        }
    }

    public final boolean R0() {
        return this.b.getLayoutDirection() == 1;
    }

    public final void S0(View view, int i, int i2) {
        RecyclerView recyclerView = this.b;
        Rect rect = this.G;
        if (recyclerView == null) {
            rect.set(0, 0, 0, 0);
        } else {
            rect.set(recyclerView.L(view));
        }
        anc ancVar = (anc) view.getLayoutParams();
        int iE1 = e1(i, ((ViewGroup.MarginLayoutParams) ancVar).leftMargin + rect.left, ((ViewGroup.MarginLayoutParams) ancVar).rightMargin + rect.right);
        int iE12 = e1(i2, ((ViewGroup.MarginLayoutParams) ancVar).topMargin + rect.top, ((ViewGroup.MarginLayoutParams) ancVar).bottomMargin + rect.bottom);
        if (y0(view, iE1, iE12, ancVar)) {
            view.measure(iE1, iE12);
        }
    }

    @Override // defpackage.sxa
    public final void T(RecyclerView recyclerView) {
        RecyclerView recyclerView2 = this.b;
        if (recyclerView2 != null) {
            recyclerView2.removeCallbacks(this.K);
        }
        for (int i = 0; i < this.p; i++) {
            this.q[i].b();
        }
        recyclerView.requestLayout();
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x03e8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void T0(defpackage.yxa r18, defpackage.eya r19, boolean r20) {
        /*
            Method dump skipped, instruction units count: 1027
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.T0(yxa, eya, boolean):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x004f  */
    @Override // defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View U(android.view.View r9, int r10, defpackage.yxa r11, defpackage.eya r12) {
        /*
            Method dump skipped, instruction units count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.U(android.view.View, int, yxa, eya):android.view.View");
    }

    public final boolean U0(int i) {
        if (this.t == 0) {
            return (i == -1) != this.x;
        }
        return ((i == -1) == this.x) == R0();
    }

    @Override // defpackage.sxa
    public final void V(AccessibilityEvent accessibilityEvent) {
        super.V(accessibilityEvent);
        if (v() > 0) {
            View viewI0 = I0(false);
            View viewH0 = H0(false);
            if (viewI0 == null || viewH0 == null) {
                return;
            }
            int iH = sxa.H(viewI0);
            int iH2 = sxa.H(viewH0);
            if (iH < iH2) {
                accessibilityEvent.setFromIndex(iH);
                accessibilityEvent.setToIndex(iH2);
            } else {
                accessibilityEvent.setFromIndex(iH2);
                accessibilityEvent.setToIndex(iH);
            }
        }
    }

    public final void V0(int i, eya eyaVar) {
        int iL0;
        int i2;
        if (i > 0) {
            iL0 = M0();
            i2 = 1;
        } else {
            iL0 = L0();
            i2 = -1;
        }
        rq6 rq6Var = this.v;
        rq6Var.a = true;
        c1(iL0, eyaVar);
        b1(i2);
        rq6Var.c = iL0 + rq6Var.d;
        rq6Var.b = Math.abs(i);
    }

    @Override // defpackage.sxa
    public final void W(yxa yxaVar, eya eyaVar, y4 y4Var) {
        super.W(yxaVar, eyaVar, y4Var);
        y4Var.i("androidx.recyclerview.widget.StaggeredGridLayoutManager");
    }

    public final void W0(yxa yxaVar, rq6 rq6Var) {
        if (!rq6Var.a || rq6Var.i) {
            return;
        }
        int i = rq6Var.b;
        int i2 = rq6Var.e;
        if (i == 0) {
            if (i2 == -1) {
                X0(yxaVar, rq6Var.g);
                return;
            } else {
                Y0(yxaVar, rq6Var.f);
                return;
            }
        }
        int i3 = this.p;
        bd7[] bd7VarArr = this.q;
        int i4 = 1;
        if (i2 == -1) {
            int i5 = rq6Var.f;
            int iK = bd7VarArr[0].k(i5);
            while (i4 < i3) {
                int iK2 = bd7VarArr[i4].k(i5);
                if (iK2 > iK) {
                    iK = iK2;
                }
                i4++;
            }
            int i6 = i5 - iK;
            int iMin = rq6Var.g;
            if (i6 >= 0) {
                iMin -= Math.min(i6, rq6Var.b);
            }
            X0(yxaVar, iMin);
            return;
        }
        int i7 = rq6Var.g;
        int i8 = bd7VarArr[0].i(i7);
        while (i4 < i3) {
            int i9 = bd7VarArr[i4].i(i7);
            if (i9 < i8) {
                i8 = i9;
            }
            i4++;
        }
        int i10 = i8 - rq6Var.g;
        int iMin2 = rq6Var.f;
        if (i10 >= 0) {
            iMin2 += Math.min(i10, rq6Var.b);
        }
        Y0(yxaVar, iMin2);
    }

    @Override // defpackage.sxa
    public final void X(yxa yxaVar, eya eyaVar, View view, y4 y4Var) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof anc)) {
            Y(view, y4Var);
            return;
        }
        bd7 bd7Var = ((anc) layoutParams).e;
        if (this.t == 0) {
            y4Var.j(olb.p(false, bd7Var == null ? -1 : bd7Var.e, 1, -1, -1));
        } else {
            y4Var.j(olb.p(false, -1, -1, bd7Var == null ? -1 : bd7Var.e, 1));
        }
    }

    public final void X0(yxa yxaVar, int i) {
        for (int iV = v() - 1; iV >= 0; iV--) {
            View viewU = u(iV);
            vw3 vw3Var = this.r;
            if (vw3Var.g(viewU) < i || vw3Var.p(viewU) < i) {
                return;
            }
            anc ancVar = (anc) viewU.getLayoutParams();
            ancVar.getClass();
            if (((ArrayList) ancVar.e.f).size() == 1) {
                return;
            }
            bd7 bd7Var = ancVar.e;
            ArrayList arrayList = (ArrayList) bd7Var.f;
            int size = arrayList.size();
            View view = (View) arrayList.remove(size - 1);
            anc ancVar2 = (anc) view.getLayoutParams();
            ancVar2.e = null;
            if (ancVar2.a.g() || ancVar2.a.j()) {
                bd7Var.d -= ((StaggeredGridLayoutManager) bd7Var.g).r.e(view);
            }
            if (size == 1) {
                bd7Var.b = Integer.MIN_VALUE;
            }
            bd7Var.c = Integer.MIN_VALUE;
            m0(viewU, yxaVar);
        }
    }

    public final void Y0(yxa yxaVar, int i) {
        while (v() > 0) {
            View viewU = u(0);
            vw3 vw3Var = this.r;
            if (vw3Var.d(viewU) > i || vw3Var.o(viewU) > i) {
                return;
            }
            anc ancVar = (anc) viewU.getLayoutParams();
            ancVar.getClass();
            if (((ArrayList) ancVar.e.f).size() == 1) {
                return;
            }
            bd7 bd7Var = ancVar.e;
            ArrayList arrayList = (ArrayList) bd7Var.f;
            View view = (View) arrayList.remove(0);
            anc ancVar2 = (anc) view.getLayoutParams();
            ancVar2.e = null;
            if (arrayList.size() == 0) {
                bd7Var.c = Integer.MIN_VALUE;
            }
            if (ancVar2.a.g() || ancVar2.a.j()) {
                bd7Var.d -= ((StaggeredGridLayoutManager) bd7Var.g).r.e(view);
            }
            bd7Var.b = Integer.MIN_VALUE;
            m0(viewU, yxaVar);
        }
    }

    @Override // defpackage.sxa
    public final void Z(int i, int i2) {
        P0(i, i2, 1);
    }

    public final void Z0() {
        if (this.t == 1 || !R0()) {
            this.x = this.w;
        } else {
            this.x = !this.w;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000c  */
    @Override // defpackage.dya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.PointF a(int r4) {
        /*
            r3 = this;
            int r0 = r3.v()
            r1 = -1
            r2 = 1
            if (r0 != 0) goto Le
            boolean r4 = r3.x
            if (r4 == 0) goto L1b
        Lc:
            r1 = r2
            goto L1b
        Le:
            int r0 = r3.L0()
            if (r4 >= r0) goto L16
            r4 = r2
            goto L17
        L16:
            r4 = 0
        L17:
            boolean r0 = r3.x
            if (r4 == r0) goto Lc
        L1b:
            android.graphics.PointF r4 = new android.graphics.PointF
            r4.<init>()
            if (r1 != 0) goto L24
            r3 = 0
            return r3
        L24:
            int r3 = r3.t
            r0 = 0
            if (r3 != 0) goto L2f
            float r3 = (float) r1
            r4.x = r3
            r4.y = r0
            return r4
        L2f:
            r4.x = r0
            float r3 = (float) r1
            r4.y = r3
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.StaggeredGridLayoutManager.a(int):android.graphics.PointF");
    }

    @Override // defpackage.sxa
    public final void a0() {
        this.B.e();
        p0();
    }

    public final int a1(int i, yxa yxaVar, eya eyaVar) {
        if (v() == 0 || i == 0) {
            return 0;
        }
        V0(i, eyaVar);
        rq6 rq6Var = this.v;
        int iG0 = G0(yxaVar, rq6Var, eyaVar);
        if (rq6Var.b >= iG0) {
            i = i < 0 ? -iG0 : iG0;
        }
        this.r.q(-i);
        this.D = this.x;
        rq6Var.b = 0;
        W0(yxaVar, rq6Var);
        return i;
    }

    @Override // defpackage.sxa
    public final void b0(int i, int i2) {
        P0(i, i2, 8);
    }

    public final void b1(int i) {
        rq6 rq6Var = this.v;
        rq6Var.e = i;
        rq6Var.d = this.x != (i == -1) ? -1 : 1;
    }

    @Override // defpackage.sxa
    public final void c(String str) {
        if (this.F == null) {
            super.c(str);
        }
    }

    @Override // defpackage.sxa
    public final void c0(int i, int i2) {
        P0(i, i2, 2);
    }

    public final void c1(int i, eya eyaVar) {
        int iN;
        int iN2;
        int i2;
        rq6 rq6Var = this.v;
        boolean z = false;
        rq6Var.b = 0;
        rq6Var.c = i;
        vz6 vz6Var = this.e;
        vw3 vw3Var = this.r;
        if (vz6Var == null || !vz6Var.e || (i2 = eyaVar.a) == -1) {
            iN = 0;
            iN2 = 0;
        } else {
            if (this.x == (i2 < i)) {
                iN = vw3Var.n();
                iN2 = 0;
            } else {
                iN2 = vw3Var.n();
                iN = 0;
            }
        }
        RecyclerView recyclerView = this.b;
        if (recyclerView == null || !recyclerView.h) {
            rq6Var.g = vw3Var.h() + iN;
            rq6Var.f = -iN2;
        } else {
            rq6Var.f = vw3Var.m() - iN2;
            rq6Var.g = vw3Var.i() + iN;
        }
        rq6Var.h = false;
        rq6Var.a = true;
        if (vw3Var.k() == 0 && vw3Var.h() == 0) {
            z = true;
        }
        rq6Var.i = z;
    }

    @Override // defpackage.sxa
    public final boolean d() {
        return this.t == 0;
    }

    @Override // defpackage.sxa
    public final void d0(int i, int i2) {
        P0(i, i2, 4);
    }

    public final void d1(bd7 bd7Var, int i, int i2) {
        int i3 = bd7Var.d;
        int i4 = bd7Var.e;
        BitSet bitSet = this.y;
        if (i != -1) {
            int i5 = bd7Var.c;
            if (i5 == Integer.MIN_VALUE) {
                bd7Var.a();
                i5 = bd7Var.c;
            }
            if (i5 - i3 >= i2) {
                bitSet.set(i4, false);
                return;
            }
            return;
        }
        int i6 = bd7Var.b;
        if (i6 == Integer.MIN_VALUE) {
            View view = (View) ((ArrayList) bd7Var.f).get(0);
            anc ancVar = (anc) view.getLayoutParams();
            bd7Var.b = ((StaggeredGridLayoutManager) bd7Var.g).r.g(view);
            ancVar.getClass();
            i6 = bd7Var.b;
        }
        if (i6 + i3 <= i2) {
            bitSet.set(i4, false);
        }
    }

    @Override // defpackage.sxa
    public final boolean e() {
        return this.t == 1;
    }

    @Override // defpackage.sxa
    public final void e0(yxa yxaVar, eya eyaVar) {
        T0(yxaVar, eyaVar, true);
    }

    @Override // defpackage.sxa
    public final boolean f(txa txaVar) {
        return txaVar instanceof anc;
    }

    @Override // defpackage.sxa
    public final void f0(eya eyaVar) {
        this.z = -1;
        this.A = Integer.MIN_VALUE;
        this.F = null;
        this.H.a();
    }

    @Override // defpackage.sxa
    public final void g0(Parcelable parcelable) {
        if (parcelable instanceof cnc) {
            cnc cncVar = (cnc) parcelable;
            this.F = cncVar;
            if (this.z != -1) {
                cncVar.a = -1;
                cncVar.b = -1;
                cncVar.d = null;
                cncVar.c = 0;
                cncVar.e = 0;
                cncVar.f = null;
                cncVar.g = null;
            }
            p0();
        }
    }

    @Override // defpackage.sxa
    public final void h(int i, int i2, eya eyaVar, ym0 ym0Var) {
        rq6 rq6Var;
        int i3;
        if (this.t != 0) {
            i = i2;
        }
        if (v() == 0 || i == 0) {
            return;
        }
        V0(i, eyaVar);
        int[] iArr = this.J;
        int i4 = this.p;
        if (iArr == null || iArr.length < i4) {
            this.J = new int[i4];
        }
        int i5 = 0;
        int i6 = 0;
        while (true) {
            rq6Var = this.v;
            if (i5 >= i4) {
                break;
            }
            int i7 = rq6Var.d;
            bd7[] bd7VarArr = this.q;
            if (i7 == -1) {
                int i8 = rq6Var.f;
                i3 = i8 - bd7VarArr[i5].k(i8);
            } else {
                i3 = bd7VarArr[i5].i(rq6Var.g) - rq6Var.g;
            }
            if (i3 >= 0) {
                this.J[i6] = i3;
                i6++;
            }
            i5++;
        }
        Arrays.sort(this.J, 0, i6);
        for (int i9 = 0; i9 < i6; i9++) {
            int i10 = rq6Var.c;
            if (i10 < 0 || i10 >= eyaVar.b()) {
                return;
            }
            ym0Var.c(rq6Var.c, this.J[i9]);
            rq6Var.c += rq6Var.d;
        }
    }

    @Override // defpackage.sxa
    public final Parcelable h0() {
        int iK;
        int iM;
        int[] iArr;
        cnc cncVar = this.F;
        if (cncVar != null) {
            cnc cncVar2 = new cnc();
            cncVar2.c = cncVar.c;
            cncVar2.a = cncVar.a;
            cncVar2.b = cncVar.b;
            cncVar2.d = cncVar.d;
            cncVar2.e = cncVar.e;
            cncVar2.f = cncVar.f;
            cncVar2.h = cncVar.h;
            cncVar2.i = cncVar.i;
            cncVar2.j = cncVar.j;
            cncVar2.g = cncVar.g;
            return cncVar2;
        }
        cnc cncVar3 = new cnc();
        cncVar3.h = this.w;
        cncVar3.i = this.D;
        cncVar3.j = this.E;
        mya myaVar = this.B;
        if (myaVar == null || (iArr = (int[]) myaVar.b) == null) {
            cncVar3.e = 0;
        } else {
            cncVar3.f = iArr;
            cncVar3.e = iArr.length;
            cncVar3.g = (ArrayList) myaVar.c;
        }
        if (v() <= 0) {
            cncVar3.a = -1;
            cncVar3.b = -1;
            cncVar3.c = 0;
            return cncVar3;
        }
        cncVar3.a = this.D ? M0() : L0();
        View viewH0 = this.x ? H0(true) : I0(true);
        cncVar3.b = viewH0 != null ? sxa.H(viewH0) : -1;
        int i = this.p;
        cncVar3.c = i;
        cncVar3.d = new int[i];
        for (int i2 = 0; i2 < i; i2++) {
            boolean z = this.D;
            vw3 vw3Var = this.r;
            bd7[] bd7VarArr = this.q;
            if (z) {
                iK = bd7VarArr[i2].i(Integer.MIN_VALUE);
                if (iK != Integer.MIN_VALUE) {
                    iM = vw3Var.i();
                    iK -= iM;
                }
            } else {
                iK = bd7VarArr[i2].k(Integer.MIN_VALUE);
                if (iK != Integer.MIN_VALUE) {
                    iM = vw3Var.m();
                    iK -= iM;
                }
            }
            cncVar3.d[i2] = iK;
        }
        return cncVar3;
    }

    @Override // defpackage.sxa
    public final void i0(int i) {
        if (i == 0) {
            E0();
        }
    }

    @Override // defpackage.sxa
    public final int j(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        boolean z = !this.I;
        return jq7.j(eyaVar, this.r, I0(z), H0(z), this, this.I);
    }

    @Override // defpackage.sxa
    public final int k(eya eyaVar) {
        return F0(eyaVar);
    }

    @Override // defpackage.sxa
    public final int l(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        boolean z = !this.I;
        return jq7.l(eyaVar, this.r, I0(z), H0(z), this, this.I);
    }

    @Override // defpackage.sxa
    public final int m(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        boolean z = !this.I;
        return jq7.j(eyaVar, this.r, I0(z), H0(z), this, this.I);
    }

    @Override // defpackage.sxa
    public final int n(eya eyaVar) {
        return F0(eyaVar);
    }

    @Override // defpackage.sxa
    public final int o(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        boolean z = !this.I;
        return jq7.l(eyaVar, this.r, I0(z), H0(z), this, this.I);
    }

    @Override // defpackage.sxa
    public final int q0(int i, yxa yxaVar, eya eyaVar) {
        return a1(i, yxaVar, eyaVar);
    }

    @Override // defpackage.sxa
    public final txa r() {
        return this.t == 0 ? new anc(-2, -1) : new anc(-1, -2);
    }

    @Override // defpackage.sxa
    public final void r0(int i) {
        cnc cncVar = this.F;
        if (cncVar != null && cncVar.a != i) {
            cncVar.d = null;
            cncVar.c = 0;
            cncVar.a = -1;
            cncVar.b = -1;
        }
        this.z = i;
        this.A = Integer.MIN_VALUE;
        p0();
    }

    @Override // defpackage.sxa
    public final txa s(Context context, AttributeSet attributeSet) {
        return new anc(context, attributeSet);
    }

    @Override // defpackage.sxa
    public final int s0(int i, yxa yxaVar, eya eyaVar) {
        return a1(i, yxaVar, eyaVar);
    }

    @Override // defpackage.sxa
    public final txa t(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof ViewGroup.MarginLayoutParams ? new anc((ViewGroup.MarginLayoutParams) layoutParams) : new anc(layoutParams);
    }

    @Override // defpackage.sxa
    public final void v0(Rect rect, int i, int i2) {
        int iG;
        int iG2;
        int iF = F() + E();
        int iD = D() + G();
        int i3 = this.t;
        int i4 = this.p;
        if (i3 == 1) {
            int iHeight = rect.height() + iD;
            RecyclerView recyclerView = this.b;
            WeakHashMap weakHashMap = ute.a;
            iG2 = sxa.g(i2, iHeight, recyclerView.getMinimumHeight());
            iG = sxa.g(i, (this.u * i4) + iF, this.b.getMinimumWidth());
        } else {
            int iWidth = rect.width() + iF;
            RecyclerView recyclerView2 = this.b;
            WeakHashMap weakHashMap2 = ute.a;
            iG = sxa.g(i, iWidth, recyclerView2.getMinimumWidth());
            iG2 = sxa.g(i2, (this.u * i4) + iD, this.b.getMinimumHeight());
        }
        this.b.setMeasuredDimension(iG, iG2);
    }

    @Override // defpackage.sxa
    public final int x(yxa yxaVar, eya eyaVar) {
        if (this.t == 1) {
            return Math.min(this.p, eyaVar.b());
        }
        return -1;
    }
}
