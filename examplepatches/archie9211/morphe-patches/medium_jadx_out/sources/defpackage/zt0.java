package defpackage;

import android.text.Layout;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zt0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ zt0(long j, float[] fArr, pya pyaVar, oya oyaVar) {
        this.a = 2;
        this.b = j;
        this.c = fArr;
        this.d = pyaVar;
        this.e = oyaVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        long j;
        boolean z;
        float fA;
        float fA2;
        int i = this.a;
        final long j2 = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        Object obj3 = this.d;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                zwa zwaVar = (zwa) obj4;
                rya ryaVar = (rya) obj3;
                long j3 = this.b;
                bs0 bs0Var = (bs0) obj2;
                cq6 cq6Var = (cq6) obj;
                cq6Var.a();
                float f = zwaVar.a;
                float f2 = zwaVar.b;
                g61 g61Var = cq6Var.a;
                ((md5) g61Var.b.b).C(f, f2);
                try {
                    ho2.l(cq6Var, (wp) ryaVar.a, j3, 0L, 0.0f, bs0Var, 0, 890);
                    return c1eVar;
                } finally {
                    ((md5) g61Var.b.b).C(-f, -f2);
                }
            case 1:
                final ArrayList arrayList = (ArrayList) obj3;
                final yt6 yt6Var = (yt6) obj2;
                ((s99) obj).t(new x45() { // from class: gw6
                    @Override // defpackage.x45
                    public final Object invoke(Object obj5) {
                        boolean z2;
                        boolean z3;
                        List list;
                        int i2;
                        of5 of5Var;
                        s99 s99Var = (s99) obj5;
                        ArrayList arrayList2 = arrayList;
                        int size = arrayList2.size();
                        int i3 = 0;
                        while (i3 < size) {
                            lw6 lw6Var = (lw6) arrayList2.get(i3);
                            boolean zW = yt6Var.b.W();
                            boolean z4 = lw6Var.d;
                            if (lw6Var.o == Integer.MIN_VALUE) {
                                e26.a("position() should be called first");
                            }
                            List list2 = lw6Var.c;
                            int size2 = list2.size();
                            int i4 = 0;
                            while (i4 < size2) {
                                t99 t99Var = (t99) list2.get(i4);
                                int i5 = lw6Var.p - (z4 ? t99Var.b : t99Var.a);
                                int i6 = lw6Var.q;
                                int i7 = i3;
                                long j4 = lw6Var.t;
                                ArrayList arrayList3 = arrayList2;
                                int i8 = size;
                                mt6 mt6VarA = lw6Var.j.a(i4, lw6Var.b);
                                if (mt6VarA != null) {
                                    if (zW) {
                                        mt6VarA.r = j4;
                                        z2 = zW;
                                        z3 = z4;
                                        list = list2;
                                        i2 = size2;
                                    } else {
                                        z2 = zW;
                                        z3 = z4;
                                        list = list2;
                                        i2 = size2;
                                        long jD = k46.d(!k46.b(mt6VarA.r, 9223372034707292159L) ? mt6VarA.r : j4, ((k46) mt6VarA.q.getValue()).a);
                                        if ((lw6Var.k(j4) <= i5 && lw6Var.k(jD) <= i5) || (lw6Var.k(j4) >= i6 && lw6Var.k(jD) >= i6)) {
                                            mt6VarA.b();
                                        }
                                        j4 = jD;
                                    }
                                    of5Var = mt6VarA.n;
                                } else {
                                    z2 = zW;
                                    z3 = z4;
                                    list = list2;
                                    i2 = size2;
                                    of5Var = null;
                                }
                                long jD2 = k46.d(j4, j2);
                                if (!z2 && mt6VarA != null) {
                                    mt6VarA.m = jD2;
                                }
                                if (of5Var != null) {
                                    s99.m(s99Var, t99Var, jD2, of5Var);
                                } else {
                                    s99.l(s99Var, t99Var, jD2);
                                }
                                i4++;
                                zW = z2;
                                i3 = i7;
                                arrayList2 = arrayList3;
                                size = i8;
                                z4 = z3;
                                list2 = list;
                                size2 = i2;
                            }
                            i3++;
                        }
                        return c1e.a;
                    }
                });
                ((fw6) obj4).a.u.getValue();
                return c1eVar;
            case 2:
                float[] fArr = (float[]) obj4;
                pya pyaVar = (pya) obj3;
                oya oyaVar = (oya) obj2;
                y19 y19Var = (y19) obj;
                int i2 = y19Var.b;
                wq wqVar = y19Var.a;
                int iE = y19Var.c;
                int iF = i2 > bkd.f(j2) ? y19Var.b : bkd.f(j2);
                if (iE >= bkd.e(j2)) {
                    iE = bkd.e(j2);
                }
                long jQ = lk7.q(y19Var.d(iF), y19Var.d(iE));
                int i3 = pyaVar.a;
                ojd ojdVar = wqVar.d;
                int iF2 = bkd.f(jQ);
                int iE2 = bkd.e(jQ);
                Layout layout = ojdVar.f;
                int length = layout.getText().length();
                if (iF2 < 0) {
                    c26.a("startOffset must be > 0");
                }
                if (iF2 >= length) {
                    c26.a("startOffset must be less than text length");
                }
                if (iE2 <= iF2) {
                    c26.a("endOffset must be greater than startOffset");
                }
                if (iE2 > length) {
                    c26.a("endOffset must be smaller or equal to text length");
                }
                if (fArr.length - i3 < (iE2 - iF2) * 4) {
                    c26.a("array.size - arrayStart must be greater or equal than (endOffset - startOffset) * 4");
                }
                int lineForOffset = layout.getLineForOffset(iF2);
                int lineForOffset2 = layout.getLineForOffset(iE2 - 1);
                jr5 jr5Var = new jr5(ojdVar);
                if (lineForOffset <= lineForOffset2) {
                    while (true) {
                        int lineStart = layout.getLineStart(lineForOffset);
                        int iF3 = ojdVar.f(lineForOffset);
                        int iMax = Math.max(iF2, lineStart);
                        int iMin = Math.min(iE2, iF3);
                        float fG = ojdVar.g(lineForOffset);
                        float fE = ojdVar.e(lineForOffset);
                        j = jQ;
                        int i4 = i3;
                        boolean z2 = false;
                        boolean z3 = layout.getParagraphDirection(lineForOffset) == 1;
                        while (iMax < iMin) {
                            boolean zIsRtlCharAt = layout.isRtlCharAt(iMax);
                            if (!z3 || zIsRtlCharAt) {
                                if (z3 && zIsRtlCharAt) {
                                    z2 = false;
                                    float fA3 = jr5Var.a(iMax, false, false, false);
                                    z = z3;
                                    fA = jr5Var.a(iMax + 1, true, true, false);
                                    fA2 = fA3;
                                } else {
                                    z = z3;
                                    z2 = false;
                                    if (z || !zIsRtlCharAt) {
                                        fA = jr5Var.a(iMax, false, false, false);
                                        fA2 = jr5Var.a(iMax + 1, true, true, false);
                                    } else {
                                        fA2 = jr5Var.a(iMax, false, false, true);
                                        fA = jr5Var.a(iMax + 1, true, true, true);
                                    }
                                }
                                fArr[i4] = fA;
                                fArr[i4 + 1] = fG;
                                fArr[i4 + 2] = fA2;
                                fArr[i4 + 3] = fE;
                                i4 += 4;
                                iMax++;
                                z3 = z;
                            } else {
                                fA = jr5Var.a(iMax, z2, z2, true);
                                z = z3;
                                fA2 = jr5Var.a(iMax + 1, true, true, true);
                            }
                            z2 = false;
                            fArr[i4] = fA;
                            fArr[i4 + 1] = fG;
                            fArr[i4 + 2] = fA2;
                            fArr[i4 + 3] = fE;
                            i4 += 4;
                            iMax++;
                            z3 = z;
                        }
                        if (lineForOffset != lineForOffset2) {
                            lineForOffset++;
                            jQ = j;
                            i3 = i4;
                        }
                    }
                } else {
                    j = jQ;
                }
                int iD = (bkd.d(j) * 4) + pyaVar.a;
                for (int i5 = pyaVar.a; i5 < iD; i5 += 4) {
                    int i6 = i5 + 1;
                    float f3 = fArr[i6];
                    float f4 = oyaVar.a;
                    fArr[i6] = f3 + f4;
                    int i7 = i5 + 3;
                    fArr[i7] = fArr[i7] + f4;
                }
                pyaVar.a = iD;
                oyaVar.a = wqVar.b() + oyaVar.a;
                return c1eVar;
            default:
                long j4 = this.b;
                br brVar = (br) obj2;
                zl3 zl3Var = (zl3) obj;
                float fInvoke = ((mn4) obj4).invoke();
                float fMax = (Math.max(Math.min(1.0f, fInvoke) - 0.4f, 0.0f) * 5.0f) / 3.0f;
                float fU = iq7.u(Math.abs(fInvoke) - 1.0f, 0.0f, 2.0f);
                float fPow = (((0.4f * fMax) - 0.25f) + (fU - (((float) Math.pow(fU, 2.0d)) / 4.0f))) * 0.5f;
                float f5 = fPow * 360.0f;
                float f6 = ((0.8f * fMax) + fPow) * 360.0f;
                float fMin = Math.min(1.0f, fMax);
                l80 l80Var = new l80();
                l80Var.a = f6;
                l80Var.b = fMin;
                float fFloatValue = ((Number) ((upc) obj3).getValue()).floatValue();
                long jK0 = zl3Var.k0();
                m50 m50VarB0 = zl3Var.b0();
                long jB = m50VarB0.B();
                m50VarB0.x().h();
                try {
                    ((md5) m50VarB0.b).y(fPow, jK0);
                    float fZ = (zl3Var.Z(2.5f) / 2.0f) + zl3Var.Z(5.5f);
                    long jS = hk7.s(zl3Var.f());
                    int i8 = (int) (jS >> 32);
                    int i9 = (int) (jS & 4294967295L);
                    zwa zwaVar2 = new zwa(Float.intBitsToFloat(i8) - fZ, Float.intBitsToFloat(i9) - fZ, Float.intBitsToFloat(i8) + fZ, Float.intBitsToFloat(i9) + fZ);
                    ho2.j(zl3Var, j4, f5, f6 - f5, zwaVar2.d(), zwaVar2.c(), fFloatValue, new uuc(zl3Var.Z(2.5f), 0.0f, 0, 0, 26), 768);
                    vo7.r(zl3Var, brVar, zwaVar2, j4, fFloatValue, l80Var);
                    return c1eVar;
                } finally {
                    y30.x(m50VarB0, jB);
                }
        }
    }

    public /* synthetic */ zt0(Object obj, Object obj2, long j, Object obj3, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = j;
        this.e = obj3;
    }
}
