package defpackage;

import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ s(wt6 wt6Var, int i, Object obj, int i2, int i3) {
        this.a = i3;
        this.c = wt6Var;
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        o28 o28Var = o28.b;
        int i2 = 0;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        int i3 = this.b;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).intValue();
                op8.a((q) obj4, (b55) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 1:
                ((Integer) obj2).getClass();
                k50.f((kc) obj4, (gc) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 2:
                ((Integer) obj2).getClass();
                qx.a((mx) obj4, (List) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 3:
                ((Integer) obj2).intValue();
                pxf.a((r28) obj4, (x45) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 4:
                ou ouVar = (ou) obj4;
                ou ouVar2 = (ou) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    r28 r28VarI = w2g.i(jfc.l(o28Var, 30.0f), ((Number) ouVar.d()).floatValue());
                    float fFloatValue = ((Number) ouVar2.d()).floatValue();
                    if (fFloatValue != 1.0f || fFloatValue != 1.0f) {
                        r28VarI = xz5.Y(r28VarI, fFloatValue, fFloatValue, 0.0f, null, 524284);
                    }
                    r28 r28VarN = bgf.N(flb.a0(r28VarI, xo7.i, bmb.a), "clap_bubble");
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i4 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarN);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    jjd.b(vo7.Q(R.string.claps_bubble_count, new Object[]{Integer.valueOf(iq7.v(i3, 1, 50))}, p65Var), bgf.N(iy0.a.a(o28Var, z46.h), "clap_bubble_text"), uu1.d, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 384, 0, 131064);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 5:
                ((Integer) obj2).getClass();
                ((mz1) obj4).d(obj3, (x12) obj, tr7.y(i3) | 1);
                return c1eVar;
            case 6:
                ((Integer) obj2).intValue();
                k40.c((o10) obj4, (b55) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 7:
                ((Integer) obj2).getClass();
                k40.d((o10[]) obj4, (b55) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 8:
                ((Integer) obj2).getClass();
                gsa.a((sj3) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 9:
                m45 m45Var = (m45) obj4;
                String str = (String) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    r28 r28VarP = hlg.p(jfc.l(o28Var, 48.0f), null, qkb.a(24.0f, 4, 0L, false), false, new vkb(0), m45Var, 12);
                    zk7 zk7VarC2 = dy0.c(z46.h, false);
                    long j2 = p65Var2.T;
                    int i5 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarP);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    qv5.b(vn7.J(i3, 0, p65Var2), str, null, ((zo7) p65Var2.j(kt7.b)).o, p65Var2, 8, 4);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 10:
                ((Integer) obj2).getClass();
                bgf.q((wub) obj4, (hub) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 11:
                ((Integer) obj2).getClass();
                bgf.s((vub) obj4, (hub) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 12:
                ((Integer) obj2).getClass();
                n01.G((kc4) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 13:
                ((Integer) obj2).getClass();
                k40.C((lm4) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 14:
                ((Integer) obj2).getClass();
                g01.i((mx4) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 15:
                ((Integer) obj2).getClass();
                s42.p((ky4) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 16:
                ((Integer) obj2).getClass();
                sgg.p((wk5) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 17:
                ((Integer) obj2).getClass();
                sgg.v((yk5) obj4, (dk5) obj3, o28Var, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 18:
                ((Integer) obj2).getClass();
                ((fr6) obj4).b(i3, obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 19:
                wt6 wt6Var = (wt6) obj4;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    wt6Var.b(i3, obj3, p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 20:
                ((Integer) obj2).getClass();
                ((yu6) obj4).b(i3, obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 21:
                ((Integer) obj2).getClass();
                ((aw6) obj4).b(i3, obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 22:
                ((Integer) obj2).getClass();
                iq7.c((ub0) obj4, (ye7) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 23:
                ((Integer) obj2).getClass();
                ((wy8) obj4).b(i3, obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 24:
                ((Integer) obj2).intValue();
                kk7.b((dr9) obj4, (sh9) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 25:
                ((Integer) obj2).getClass();
                tp7.j((nca) obj4, (r28) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 26:
                ((Integer) obj2).intValue();
                xz5.z((eea) obj4, (x45) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 27:
                ((Integer) obj2).getClass();
                xz5.q((sga) obj4, (x45) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            case 28:
                ((Integer) obj2).getClass();
                xz5.r((rga) obj4, (x45) obj3, (x12) obj, tr7.y(i3 | 1));
                return c1eVar;
            default:
                List list = (List) obj4;
                mz1 mz1Var = (mz1) obj3;
                lvc lvcVar = (lvc) obj;
                f72 f72Var = (f72) obj2;
                lvcVar.getClass();
                int iI0 = lvcVar.i0(16.0f);
                int iI02 = lvcVar.i0(24.0f);
                int iI03 = lvcVar.i0(16.0f);
                int iI04 = lvcVar.i0(100.0f);
                int iH = f72.h(f72Var.a);
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                int i6 = 0;
                for (Object obj5 : list) {
                    int i7 = i6 + 1;
                    if (i6 < 0) {
                        d46.i0();
                        throw null;
                    }
                    arrayList.add(((tk7) bu1.x0(lvcVar.x(new mz1(new nta((kta) obj5, i2), true, -1504944341), b09.w(i6, "percentage")))).s(f72.a(f72Var.a, 0, 0, 0, 0, 14)));
                    iI02 = iI02;
                    i6 = i7;
                    i2 = 0;
                }
                int i8 = iI02;
                Iterator it2 = arrayList.iterator();
                if (!it2.hasNext()) {
                    ywb.n();
                    return null;
                }
                int i9 = ((t99) it2.next()).a;
                while (it2.hasNext()) {
                    int i10 = ((t99) it2.next()).a;
                    if (i9 < i10) {
                        i9 = i10;
                    }
                }
                int i11 = (((iH - iI0) - i8) - i9) - iI04;
                ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
                int i12 = 0;
                for (Object obj6 : list) {
                    int i13 = i12 + 1;
                    if (i12 < 0) {
                        d46.i0();
                        throw null;
                    }
                    arrayList2.add(((tk7) bu1.x0(lvcVar.x(new mz1(new pma(mz1Var, 6, (kta) obj6), true, -1101550485), b09.w(i12, "chip")))).s(f72.a(f72Var.a, 0, i11, 0, 0, 12)));
                    iI0 = iI0;
                    i12 = i13;
                    i9 = i9;
                }
                int i14 = iI0;
                int i15 = i9;
                Iterator it3 = arrayList2.iterator();
                if (!it3.hasNext()) {
                    ywb.n();
                    return null;
                }
                int i16 = ((t99) it3.next()).a;
                while (it3.hasNext()) {
                    int i17 = ((t99) it3.next()).a;
                    if (i16 < i17) {
                        i16 = i17;
                    }
                }
                float fN = lvcVar.N(i16);
                ArrayList arrayList3 = new ArrayList(cu1.k0(list, 10));
                Iterator it4 = list.iterator();
                int i18 = 0;
                while (it4.hasNext()) {
                    Object next = it4.next();
                    int i19 = i18 + 1;
                    if (i18 < 0) {
                        d46.i0();
                        throw null;
                    }
                    kta ktaVar = (kta) next;
                    int i20 = (((iH - i16) - i14) - i8) - i15;
                    arrayList3.add(((tk7) bu1.x0(lvcVar.x(new mz1(new fs7(fN, ktaVar, lvcVar, mz1Var, i20 < iI04 ? iI04 : i20), true, -1655590398), b09.w(i18, "item")))).s(f72Var.a));
                    it4 = it4;
                    iI04 = iI04;
                    i16 = i16;
                    i18 = i19;
                }
                Iterator it5 = arrayList3.iterator();
                int i21 = 0;
                while (it5.hasNext()) {
                    i21 += ((t99) it5.next()).b;
                }
                return lvcVar.q0(iH, ((i3 - 1) * iI03) + i21, fy3.a, new e58(arrayList3, i3, iI03, 1));
        }
    }

    public /* synthetic */ s(Object obj, int i, Object obj2, int i2) {
        this.a = i2;
        this.c = obj;
        this.b = i;
        this.d = obj2;
    }

    public /* synthetic */ s(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = i;
    }
}
