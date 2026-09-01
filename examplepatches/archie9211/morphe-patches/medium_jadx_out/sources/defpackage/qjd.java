package defpackage;

import android.graphics.RectF;
import android.text.Layout;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qjd {
    public final pjd a;
    public final f58 b;
    public final long c;
    public final float d;
    public final float e;
    public final ArrayList f;

    public qjd(pjd pjdVar, f58 f58Var, long j) {
        this.a = pjdVar;
        this.b = f58Var;
        this.c = j;
        ArrayList arrayList = f58Var.h;
        float fD = 0.0f;
        this.d = arrayList.isEmpty() ? 0.0f : ((y19) arrayList.get(0)).a.d.d(0);
        if (!arrayList.isEmpty()) {
            y19 y19Var = (y19) bu1.H0(arrayList);
            fD = y19Var.a.d.d(r4.g - 1) + y19Var.f;
        }
        this.e = fD;
        this.f = f58Var.g;
    }

    public final mcb a(int i) {
        f58 f58Var = this.b;
        f58Var.l(i);
        int length = ((mx) f58Var.a.b).b.length();
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(i == length ? arrayList.size() - 1 : mk7.r(i, arrayList));
        return y19Var.a.d.f.isRtlCharAt(y19Var.d(i)) ? mcb.Rtl : mcb.Ltr;
    }

    public final zwa b(int i) {
        float fI;
        float fI2;
        float fH;
        float fH2;
        f58 f58Var = this.b;
        f58Var.k(i);
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(mk7.r(i, arrayList));
        wq wqVar = y19Var.a;
        int iD = y19Var.d(i);
        CharSequence charSequence = wqVar.e;
        if (iD < 0 || iD >= charSequence.length()) {
            StringBuilder sbC = ev6.C("offset(", iD, ") is out of bounds [0,");
            sbC.append(charSequence.length());
            sbC.append(')');
            c26.a(sbC.toString());
        }
        ojd ojdVar = wqVar.d;
        Layout layout = ojdVar.f;
        int lineForOffset = layout.getLineForOffset(iD);
        float fG = ojdVar.g(lineForOffset);
        float fE = ojdVar.e(lineForOffset);
        boolean z = layout.getParagraphDirection(lineForOffset) == 1;
        boolean zIsRtlCharAt = layout.isRtlCharAt(iD);
        if (!z || zIsRtlCharAt) {
            if (z && zIsRtlCharAt) {
                fH = ojdVar.i(iD, false);
                fH2 = ojdVar.i(iD + 1, true);
            } else if (zIsRtlCharAt) {
                fH = ojdVar.h(iD, false);
                fH2 = ojdVar.h(iD + 1, true);
            } else {
                fI = ojdVar.i(iD, false);
                fI2 = ojdVar.i(iD + 1, true);
            }
            float f = fH;
            fI = fH2;
            fI2 = f;
        } else {
            fI = ojdVar.h(iD, false);
            fI2 = ojdVar.h(iD + 1, true);
        }
        RectF rectF = new RectF(fI, fG, fI2, fE);
        return y19Var.a(new zwa(rectF.left, rectF.top, rectF.right, rectF.bottom));
    }

    public final zwa c(int i) {
        f58 f58Var = this.b;
        f58Var.l(i);
        int length = ((mx) f58Var.a.b).b.length();
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(i == length ? arrayList.size() - 1 : mk7.r(i, arrayList));
        wq wqVar = y19Var.a;
        int iD = y19Var.d(i);
        CharSequence charSequence = wqVar.e;
        ojd ojdVar = wqVar.d;
        if (iD < 0 || iD > charSequence.length()) {
            StringBuilder sbC = ev6.C("offset(", iD, ") is out of bounds [0,");
            sbC.append(charSequence.length());
            sbC.append(']');
            c26.a(sbC.toString());
        }
        float fH = ojdVar.h(iD, false);
        int lineForOffset = ojdVar.f.getLineForOffset(iD);
        return y19Var.a(new zwa(fH, ojdVar.g(lineForOffset), fH, ojdVar.e(lineForOffset)));
    }

    public final boolean d() {
        long j = this.c;
        float f = (int) (j >> 32);
        f58 f58Var = this.b;
        return f < f58Var.d || f58Var.c || ((float) ((int) (j & 4294967295L))) < f58Var.e;
    }

    public final float e(int i) {
        f58 f58Var = this.b;
        f58Var.m(i);
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        int i2 = i - y19Var.d;
        ojd ojdVar = wqVar.d;
        return ojdVar.f.getLineLeft(i2) + (i2 == ojdVar.g + (-1) ? ojdVar.j : 0.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof qjd) {
            qjd qjdVar = (qjd) obj;
            if (g76.L(this.a, qjdVar.a) && this.b == qjdVar.b && s46.a(this.c, qjdVar.c) && this.d == qjdVar.d && this.e == qjdVar.e && this.f.equals(qjdVar.f)) {
                return true;
            }
        }
        return false;
    }

    public final float f(int i) {
        f58 f58Var = this.b;
        f58Var.m(i);
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        int i2 = i - y19Var.d;
        ojd ojdVar = wqVar.d;
        return ojdVar.f.getLineRight(i2) + (i2 == ojdVar.g + (-1) ? ojdVar.k : 0.0f);
    }

    public final int g(int i) {
        f58 f58Var = this.b;
        f58Var.m(i);
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        return wqVar.d.f.getLineStart(i - y19Var.d) + y19Var.b;
    }

    public final mcb h(int i) {
        f58 f58Var = this.b;
        f58Var.l(i);
        int length = ((mx) f58Var.a.b).b.length();
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(i == length ? arrayList.size() - 1 : mk7.r(i, arrayList));
        wq wqVar = y19Var.a;
        int iD = y19Var.d(i);
        ojd ojdVar = wqVar.d;
        return ojdVar.f.getParagraphDirection(ojdVar.f.getLineForOffset(iD)) == 1 ? mcb.Ltr : mcb.Rtl;
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        long j = this.c;
        return this.f.hashCode() + km4.p(this.e, km4.p(this.d, (((int) (j ^ (j >>> 32))) + iHashCode) * 31, 31), 31);
    }

    public final br i(int i, int i2) {
        f58 f58Var = this.b;
        mx mxVar = (mx) f58Var.a.b;
        if (i < 0 || i > i2 || i2 > mxVar.b.length()) {
            StringBuilder sbB = ev6.B(i, i2, "Start(", ") or End(", ") is out of range [0..");
            sbB.append(mxVar.b.length());
            sbB.append("), or start > end!");
            c26.a(sbB.toString());
        }
        if (i == i2) {
            return er.a();
        }
        br brVarA = er.a();
        mk7.u(f58Var.h, lk7.q(i, i2), new e58(brVarA, i, i2, 0));
        return brVarA;
    }

    public final long j(int i) {
        int iX;
        int iU;
        int iU2;
        f58 f58Var = this.b;
        f58Var.l(i);
        int length = ((mx) f58Var.a.b).b.length();
        ArrayList arrayList = f58Var.h;
        y19 y19Var = (y19) arrayList.get(i == length ? arrayList.size() - 1 : mk7.r(i, arrayList));
        wq wqVar = y19Var.a;
        int iD = y19Var.d(i);
        h30 h30VarJ = wqVar.d.j();
        if (h30VarJ.r(h30VarJ.x(iD))) {
            h30VarJ.b(iD);
            iX = iD;
            while (iX != -1 && (!h30VarJ.r(iX) || h30VarJ.n(iX))) {
                iX = h30VarJ.x(iX);
            }
        } else {
            h30VarJ.b(iD);
            iX = h30VarJ.q(iD) ? (!h30VarJ.o(iD) || h30VarJ.m(iD)) ? h30VarJ.x(iD) : iD : h30VarJ.m(iD) ? h30VarJ.x(iD) : -1;
        }
        if (iX == -1) {
            iX = iD;
        }
        if (h30VarJ.n(h30VarJ.u(iD))) {
            h30VarJ.b(iD);
            iU = iD;
            while (iU != -1 && (h30VarJ.r(iU) || !h30VarJ.n(iU))) {
                iU = h30VarJ.u(iU);
            }
        } else {
            h30VarJ.b(iD);
            if (h30VarJ.m(iD)) {
                if (!h30VarJ.o(iD) || h30VarJ.q(iD)) {
                    iU2 = h30VarJ.u(iD);
                    iU = iU2;
                } else {
                    iU = iD;
                }
            } else if (h30VarJ.q(iD)) {
                iU2 = h30VarJ.u(iD);
                iU = iU2;
            } else {
                iU = -1;
            }
        }
        if (iU != -1) {
            iD = iU;
        }
        return y19Var.b(lk7.q(iX, iD), false);
    }

    public final String toString() {
        return "TextLayoutResult(layoutInput=" + this.a + ", multiParagraph=" + this.b + ", size=" + ((Object) s46.b(this.c)) + ", firstBaseline=" + this.d + ", lastBaseline=" + this.e + ", placeholderRects=" + this.f + ')';
    }
}
