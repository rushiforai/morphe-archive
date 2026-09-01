package defpackage;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class npb implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ npb(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        lx lxVar;
        int i = 0;
        mx3Var = null;
        mx3 mx3Var = null;
        i3cVar = null;
        i3c i3cVar = null;
        zjdVar = null;
        zjd zjdVar = null;
        b07Var = null;
        b07 b07Var = null;
        c07Var = null;
        c07 c07Var = null;
        g7eVar = null;
        g7e g7eVar = null;
        wreVar = null;
        wre wreVar = null;
        skcVar = null;
        skc skcVar = null;
        s29Var = null;
        s29 s29Var = null;
        wjdVar = null;
        wjd wjdVar = null;
        switch (this.a) {
            case 0:
                obj.getClass();
                List list = (List) obj;
                Object obj2 = list.get(0);
                Integer num = obj2 != null ? (Integer) obj2 : null;
                num.getClass();
                int iIntValue = num.intValue();
                Object obj3 = list.get(1);
                Integer num2 = obj3 != null ? (Integer) obj3 : null;
                num2.getClass();
                return new bkd(lk7.q(iIntValue, num2.intValue()));
            case 1:
                obj.getClass();
                List list2 = (List) obj;
                Object obj4 = list2.get(0);
                int i2 = uu1.i;
                Boolean bool = Boolean.FALSE;
                g76.L(obj4, bool);
                uu1 uu1Var = obj4 != null ? g76.L(obj4, Boolean.FALSE) ? new uu1(uu1.h) : new uu1(op8.j(((Integer) obj4).intValue())) : null;
                uu1Var.getClass();
                long j = uu1Var.a;
                Object obj5 = list2.get(1);
                opb opbVar = qpb.z;
                g76.L(obj5, bool);
                ip8 ip8Var = obj5 != null ? (ip8) opbVar.b.invoke(obj5) : null;
                ip8Var.getClass();
                long j2 = ip8Var.a;
                Object obj6 = list2.get(2);
                Float f = obj6 != null ? (Float) obj6 : null;
                f.getClass();
                return new i3c(f.floatValue(), j, j2);
            case 2:
                obj.getClass();
                return new jgd(((Integer) obj).intValue());
            case 3:
                obj.getClass();
                List list3 = (List) obj;
                Object obj7 = list3.get(0);
                String str = obj7 != null ? (String) obj7 : null;
                str.getClass();
                Object obj8 = list3.get(1);
                mya myaVar = qpb.j;
                if (!g76.L(obj8, Boolean.FALSE) && obj8 != null) {
                    wjdVar = (wjd) ((x45) myaVar.c).invoke(obj8);
                }
                return new c07(str, wjdVar);
            case 4:
                obj.getClass();
                return new qhd(((Integer) obj).intValue());
            case 5:
                obj.getClass();
                return new tt5(((Integer) obj).intValue());
            case 6:
                obj.getClass();
                List list4 = (List) obj;
                ArrayList arrayList = new ArrayList(list4.size());
                int size = list4.size();
                while (i < size) {
                    Object obj9 = list4.get(i);
                    lx lxVar2 = (g76.L(obj9, Boolean.FALSE) || obj9 == null) ? null : (lx) ((x45) qpb.c.c).invoke(obj9);
                    lxVar2.getClass();
                    arrayList.add(lxVar2);
                    i++;
                }
                return arrayList;
            case 7:
                obj.getClass();
                return new zz4(((Integer) obj).intValue());
            case 8:
                obj.getClass();
                return new a05(((Integer) obj).intValue());
            case 9:
                Boolean bool2 = Boolean.FALSE;
                if (g76.L(obj, bool2)) {
                    return new qkd(qkd.c);
                }
                obj.getClass();
                List list5 = (List) obj;
                Object obj10 = list5.get(0);
                Float f2 = obj10 != null ? (Float) obj10 : null;
                f2.getClass();
                float fFloatValue = f2.floatValue();
                Object obj11 = list5.get(1);
                opb opbVar2 = qpb.y;
                g76.L(obj11, bool2);
                rkd rkdVar = obj11 != null ? (rkd) opbVar2.b.invoke(obj11) : null;
                rkdVar.getClass();
                return new qkd(en7.M(fFloatValue, rkdVar.a));
            case 10:
                return g76.L(obj, 0) ? new rkd(8589934592L) : g76.L(obj, 1) ? new rkd(4294967296L) : new rkd(0L);
            case 11:
                if (g76.L(obj, Boolean.FALSE)) {
                    return new ip8(9205357640488583168L);
                }
                obj.getClass();
                List list6 = (List) obj;
                Object obj12 = list6.get(0);
                Float f3 = obj12 != null ? (Float) obj12 : null;
                f3.getClass();
                float fFloatValue2 = f3.floatValue();
                Object obj13 = list6.get(1);
                Float f4 = obj13 != null ? (Float) obj13 : null;
                f4.getClass();
                return new ip8((((long) Float.floatToRawIntBits(fFloatValue2)) << 32) | (((long) Float.floatToRawIntBits(f4.floatValue())) & 4294967295L));
            case 12:
                obj.getClass();
                List list7 = (List) obj;
                ArrayList arrayList2 = new ArrayList(list7.size());
                int size2 = list7.size();
                while (i < size2) {
                    Object obj14 = list7.get(i);
                    f67 f67Var = (g76.L(obj14, Boolean.FALSE) || obj14 == null) ? null : (f67) ((x45) qpb.B.c).invoke(obj14);
                    f67Var.getClass();
                    arrayList2.add(f67Var);
                    i++;
                }
                return new h67(arrayList2);
            case 13:
                obj.getClass();
                String str2 = (String) obj;
                Locale localeForLanguageTag = Locale.forLanguageTag(str2);
                if (g76.L(localeForLanguageTag.toLanguageTag(), "und")) {
                    System.err.println("The language tag " + str2 + " is not well-formed. Locale is resolved to Undetermined. Note that underscore '_' is not a valid subtag delimiter and must be replaced with '-'.");
                }
                return new f67(localeForLanguageTag);
            case 14:
                obj.getClass();
                List list8 = (List) obj;
                Object obj15 = list8.get(0);
                String str3 = obj15 != null ? (String) obj15 : null;
                str3.getClass();
                Object obj16 = list8.get(1);
                return new b07(str3, (g76.L(obj16, Boolean.FALSE) || obj16 == null) ? null : (wjd) ((x45) qpb.j.c).invoke(obj16), null);
            case 15:
                obj.getClass();
                List list9 = (List) obj;
                Object obj17 = list9.get(0);
                float f5 = iz6.b;
                opb opbVar3 = qpb.D;
                Boolean bool3 = Boolean.FALSE;
                g76.L(obj17, bool3);
                iz6 iz6Var = obj17 != null ? (iz6) opbVar3.b.invoke(obj17) : null;
                iz6Var.getClass();
                float f6 = iz6Var.a;
                Object obj18 = list9.get(1);
                opb opbVar4 = qpb.E;
                g76.L(obj18, bool3);
                kz6 kz6Var = obj18 != null ? (kz6) opbVar4.b.invoke(obj18) : null;
                kz6Var.getClass();
                int i3 = kz6Var.a;
                Object obj19 = list9.get(2);
                opb opbVar5 = qpb.F;
                g76.L(obj19, bool3);
                jz6 jz6Var = obj19 != null ? (jz6) opbVar5.b.invoke(obj19) : null;
                jz6Var.getClass();
                return new lz6(f6, i3, jz6Var.a);
            case 16:
                obj.getClass();
                float fFloatValue3 = ((Float) obj).floatValue();
                iz6.a(fFloatValue3);
                return new iz6(fFloatValue3);
            case 17:
                obj.getClass();
                return new kz6(((Integer) obj).intValue());
            case 18:
                obj.getClass();
                List list10 = (List) obj;
                Object obj20 = list10.get(0);
                ey eyVar = obj20 != null ? (ey) obj20 : null;
                eyVar.getClass();
                Object obj21 = list10.get(2);
                Integer num3 = obj21 != null ? (Integer) obj21 : null;
                num3.getClass();
                int iIntValue2 = num3.intValue();
                Object obj22 = list10.get(3);
                Integer num4 = obj22 != null ? (Integer) obj22 : null;
                num4.getClass();
                int iIntValue3 = num4.intValue();
                Object obj23 = list10.get(4);
                String str4 = obj23 != null ? (String) obj23 : null;
                str4.getClass();
                switch (ppb.a[eyVar.ordinal()]) {
                    case 1:
                        Object obj24 = list10.get(1);
                        mya myaVar2 = qpb.h;
                        if (!g76.L(obj24, Boolean.FALSE) && obj24 != null) {
                            s29Var = (s29) ((x45) myaVar2.c).invoke(obj24);
                        }
                        s29Var.getClass();
                        lxVar = new lx(s29Var, iIntValue2, iIntValue3, str4);
                        break;
                    case 2:
                        Object obj25 = list10.get(1);
                        mya myaVar3 = qpb.i;
                        if (!g76.L(obj25, Boolean.FALSE) && obj25 != null) {
                            skcVar = (skc) ((x45) myaVar3.c).invoke(obj25);
                        }
                        skcVar.getClass();
                        lxVar = new lx(skcVar, iIntValue2, iIntValue3, str4);
                        break;
                    case 3:
                        Object obj26 = list10.get(1);
                        mya myaVar4 = qpb.d;
                        if (!g76.L(obj26, Boolean.FALSE) && obj26 != null) {
                            wreVar = (wre) ((x45) myaVar4.c).invoke(obj26);
                        }
                        wreVar.getClass();
                        lxVar = new lx(wreVar, iIntValue2, iIntValue3, str4);
                        break;
                    case 4:
                        Object obj27 = list10.get(1);
                        mya myaVar5 = qpb.e;
                        if (!g76.L(obj27, Boolean.FALSE) && obj27 != null) {
                            g7eVar = (g7e) ((x45) myaVar5.c).invoke(obj27);
                        }
                        g7eVar.getClass();
                        lxVar = new lx(g7eVar, iIntValue2, iIntValue3, str4);
                        break;
                    case 5:
                        Object obj28 = list10.get(1);
                        mya myaVar6 = qpb.f;
                        if (!g76.L(obj28, Boolean.FALSE) && obj28 != null) {
                            c07Var = (c07) ((x45) myaVar6.c).invoke(obj28);
                        }
                        c07Var.getClass();
                        lxVar = new lx(c07Var, iIntValue2, iIntValue3, str4);
                        break;
                    case 6:
                        Object obj29 = list10.get(1);
                        mya myaVar7 = qpb.g;
                        if (!g76.L(obj29, Boolean.FALSE) && obj29 != null) {
                            b07Var = (b07) ((x45) myaVar7.c).invoke(obj29);
                        }
                        b07Var.getClass();
                        lxVar = new lx(b07Var, iIntValue2, iIntValue3, str4);
                        break;
                    case 7:
                        Object obj30 = list10.get(1);
                        String str5 = obj30 != null ? (String) obj30 : null;
                        str5.getClass();
                        lxVar = new lx(new fuc(str5), iIntValue2, iIntValue3, str4);
                        break;
                    default:
                        ygf.a();
                        return null;
                }
                return lxVar;
            case 19:
                obj.getClass();
                return new jz6(((Integer) obj).intValue());
            case 20:
                String str6 = obj != null ? (String) obj : null;
                str6.getClass();
                return new wre(str6);
            case 21:
                String str7 = obj != null ? (String) obj : null;
                str7.getClass();
                return new g7e(str7);
            case 22:
                obj.getClass();
                List list11 = (List) obj;
                Object obj31 = list11.get(0);
                opb opbVar6 = qpb.s;
                Boolean bool4 = Boolean.FALSE;
                g76.L(obj31, bool4);
                jgd jgdVar = obj31 != null ? (jgd) opbVar6.b.invoke(obj31) : null;
                jgdVar.getClass();
                int i4 = jgdVar.a;
                Object obj32 = list11.get(1);
                opb opbVar7 = qpb.t;
                g76.L(obj32, bool4);
                qhd qhdVar = obj32 != null ? (qhd) opbVar7.b.invoke(obj32) : null;
                qhdVar.getClass();
                int i5 = qhdVar.a;
                Object obj33 = list11.get(2);
                rkd[] rkdVarArr = qkd.b;
                opb opbVar8 = qpb.x;
                g76.L(obj33, bool4);
                qkd qkdVar = obj33 != null ? (qkd) opbVar8.b.invoke(obj33) : null;
                qkdVar.getClass();
                long j3 = qkdVar.a;
                Object obj34 = list11.get(3);
                yid yidVar = yid.c;
                yid yidVar2 = (g76.L(obj34, bool4) || obj34 == null) ? null : (yid) ((x45) qpb.m.c).invoke(obj34);
                Object obj35 = list11.get(4);
                pa9 pa9Var = (g76.L(obj35, bool4) || obj35 == null) ? null : (pa9) ((x45) bgf.I.c).invoke(obj35);
                Object obj36 = list11.get(5);
                lz6 lz6Var = lz6.d;
                lz6 lz6Var2 = (g76.L(obj36, bool4) || obj36 == null) ? null : (lz6) ((x45) qpb.C.c).invoke(obj36);
                Object obj37 = list11.get(6);
                bz6 bz6Var = (g76.L(obj37, bool4) || obj37 == null) ? null : (bz6) ((x45) bgf.K.c).invoke(obj37);
                bz6Var.getClass();
                int i6 = bz6Var.a;
                Object obj38 = list11.get(7);
                opb opbVar9 = qpb.u;
                g76.L(obj38, bool4);
                tt5 tt5Var = obj38 != null ? (tt5) opbVar9.b.invoke(obj38) : null;
                tt5Var.getClass();
                int i7 = tt5Var.a;
                Object obj39 = list11.get(8);
                mya myaVar8 = bgf.L;
                if (!g76.L(obj39, bool4) && obj39 != null) {
                    zjdVar = (zjd) ((x45) myaVar8.c).invoke(obj39);
                }
                return new s29(i4, i5, j3, yidVar2, pa9Var, lz6Var2, i6, i7, zjdVar);
            case 23:
                obj.getClass();
                List list12 = (List) obj;
                Object obj40 = list12.get(0);
                int i8 = uu1.i;
                Boolean bool5 = Boolean.FALSE;
                g76.L(obj40, bool5);
                uu1 uu1Var2 = obj40 != null ? g76.L(obj40, Boolean.FALSE) ? new uu1(uu1.h) : new uu1(op8.j(((Integer) obj40).intValue())) : null;
                uu1Var2.getClass();
                long j4 = uu1Var2.a;
                Object obj41 = list12.get(1);
                rkd[] rkdVarArr2 = qkd.b;
                x45 x45Var = qpb.x.b;
                g76.L(obj41, bool5);
                qkd qkdVar2 = obj41 != null ? (qkd) x45Var.invoke(obj41) : null;
                qkdVar2.getClass();
                long j5 = qkdVar2.a;
                Object obj42 = list12.get(2);
                d05 d05Var = d05.b;
                d05 d05Var2 = (g76.L(obj42, bool5) || obj42 == null) ? null : (d05) ((x45) qpb.n.c).invoke(obj42);
                Object obj43 = list12.get(3);
                zz4 zz4Var = (g76.L(obj43, bool5) || obj43 == null) ? null : (zz4) ((x45) qpb.v.c).invoke(obj43);
                Object obj44 = list12.get(4);
                a05 a05Var = (g76.L(obj44, bool5) || obj44 == null) ? null : (a05) ((x45) qpb.w.c).invoke(obj44);
                Object obj45 = list12.get(6);
                String str8 = obj45 != null ? (String) obj45 : null;
                Object obj46 = list12.get(7);
                g76.L(obj46, bool5);
                qkd qkdVar3 = obj46 != null ? (qkd) x45Var.invoke(obj46) : null;
                qkdVar3.getClass();
                long j6 = qkdVar3.a;
                Object obj47 = list12.get(8);
                lo0 lo0Var = (g76.L(obj47, bool5) || obj47 == null) ? null : (lo0) ((x45) qpb.o.c).invoke(obj47);
                Object obj48 = list12.get(9);
                xid xidVar = (g76.L(obj48, bool5) || obj48 == null) ? null : (xid) ((x45) qpb.l.c).invoke(obj48);
                Object obj49 = list12.get(10);
                h67 h67Var = h67.c;
                h67 h67Var2 = (g76.L(obj49, bool5) || obj49 == null) ? null : (h67) ((x45) qpb.A.c).invoke(obj49);
                Object obj50 = list12.get(11);
                g76.L(obj50, bool5);
                uu1 uu1Var3 = obj50 != null ? g76.L(obj50, Boolean.FALSE) ? new uu1(uu1.h) : new uu1(op8.j(((Integer) obj50).intValue())) : null;
                uu1Var3.getClass();
                long j7 = uu1Var3.a;
                Object obj51 = list12.get(12);
                ohd ohdVar = (g76.L(obj51, bool5) || obj51 == null) ? null : (ohd) ((x45) qpb.k.c).invoke(obj51);
                Object obj52 = list12.get(13);
                i3c i3cVar2 = i3c.d;
                mya myaVar9 = qpb.q;
                if (!g76.L(obj52, bool5) && obj52 != null) {
                    i3cVar = (i3c) ((x45) myaVar9.c).invoke(obj52);
                }
                return new skc(j4, j5, d05Var2, zz4Var, a05Var, (az4) null, str8, j6, lo0Var, xidVar, h67Var2, j7, ohdVar, i3cVar, 49184);
            case 24:
                obj.getClass();
                List list13 = (List) obj;
                Object obj53 = list13.get(0);
                Boolean bool6 = obj53 != null ? (Boolean) obj53 : null;
                bool6.getClass();
                boolean zBooleanValue = bool6.booleanValue();
                Object obj54 = list13.get(1);
                mya myaVar10 = bgf.J;
                if (!g76.L(obj54, Boolean.FALSE) && obj54 != null) {
                    mx3Var = (mx3) ((x45) myaVar10.c).invoke(obj54);
                }
                mx3Var.getClass();
                return new pa9(mx3Var.a, zBooleanValue);
            case 25:
                obj.getClass();
                return new mx3(((Integer) obj).intValue());
            case 26:
                obj.getClass();
                return new bz6(((Integer) obj).intValue());
            case 27:
                obj.getClass();
                List list14 = (List) obj;
                Object obj55 = list14.get(0);
                yjd yjdVar = (g76.L(obj55, Boolean.FALSE) || obj55 == null) ? null : (yjd) ((x45) bgf.M.c).invoke(obj55);
                yjdVar.getClass();
                int i9 = yjdVar.a;
                Object obj56 = list14.get(1);
                Boolean bool7 = obj56 != null ? (Boolean) obj56 : null;
                bool7.getClass();
                return new zjd(i9, bool7.booleanValue());
            case 28:
                obj.getClass();
                return new yjd(((Integer) obj).intValue());
            default:
                return new yrb(((Integer) obj).intValue());
        }
    }
}
