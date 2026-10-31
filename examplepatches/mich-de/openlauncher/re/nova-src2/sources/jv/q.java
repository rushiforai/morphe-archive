package jv;

import b.u4;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import e00.q4;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.builders.ListBuilder;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import w70.g2;
import w70.i2;
import w70.u1;
import z2.r1;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f70120a;

    /* renamed from: b, reason: collision with root package name */
    public final n f70121b;

    /* renamed from: c, reason: collision with root package name */
    public final h10.k1 f70122c;

    /* renamed from: d, reason: collision with root package name */
    public final b10.d0 f70123d;

    /* renamed from: e, reason: collision with root package name */
    public final b10.r f70124e;

    /* renamed from: f, reason: collision with root package name */
    public final g2 f70125f;

    /* renamed from: g, reason: collision with root package name */
    public final hv.a0 f70126g;

    /* renamed from: h, reason: collision with root package name */
    public final uw.c f70127h;

    /* renamed from: i, reason: collision with root package name */
    public final iv.c f70128i;

    /* renamed from: j, reason: collision with root package name */
    public final iv.c f70129j;

    /* renamed from: k, reason: collision with root package name */
    public final e f70130k;

    /* renamed from: l, reason: collision with root package name */
    public final n f70131l;

    /* renamed from: m, reason: collision with root package name */
    public final hv.a0 f70132m;
    public final i2 n;
    public final i2 o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f70133p;

    /* renamed from: q, reason: collision with root package name */
    public final uw.c f70134q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f70135r;

    /* renamed from: s, reason: collision with root package name */
    public final uw.c f70136s;

    /* renamed from: t, reason: collision with root package name */
    public final uw.c f70137t;

    /* renamed from: u, reason: collision with root package name */
    public final bt.e f70138u;

    public q(PaymentMethodMetadata paymentMethodMetadata, w70.o1 processing, w70.o1 o1Var, w70.o1 selection, fl.l lVar, n nVar, h10.k1 k1Var, b10.d0 d0Var, b10.r rVar, uw.c paymentMethods, w70.o1 mostRecentlySelectedSavedPaymentMethod, uw.c canRemove, g2 walletsState, uw.c canUpdateFullPaymentMethodDetails, hv.a0 a0Var, uw.c cVar, iv.c cVar2, iv.c cVar3, e eVar, n nVar2, hv.a0 a0Var2) {
        a80.e dispatcher = t70.y0.f88884a;
        u70.d mainDispatcher = y70.o.f96819a.f90673f;
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(processing, "processing");
        Intrinsics.g(selection, "selection");
        Intrinsics.g(paymentMethods, "paymentMethods");
        Intrinsics.g(mostRecentlySelectedSavedPaymentMethod, "mostRecentlySelectedSavedPaymentMethod");
        Intrinsics.g(canRemove, "canRemove");
        Intrinsics.g(walletsState, "walletsState");
        Intrinsics.g(canUpdateFullPaymentMethodDetails, "canUpdateFullPaymentMethodDetails");
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        this.f70120a = paymentMethodMetadata;
        this.f70121b = nVar;
        this.f70122c = k1Var;
        this.f70123d = d0Var;
        this.f70124e = rVar;
        this.f70125f = mostRecentlySelectedSavedPaymentMethod;
        this.f70126g = a0Var;
        this.f70127h = cVar;
        this.f70128i = cVar2;
        this.f70129j = cVar3;
        this.f70130k = eVar;
        this.f70131l = nVar2;
        this.f70132m = a0Var2;
        y70.d dVarA = t70.k0.a(dispatcher.plus(t70.m0.d()));
        i2 i2VarC = u1.c(selection.f93973a.getValue());
        this.n = i2VarC;
        this.o = i2VarC;
        this.f70133p = paymentMethodMetadata.S();
        uw.c cVarJ = ps.v.j(paymentMethods, mostRecentlySelectedSavedPaymentMethod, new g(this, 0));
        final int i5 = 0;
        uw.c cVarL = ps.v.l(paymentMethods, cVarJ, canRemove, canUpdateFullPaymentMethodDetails, new h(this, i5));
        uw.c cVarK = ps.v.k(paymentMethods, walletsState, (w70.o1) lVar.f55375c, new Function3(this) { // from class: jv.i

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ q f70069b;

            {
                this.f70069b = this;
            }

            @Override // kotlin.jvm.functions.Function3
            public final Object invoke(Object obj, Object obj2, Object obj3) {
                gv.y0 y0VarB;
                ResolvableString resolvableStringG;
                ResolvableString resolvableStringG2;
                int i11 = i5;
                q qVar = this.f70069b;
                switch (i11) {
                    case 0:
                        List paymentMethods2 = (List) obj;
                        gv.z0 z0Var = (gv.z0) obj2;
                        PaymentMethodIncentive paymentMethodIncentive = (PaymentMethodIncentive) obj3;
                        Intrinsics.g(paymentMethods2, "paymentMethods");
                        ArrayList arrayList = qVar.f70133p;
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            bt.g gVar = (bt.g) it.next();
                            PaymentMethodIncentive paymentMethodIncentiveA = paymentMethodIncentive != null ? paymentMethodIncentive.a(gVar.f18480a) : null;
                            q4 q4Var = new q4(23, qVar, gVar);
                            gVar.getClass();
                            PaymentMethod.Type type = PaymentMethod.Type.f43639i;
                            List list = paymentMethods2;
                            if ((list instanceof Collection) && list.isEmpty()) {
                                resolvableStringG2 = gVar.f18482c;
                            } else {
                                Iterator it2 = list.iterator();
                                while (true) {
                                    if (it2.hasNext()) {
                                        if (((PaymentMethod) it2.next()).f43573e == type) {
                                            if (Intrinsics.b(gVar.f18480a, "card")) {
                                                resolvableStringG2 = zg.a.G(2132019918);
                                            }
                                        }
                                    }
                                }
                            }
                            ResolvableString resolvableString = resolvableStringG2;
                            arrayList2.add(new t(gVar.f18480a, gVar.f18481b, resolvableString, gVar.f18483d, gVar.f18484e, gVar.f18485f, gVar.f18486g, gVar.f18487h, gVar.f18488i, paymentMethodIncentiveA != null ? paymentMethodIncentiveA.f44798b : null, q4Var, gVar.f18489j));
                        }
                        ArrayList arrayList3 = new ArrayList();
                        if (z0Var != null && (y0VarB = z0Var.b(gv.r0.f57932b)) != null) {
                            ps.v vVar = y0VarB.f57996a;
                            if (vVar instanceof ps.u) {
                                resolvableStringG = zg.a.H(((ps.u) vVar).f82966a);
                            } else {
                                if (!(vVar instanceof ps.t) && !(vVar instanceof ps.s)) {
                                    throw new NoWhenBranchMatchedException();
                                }
                                resolvableStringG = zg.a.G(2132019845);
                            }
                            ResolvableString resolvableString2 = resolvableStringG;
                            z2 z2Var = PaymentMethod.Type.f43637g;
                            arrayList3.add(new t("link", zg.a.G(2132019824), 2131232237, resolvableString2, new k(qVar, 0)));
                        }
                        if (z0Var != null && z0Var.a(gv.r0.f57932b) != null) {
                            arrayList3.add(new t("google_pay", zg.a.G(2132019793), 2131232128, null, new k(qVar, 1)));
                        }
                        return b70.g.t1(arrayList2, arrayList3);
                    default:
                        List paymentMethods3 = (List) obj;
                        gv.z0 z0Var2 = (gv.z0) obj2;
                        PaymentMethod paymentMethod = (PaymentMethod) obj3;
                        Intrinsics.g(paymentMethods3, "paymentMethods");
                        if (paymentMethod == null) {
                            paymentMethod = (PaymentMethod) b70.g.Y0(paymentMethods3);
                        }
                        PaymentMethod.Type type2 = paymentMethod != null ? paymentMethod.f43573e : null;
                        ArrayList arrayList4 = qVar.f70133p;
                        ArrayList arrayList5 = new ArrayList(b70.c.u0(arrayList4, 10));
                        Iterator it3 = arrayList4.iterator();
                        while (it3.hasNext()) {
                            arrayList5.add(((bt.g) it3.next()).f18480a);
                        }
                        ListBuilder listBuilderW = ul.b.w();
                        if (type2 != null) {
                            listBuilderW.add("saved");
                        }
                        if (z0Var2 != null && z0Var2.b(gv.r0.f57932b) != null) {
                            z2 z2Var2 = PaymentMethod.Type.f43637g;
                            listBuilderW.add("link");
                        }
                        if (z0Var2 != null && z0Var2.a(gv.r0.f57932b) != null) {
                            listBuilderW.add("google_pay");
                        }
                        listBuilderW.addAll(arrayList5);
                        return ul.b.m(listBuilderW);
                }
            }
        });
        final int i11 = 1;
        uw.c cVarK2 = ps.v.k(paymentMethods, walletsState, mostRecentlySelectedSavedPaymentMethod, new Function3(this) { // from class: jv.i

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ q f70069b;

            {
                this.f70069b = this;
            }

            @Override // kotlin.jvm.functions.Function3
            public final Object invoke(Object obj, Object obj2, Object obj3) {
                gv.y0 y0VarB;
                ResolvableString resolvableStringG;
                ResolvableString resolvableStringG2;
                int i112 = i11;
                q qVar = this.f70069b;
                switch (i112) {
                    case 0:
                        List paymentMethods2 = (List) obj;
                        gv.z0 z0Var = (gv.z0) obj2;
                        PaymentMethodIncentive paymentMethodIncentive = (PaymentMethodIncentive) obj3;
                        Intrinsics.g(paymentMethods2, "paymentMethods");
                        ArrayList arrayList = qVar.f70133p;
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            bt.g gVar = (bt.g) it.next();
                            PaymentMethodIncentive paymentMethodIncentiveA = paymentMethodIncentive != null ? paymentMethodIncentive.a(gVar.f18480a) : null;
                            q4 q4Var = new q4(23, qVar, gVar);
                            gVar.getClass();
                            PaymentMethod.Type type = PaymentMethod.Type.f43639i;
                            List list = paymentMethods2;
                            if ((list instanceof Collection) && list.isEmpty()) {
                                resolvableStringG2 = gVar.f18482c;
                            } else {
                                Iterator it2 = list.iterator();
                                while (true) {
                                    if (it2.hasNext()) {
                                        if (((PaymentMethod) it2.next()).f43573e == type) {
                                            if (Intrinsics.b(gVar.f18480a, "card")) {
                                                resolvableStringG2 = zg.a.G(2132019918);
                                            }
                                        }
                                    }
                                }
                            }
                            ResolvableString resolvableString = resolvableStringG2;
                            arrayList2.add(new t(gVar.f18480a, gVar.f18481b, resolvableString, gVar.f18483d, gVar.f18484e, gVar.f18485f, gVar.f18486g, gVar.f18487h, gVar.f18488i, paymentMethodIncentiveA != null ? paymentMethodIncentiveA.f44798b : null, q4Var, gVar.f18489j));
                        }
                        ArrayList arrayList3 = new ArrayList();
                        if (z0Var != null && (y0VarB = z0Var.b(gv.r0.f57932b)) != null) {
                            ps.v vVar = y0VarB.f57996a;
                            if (vVar instanceof ps.u) {
                                resolvableStringG = zg.a.H(((ps.u) vVar).f82966a);
                            } else {
                                if (!(vVar instanceof ps.t) && !(vVar instanceof ps.s)) {
                                    throw new NoWhenBranchMatchedException();
                                }
                                resolvableStringG = zg.a.G(2132019845);
                            }
                            ResolvableString resolvableString2 = resolvableStringG;
                            z2 z2Var = PaymentMethod.Type.f43637g;
                            arrayList3.add(new t("link", zg.a.G(2132019824), 2131232237, resolvableString2, new k(qVar, 0)));
                        }
                        if (z0Var != null && z0Var.a(gv.r0.f57932b) != null) {
                            arrayList3.add(new t("google_pay", zg.a.G(2132019793), 2131232128, null, new k(qVar, 1)));
                        }
                        return b70.g.t1(arrayList2, arrayList3);
                    default:
                        List paymentMethods3 = (List) obj;
                        gv.z0 z0Var2 = (gv.z0) obj2;
                        PaymentMethod paymentMethod = (PaymentMethod) obj3;
                        Intrinsics.g(paymentMethods3, "paymentMethods");
                        if (paymentMethod == null) {
                            paymentMethod = (PaymentMethod) b70.g.Y0(paymentMethods3);
                        }
                        PaymentMethod.Type type2 = paymentMethod != null ? paymentMethod.f43573e : null;
                        ArrayList arrayList4 = qVar.f70133p;
                        ArrayList arrayList5 = new ArrayList(b70.c.u0(arrayList4, 10));
                        Iterator it3 = arrayList4.iterator();
                        while (it3.hasNext()) {
                            arrayList5.add(((bt.g) it3.next()).f18480a);
                        }
                        ListBuilder listBuilderW = ul.b.w();
                        if (type2 != null) {
                            listBuilderW.add("saved");
                        }
                        if (z0Var2 != null && z0Var2.b(gv.r0.f57932b) != null) {
                            z2 z2Var2 = PaymentMethod.Type.f43637g;
                            listBuilderW.add("link");
                        }
                        if (z0Var2 != null && z0Var2.a(gv.r0.f57932b) != null) {
                            listBuilderW.add("google_pay");
                        }
                        listBuilderW.addAll(arrayList5);
                        return ul.b.m(listBuilderW);
                }
            }
        });
        this.f70134q = cVarK2;
        this.f70135r = paymentMethodMetadata.f43092a.getF43545m();
        this.f70136s = ps.v.i(new j(this, 0), cVarK, processing, i2VarC, cVarJ, cVarL, o1Var);
        this.f70137t = ps.v.u(walletsState, new iw.p(16));
        Continuation continuation = null;
        t70.m0.t(dVarA, mainDispatcher, null, new h6.c(selection, this, continuation, 18), 2);
        t70.m0.t(dVarA, mainDispatcher, null, new m(this, continuation, 0), 2);
        int i12 = 1;
        t70.m0.t(dVarA, mainDispatcher, null, new m(this, continuation, i12), 2);
        this.f70138u = new bt.e((List) cVarK2.f91586b.invoke(), new g(this, i12), dispatcher);
    }

    public static String a(PaymentSelection.New r42) {
        if (!(r42 instanceof PaymentSelection.New.Card)) {
            if (r42 instanceof PaymentSelection.New.USBankAccount) {
                return ((PaymentSelection.New.USBankAccount) r42).f44830a;
            }
            return null;
        }
        PaymentSelection.New.Card card = (PaymentSelection.New.Card) r42;
        ft.b bVar = card.f44815b;
        String str = bVar.f55898b;
        if (bVar == ft.b.f55894x) {
            str = null;
        }
        String strConcat = str != null ? str.concat(" ") : null;
        if (strConcat == null) {
            strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return u4.m(strConcat, "···· ", card.f44820g);
    }

    public final void b(c1 c1Var) {
        boolean z11;
        int iE0;
        boolean z12;
        boolean z13;
        boolean z14;
        boolean z15 = c1Var instanceof y0;
        iv.c cVar = this.f70128i;
        if (z15) {
            String paymentMethodCode = ((y0) c1Var).f70187a;
            cVar.invoke(paymentMethodCode);
            if (((ou.n) this.f70121b.invoke(paymentMethodCode)).equals(ou.l.f80925b)) {
                this.f70129j.invoke(paymentMethodCode);
                this.f70124e.invoke(paymentMethodCode);
                return;
            }
            Intrinsics.g(paymentMethodCode, "paymentMethodCode");
            PaymentMethodMetadata metadata = this.f70120a;
            Intrinsics.g(metadata, "metadata");
            this.f70122c.invoke(new yu.a(paymentMethodCode, metadata.f43099h, metadata.f43100i, metadata.b(), metadata.f43102k, metadata.f43103l, metadata.f43108s, metadata.m(paymentMethodCode), metadata.f43093b).a(), paymentMethodCode);
            return;
        }
        if (c1Var instanceof z0) {
            cVar.invoke("saved");
            this.f70126g.invoke(new PaymentSelection.Saved(((z0) c1Var).f70201a, null, null), Boolean.TRUE);
            return;
        }
        if (c1Var instanceof a1) {
            this.f70123d.invoke();
            return;
        }
        if (c1Var instanceof x0) {
            this.f70130k.invoke(((x0) c1Var).f70186a);
            return;
        }
        boolean z16 = c1Var instanceof b1;
        bt.e eVar = this.f70138u;
        if (!z16) {
            if (!(c1Var instanceof w0)) {
                throw new NoWhenBranchMatchedException();
            }
            eVar.h();
            return;
        }
        b1 b1Var = (b1) c1Var;
        String itemCode = b1Var.f69993a;
        z2.y coordinates = b1Var.f69994b;
        if (eVar.f18449a) {
            return;
        }
        List items = (List) this.f70134q.f91586b.invoke();
        Intrinsics.g(items, "items");
        if (!Intrinsics.b((List) eVar.f18450b, items)) {
            eVar.f18450b = items;
            eVar.h();
        }
        LinkedHashMap linkedHashMap = (LinkedHashMap) eVar.f18453e;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) eVar.f18454f;
        LinkedHashMap linkedHashMap3 = (LinkedHashMap) eVar.f18452d;
        Intrinsics.g(itemCode, "itemCode");
        Intrinsics.g(coordinates, "coordinates");
        if (!((List) eVar.f18450b).contains(itemCode) || ((List) eVar.f18450b).isEmpty() || eVar.f18449a || !coordinates.isAttached()) {
            return;
        }
        long jX = coordinates.x(0L);
        long jG = coordinates.g();
        h2.c cVarE = r1.e(coordinates);
        d0 d0Var = new d0(jX, jG, cVarE);
        float f11 = cVarE.f59018a;
        float f12 = cVarE.f59021d;
        float f13 = cVarE.f59020c;
        float f14 = cVarE.f59019b;
        if (f11 == 0.0f && f14 == 0.0f && f13 == 0.0f && f12 == 0.0f) {
            z12 = false;
        } else {
            int i5 = ((int) (jG >> 32)) * ((int) (jG & 4294967295L));
            float f15 = (f13 - f11) * (f12 - f14);
            if (i5 > 0) {
                z11 = false;
                iE0 = kotlin.ranges.a.e0((int) ((f15 / i5) * 100), 0, 100);
            } else {
                z11 = false;
                iE0 = 0;
            }
            z12 = iE0 >= 95 ? true : z11;
        }
        d0 d0Var2 = (d0) linkedHashMap.get(itemCode);
        if (d0Var2 != null) {
            z13 = h2.b.b(d0Var2.f70000a, jX) && y3.m.a(d0Var2.f70001b, jG) && d0Var2.f70002c.equals(cVarE);
            linkedHashMap = linkedHashMap;
        } else {
            z13 = false;
        }
        linkedHashMap.put(itemCode, d0Var);
        boolean zB = Intrinsics.b(linkedHashMap3.get(itemCode), Boolean.valueOf(z12));
        linkedHashMap3.put(itemCode, Boolean.valueOf(z12));
        if (z13 && zB) {
            linkedHashMap2.put(itemCode, Boolean.TRUE);
        } else {
            linkedHashMap2.remove(itemCode);
            t70.g2 g2Var = (t70.g2) eVar.f18456h;
            if (g2Var != null) {
                g2Var.c(null);
            }
        }
        Collection collectionValues = linkedHashMap3.values();
        if ((collectionValues instanceof Collection) && collectionValues.isEmpty()) {
            z14 = false;
        } else {
            Iterator it = collectionValues.iterator();
            while (it.hasNext()) {
                if (((Boolean) it.next()).booleanValue()) {
                    z14 = true;
                    break;
                }
            }
            z14 = false;
        }
        if (((List) eVar.f18450b).size() == linkedHashMap2.size() && ((List) eVar.f18450b).size() == linkedHashMap3.size()) {
            List<String> list = (List) eVar.f18450b;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                for (String str : list) {
                    if (!Intrinsics.b(linkedHashMap2.get(str), Boolean.TRUE) || !linkedHashMap3.containsKey(str)) {
                        return;
                    }
                }
            }
            if (!z14 || eVar.f18449a) {
                return;
            }
            t70.g2 g2Var2 = (t70.g2) eVar.f18456h;
            Continuation continuation = null;
            if (g2Var2 != null) {
                g2Var2.c(null);
            }
            eVar.f18456h = t70.m0.t((y70.d) eVar.f18455g, null, null, new h6.c(eVar, continuation, 21), 3);
        }
    }
}
