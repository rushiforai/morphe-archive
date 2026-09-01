package defpackage;

import android.graphics.Matrix;
import android.graphics.Shader;
import android.text.Layout;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f58 {
    public final iq1 a;
    public final int b;
    public final boolean c;
    public final float d;
    public final float e;
    public final int f;
    public final ArrayList g;
    public final ArrayList h;

    public f58(iq1 iq1Var, long j, int i, int i2) {
        int i3;
        boolean z;
        int i4;
        int iG;
        int i5;
        this.a = iq1Var;
        this.b = i;
        if (f72.j(j) != 0 || f72.i(j) != 0) {
            c26.a("Setting Constraints.minWidth and Constraints.minHeight is not supported, these should be the default zero values instead.");
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = (ArrayList) iq1Var.f;
        int size = arrayList2.size();
        float f = 0.0f;
        int i6 = 0;
        int i7 = 0;
        while (i6 < size) {
            a29 a29Var = (a29) arrayList2.get(i6);
            ar arVar = a29Var.a;
            int iH = f72.h(j);
            if (f72.c(j)) {
                i4 = i6;
                iG = f72.g(j) - ((int) Math.ceil(f));
                if (iG < 0) {
                    iG = 0;
                }
            } else {
                i4 = i6;
                iG = f72.g(j);
            }
            i3 = 0;
            wq wqVar = new wq(arVar, this.b - i7, i2, h72.b(0, iH, 0, iG, 5));
            float fB = wqVar.b() + f;
            ojd ojdVar = wqVar.d;
            int i8 = i7 + ojdVar.g;
            arrayList.add(new y19(wqVar, a29Var.b, a29Var.c, i7, i8, f, fB));
            if (!ojdVar.d) {
                if (i8 == this.b) {
                    i5 = i4;
                    if (i5 != d46.K((ArrayList) this.a.f)) {
                    }
                } else {
                    i5 = i4;
                }
                i6 = i5 + 1;
                i7 = i8;
                f = fB;
            }
            z = true;
            i7 = i8;
            f = fB;
            break;
        }
        i3 = 0;
        z = false;
        this.e = f;
        this.f = i7;
        this.c = z;
        this.h = arrayList;
        this.d = f72.h(j);
        ArrayList arrayList3 = new ArrayList(arrayList.size());
        int size2 = arrayList.size();
        for (int i9 = i3; i9 < size2; i9++) {
            y19 y19Var = (y19) arrayList.get(i9);
            List list = y19Var.a.f;
            ArrayList arrayList4 = new ArrayList(list.size());
            int size3 = list.size();
            for (int i10 = i3; i10 < size3; i10++) {
                zwa zwaVar = (zwa) list.get(i10);
                arrayList4.add(zwaVar != null ? y19Var.a(zwaVar) : null);
            }
            bu1.n0(arrayList4, arrayList3);
        }
        if (arrayList3.size() < ((List) this.a.c).size()) {
            int size4 = ((List) this.a.c).size() - arrayList3.size();
            ArrayList arrayList5 = new ArrayList(size4);
            for (int i11 = i3; i11 < size4; i11++) {
                arrayList5.add(null);
            }
            arrayList3 = bu1.Q0(arrayList5, arrayList3);
        }
        this.g = arrayList3;
    }

    public static void i(f58 f58Var, e61 e61Var, long j, i3c i3cVar, ohd ohdVar, pxf pxfVar, int i) {
        if ((i & 2) != 0) {
            j = uu1.h;
        }
        long j2 = j;
        i3c i3cVar2 = (i & 4) != 0 ? null : i3cVar;
        ohd ohdVar2 = (i & 8) != 0 ? null : ohdVar;
        pxf pxfVar2 = (i & 16) != 0 ? null : pxfVar;
        e61Var.h();
        ArrayList arrayList = f58Var.h;
        int size = arrayList.size();
        int i2 = 0;
        while (i2 < size) {
            y19 y19Var = (y19) arrayList.get(i2);
            e61 e61Var2 = e61Var;
            y19Var.a.f(e61Var2, j2, i3cVar2, ohdVar2, pxfVar2, 3);
            e61Var2.p(0.0f, y19Var.a.b());
            i2++;
            e61Var = e61Var2;
        }
        e61Var.q();
    }

    public static void j(f58 f58Var, e61 e61Var, ez0 ez0Var, float f, i3c i3cVar, ohd ohdVar, pxf pxfVar) {
        e61Var.h();
        ArrayList arrayList = f58Var.h;
        if (arrayList.size() <= 1 || (ez0Var instanceof dkc)) {
            k50.Z(f58Var, e61Var, ez0Var, f, i3cVar, ohdVar, pxfVar);
        } else {
            if (!(ez0Var instanceof g3c)) {
                ygf.a();
                return;
            }
            int size = arrayList.size();
            float fMax = 0.0f;
            float fB = 0.0f;
            for (int i = 0; i < size; i++) {
                y19 y19Var = (y19) arrayList.get(i);
                fB += y19Var.a.b();
                fMax = Math.max(fMax, y19Var.a.d());
            }
            Shader shaderB = ((g3c) ez0Var).b((((long) Float.floatToRawIntBits(fMax)) << 32) | (((long) Float.floatToRawIntBits(fB)) & 4294967295L));
            Matrix matrix = new Matrix();
            shaderB.getLocalMatrix(matrix);
            int size2 = arrayList.size();
            for (int i2 = 0; i2 < size2; i2++) {
                wq wqVar = ((y19) arrayList.get(i2)).a;
                wqVar.g(e61Var, new fz0(shaderB), f, i3cVar, ohdVar, pxfVar);
                e61Var.p(0.0f, wqVar.b());
                matrix.setTranslate(0.0f, -wqVar.b());
                shaderB.setLocalMatrix(matrix);
            }
        }
        e61Var.q();
    }

    public final void a(long j, float[] fArr) {
        k(bkd.f(j));
        l(bkd.e(j));
        pya pyaVar = new pya();
        pyaVar.a = 0;
        mk7.u(this.h, j, new zt0(j, fArr, pyaVar, new oya()));
    }

    public final float b(int i) {
        m(i);
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        return wqVar.d.e(i - y19Var.d) + y19Var.f;
    }

    public final int c(int i, boolean z) {
        int iF;
        m(i);
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        int i2 = i - y19Var.d;
        ojd ojdVar = wqVar.d;
        if (z) {
            Layout layout = ojdVar.f;
            ThreadLocal threadLocal = sjd.a;
            if (layout.getEllipsisCount(i2) <= 0 || ojdVar.b != TextUtils.TruncateAt.END) {
                iq1 iq1VarC = ojdVar.c();
                Layout layout2 = (Layout) iq1VarC.b;
                iF = iq1VarC.H(layout2.getLineEnd(i2), layout2.getLineStart(i2));
            } else {
                iF = layout.getEllipsisStart(i2) + layout.getLineStart(i2);
            }
        } else {
            iF = ojdVar.f(i2);
        }
        return iF + y19Var.b;
    }

    public final int d(int i) {
        int length = ((mx) this.a.b).b.length();
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(i >= length ? arrayList.size() - 1 : i < 0 ? 0 : mk7.r(i, arrayList));
        return y19Var.a.d.f.getLineForOffset(y19Var.d(i)) + y19Var.d;
    }

    public final int e(float f) {
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(mk7.t(arrayList, f));
        int i = y19Var.c - y19Var.b;
        int i2 = y19Var.d;
        if (i == 0) {
            return i2;
        }
        wq wqVar = y19Var.a;
        float f2 = f - y19Var.f;
        ojd ojdVar = wqVar.d;
        return ojdVar.f.getLineForVertical(((int) f2) - ojdVar.h) + i2;
    }

    public final float f(int i) {
        m(i);
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(mk7.s(i, arrayList));
        wq wqVar = y19Var.a;
        return wqVar.d.g(i - y19Var.d) + y19Var.f;
    }

    public final int g(long j) {
        int i = (int) (j & 4294967295L);
        float fIntBitsToFloat = Float.intBitsToFloat(i);
        ArrayList arrayList = this.h;
        y19 y19Var = (y19) arrayList.get(mk7.t(arrayList, fIntBitsToFloat));
        int i2 = y19Var.c;
        int i3 = y19Var.b;
        if (i2 - i3 == 0) {
            return i3;
        }
        wq wqVar = y19Var.a;
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j >> 32));
        float fIntBitsToFloat3 = Float.intBitsToFloat(i) - y19Var.f;
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat3)) & 4294967295L);
        ojd ojdVar = wqVar.d;
        int lineForVertical = ojdVar.f.getLineForVertical(((int) Float.intBitsToFloat((int) (4294967295L & jFloatToRawIntBits))) - ojdVar.h);
        return ojdVar.f.getOffsetForHorizontal(lineForVertical, (ojdVar.b(lineForVertical) * (-1.0f)) + Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32))) + i3;
    }

    public final long h(zwa zwaVar, int i, ywb ywbVar) {
        long jB;
        long j;
        float f = zwaVar.b;
        ArrayList arrayList = this.h;
        int iT = mk7.t(arrayList, f);
        float f2 = ((y19) arrayList.get(iT)).g;
        float f3 = zwaVar.d;
        if (f2 >= f3 || iT == arrayList.size() - 1) {
            y19 y19Var = (y19) arrayList.get(iT);
            return y19Var.b(y19Var.a.c(y19Var.c(zwaVar), i, ywbVar), true);
        }
        int iT2 = mk7.t(arrayList, f3);
        long jB2 = bkd.b;
        while (true) {
            jB = bkd.b;
            if (!bkd.b(jB2, jB) || iT > iT2) {
                break;
            }
            y19 y19Var2 = (y19) arrayList.get(iT);
            jB2 = y19Var2.b(y19Var2.a.c(y19Var2.c(zwaVar), i, ywbVar), true);
            iT++;
        }
        if (bkd.b(jB2, jB)) {
            return jB;
        }
        while (true) {
            j = bkd.b;
            if (!bkd.b(jB, j) || iT > iT2) {
                break;
            }
            y19 y19Var3 = (y19) arrayList.get(iT2);
            jB = y19Var3.b(y19Var3.a.c(y19Var3.c(zwaVar), i, ywbVar), true);
            iT2--;
        }
        return bkd.b(jB, j) ? jB2 : lk7.q((int) (jB2 >> 32), (int) (4294967295L & jB));
    }

    public final void k(int i) {
        mx mxVar = (mx) this.a.b;
        if (i < 0 || i >= mxVar.b.length()) {
            StringBuilder sbC = ev6.C("offset(", i, ") is out of bounds [0, ");
            sbC.append(mxVar.b.length());
            sbC.append(')');
            c26.a(sbC.toString());
        }
    }

    public final void l(int i) {
        mx mxVar = (mx) this.a.b;
        if (i < 0 || i > mxVar.b.length()) {
            StringBuilder sbC = ev6.C("offset(", i, ") is out of bounds [0, ");
            sbC.append(mxVar.b.length());
            sbC.append(']');
            c26.a(sbC.toString());
        }
    }

    public final void m(int i) {
        boolean z = false;
        int i2 = this.f;
        if (i >= 0 && i < i2) {
            z = true;
        }
        if (z) {
            return;
        }
        c26.a("lineIndex(" + i + ") is out of bounds [0, " + i2 + ')');
    }
}
