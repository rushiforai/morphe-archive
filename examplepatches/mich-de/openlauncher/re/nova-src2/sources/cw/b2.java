package cw;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.model.AccountRange;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b2 implements kw.y2 {
    public final uw.c A;
    public final uw.c B;
    public final uw.c C;

    /* renamed from: a, reason: collision with root package name */
    public final c2.f f48080a;

    /* renamed from: b, reason: collision with root package name */
    public final d1 f48081b;

    /* renamed from: c, reason: collision with root package name */
    public final String f48082c;

    /* renamed from: d, reason: collision with root package name */
    public final CardBrandFilter f48083d;

    /* renamed from: e, reason: collision with root package name */
    public final hq.r f48084e;

    /* renamed from: f, reason: collision with root package name */
    public final int f48085f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.o1 f48086g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.i2 f48087h;

    /* renamed from: i, reason: collision with root package name */
    public final w70.o1 f48088i;

    /* renamed from: j, reason: collision with root package name */
    public final w70.i2 f48089j;

    /* renamed from: k, reason: collision with root package name */
    public final uw.c f48090k;

    /* renamed from: l, reason: collision with root package name */
    public final y3.n f48091l;

    /* renamed from: m, reason: collision with root package name */
    public final uw.c f48092m;
    public final boolean n;
    public final w70.i2 o;

    /* renamed from: p, reason: collision with root package name */
    public final List f48093p;

    /* renamed from: q, reason: collision with root package name */
    public final w70.i2 f48094q;

    /* renamed from: r, reason: collision with root package name */
    public final uw.c f48095r;

    /* renamed from: s, reason: collision with root package name */
    public final w70.o1 f48096s;

    /* renamed from: t, reason: collision with root package name */
    public final w70.g2 f48097t;

    /* renamed from: u, reason: collision with root package name */
    public final w70.o1 f48098u;

    /* renamed from: v, reason: collision with root package name */
    public final w70.o1 f48099v;

    /* renamed from: w, reason: collision with root package name */
    public final w70.i2 f48100w;

    /* renamed from: x, reason: collision with root package name */
    public final w70.i2 f48101x;

    /* renamed from: y, reason: collision with root package name */
    public final uw.c f48102y;

    /* renamed from: z, reason: collision with root package name */
    public final uw.c f48103z;

    /* JADX WARN: Removed duplicated region for block: B:118:0x02a5 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0277  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0283  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public b2(d1 d1Var, hq.l cardAccountRangeRepository, CoroutineContext coroutineContext, CoroutineContext coroutineContext2, String str, s0 s0Var, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter) {
        List list;
        ft.b bVar;
        ft.b bVar2;
        boolean z11;
        int i5;
        int length;
        boolean z12;
        Object j3Var;
        hq.s sVar = new hq.s();
        y70.d dVarA = t70.k0.a(coroutineContext);
        hq.r rVar = new hq.r(cardAccountRangeRepository, coroutineContext, coroutineContext2, sVar, cardBrandFilter, cardFundingFilter, null, dVarA, 64);
        Intrinsics.g(cardAccountRangeRepository, "cardAccountRangeRepository");
        c2.m.f19181a.getClass();
        this.f48080a = c2.l.f19175e;
        this.f48081b = d1Var;
        this.f48082c = str;
        this.f48083d = cardBrandFilter;
        this.f48084e = rVar;
        this.f48085f = d1Var.f48120e;
        this.f48086g = ps.v.y(d1Var.f48119d);
        w70.i2 i2VarC = w70.u1.c(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f48087h = i2VarC;
        w70.o1 o1Var = new w70.o1(i2VarC);
        this.f48088i = o1Var;
        w70.i2 i2VarC2 = w70.u1.c(null);
        this.f48089j = i2VarC2;
        final int i11 = 0;
        this.f48090k = ps.v.j(o1Var, i2VarC2, new Function2(this) { // from class: cw.p1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b2 f48262b;

            {
                this.f48262b = this;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                ft.b bVar3;
                int iB;
                Object next;
                switch (i11) {
                    case 0:
                        String number = (String) obj;
                        Integer num = (Integer) obj2;
                        Intrinsics.g(number, "number");
                        if (num != null) {
                            iB = num.intValue();
                        } else {
                            ft.b.f55885m.getClass();
                            if (r70.k.U0(number)) {
                                bVar3 = ft.b.f55894x;
                            } else {
                                ArrayList arrayListR = b6.b.r(number);
                                int size = arrayListR.size();
                                List listP = arrayListR;
                                if (size != 1) {
                                    listP = null;
                                }
                                if (listP == null) {
                                    listP = ul.b.P(ft.b.f55894x);
                                }
                                bVar3 = (ft.b) b70.g.W0(listP);
                            }
                            iB = bVar3.b(number);
                        }
                        this.f48262b.f48081b.getClass();
                        return (iB == 14 || iB == 15) ? new g1() : iB != 19 ? new f1() : new h1();
                    default:
                        ft.b bVar4 = (ft.b) obj;
                        List allChoices = (List) obj2;
                        Intrinsics.g(allChoices, "allChoices");
                        b2 b2Var = this.f48262b;
                        CardBrandFilter cardBrandFilter2 = b2Var.f48083d;
                        List preferredBrands = b2Var.f48093p;
                        Intrinsics.g(cardBrandFilter2, "cardBrandFilter");
                        Intrinsics.g(preferredBrands, "preferredBrands");
                        List list2 = allChoices;
                        ArrayList arrayList = new ArrayList();
                        for (Object obj3 : list2) {
                            if (cardBrandFilter2.M((ft.b) obj3)) {
                                arrayList.add(obj3);
                            }
                        }
                        if (arrayList.size() == 1 && allChoices.size() > 1) {
                            return (ft.b) b70.g.y1(arrayList);
                        }
                        ft.b bVar5 = ft.b.f55894x;
                        if (bVar4 == bVar5) {
                            return bVar4;
                        }
                        if (b70.g.O0(list2, bVar4)) {
                            return bVar4 == null ? bVar5 : bVar4;
                        }
                        Iterator it = preferredBrands.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                next = it.next();
                                if (allChoices.contains((ft.b) next)) {
                                }
                            } else {
                                next = null;
                            }
                        }
                        ft.b bVar6 = (ft.b) next;
                        return bVar6 == null ? ft.b.f55894x : bVar6;
                }
            }
        });
        this.f48091l = y3.n.f96612a;
        uw.c cVarU = ps.v.u(i2VarC, new c0(this, 3));
        this.f48092m = ps.v.u(i2VarC, new cv.n(12));
        boolean z13 = s0Var instanceof q0;
        this.n = z13;
        EmptyList accountRanges = EmptyList.f71733a;
        w70.i2 i2VarC3 = w70.u1.c(accountRanges);
        this.o = i2VarC3;
        if (z13) {
            list = ((q0) s0Var).f48269a;
        } else {
            if (!(s0Var instanceof r0)) {
                throw new NoWhenBranchMatchedException();
            }
            list = accountRanges;
        }
        this.f48093p = list;
        if (z13) {
            bVar = ((q0) s0Var).f48270b;
        } else {
            if (!(s0Var instanceof r0)) {
                throw new NoWhenBranchMatchedException();
            }
            bVar = null;
        }
        w70.i2 i2VarC4 = w70.u1.c(bVar);
        this.f48094q = i2VarC4;
        final int i12 = 1;
        uw.c cVarJ = ps.v.j(i2VarC4, i2VarC3, new Function2(this) { // from class: cw.p1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b2 f48262b;

            {
                this.f48262b = this;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                ft.b bVar3;
                int iB;
                Object next;
                switch (i12) {
                    case 0:
                        String number = (String) obj;
                        Integer num = (Integer) obj2;
                        Intrinsics.g(number, "number");
                        if (num != null) {
                            iB = num.intValue();
                        } else {
                            ft.b.f55885m.getClass();
                            if (r70.k.U0(number)) {
                                bVar3 = ft.b.f55894x;
                            } else {
                                ArrayList arrayListR = b6.b.r(number);
                                int size = arrayListR.size();
                                List listP = arrayListR;
                                if (size != 1) {
                                    listP = null;
                                }
                                if (listP == null) {
                                    listP = ul.b.P(ft.b.f55894x);
                                }
                                bVar3 = (ft.b) b70.g.W0(listP);
                            }
                            iB = bVar3.b(number);
                        }
                        this.f48262b.f48081b.getClass();
                        return (iB == 14 || iB == 15) ? new g1() : iB != 19 ? new f1() : new h1();
                    default:
                        ft.b bVar4 = (ft.b) obj;
                        List allChoices = (List) obj2;
                        Intrinsics.g(allChoices, "allChoices");
                        b2 b2Var = this.f48262b;
                        CardBrandFilter cardBrandFilter2 = b2Var.f48083d;
                        List preferredBrands = b2Var.f48093p;
                        Intrinsics.g(cardBrandFilter2, "cardBrandFilter");
                        Intrinsics.g(preferredBrands, "preferredBrands");
                        List list2 = allChoices;
                        ArrayList arrayList = new ArrayList();
                        for (Object obj3 : list2) {
                            if (cardBrandFilter2.M((ft.b) obj3)) {
                                arrayList.add(obj3);
                            }
                        }
                        if (arrayList.size() == 1 && allChoices.size() > 1) {
                            return (ft.b) b70.g.y1(arrayList);
                        }
                        ft.b bVar5 = ft.b.f55894x;
                        if (bVar4 == bVar5) {
                            return bVar4;
                        }
                        if (b70.g.O0(list2, bVar4)) {
                            return bVar4 == null ? bVar5 : bVar4;
                        }
                        Iterator it = preferredBrands.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                next = it.next();
                                if (allChoices.contains((ft.b) next)) {
                                }
                            } else {
                                next = null;
                            }
                        }
                        ft.b bVar6 = (ft.b) next;
                        return bVar6 == null ? ft.b.f55894x : bVar6;
                }
            }
        });
        this.f48095r = cVarJ;
        w70.i2 i2Var = rVar.f60010m;
        w70.j1 j1Var = new w70.j1(i2VarC, new y1(i2Var, 1), new v1(this, (Continuation) null, i11));
        AccountRange accountRange = (AccountRange) b70.g.Y0(((hq.d) i2Var.getValue()).a());
        String str2 = (String) i2VarC.getValue();
        if (accountRange == null || (bVar2 = accountRange.f43124c.f55884b) == null) {
            ft.b.f55885m.getClass();
            bVar2 = (ft.b) b70.g.Y0(b6.b.p(str2));
            if (bVar2 == null) {
                bVar2 = ft.b.f55894x;
            }
        }
        w70.a2 a2Var = w70.y1.f94086a;
        w70.o1 o1VarZ = w70.u1.z(j1Var, dVarA, a2Var, bVar2);
        this.f48096s = o1VarZ;
        this.f48097t = z13 ? ps.v.j(i2VarC3, cVarJ, new b10.o1(18)) : o1VarZ;
        this.f48098u = w70.u1.z(new e10.q2(4, new w70.m[]{i2VarC, i2VarC3, cVarJ, i2Var}, new a2(this, null)), dVarA, a2Var, v((String) i2VarC.getValue(), (List) i2VarC3.getValue(), (ft.b) cVarJ.f91586b.invoke(), (AccountRange) b70.g.Y0(((hq.d) i2Var.getValue()).a())));
        u0 u0VarJ = w70.u1.j(o1VarZ, i2VarC, new y1(i2Var, 0), new u1(this, null, i11));
        ft.b brand = (ft.b) o1VarZ.f93973a.getValue();
        String number = (String) i2VarC.getValue();
        AccountRange accountRangeA = rVar.a();
        int iB = accountRangeA != null ? accountRangeA.f43123b : brand.b(number);
        Intrinsics.g(brand, "brand");
        Intrinsics.g(accountRanges, "accountRanges");
        Intrinsics.g(number, "number");
        if (r70.k.U0(number)) {
            j3Var = kw.f3.f72376b;
        } else {
            kw.h3 h3Var = (d1Var.f48117b.M(brand) || (d1Var.f48116a && number.length() <= d1Var.f48121f)) ? null : new kw.h3(2132019766, ul.b.P(brand.f55898b), false);
            if (h3Var != null) {
                j3Var = h3Var;
            } else if (brand == ft.b.f55894x) {
                j3Var = new kw.h3(2132019811, 2, (List) null);
            } else {
                boolean z14 = brand.b(number) != -1;
                CardFundingFilter cardFundingFilter2 = d1Var.f48118c;
                ArrayList arrayList = new ArrayList();
                for (Object obj : accountRanges) {
                    if (!((AccountRange) obj).f43122a.f43154c) {
                        arrayList.add(obj);
                    }
                }
                if (arrayList.isEmpty()) {
                    z11 = false;
                    boolean z15 = (number.length() >= d1Var.f48122g || arrayList.isEmpty() || z11) ? false : true;
                    Integer numE = cardFundingFilter2.E();
                    numE = (numE == null && z15) ? numE : null;
                    if (z14 || number.length() >= iB) {
                        i5 = 0;
                        length = number.length() - 1;
                        z12 = true;
                        while (true) {
                            if (-1 >= length) {
                                char cCharAt = number.charAt(length);
                                if (!Character.isDigit(cCharAt)) {
                                    break;
                                }
                                int numericValue = Character.getNumericValue(cCharAt);
                                boolean z16 = !z12;
                                numericValue = z12 ? numericValue : numericValue * 2;
                                if (numericValue > 9) {
                                    numericValue -= 9;
                                }
                                i5 += numericValue;
                                length--;
                                z12 = z16;
                            } else if (i5 % 10 == 0) {
                                j3Var = (z14 && number.length() == iB) ? numE != null ? new kw.j3(new kw.v0(numE.intValue())) : new kw.j3(null) : new kw.h3(2132019811, 6, (List) null);
                            }
                        }
                        j3Var = new kw.h3(2132019811, 2, (List) null);
                    } else {
                        j3Var = numE != null ? new kw.h3(new kw.v0(numE.intValue()), false) : new kw.g3(2132019811);
                    }
                } else {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        if (cardFundingFilter2.H(((AccountRange) it.next()).f43125d)) {
                            z11 = true;
                            break;
                        }
                    }
                    z11 = false;
                    if (number.length() >= d1Var.f48122g) {
                        Integer numE2 = cardFundingFilter2.E();
                        if (numE2 == null) {
                            if (z14) {
                                i5 = 0;
                                length = number.length() - 1;
                                z12 = true;
                                while (true) {
                                    if (-1 >= length) {
                                    }
                                    i5 += numericValue;
                                    length--;
                                    z12 = z16;
                                }
                                j3Var = new kw.h3(2132019811, 2, (List) null);
                            }
                        }
                    }
                }
            }
        }
        w70.o1 o1VarZ2 = w70.u1.z(u0VarJ, dVarA, a2Var, j3Var);
        this.f48099v = o1VarZ2;
        Boolean bool = Boolean.FALSE;
        w70.i2 i2VarC5 = w70.u1.c(bool);
        this.f48100w = i2VarC5;
        w70.i2 i2VarC6 = w70.u1.c(bool);
        this.f48101x = i2VarC6;
        this.f48102y = rVar.f60007j;
        uw.c cVarK = ps.v.k(o1VarZ2, i2VarC6, i2VarC5, new com.moloco.sdk.internal.publisher.nativead.ui.i(4));
        this.f48103z = cVarK;
        this.A = ps.v.j(cVarK, o1VarZ2, new b10.o1(19));
        uw.c cVarU2 = ps.v.u(o1VarZ2, new cv.n(13));
        this.B = cVarU2;
        this.C = ps.v.j(cVarU2, cVarU, new b10.o1(17));
        t(str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str);
        t70.m0.t(dVarA, coroutineContext, null, new cv.y(this, null, i12), 2);
    }

    @Override // kw.l2
    public final void a(boolean z11) {
        h6.c1.B(z11, this.f48100w, null);
    }

    @Override // kw.y2
    public final w70.g2 b() {
        return this.f48102y;
    }

    @Override // kw.y2
    public final w70.g2 c() {
        return this.f48098u;
    }

    @Override // kw.y2
    public final w70.g2 d() {
        return this.f48090k;
    }

    @Override // kw.y2
    public final w70.g2 e() {
        return ps.v.y(null);
    }

    @Override // kw.b1
    public final w70.g2 f() {
        return this.B;
    }

    @Override // kw.l2
    public final w70.g2 g() {
        return this.A;
    }

    @Override // kw.y2
    public final uw.c getContentDescription() {
        return this.f48092m;
    }

    @Override // kw.y2
    public final w70.g2 getLabel() {
        return this.f48086g;
    }

    @Override // kw.y2
    public final y3.n getLayoutDirection() {
        return this.f48091l;
    }

    @Override // kw.y2
    public final int h() {
        return 0;
    }

    @Override // kw.y2
    public final void i(boolean z11) {
        h6.c1.B(z11, this.f48101x, null);
    }

    @Override // kw.b1
    public final w70.g2 j() {
        return this.C;
    }

    @Override // kw.y2
    public final c2.f k() {
        return this.f48080a;
    }

    @Override // kw.y2
    public final String l() {
        return this.f48082c;
    }

    @Override // kw.y2
    public final boolean m() {
        return false;
    }

    @Override // kw.y2
    public final void n(kw.z2 item) {
        Intrinsics.g(item, "item");
        b6.b bVar = ft.b.f55885m;
        String str = item.f72742a;
        bVar.getClass();
        this.f48094q.j(b6.b.l(str));
    }

    @Override // kw.y2
    public final int o() {
        return this.f48085f;
    }

    @Override // kw.y2
    public final w70.g2 p() {
        return this.f48088i;
    }

    @Override // kw.j2
    public final void q(boolean z11, kw.k2 k2Var, b2.t modifier, Set set, IdentifierSpec identifierSpec, p1.o oVar, int i5) {
        Intrinsics.g(modifier, "modifier");
        p1.t tVar = (p1.t) oVar;
        tVar.b0(-1792651236);
        fw.e eVar = (fw.e) tVar.j(fw.f.f56150a);
        fw.c cVar = (fw.c) tVar.j(fw.d.f56149a);
        fw.a aVar = (fw.a) tVar.j(fw.b.f56148a);
        Object[] objArr = new Object[0];
        tVar.b0(-1824729757);
        Object objP = tVar.P();
        p1.g1 g1Var = p1.n.f81514a;
        if (objP == g1Var) {
            objP = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x(24);
            tVar.m0(objP);
        }
        tVar.p(false);
        p1.e1 e1Var = (p1.e1) y1.j.c(objArr, (Function0) objP, tVar, 48);
        Object[] objArr2 = new Object[0];
        tVar.b0(-1824725736);
        Object objP2 = tVar.P();
        if (objP2 == g1Var) {
            objP2 = new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x(25);
            tVar.m0(objP2);
        }
        tVar.p(false);
        p1.e1 e1Var2 = (p1.e1) y1.j.c(objArr2, (Function0) objP2, tVar, 48);
        Unit unit = Unit.f71706a;
        tVar.b0(-1824722871);
        boolean zH = tVar.h(this) | tVar.h(eVar) | tVar.f(e1Var) | tVar.h(cVar);
        Object objP3 = tVar.P();
        if (zH || objP3 == g1Var) {
            androidx.room.p pVar = new androidx.room.p(this, eVar, cVar, e1Var, null, 8);
            tVar.m0(pVar);
            objP3 = pVar;
        }
        tVar.p(false);
        p1.o0.f(unit, (Function2) objP3, tVar);
        tVar.b0(-1824687057);
        boolean zH2 = tVar.h(this) | tVar.f(e1Var2) | tVar.h(aVar);
        Object objP4 = tVar.P();
        if (zH2 || objP4 == g1Var) {
            androidx.room.q qVar = new androidx.room.q(this, e1Var2, aVar, (Continuation) null, 27);
            tVar.m0(qVar);
            objP4 = qVar;
        }
        tVar.p(false);
        p1.o0.f(unit, (Function2) objP4, tVar);
        kw.z0 z0Var = IdentifierSpec.Companion;
        vh.a.c(this, z11, k2Var, modifier, set, identifierSpec, tVar, i5 & 524286);
        tVar.p(false);
    }

    @Override // kw.y2
    public final kw.e3 r(String displayFormatted) {
        Intrinsics.g(displayFormatted, "displayFormatted");
        this.f48081b.getClass();
        StringBuilder sb2 = new StringBuilder();
        int length = displayFormatted.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = displayFormatted.charAt(i5);
            if (Character.isDigit(cCharAt)) {
                sb2.append(cCharAt);
            }
        }
        this.f48087h.j(sb2.toString());
        this.f48084e.b(new hq.f(displayFormatted), this.n);
        return null;
    }

    @Override // kw.y2
    public final w70.g2 s() {
        return this.f48099v;
    }

    @Override // kw.b1
    public final void t(String rawValue) {
        Intrinsics.g(rawValue, "rawValue");
        this.f48081b.getClass();
        r(rawValue);
    }

    @Override // kw.y2
    public final w70.g2 u() {
        return this.f48103z;
    }

    public final kw.d3 v(String str, List list, ft.b bVar, AccountRange accountRange) {
        boolean z11 = this.n;
        kw.z2 z2Var = null;
        CardBrandFilter cardBrandFilter = this.f48083d;
        if (!z11 || str.length() <= 0) {
            if (accountRange != null) {
                return new kw.c3(accountRange.f43124c.f55884b.f55899c, false, (n0.w) null, 10);
            }
            ft.b.f55885m.getClass();
            List listP = b6.b.p(str);
            ArrayList arrayList = new ArrayList();
            for (Object obj : listP) {
                if (cardBrandFilter.M((ft.b) obj)) {
                    arrayList.add(obj);
                }
            }
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                arrayList2.add(new kw.c3(((ft.b) it.next()).f55899c, false, (n0.w) null, 10));
            }
            List listE1 = b70.g.E1(arrayList2, 3);
            ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                arrayList3.add(new kw.c3(((ft.b) it2.next()).f55899c, false, (n0.w) null, 10));
            }
            return new kw.b3(listE1, b70.g.Q0(arrayList3, 3));
        }
        ft.b bVar2 = ft.b.f55894x;
        kw.z2 z2Var2 = new kw.z2(bVar2.f55897a, zg.a.G(2132019735), bVar2.f55899c, true);
        if (list.size() == 1) {
            ft.b bVar3 = (ft.b) list.get(0);
            z2Var = new kw.z2(bVar3.f55897a, zg.a.H(bVar3.f55898b), bVar3.f55899c, true);
        } else if (t1.f48305a[bVar.ordinal()] != 1) {
            z2Var = new kw.z2(bVar.f55897a, zg.a.H(bVar.f55898b), bVar.f55899c, true);
        }
        List<ft.b> list2 = list;
        ArrayList arrayList4 = new ArrayList(b70.c.u0(list2, 10));
        for (ft.b bVar4 : list2) {
            boolean zM = cardBrandFilter.M(bVar4);
            String str2 = bVar4.f55897a;
            String str3 = bVar4.f55898b;
            arrayList4.add(new kw.z2(str2, zM ? zg.a.H(str3) : zg.a.U(2132019738, new Object[]{str3}, EmptyList.f71733a), bVar4.f55899c, zM));
        }
        IdentifierResolvableString identifierResolvableStringG = zg.a.G(2132019736);
        if (z2Var != null) {
            z2Var2 = z2Var;
        }
        return new kw.a3(identifierResolvableStringG, list.size() < 2, z2Var2, arrayList4);
    }
}
