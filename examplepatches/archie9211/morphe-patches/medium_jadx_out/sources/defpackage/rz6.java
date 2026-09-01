package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rz6 {
    public vw3 a;
    public int b;
    public int c;
    public boolean d;
    public boolean e;

    public rz6() {
        c();
    }

    public final void a() {
        boolean z = this.d;
        vw3 vw3Var = this.a;
        this.c = z ? vw3Var.i() : vw3Var.m();
    }

    public final void b(View view, int i) {
        vw3 vw3Var = this.a;
        int iN = Integer.MIN_VALUE == vw3Var.a ? 0 : vw3Var.n() - vw3Var.a;
        if (iN >= 0) {
            boolean z = this.d;
            vw3 vw3Var2 = this.a;
            if (z) {
                int iD = vw3Var2.d(view);
                vw3 vw3Var3 = this.a;
                this.c = (Integer.MIN_VALUE != vw3Var3.a ? vw3Var3.n() - vw3Var3.a : 0) + iD;
            } else {
                this.c = vw3Var2.g(view);
            }
            this.b = i;
            return;
        }
        this.b = i;
        boolean z2 = this.d;
        vw3 vw3Var4 = this.a;
        if (!z2) {
            int iG = vw3Var4.g(view);
            int iM = iG - this.a.m();
            this.c = iG;
            if (iM > 0) {
                int i2 = (this.a.i() - Math.min(0, (this.a.i() - iN) - this.a.d(view))) - (this.a.e(view) + iG);
                if (i2 < 0) {
                    this.c -= Math.min(iM, -i2);
                    return;
                }
                return;
            }
            return;
        }
        int i3 = (vw3Var4.i() - iN) - this.a.d(view);
        this.c = this.a.i() - i3;
        if (i3 > 0) {
            int iE = this.c - this.a.e(view);
            int iM2 = this.a.m();
            int iMin = iE - (Math.min(this.a.g(view) - iM2, 0) + iM2);
            if (iMin < 0) {
                this.c = Math.min(i3, -iMin) + this.c;
            }
        }
    }

    public final void c() {
        this.b = -1;
        this.c = Integer.MIN_VALUE;
        this.d = false;
        this.e = false;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("AnchorInfo{mPosition=");
        sb.append(this.b);
        sb.append(", mCoordinate=");
        sb.append(this.c);
        sb.append(", mLayoutFromEnd=");
        sb.append(this.d);
        sb.append(", mValid=");
        return ev6.A(sb, this.e, '}');
    }
}
