package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iw6 implements xt6 {
    public final /* synthetic */ pw6 a;
    public final /* synthetic */ hw8 b;
    public final /* synthetic */ nw6 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ jy8 e;
    public final /* synthetic */ sb2 f;
    public final /* synthetic */ lf5 g;

    public iw6(pw6 pw6Var, hw8 hw8Var, nw6 nw6Var, ti6 ti6Var, jy8 jy8Var, sb2 sb2Var, lf5 lf5Var) {
        this.a = pw6Var;
        this.b = hw8Var;
        this.c = nw6Var;
        this.d = ti6Var;
        this.e = jy8Var;
        this.f = sb2Var;
        this.g = lf5Var;
    }

    @Override // defpackage.xt6
    public final al7 a(yt6 yt6Var, long j) {
        hx4 hx4Var;
        float fO;
        float fN;
        float fO2;
        hx4 hx4Var2;
        long j2;
        int iO;
        lvc lvcVar = yt6Var.b;
        jy8 jy8Var = this.e;
        float f = jy8Var.d;
        float f2 = jy8Var.b;
        pw6 pw6Var = this.a;
        pw6Var.v.getValue();
        boolean z = pw6Var.a || lvcVar.W();
        hw8 hw8Var = this.b;
        wgf.g(j, hw8Var);
        nw6 nw6Var = this.c;
        if (nw6Var.d != null && f72.b(nw6Var.b, j) && nw6Var.c == lvcVar.b()) {
            hx4 hx4Var3 = nw6Var.d;
            hx4Var3.getClass();
            hx4Var = hx4Var3;
        } else {
            nw6Var.b = j;
            nw6Var.c = lvcVar.b();
            hx4Var = (hx4) nw6Var.a.invoke(yt6Var, new f72(j));
            nw6Var.d = hx4Var;
        }
        boolean z2 = hw8Var == hw8.Vertical;
        aw6 aw6Var = (aw6) this.d.invoke();
        ip6 layoutDirection = lvcVar.getLayoutDirection();
        int[] iArr = hw6.a;
        int i = iArr[hw8Var.ordinal()];
        if (i == 1) {
            fO = f2;
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            fO = w2g.o(jy8Var, layoutDirection);
        }
        int iI0 = lvcVar.i0(fO);
        ip6 layoutDirection2 = lvcVar.getLayoutDirection();
        int i2 = iArr[hw8Var.ordinal()];
        if (i2 == 1) {
            fN = f;
        } else {
            if (i2 != 2) {
                ygf.a();
                return null;
            }
            fN = w2g.n(jy8Var, layoutDirection2);
        }
        int iI02 = lvcVar.i0(fN);
        ip6 layoutDirection3 = lvcVar.getLayoutDirection();
        int i3 = iArr[hw8Var.ordinal()];
        if (i3 == 1) {
            fO2 = w2g.o(jy8Var, layoutDirection3);
        } else {
            if (i3 != 2) {
                ygf.a();
                return null;
            }
            fO2 = f2;
        }
        int iI03 = lvcVar.i0(fO2);
        int iG = ((z2 ? f72.g(j) : f72.h(j)) - iI0) - iI02;
        if (z2) {
            hx4Var2 = hx4Var;
            j2 = (((long) iI03) << 32) | (((long) iI0) & 4294967295L);
        } else {
            hx4Var2 = hx4Var;
            j2 = (((long) iI0) << 32) | (((long) iI03) & 4294967295L);
        }
        int iI04 = lvcVar.i0(w2g.n(jy8Var, lvcVar.getLayoutDirection()) + w2g.o(jy8Var, lvcVar.getLayoutDirection()));
        int iI05 = lvcVar.i0(f + f2);
        List listL = g01.L(aw6Var, pw6Var.s, pw6Var.k);
        long jA = f72.a(j, h72.g(iI04, j), 0, h72.f(iI05, j), 0, 10);
        int iI06 = lvcVar.i0(0.0f);
        boolean zW = lvcVar.W();
        jw6 jw6Var = pw6Var.b;
        fw6 fw6Var = new fw6(pw6Var, listL, aw6Var, hx4Var2, jA, z2, yt6Var, iG, j2, iI0, iI02, iI06, this.f, z, jw6Var != null ? jw6Var.m : null, this.g);
        i00 i00Var = pw6Var.c;
        int[] iArr2 = (int[]) i00Var.c;
        Object obj = i00Var.g;
        Integer numX0 = k80.x0(0, iArr2);
        int iH = vc2.H(aw6Var, obj, numX0 != null ? numX0.intValue() : 0);
        if (!k80.c0(iH, iArr2)) {
            ((au6) i00Var.h).c(iH);
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                iArr2 = (int[]) ((xi1) i00Var.b).invoke(Integer.valueOf(iH), Integer.valueOf(iArr2.length));
                vn7.T(oicVarA, oicVarG, x45VarE);
                i00Var.c = iArr2;
                ((h49) i00Var.d).h(i00.c(iArr2));
            } catch (Throwable th) {
                vn7.T(oicVarA, oicVarG, x45VarE);
                throw th;
            }
        }
        int[] iArr3 = (int[]) i00Var.e;
        int length = iArr2.length;
        int i4 = fw6Var.s;
        if (length != i4) {
            xp xpVar = fw6Var.r;
            xpVar.A();
            int[] iArr4 = new int[i4];
            for (int i5 = 0; i5 < i4; i5++) {
                if (i5 >= iArr2.length || (iO = iArr2[i5]) == -1) {
                    if (i5 == 0) {
                        iO = 0;
                    } else {
                        iO = f49.O(iArr4, ((long) i5) & 4294967295L) + 1;
                    }
                }
                iArr4[i5] = iO;
                xpVar.C(iO, i5);
            }
            iArr2 = iArr4;
        }
        if (iArr3.length != i4) {
            int[] iArr5 = new int[i4];
            int i6 = 0;
            while (i6 < i4) {
                iArr5[i6] = i6 < iArr3.length ? iArr3[i6] : i6 == 0 ? 0 : iArr5[i6 - 1];
                i6++;
            }
            iArr3 = iArr5;
        }
        jw6 jw6VarP = f49.P(fw6Var, Math.round((zW || !pw6Var.a) ? pw6Var.o : ((Number) ((xw) pw6Var.w.c).b.getValue()).floatValue()), iArr2, iArr3, true);
        pw6Var.f(jw6VarP, lvcVar.W(), false);
        return jw6VarP;
    }
}
