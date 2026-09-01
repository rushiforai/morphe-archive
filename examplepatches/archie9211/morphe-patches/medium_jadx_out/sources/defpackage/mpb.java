package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mpb implements b55 {
    public final /* synthetic */ int a;

    public /* synthetic */ mpb(int i) {
        this.a = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ey eyVar;
        Object objA;
        switch (this.a) {
            case 0:
                bkd bkdVar = (bkd) obj2;
                return d46.t(Integer.valueOf((int) (bkdVar.a >> 32)), Integer.valueOf((int) (4294967295L & bkdVar.a)));
            case 1:
                lpb lpbVar = (lpb) obj;
                i3c i3cVar = (i3c) obj2;
                return d46.t(qpb.a(new uu1(i3cVar.a), qpb.r, lpbVar), qpb.a(new ip8(i3cVar.b), qpb.z, lpbVar), Float.valueOf(i3cVar.c));
            case 2:
                return Integer.valueOf(((jgd) obj2).a);
            case 3:
                return Integer.valueOf(((qhd) obj2).a);
            case 4:
                return Integer.valueOf(((tt5) obj2).a);
            case 5:
                return Integer.valueOf(((zz4) obj2).a);
            case 6:
                return Integer.valueOf(((a05) obj2).a);
            case 7:
                qkd qkdVar = (qkd) obj2;
                return qkdVar == null ? false : qkd.a(qkdVar.a, qkd.c) ? Boolean.FALSE : d46.t(Float.valueOf(qkd.c(qkdVar.a)), qpb.a(new rkd(qkd.b(qkdVar.a)), qpb.y, (lpb) obj));
            case 8:
                b07 b07Var = (b07) obj2;
                return d46.t(b07Var.a, qpb.a(b07Var.b, qpb.j, (lpb) obj));
            case 9:
                long j = ((rkd) obj2).a;
                if (rkd.a(j, 8589934592L)) {
                    return 0;
                }
                if (rkd.a(j, 4294967296L)) {
                    return 1;
                }
                return Boolean.FALSE;
            case 10:
                ip8 ip8Var = (ip8) obj2;
                return ip8Var == null ? false : ip8.b(ip8Var.a, 9205357640488583168L) ? Boolean.FALSE : d46.t(Float.valueOf(Float.intBitsToFloat((int) (ip8Var.a >> 32))), Float.valueOf(Float.intBitsToFloat((int) (4294967295L & ip8Var.a))));
            case 11:
                lpb lpbVar2 = (lpb) obj;
                lx lxVar = (lx) obj2;
                Object obj3 = lxVar.a;
                if (obj3 instanceof s29) {
                    eyVar = ey.Paragraph;
                } else if (obj3 instanceof skc) {
                    eyVar = ey.Span;
                } else if (obj3 instanceof wre) {
                    eyVar = ey.VerbatimTts;
                } else if (obj3 instanceof g7e) {
                    eyVar = ey.Url;
                } else if (obj3 instanceof c07) {
                    eyVar = ey.Link;
                } else if (obj3 instanceof b07) {
                    eyVar = ey.Clickable;
                } else {
                    if (!(obj3 instanceof fuc)) {
                        rd6.b();
                        return null;
                    }
                    eyVar = ey.String;
                }
                switch (ppb.a[eyVar.ordinal()]) {
                    case 1:
                        obj3.getClass();
                        objA = qpb.a((s29) obj3, qpb.h, lpbVar2);
                        break;
                    case 2:
                        obj3.getClass();
                        objA = qpb.a((skc) obj3, qpb.i, lpbVar2);
                        break;
                    case 3:
                        obj3.getClass();
                        objA = qpb.a((wre) obj3, qpb.d, lpbVar2);
                        break;
                    case 4:
                        obj3.getClass();
                        objA = qpb.a((g7e) obj3, qpb.e, lpbVar2);
                        break;
                    case 5:
                        obj3.getClass();
                        objA = qpb.a((c07) obj3, qpb.f, lpbVar2);
                        break;
                    case 6:
                        obj3.getClass();
                        objA = qpb.a((b07) obj3, qpb.g, lpbVar2);
                        break;
                    case 7:
                        obj3.getClass();
                        objA = ((fuc) obj3).a;
                        break;
                    default:
                        ygf.a();
                        return null;
                }
                return d46.t(eyVar, objA, Integer.valueOf(lxVar.b), Integer.valueOf(lxVar.c), lxVar.d);
            case 12:
                lpb lpbVar3 = (lpb) obj;
                List list = ((h67) obj2).a;
                ArrayList arrayList = new ArrayList(list.size());
                int size = list.size();
                for (int i = 0; i < size; i++) {
                    arrayList.add(qpb.a((f67) list.get(i), qpb.B, lpbVar3));
                }
                return arrayList;
            case 13:
                return ((f67) obj2).a.toLanguageTag();
            case 14:
                lpb lpbVar4 = (lpb) obj;
                lz6 lz6Var = (lz6) obj2;
                return d46.t(qpb.a(new iz6(lz6Var.a), qpb.D, lpbVar4), qpb.a(new kz6(lz6Var.b), qpb.E, lpbVar4), qpb.a(new jz6(lz6Var.c), qpb.F, lpbVar4));
            case 15:
                return Float.valueOf(((iz6) obj2).a);
            case 16:
                return Integer.valueOf(((kz6) obj2).a);
            case 17:
                return Integer.valueOf(((jz6) obj2).a);
            case 18:
                return ((wre) obj2).a;
            case 19:
                lpb lpbVar5 = (lpb) obj;
                s29 s29Var = (s29) obj2;
                Object objA2 = qpb.a(new jgd(s29Var.a), qpb.s, lpbVar5);
                Object objA3 = qpb.a(new qhd(s29Var.b), qpb.t, lpbVar5);
                Object objA4 = qpb.a(new qkd(s29Var.c), qpb.x, lpbVar5);
                yid yidVar = s29Var.d;
                yid yidVar2 = yid.c;
                Object objA5 = qpb.a(yidVar, qpb.m, lpbVar5);
                Object objA6 = qpb.a(s29Var.e, bgf.I, lpbVar5);
                lz6 lz6Var2 = s29Var.f;
                lz6 lz6Var3 = lz6.d;
                return d46.t(objA2, objA3, objA4, objA5, objA6, qpb.a(lz6Var2, qpb.C, lpbVar5), qpb.a(new bz6(s29Var.g), bgf.K, lpbVar5), qpb.a(new tt5(s29Var.h), qpb.u, lpbVar5), qpb.a(s29Var.i, bgf.L, lpbVar5));
            case 20:
                return ((g7e) obj2).a;
            case 21:
                lpb lpbVar6 = (lpb) obj;
                skc skcVar = (skc) obj2;
                uu1 uu1Var = new uu1(skcVar.a.b());
                opb opbVar = qpb.r;
                Object objA7 = qpb.a(uu1Var, opbVar, lpbVar6);
                qkd qkdVar2 = new qkd(skcVar.b);
                opb opbVar2 = qpb.x;
                Object objA8 = qpb.a(qkdVar2, opbVar2, lpbVar6);
                d05 d05Var = skcVar.c;
                d05 d05Var2 = d05.b;
                Object objA9 = qpb.a(d05Var, qpb.n, lpbVar6);
                Object objA10 = qpb.a(skcVar.d, qpb.v, lpbVar6);
                Object objA11 = qpb.a(skcVar.e, qpb.w, lpbVar6);
                String str = skcVar.g;
                Object objA12 = qpb.a(new qkd(skcVar.h), opbVar2, lpbVar6);
                Object objA13 = qpb.a(skcVar.i, qpb.o, lpbVar6);
                Object objA14 = qpb.a(skcVar.j, qpb.l, lpbVar6);
                h67 h67Var = skcVar.k;
                h67 h67Var2 = h67.c;
                Object objA15 = qpb.a(h67Var, qpb.A, lpbVar6);
                Object objA16 = qpb.a(new uu1(skcVar.l), opbVar, lpbVar6);
                Object objA17 = qpb.a(skcVar.m, qpb.k, lpbVar6);
                i3c i3cVar2 = skcVar.n;
                i3c i3cVar3 = i3c.d;
                return d46.t(objA7, objA8, objA9, objA10, objA11, -1, str, objA12, objA13, objA14, objA15, objA16, objA17, qpb.a(i3cVar2, qpb.q, lpbVar6));
            case 22:
                lpb lpbVar7 = (lpb) obj;
                wjd wjdVar = (wjd) obj2;
                skc skcVar2 = wjdVar.a;
                mya myaVar = qpb.i;
                return d46.t(qpb.a(skcVar2, myaVar, lpbVar7), qpb.a(wjdVar.b, myaVar, lpbVar7), qpb.a(wjdVar.c, myaVar, lpbVar7), qpb.a(wjdVar.d, myaVar, lpbVar7));
            case 23:
                pa9 pa9Var = (pa9) obj2;
                Boolean boolValueOf = Boolean.valueOf(pa9Var.a);
                mya myaVar2 = qpb.a;
                return d46.t(boolValueOf, qpb.a(new mx3(pa9Var.b), bgf.J, (lpb) obj));
            case 24:
                return Integer.valueOf(((mx3) obj2).a);
            case 25:
                return Integer.valueOf(((bz6) obj2).a);
            case 26:
                zjd zjdVar = (zjd) obj2;
                return d46.t(qpb.a(new yjd(zjdVar.a), bgf.M, (lpb) obj), Boolean.valueOf(zjdVar.b));
            case 27:
                return Integer.valueOf(((yjd) obj2).a);
            case 28:
                return Integer.valueOf(((yrb) obj2).a.g());
            default:
                lpb lpbVar8 = (lpb) obj;
                atb atbVar = (atb) obj2;
                lpbVar8.getClass();
                atbVar.getClass();
                return d46.R(((b55) uid.d.b).invoke(lpbVar8, atbVar.a), Boolean.valueOf(atbVar.b), Boolean.valueOf(atbVar.c));
        }
    }
}
