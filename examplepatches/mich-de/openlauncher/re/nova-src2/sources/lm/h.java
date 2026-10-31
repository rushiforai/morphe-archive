package lm;

import ab.c0;
import android.content.ComponentName;
import android.util.Log;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.z2;
import i2.r0;
import i2.u0;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import m0.b0;
import m3.d0;
import m3.e0;
import m3.f0;
import m3.g0;
import m3.i0;
import m3.m;
import m3.m0;
import m3.o0;
import m3.q0;
import m3.u;
import m3.x;
import nova.branch.engage.sesame_lite.internal.DataImporters;
import nova.branch.engage.sesame_lite.internal.DbView;
import q3.v;
import q3.w;
import x3.k;
import x3.l;
import x3.p;
import x3.s;
import y3.q;

/* loaded from: classes.dex */
public final /* synthetic */ class h implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75046a;

    public /* synthetic */ h(int i5) {
        this.f75046a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5;
        int i11;
        int i12;
        int i13;
        long j11;
        s sVar;
        int i14 = 0;
        switch (this.f75046a) {
            case 0:
                y5.b bVar = (y5.b) obj;
                y5.f fVar = j.f75050c;
                long j12 = 0;
                for (Map.Entry entry : bVar.a().entrySet()) {
                    if (entry.getValue() instanceof Set) {
                        y5.f fVar2 = (y5.f) entry.getKey();
                        Set set = (Set) entry.getValue();
                        String strB = j.b(System.currentTimeMillis());
                        if (set.contains(strB)) {
                            bVar.d(fVar2, fq.c.l(strB));
                            j12++;
                        } else {
                            bVar.c(fVar2);
                        }
                    }
                }
                if (j12 == 0) {
                    bVar.c(fVar);
                    return null;
                }
                bVar.d(fVar, Long.valueOf(j12));
                return null;
            case 1:
                List list = (List) obj;
                return new b0(((Number) list.get(0)).intValue(), ((Number) list.get(1)).intValue());
            case 2:
                return Boolean.valueOf(!(((m3.b) obj) instanceof u));
            case 3:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list2 = (List) obj;
                Object obj2 = list2.get(0);
                Function1 function1 = (Function1) e0.f75863h.f692c;
                Boolean bool = Boolean.FALSE;
                g0 g0Var = (Intrinsics.b(obj2, bool) || obj2 == null) ? null : (g0) function1.invoke(obj2);
                Object obj3 = list2.get(1);
                g0 g0Var2 = (Intrinsics.b(obj3, bool) || obj3 == null) ? null : (g0) function1.invoke(obj3);
                Object obj4 = list2.get(2);
                g0 g0Var3 = (Intrinsics.b(obj4, bool) || obj4 == null) ? null : (g0) function1.invoke(obj4);
                Object obj5 = list2.get(3);
                return new m0(g0Var, g0Var2, g0Var3, (Intrinsics.b(obj5, bool) || obj5 == null) ? null : (g0) function1.invoke(obj5));
            case 4:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list3 = (List) obj;
                Object obj6 = list3.get(1);
                List list4 = (Intrinsics.b(obj6, Boolean.FALSE) || obj6 == null) ? null : (List) ((Function1) e0.f75856a.f692c).invoke(obj6);
                Object obj7 = list3.get(0);
                String str = obj7 != null ? (String) obj7 : null;
                Intrinsics.d(str);
                return new m3.g(list4, str);
            case 5:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Int");
                return new l(((Integer) obj).intValue());
            case 6:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Float>");
                List list5 = (List) obj;
                return new p(((Number) list5.get(0)).floatValue(), ((Number) list5.get(1)).floatValue());
            case 7:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list6 = (List) obj;
                Object obj8 = list6.get(0);
                q[] qVarArr = y3.p.f96616b;
                Function1 function12 = e0.f75870q.f75851b;
                Boolean bool2 = Boolean.FALSE;
                Intrinsics.b(obj8, bool2);
                y3.p pVar = obj8 != null ? (y3.p) function12.invoke(obj8) : null;
                Intrinsics.d(pVar);
                long j13 = pVar.f96618a;
                Object obj9 = list6.get(1);
                Intrinsics.b(obj9, bool2);
                y3.p pVar2 = obj9 != null ? (y3.p) function12.invoke(obj9) : null;
                Intrinsics.d(pVar2);
                return new x3.q(j13, pVar2.f96618a);
            case 8:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Int");
                return new q3.b0(((Integer) obj).intValue());
            case 9:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Float");
                return new x3.a(((Float) obj).floatValue());
            case 10:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list7 = (List) obj;
                Object obj10 = list7.get(0);
                Integer num = obj10 != null ? (Integer) obj10 : null;
                Intrinsics.d(num);
                int iIntValue = num.intValue();
                Object obj11 = list7.get(1);
                Integer num2 = obj11 != null ? (Integer) obj11 : null;
                Intrinsics.d(num2);
                return new o0(z2.u(iIntValue, num2.intValue()));
            case 11:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list8 = (List) obj;
                Object obj12 = list8.get(0);
                int i15 = i2.s.n;
                Boolean bool3 = Boolean.FALSE;
                Intrinsics.b(obj12, bool3);
                i2.s sVar2 = obj12 != null ? Intrinsics.b(obj12, Boolean.FALSE) ? new i2.s(i2.s.f61147m) : new i2.s(r0.b(((Integer) obj12).intValue())) : null;
                Intrinsics.d(sVar2);
                long j14 = sVar2.f61148a;
                Object obj13 = list8.get(1);
                d0 d0Var = e0.f75871r;
                Intrinsics.b(obj13, bool3);
                h2.b bVar2 = obj13 != null ? (h2.b) d0Var.f75851b.invoke(obj13) : null;
                Intrinsics.d(bVar2);
                long j15 = bVar2.f59016a;
                Object obj14 = list8.get(2);
                Float f11 = obj14 != null ? (Float) obj14 : null;
                Intrinsics.d(f11);
                return new u0(f11.floatValue(), j14, j15);
            case 12:
                if (Intrinsics.b(obj, Boolean.FALSE)) {
                    return new y3.p(y3.p.f96617c);
                }
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list9 = (List) obj;
                Object obj15 = list9.get(0);
                Float f12 = obj15 != null ? (Float) obj15 : null;
                Intrinsics.d(f12);
                float fFloatValue = f12.floatValue();
                Object obj16 = list9.get(1);
                q qVar = obj16 != null ? (q) obj16 : null;
                Intrinsics.d(qVar);
                return new y3.p(w20.h.m(fFloatValue, qVar.f96619a));
            case 13:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list10 = (List) obj;
                Object obj17 = list10.get(0);
                String str2 = obj17 != null ? (String) obj17 : null;
                Intrinsics.d(str2);
                Object obj18 = list10.get(1);
                return new m(str2, (Intrinsics.b(obj18, Boolean.FALSE) || obj18 == null) ? null : (m0) ((Function1) e0.f75864i.f692c).invoke(obj18));
            case 14:
                if (Intrinsics.b(obj, Boolean.FALSE)) {
                    return new h2.b(9205357640488583168L);
                }
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list11 = (List) obj;
                Object obj19 = list11.get(0);
                Float f13 = obj19 != null ? (Float) obj19 : null;
                Intrinsics.d(f13);
                float fFloatValue2 = f13.floatValue();
                Object obj20 = list11.get(1);
                Intrinsics.d(obj20 != null ? (Float) obj20 : null);
                return new h2.b((Float.floatToRawIntBits(fFloatValue2) << 32) | (Float.floatToRawIntBits(r14.floatValue()) & 4294967295L));
            case 15:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list12 = (List) obj;
                ArrayList arrayList = new ArrayList(list12.size());
                int size = list12.size();
                while (i14 < size) {
                    Object obj21 = list12.get(i14);
                    t3.a aVar = (Intrinsics.b(obj21, Boolean.FALSE) || obj21 == null) ? null : (t3.a) ((Function1) e0.f75873t.f692c).invoke(obj21);
                    Intrinsics.d(aVar);
                    arrayList.add(aVar);
                    i14++;
                }
                return new t3.b(arrayList);
            case 16:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list13 = (List) obj;
                ArrayList arrayList2 = new ArrayList(list13.size());
                int size2 = list13.size();
                while (i14 < size2) {
                    Object obj22 = list13.get(i14);
                    m3.e eVar = (Intrinsics.b(obj22, Boolean.FALSE) || obj22 == null) ? null : (m3.e) ((Function1) e0.f75857b.f692c).invoke(obj22);
                    Intrinsics.d(eVar);
                    arrayList2.add(eVar);
                    i14++;
                }
                return arrayList2;
            case 17:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.String");
                String str3 = (String) obj;
                t3.c.f88513a.getClass();
                Locale localeForLanguageTag = Locale.forLanguageTag(str3);
                if (Intrinsics.b(localeForLanguageTag.toLanguageTag(), "und")) {
                    Log.e("Locale", "The language tag " + str3 + " is not well-formed. Locale is resolved to Undetermined. Note that underscore '_' is not a valid subtag delimiter and must be replaced with '-'.");
                }
                return new t3.a(localeForLanguageTag);
            case 18:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list14 = (List) obj;
                Object obj23 = list14.get(0);
                x3.f fVar3 = obj23 != null ? (x3.f) obj23 : null;
                Intrinsics.d(fVar3);
                float f14 = fVar3.f95011a;
                Object obj24 = list14.get(1);
                x3.h hVar = obj24 != null ? (x3.h) obj24 : null;
                Intrinsics.d(hVar);
                int i16 = hVar.f95012a;
                Object obj25 = list14.get(2);
                Intrinsics.d(obj25 != null ? (x3.g) obj25 : null);
                return new x3.i(f14, i16);
            case 19:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
                List list15 = (List) obj;
                Object obj26 = list15.get(0);
                m3.i iVar = obj26 != null ? (m3.i) obj26 : null;
                Intrinsics.d(iVar);
                Object obj27 = list15.get(2);
                Integer num3 = obj27 != null ? (Integer) obj27 : null;
                Intrinsics.d(num3);
                int iIntValue2 = num3.intValue();
                Object obj28 = list15.get(3);
                Integer num4 = obj28 != null ? (Integer) obj28 : null;
                Intrinsics.d(num4);
                int iIntValue3 = num4.intValue();
                Object obj29 = list15.get(4);
                String str4 = obj29 != null ? (String) obj29 : null;
                Intrinsics.d(str4);
                switch (iVar.ordinal()) {
                    case 0:
                        Object obj30 = list15.get(1);
                        u uVar = (Intrinsics.b(obj30, Boolean.FALSE) || obj30 == null) ? null : (u) ((Function1) e0.f75862g.f692c).invoke(obj30);
                        Intrinsics.d(uVar);
                        return new m3.e(uVar, iIntValue2, iIntValue3, str4);
                    case 1:
                        Object obj31 = list15.get(1);
                        g0 g0Var4 = (Intrinsics.b(obj31, Boolean.FALSE) || obj31 == null) ? null : (g0) ((Function1) e0.f75863h.f692c).invoke(obj31);
                        Intrinsics.d(g0Var4);
                        return new m3.e(g0Var4, iIntValue2, iIntValue3, str4);
                    case 2:
                        Object obj32 = list15.get(1);
                        m3.r0 r0Var = (Intrinsics.b(obj32, Boolean.FALSE) || obj32 == null) ? null : (m3.r0) ((Function1) e0.f75858c.f692c).invoke(obj32);
                        Intrinsics.d(r0Var);
                        return new m3.e(r0Var, iIntValue2, iIntValue3, str4);
                    case 3:
                        Object obj33 = list15.get(1);
                        q0 q0Var = (Intrinsics.b(obj33, Boolean.FALSE) || obj33 == null) ? null : (q0) ((Function1) e0.f75859d.f692c).invoke(obj33);
                        Intrinsics.d(q0Var);
                        return new m3.e(q0Var, iIntValue2, iIntValue3, str4);
                    case 4:
                        Object obj34 = list15.get(1);
                        m mVar = (Intrinsics.b(obj34, Boolean.FALSE) || obj34 == null) ? null : (m) ((Function1) e0.f75860e.f692c).invoke(obj34);
                        Intrinsics.d(mVar);
                        return new m3.e(mVar, iIntValue2, iIntValue3, str4);
                    case 5:
                        Object obj35 = list15.get(1);
                        m3.l lVar = (Intrinsics.b(obj35, Boolean.FALSE) || obj35 == null) ? null : (m3.l) ((Function1) e0.f75861f.f692c).invoke(obj35);
                        Intrinsics.d(lVar);
                        return new m3.e(lVar, iIntValue2, iIntValue3, str4);
                    case 6:
                        Object obj36 = list15.get(1);
                        String str5 = obj36 != null ? (String) obj36 : null;
                        Intrinsics.d(str5);
                        return new m3.e(i0.a(str5), iIntValue2, iIntValue3, str4);
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            case 20:
                String str6 = obj != null ? (String) obj : null;
                Intrinsics.d(str6);
                return new m3.r0(str6);
            case 21:
                String str7 = obj != null ? (String) obj : null;
                Intrinsics.d(str7);
                return new q0(str7);
            case 22:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list16 = (List) obj;
                Object obj37 = list16.get(0);
                String str8 = obj37 != null ? (String) obj37 : null;
                Intrinsics.d(str8);
                Object obj38 = list16.get(1);
                return new m3.l(str8, (Intrinsics.b(obj38, Boolean.FALSE) || obj38 == null) ? null : (m0) ((Function1) e0.f75864i.f692c).invoke(obj38), null);
            case 23:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list17 = (List) obj;
                Object obj39 = list17.get(0);
                k kVar = obj39 != null ? (k) obj39 : null;
                Intrinsics.d(kVar);
                int i17 = kVar.f95019a;
                Object obj40 = list17.get(1);
                x3.m mVar2 = obj40 != null ? (x3.m) obj40 : null;
                Intrinsics.d(mVar2);
                int i18 = mVar2.f95024a;
                Object obj41 = list17.get(2);
                q[] qVarArr2 = y3.p.f96616b;
                d0 d0Var2 = e0.f75870q;
                Boolean bool4 = Boolean.FALSE;
                Intrinsics.b(obj41, bool4);
                y3.p pVar3 = obj41 != null ? (y3.p) d0Var2.f75851b.invoke(obj41) : null;
                Intrinsics.d(pVar3);
                long j16 = pVar3.f96618a;
                Object obj42 = list17.get(3);
                x3.q qVar2 = x3.q.f95029c;
                x3.q qVar3 = (Intrinsics.b(obj42, bool4) || obj42 == null) ? null : (x3.q) ((Function1) e0.f75867l.f692c).invoke(obj42);
                Object obj43 = list17.get(4);
                x xVar = (Intrinsics.b(obj43, bool4) || obj43 == null) ? null : (x) ((Function1) f0.f75876a.f692c).invoke(obj43);
                Object obj44 = list17.get(5);
                x3.i iVar2 = x3.i.f95013c;
                x3.i iVar3 = (Intrinsics.b(obj44, bool4) || obj44 == null) ? null : (x3.i) ((Function1) e0.f75874u.f692c).invoke(obj44);
                Object obj45 = list17.get(6);
                x3.e eVar2 = (Intrinsics.b(obj45, bool4) || obj45 == null) ? null : (x3.e) ((Function1) f0.f75877b.f692c).invoke(obj45);
                Intrinsics.d(eVar2);
                int i19 = eVar2.f95007a;
                Object obj46 = list17.get(7);
                x3.d dVar = obj46 != null ? (x3.d) obj46 : null;
                Intrinsics.d(dVar);
                int i21 = dVar.f95005a;
                Object obj47 = list17.get(8);
                boolean zB = Intrinsics.b(obj47, bool4);
                c0 c0Var = f0.f75878c;
                if (zB || obj47 == null) {
                    i5 = i17;
                    i11 = i18;
                    i12 = i21;
                    i13 = i19;
                    j11 = j16;
                    sVar = null;
                } else {
                    i5 = i17;
                    i11 = i18;
                    i12 = i21;
                    i13 = i19;
                    j11 = j16;
                    sVar = (s) ((Function1) c0Var.f692c).invoke(obj47);
                }
                return new u(i5, i11, j11, qVar3, xVar, iVar3, i13, i12, sVar);
            case 24:
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
                List list18 = (List) obj;
                Object obj48 = list18.get(0);
                int i22 = i2.s.n;
                Boolean bool5 = Boolean.FALSE;
                Intrinsics.b(obj48, bool5);
                i2.s sVar3 = obj48 != null ? obj48.equals(bool5) ? new i2.s(i2.s.f61147m) : new i2.s(r0.b(((Integer) obj48).intValue())) : null;
                Intrinsics.d(sVar3);
                long j17 = sVar3.f61148a;
                Object obj49 = list18.get(1);
                q[] qVarArr3 = y3.p.f96616b;
                Function1 function13 = e0.f75870q.f75851b;
                Intrinsics.b(obj49, bool5);
                y3.p pVar4 = obj49 != null ? (y3.p) function13.invoke(obj49) : null;
                Intrinsics.d(pVar4);
                long j18 = pVar4.f96618a;
                Object obj50 = list18.get(2);
                q3.b0 b0Var = q3.b0.f83528b;
                q3.b0 b0Var2 = (Intrinsics.b(obj50, bool5) || obj50 == null) ? null : (q3.b0) ((Function1) e0.f75868m.f692c).invoke(obj50);
                Object obj51 = list18.get(3);
                v vVar = obj51 != null ? (v) obj51 : null;
                Object obj52 = list18.get(4);
                w wVar = obj52 != null ? (w) obj52 : null;
                Object obj53 = list18.get(6);
                String str9 = obj53 != null ? (String) obj53 : null;
                Object obj54 = list18.get(7);
                Intrinsics.b(obj54, bool5);
                y3.p pVar5 = obj54 != null ? (y3.p) function13.invoke(obj54) : null;
                Intrinsics.d(pVar5);
                long j19 = pVar5.f96618a;
                Object obj55 = list18.get(8);
                x3.a aVar2 = (Intrinsics.b(obj55, bool5) || obj55 == null) ? null : (x3.a) ((Function1) e0.n.f692c).invoke(obj55);
                Object obj56 = list18.get(9);
                p pVar6 = (Intrinsics.b(obj56, bool5) || obj56 == null) ? null : (p) ((Function1) e0.f75866k.f692c).invoke(obj56);
                Object obj57 = list18.get(10);
                t3.b bVar3 = t3.b.f88510c;
                t3.b bVar4 = (Intrinsics.b(obj57, bool5) || obj57 == null) ? null : (t3.b) ((Function1) e0.f75872s.f692c).invoke(obj57);
                Object obj58 = list18.get(11);
                Intrinsics.b(obj58, bool5);
                i2.s sVar4 = obj58 != null ? obj58.equals(bool5) ? new i2.s(i2.s.f61147m) : new i2.s(r0.b(((Integer) obj58).intValue())) : null;
                Intrinsics.d(sVar4);
                long j21 = sVar4.f61148a;
                Object obj59 = list18.get(12);
                l lVar2 = (Intrinsics.b(obj59, bool5) || obj59 == null) ? null : (l) ((Function1) e0.f75865j.f692c).invoke(obj59);
                Object obj60 = list18.get(13);
                u0 u0Var = u0.f61170d;
                return new g0(j17, j18, b0Var2, vVar, wVar, (q3.p) null, str9, j19, aVar2, pVar6, bVar4, j21, lVar2, (Intrinsics.b(obj60, bool5) || obj60 == null) ? null : (u0) ((Function1) e0.o.f692c).invoke(obj60), 49184);
            case 25:
                ((Boolean) obj).booleanValue();
                ComponentName componentName = NovaLauncher.f45646r1;
                return Unit.f71706a;
            case 26:
                return Boolean.valueOf(DataImporters.pullContacts$lambda$45((DataImporters.JoinedContact) obj));
            case 27:
                return Long.valueOf(DataImporters.pullStaticNavigations$lambda$34$lambda$33((DbView) obj));
            case 28:
                return Boolean.valueOf(DataImporters.pullContacts$lambda$67$lambda$62((Map.Entry) obj));
            default:
                ((Integer) obj).getClass();
                return null;
        }
    }

    public /* synthetic */ h(j jVar) {
        this.f75046a = 0;
    }
}
