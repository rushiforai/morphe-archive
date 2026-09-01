package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import com.drew.metadata.avi.AviDirectory;
import defpackage.ay0;
import defpackage.b09;
import defpackage.dya;
import defpackage.eya;
import defpackage.gy6;
import defpackage.jq7;
import defpackage.kxa;
import defpackage.op8;
import defpackage.rxa;
import defpackage.rz6;
import defpackage.sxa;
import defpackage.sz6;
import defpackage.t4;
import defpackage.txa;
import defpackage.tz6;
import defpackage.uz6;
import defpackage.vw3;
import defpackage.vz6;
import defpackage.y4;
import defpackage.ym0;
import defpackage.yxa;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class LinearLayoutManager extends sxa implements dya {
    public final rz6 A;
    public final sz6 B;
    public final int C;
    public final int[] D;
    public int p;
    public tz6 q;
    public vw3 r;
    public boolean s;
    public final boolean t;
    public boolean u;
    public boolean v;
    public boolean w;
    public int x;
    public int y;
    public uz6 z;

    public LinearLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        this.p = 1;
        this.t = false;
        this.u = false;
        this.v = false;
        this.w = true;
        this.x = -1;
        this.y = Integer.MIN_VALUE;
        this.z = null;
        this.A = new rz6();
        this.B = new sz6();
        this.C = 2;
        this.D = new int[2];
        rxa rxaVarI = sxa.I(context, attributeSet, i, i2);
        d1(rxaVarI.a);
        boolean z = rxaVarI.c;
        c(null);
        if (z != this.t) {
            this.t = z;
            p0();
        }
        e1(rxaVarI.d);
    }

    @Override // defpackage.sxa
    public void B0(RecyclerView recyclerView, int i) {
        vz6 vz6Var = new vz6(recyclerView.getContext());
        vz6Var.a = i;
        C0(vz6Var);
    }

    @Override // defpackage.sxa
    public boolean D0() {
        return this.z == null && this.s == this.v;
    }

    public void E0(eya eyaVar, tz6 tz6Var, ym0 ym0Var) {
        int i = tz6Var.d;
        if (i < 0 || i >= eyaVar.b()) {
            return;
        }
        ym0Var.c(i, Math.max(0, tz6Var.g));
    }

    public final int F0(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        J0();
        return jq7.j(eyaVar, this.r, M0(!this.w), L0(!this.w), this, this.w);
    }

    public final int G0(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        J0();
        return jq7.k(eyaVar, this.r, M0(!this.w), L0(!this.w), this, this.w, this.u);
    }

    public final int H0(eya eyaVar) {
        if (v() == 0) {
            return 0;
        }
        J0();
        return jq7.l(eyaVar, this.r, M0(!this.w), L0(!this.w), this, this.w);
    }

    public final int I0(int i) {
        return i != 1 ? i != 2 ? i != 17 ? i != 33 ? i != 66 ? (i == 130 && this.p == 1) ? 1 : Integer.MIN_VALUE : this.p == 0 ? 1 : Integer.MIN_VALUE : this.p == 1 ? -1 : Integer.MIN_VALUE : this.p == 0 ? -1 : Integer.MIN_VALUE : (this.p != 1 && W0()) ? -1 : 1 : (this.p != 1 && W0()) ? 1 : -1;
    }

    public final void J0() {
        if (this.q == null) {
            tz6 tz6Var = new tz6();
            tz6Var.a = true;
            tz6Var.h = 0;
            tz6Var.i = 0;
            tz6Var.k = null;
            this.q = tz6Var;
        }
    }

    public final int K0(yxa yxaVar, tz6 tz6Var, eya eyaVar, boolean z) {
        int i;
        int i2 = tz6Var.c;
        int i3 = tz6Var.g;
        if (i3 != Integer.MIN_VALUE) {
            if (i2 < 0) {
                tz6Var.g = i3 + i2;
            }
            Z0(yxaVar, tz6Var);
        }
        int i4 = tz6Var.c + tz6Var.h;
        while (true) {
            if ((!tz6Var.l && i4 <= 0) || (i = tz6Var.d) < 0 || i >= eyaVar.b()) {
                break;
            }
            sz6 sz6Var = this.B;
            sz6Var.a = 0;
            sz6Var.b = false;
            sz6Var.c = false;
            sz6Var.d = false;
            X0(yxaVar, eyaVar, tz6Var, sz6Var);
            if (!sz6Var.b) {
                int i5 = tz6Var.b;
                int i6 = sz6Var.a;
                tz6Var.b = (tz6Var.f * i6) + i5;
                if (!sz6Var.c || tz6Var.k != null || !eyaVar.g) {
                    tz6Var.c -= i6;
                    i4 -= i6;
                }
                int i7 = tz6Var.g;
                if (i7 != Integer.MIN_VALUE) {
                    int i8 = i7 + i6;
                    tz6Var.g = i8;
                    int i9 = tz6Var.c;
                    if (i9 < 0) {
                        tz6Var.g = i8 + i9;
                    }
                    Z0(yxaVar, tz6Var);
                }
                if (z && sz6Var.d) {
                    break;
                }
            } else {
                break;
            }
        }
        return i2 - tz6Var.c;
    }

    @Override // defpackage.sxa
    public final boolean L() {
        return true;
    }

    public final View L0(boolean z) {
        return this.u ? P0(0, v(), z, true) : P0(v() - 1, -1, z, true);
    }

    @Override // defpackage.sxa
    public final boolean M() {
        return this.t;
    }

    public final View M0(boolean z) {
        return this.u ? P0(v() - 1, -1, z, true) : P0(0, v(), z, true);
    }

    public final int N0() {
        View viewP0 = P0(v() - 1, -1, false, true);
        if (viewP0 == null) {
            return -1;
        }
        return sxa.H(viewP0);
    }

    public final View O0(int i, int i2) {
        int i3;
        int i4;
        J0();
        if (i2 <= i && i2 >= i) {
            return u(i);
        }
        if (this.r.g(u(i)) < this.r.m()) {
            i3 = 16644;
            i4 = 16388;
        } else {
            i3 = 4161;
            i4 = 4097;
        }
        return this.p == 0 ? this.c.l(i, i2, i3, i4) : this.d.l(i, i2, i3, i4);
    }

    public final View P0(int i, int i2, boolean z, boolean z2) {
        J0();
        int i3 = AviDirectory.TAG_DATETIME_ORIGINAL;
        int i4 = z ? 24579 : 320;
        if (!z2) {
            i3 = 0;
        }
        return this.p == 0 ? this.c.l(i, i2, i4, i3) : this.d.l(i, i2, i4, i3);
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.view.View Q0(defpackage.yxa r17, defpackage.eya r18, boolean r19, boolean r20) {
        /*
            r16 = this;
            r0 = r16
            r0.J0()
            int r1 = r0.v()
            r2 = 0
            r3 = 1
            if (r20 == 0) goto L15
            int r1 = r0.v()
            int r1 = r1 - r3
            r4 = -1
            r5 = r4
            goto L18
        L15:
            r4 = r1
            r1 = r2
            r5 = r3
        L18:
            int r6 = r18.b()
            vw3 r7 = r0.r
            int r7 = r7.m()
            vw3 r8 = r0.r
            int r8 = r8.i()
            r9 = 0
            r10 = r9
            r11 = r10
        L2b:
            if (r1 == r4) goto L7c
            android.view.View r12 = r0.u(r1)
            int r13 = defpackage.sxa.H(r12)
            vw3 r14 = r0.r
            int r14 = r14.g(r12)
            vw3 r15 = r0.r
            int r15 = r15.d(r12)
            if (r13 < 0) goto L7a
            if (r13 >= r6) goto L7a
            android.view.ViewGroup$LayoutParams r13 = r12.getLayoutParams()
            txa r13 = (defpackage.txa) r13
            pr0 r13 = r13.a
            boolean r13 = r13.g()
            if (r13 == 0) goto L57
            if (r11 != 0) goto L7a
            r11 = r12
            goto L7a
        L57:
            if (r15 > r7) goto L5d
            if (r14 >= r7) goto L5d
            r13 = r3
            goto L5e
        L5d:
            r13 = r2
        L5e:
            if (r14 < r8) goto L64
            if (r15 <= r8) goto L64
            r14 = r3
            goto L65
        L64:
            r14 = r2
        L65:
            if (r13 != 0) goto L6b
            if (r14 == 0) goto L6a
            goto L6b
        L6a:
            return r12
        L6b:
            if (r19 == 0) goto L73
            if (r14 == 0) goto L70
            goto L75
        L70:
            if (r9 != 0) goto L7a
            goto L79
        L73:
            if (r13 == 0) goto L77
        L75:
            r10 = r12
            goto L7a
        L77:
            if (r9 != 0) goto L7a
        L79:
            r9 = r12
        L7a:
            int r1 = r1 + r5
            goto L2b
        L7c:
            if (r9 == 0) goto L7f
            return r9
        L7f:
            if (r10 == 0) goto L82
            return r10
        L82:
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.LinearLayoutManager.Q0(yxa, eya, boolean, boolean):android.view.View");
    }

    public final int R0(int i, yxa yxaVar, eya eyaVar, boolean z) {
        int i2;
        int i3 = this.r.i() - i;
        if (i3 <= 0) {
            return 0;
        }
        int i4 = -c1(-i3, yxaVar, eyaVar);
        int i5 = i + i4;
        if (!z || (i2 = this.r.i() - i5) <= 0) {
            return i4;
        }
        this.r.q(i2);
        return i2 + i4;
    }

    public final int S0(int i, yxa yxaVar, eya eyaVar, boolean z) {
        int iM;
        int iM2 = i - this.r.m();
        if (iM2 <= 0) {
            return 0;
        }
        int i2 = -c1(iM2, yxaVar, eyaVar);
        int i3 = i + i2;
        if (!z || (iM = i3 - this.r.m()) <= 0) {
            return i2;
        }
        this.r.q(-iM);
        return i2 - iM;
    }

    public final View T0() {
        return u(this.u ? 0 : v() - 1);
    }

    @Override // defpackage.sxa
    public View U(View view, int i, yxa yxaVar, eya eyaVar) {
        int iI0;
        b1();
        if (v() != 0 && (iI0 = I0(i)) != Integer.MIN_VALUE) {
            J0();
            f1(iI0, (int) (this.r.n() * 0.33333334f), false, eyaVar);
            tz6 tz6Var = this.q;
            tz6Var.g = Integer.MIN_VALUE;
            tz6Var.a = false;
            K0(yxaVar, tz6Var, eyaVar, true);
            boolean z = this.u;
            View viewO0 = iI0 == -1 ? z ? O0(v() - 1, -1) : O0(0, v()) : z ? O0(0, v()) : O0(v() - 1, -1);
            View viewU0 = iI0 == -1 ? U0() : T0();
            if (!viewU0.hasFocusable()) {
                return viewO0;
            }
            if (viewO0 != null) {
                return viewU0;
            }
        }
        return null;
    }

    public final View U0() {
        return u(this.u ? v() - 1 : 0);
    }

    @Override // defpackage.sxa
    public final void V(AccessibilityEvent accessibilityEvent) {
        super.V(accessibilityEvent);
        if (v() > 0) {
            View viewP0 = P0(0, v(), false, true);
            accessibilityEvent.setFromIndex(viewP0 == null ? -1 : sxa.H(viewP0));
            accessibilityEvent.setToIndex(N0());
        }
    }

    public int V0(eya eyaVar) {
        if (eyaVar.a != -1) {
            return this.r.n();
        }
        return 0;
    }

    @Override // defpackage.sxa
    public void W(yxa yxaVar, eya eyaVar, y4 y4Var) {
        super.W(yxaVar, eyaVar, y4Var);
        kxa kxaVar = this.b.m;
        if (kxaVar == null || op8.Y(((gy6) kxaVar).c) <= 0) {
            return;
        }
        y4Var.b(t4.k);
    }

    public final boolean W0() {
        return this.b.getLayoutDirection() == 1;
    }

    public void X0(yxa yxaVar, eya eyaVar, tz6 tz6Var, sz6 sz6Var) {
        int i;
        int iF;
        int i2;
        int iF2;
        View viewB = tz6Var.b(yxaVar);
        if (viewB == null) {
            sz6Var.b = true;
            return;
        }
        txa txaVar = (txa) viewB.getLayoutParams();
        List list = tz6Var.k;
        boolean z = this.u;
        int i3 = tz6Var.f;
        if (list == null) {
            if (z == (i3 == -1)) {
                b(viewB, -1, false);
            } else {
                b(viewB, 0, false);
            }
        } else {
            if (z == (i3 == -1)) {
                b(viewB, -1, true);
            } else {
                b(viewB, 0, true);
            }
        }
        txa txaVar2 = (txa) viewB.getLayoutParams();
        Rect rectL = this.b.L(viewB);
        int i4 = rectL.left + rectL.right;
        int i5 = rectL.top + rectL.bottom;
        int iW = sxa.w(d(), this.n, this.l, F() + E() + ((ViewGroup.MarginLayoutParams) txaVar2).leftMargin + ((ViewGroup.MarginLayoutParams) txaVar2).rightMargin + i4, ((ViewGroup.MarginLayoutParams) txaVar2).width);
        int iW2 = sxa.w(e(), this.o, this.m, D() + G() + ((ViewGroup.MarginLayoutParams) txaVar2).topMargin + ((ViewGroup.MarginLayoutParams) txaVar2).bottomMargin + i5, ((ViewGroup.MarginLayoutParams) txaVar2).height);
        if (y0(viewB, iW, iW2, txaVar2)) {
            viewB.measure(iW, iW2);
        }
        sz6Var.a = this.r.e(viewB);
        if (this.p == 1) {
            if (W0()) {
                iF2 = this.n - F();
                iF = iF2 - this.r.f(viewB);
            } else {
                int iE = E();
                iF2 = this.r.f(viewB) + iE;
                iF = iE;
            }
            int i6 = tz6Var.f;
            i2 = tz6Var.b;
            int i7 = sz6Var.a;
            if (i6 == -1) {
                int i8 = i2 - i7;
                i = i2;
                i2 = i8;
            } else {
                i = i7 + i2;
            }
        } else {
            int iG = G();
            int iF3 = this.r.f(viewB) + iG;
            int i9 = tz6Var.f;
            int i10 = tz6Var.b;
            int i11 = sz6Var.a;
            if (i9 == -1) {
                int i12 = i10 - i11;
                iF2 = i10;
                i2 = iG;
                i = iF3;
                iF = i12;
            } else {
                int i13 = i10 + i11;
                i = iF3;
                iF = i10;
                i2 = iG;
                iF2 = i13;
            }
        }
        sxa.O(viewB, iF, i2, iF2, i);
        if (txaVar.a.g() || txaVar.a.j()) {
            sz6Var.c = true;
        }
        sz6Var.d = viewB.hasFocusable();
    }

    public final void Z0(yxa yxaVar, tz6 tz6Var) {
        if (!tz6Var.a || tz6Var.l) {
            return;
        }
        int i = tz6Var.g;
        int i2 = tz6Var.i;
        if (tz6Var.f == -1) {
            int iV = v();
            if (i < 0) {
                return;
            }
            int iH = (this.r.h() - i) + i2;
            if (this.u) {
                for (int i3 = 0; i3 < iV; i3++) {
                    View viewU = u(i3);
                    if (this.r.g(viewU) < iH || this.r.p(viewU) < iH) {
                        a1(yxaVar, 0, i3);
                        return;
                    }
                }
                return;
            }
            int i4 = iV - 1;
            for (int i5 = i4; i5 >= 0; i5--) {
                View viewU2 = u(i5);
                if (this.r.g(viewU2) < iH || this.r.p(viewU2) < iH) {
                    a1(yxaVar, i4, i5);
                    return;
                }
            }
            return;
        }
        if (i < 0) {
            return;
        }
        int i6 = i - i2;
        int iV2 = v();
        if (!this.u) {
            for (int i7 = 0; i7 < iV2; i7++) {
                View viewU3 = u(i7);
                if (this.r.d(viewU3) > i6 || this.r.o(viewU3) > i6) {
                    a1(yxaVar, 0, i7);
                    return;
                }
            }
            return;
        }
        int i8 = iV2 - 1;
        for (int i9 = i8; i9 >= 0; i9--) {
            View viewU4 = u(i9);
            if (this.r.d(viewU4) > i6 || this.r.o(viewU4) > i6) {
                a1(yxaVar, i8, i9);
                return;
            }
        }
    }

    @Override // defpackage.dya
    public final PointF a(int i) {
        if (v() == 0) {
            return null;
        }
        int i2 = (i < sxa.H(u(0))) != this.u ? -1 : 1;
        return this.p == 0 ? new PointF(i2, 0.0f) : new PointF(0.0f, i2);
    }

    public final void a1(yxa yxaVar, int i, int i2) {
        if (i == i2) {
            return;
        }
        if (i2 <= i) {
            while (i > i2) {
                View viewU = u(i);
                n0(i);
                yxaVar.i(viewU);
                i--;
            }
            return;
        }
        for (int i3 = i2 - 1; i3 >= i; i3--) {
            View viewU2 = u(i3);
            n0(i3);
            yxaVar.i(viewU2);
        }
    }

    public final void b1() {
        if (this.p == 1 || !W0()) {
            this.u = this.t;
        } else {
            this.u = !this.t;
        }
    }

    @Override // defpackage.sxa
    public final void c(String str) {
        if (this.z == null) {
            super.c(str);
        }
    }

    public final int c1(int i, yxa yxaVar, eya eyaVar) {
        if (v() != 0 && i != 0) {
            J0();
            this.q.a = true;
            int i2 = i > 0 ? 1 : -1;
            int iAbs = Math.abs(i);
            f1(i2, iAbs, true, eyaVar);
            tz6 tz6Var = this.q;
            int iK0 = K0(yxaVar, tz6Var, eyaVar, false) + tz6Var.g;
            if (iK0 >= 0) {
                if (iAbs > iK0) {
                    i = i2 * iK0;
                }
                this.r.q(-i);
                this.q.j = i;
                return i;
            }
        }
        return 0;
    }

    @Override // defpackage.sxa
    public final boolean d() {
        return this.p == 0;
    }

    public final void d1(int i) {
        if (i != 0 && i != 1) {
            ay0.e(b09.w(i, "invalid orientation:"));
            return;
        }
        c(null);
        if (i != this.p || this.r == null) {
            vw3 vw3VarB = vw3.b(this, i);
            this.r = vw3VarB;
            this.A.a = vw3VarB;
            this.p = i;
            p0();
        }
    }

    @Override // defpackage.sxa
    public final boolean e() {
        return this.p == 1;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0246  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x018c  */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v14 */
    @Override // defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void e0(defpackage.yxa r18, defpackage.eya r19) {
        /*
            Method dump skipped, instruction units count: 1121
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.LinearLayoutManager.e0(yxa, eya):void");
    }

    public void e1(boolean z) {
        c(null);
        if (this.v == z) {
            return;
        }
        this.v = z;
        p0();
    }

    @Override // defpackage.sxa
    public void f0(eya eyaVar) {
        this.z = null;
        this.x = -1;
        this.y = Integer.MIN_VALUE;
        this.A.c();
    }

    public final void f1(int i, int i2, boolean z, eya eyaVar) {
        int i3;
        int iM;
        this.q.l = this.r.k() == 0 && this.r.h() == 0;
        this.q.f = i;
        int[] iArr = this.D;
        iArr[0] = 0;
        iArr[1] = 0;
        int iV0 = V0(eyaVar);
        if (this.q.f == -1) {
            i3 = 0;
        } else {
            i3 = iV0;
            iV0 = 0;
        }
        iArr[0] = iV0;
        iArr[1] = i3;
        int iMax = Math.max(0, iV0);
        int iMax2 = Math.max(0, iArr[1]);
        boolean z2 = i == 1;
        tz6 tz6Var = this.q;
        int i4 = z2 ? iMax2 : iMax;
        tz6Var.h = i4;
        if (!z2) {
            iMax = iMax2;
        }
        tz6Var.i = iMax;
        if (z2) {
            tz6Var.h = this.r.j() + i4;
            View viewT0 = T0();
            tz6 tz6Var2 = this.q;
            tz6Var2.e = this.u ? -1 : 1;
            int iH = sxa.H(viewT0);
            tz6 tz6Var3 = this.q;
            tz6Var2.d = iH + tz6Var3.e;
            tz6Var3.b = this.r.d(viewT0);
            iM = this.r.d(viewT0) - this.r.i();
        } else {
            View viewU0 = U0();
            tz6 tz6Var4 = this.q;
            tz6Var4.h = this.r.m() + tz6Var4.h;
            tz6 tz6Var5 = this.q;
            tz6Var5.e = this.u ? 1 : -1;
            int iH2 = sxa.H(viewU0);
            tz6 tz6Var6 = this.q;
            tz6Var5.d = iH2 + tz6Var6.e;
            tz6Var6.b = this.r.g(viewU0);
            iM = (-this.r.g(viewU0)) + this.r.m();
        }
        tz6 tz6Var7 = this.q;
        tz6Var7.c = i2;
        if (z) {
            tz6Var7.c = i2 - iM;
        }
        tz6Var7.g = iM;
    }

    @Override // defpackage.sxa
    public final void g0(Parcelable parcelable) {
        if (parcelable instanceof uz6) {
            uz6 uz6Var = (uz6) parcelable;
            this.z = uz6Var;
            if (this.x != -1) {
                uz6Var.a = -1;
            }
            p0();
        }
    }

    public final void g1(int i, int i2) {
        this.q.c = this.r.i() - i2;
        tz6 tz6Var = this.q;
        tz6Var.e = this.u ? -1 : 1;
        tz6Var.d = i;
        tz6Var.f = 1;
        tz6Var.b = i2;
        tz6Var.g = Integer.MIN_VALUE;
    }

    @Override // defpackage.sxa
    public final void h(int i, int i2, eya eyaVar, ym0 ym0Var) {
        if (this.p != 0) {
            i = i2;
        }
        if (v() == 0 || i == 0) {
            return;
        }
        J0();
        f1(i > 0 ? 1 : -1, Math.abs(i), true, eyaVar);
        E0(eyaVar, this.q, ym0Var);
    }

    @Override // defpackage.sxa
    public final Parcelable h0() {
        uz6 uz6Var = this.z;
        if (uz6Var != null) {
            uz6 uz6Var2 = new uz6();
            uz6Var2.a = uz6Var.a;
            uz6Var2.b = uz6Var.b;
            uz6Var2.c = uz6Var.c;
            return uz6Var2;
        }
        uz6 uz6Var3 = new uz6();
        if (v() <= 0) {
            uz6Var3.a = -1;
            return uz6Var3;
        }
        J0();
        boolean z = this.s ^ this.u;
        uz6Var3.c = z;
        if (z) {
            View viewT0 = T0();
            uz6Var3.b = this.r.i() - this.r.d(viewT0);
            uz6Var3.a = sxa.H(viewT0);
            return uz6Var3;
        }
        View viewU0 = U0();
        uz6Var3.a = sxa.H(viewU0);
        uz6Var3.b = this.r.g(viewU0) - this.r.m();
        return uz6Var3;
    }

    public final void h1(int i, int i2) {
        this.q.c = i2 - this.r.m();
        tz6 tz6Var = this.q;
        tz6Var.d = i;
        tz6Var.e = this.u ? 1 : -1;
        tz6Var.f = -1;
        tz6Var.b = i2;
        tz6Var.g = Integer.MIN_VALUE;
    }

    @Override // defpackage.sxa
    public final void i(int i, ym0 ym0Var) {
        boolean z;
        int i2;
        uz6 uz6Var = this.z;
        if (uz6Var == null || (i2 = uz6Var.a) < 0) {
            b1();
            z = this.u;
            i2 = this.x;
            if (i2 == -1) {
                i2 = z ? i - 1 : 0;
            }
        } else {
            z = uz6Var.c;
        }
        int i3 = z ? -1 : 1;
        for (int i4 = 0; i4 < this.C && i2 >= 0 && i2 < i; i4++) {
            ym0Var.c(i2, 0);
            i2 += i3;
        }
    }

    @Override // defpackage.sxa
    public final int j(eya eyaVar) {
        return F0(eyaVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0048  */
    @Override // defpackage.sxa
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean j0(int r5, android.os.Bundle r6) {
        /*
            r4 = this;
            boolean r0 = super.j0(r5, r6)
            r1 = 1
            if (r0 == 0) goto L8
            return r1
        L8:
            r0 = 16908343(0x1020037, float:2.3877383E-38)
            r2 = 0
            if (r5 != r0) goto L56
            if (r6 == 0) goto L56
            int r5 = r4.p
            r0 = -1
            if (r5 != r1) goto L2e
            java.lang.String r5 = "android.view.accessibility.action.ARGUMENT_ROW_INT"
            int r5 = r6.getInt(r5, r0)
            if (r5 >= 0) goto L1e
            goto L56
        L1e:
            androidx.recyclerview.widget.RecyclerView r6 = r4.b
            yxa r3 = r6.c
            eya r6 = r6.u0
            int r6 = r4.J(r3, r6)
            int r6 = r6 - r1
            int r5 = java.lang.Math.min(r5, r6)
            goto L46
        L2e:
            java.lang.String r5 = "android.view.accessibility.action.ARGUMENT_COLUMN_INT"
            int r5 = r6.getInt(r5, r0)
            if (r5 >= 0) goto L37
            goto L56
        L37:
            androidx.recyclerview.widget.RecyclerView r6 = r4.b
            yxa r3 = r6.c
            eya r6 = r6.u0
            int r6 = r4.x(r3, r6)
            int r6 = r6 - r1
            int r5 = java.lang.Math.min(r5, r6)
        L46:
            if (r5 < 0) goto L56
            r4.x = r5
            r4.y = r2
            uz6 r5 = r4.z
            if (r5 == 0) goto L52
            r5.a = r0
        L52:
            r4.p0()
            return r1
        L56:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.LinearLayoutManager.j0(int, android.os.Bundle):boolean");
    }

    @Override // defpackage.sxa
    public int k(eya eyaVar) {
        return G0(eyaVar);
    }

    @Override // defpackage.sxa
    public int l(eya eyaVar) {
        return H0(eyaVar);
    }

    @Override // defpackage.sxa
    public int m(eya eyaVar) {
        return F0(eyaVar);
    }

    @Override // defpackage.sxa
    public int n(eya eyaVar) {
        return G0(eyaVar);
    }

    @Override // defpackage.sxa
    public int o(eya eyaVar) {
        return H0(eyaVar);
    }

    @Override // defpackage.sxa
    public final View q(int i) {
        int iV = v();
        if (iV == 0) {
            return null;
        }
        int iH = i - sxa.H(u(0));
        if (iH >= 0 && iH < iV) {
            View viewU = u(iH);
            if (sxa.H(viewU) == i) {
                return viewU;
            }
        }
        return super.q(i);
    }

    @Override // defpackage.sxa
    public int q0(int i, yxa yxaVar, eya eyaVar) {
        if (this.p == 1) {
            return 0;
        }
        return c1(i, yxaVar, eyaVar);
    }

    @Override // defpackage.sxa
    public txa r() {
        return new txa(-2, -2);
    }

    @Override // defpackage.sxa
    public final void r0(int i) {
        this.x = i;
        this.y = Integer.MIN_VALUE;
        uz6 uz6Var = this.z;
        if (uz6Var != null) {
            uz6Var.a = -1;
        }
        p0();
    }

    @Override // defpackage.sxa
    public int s0(int i, yxa yxaVar, eya eyaVar) {
        if (this.p == 0) {
            return 0;
        }
        return c1(i, yxaVar, eyaVar);
    }

    @Override // defpackage.sxa
    public final boolean z0() {
        if (this.m != 1073741824 && this.l != 1073741824) {
            int iV = v();
            for (int i = 0; i < iV; i++) {
                ViewGroup.LayoutParams layoutParams = u(i).getLayoutParams();
                if (layoutParams.width < 0 && layoutParams.height < 0) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // defpackage.sxa
    public final void T(RecyclerView recyclerView) {
    }

    public LinearLayoutManager() {
        this.p = 1;
        this.t = false;
        this.u = false;
        this.v = false;
        this.w = true;
        this.x = -1;
        this.y = Integer.MIN_VALUE;
        this.z = null;
        this.A = new rz6();
        this.B = new sz6();
        this.C = 2;
        this.D = new int[2];
        d1(1);
        c(null);
        if (this.t) {
            this.t = false;
            p0();
        }
    }

    public void Y0(yxa yxaVar, eya eyaVar, rz6 rz6Var, int i) {
    }
}
