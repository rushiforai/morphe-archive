package hv;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import java.util.ArrayList;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d0 implements x0 {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f60194a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f60195b;

    /* renamed from: c, reason: collision with root package name */
    public final u f60196c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f60197d;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f60198e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f60199f;

    /* renamed from: g, reason: collision with root package name */
    public final w70.i2 f60200g;

    /* renamed from: h, reason: collision with root package name */
    public final w70.i2 f60201h;

    /* renamed from: i, reason: collision with root package name */
    public final l f60202i;

    /* renamed from: j, reason: collision with root package name */
    public final w70.o1 f60203j;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [kotlin.coroutines.Continuation] */
    public d0(y0 y0Var, PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration, u uVar, boolean z11, t70.j0 coroutineScope, Function1 function1, Function1 function12) {
        l lVar;
        boolean z12;
        q qVar;
        l lVar2;
        String string;
        String strE;
        Intrinsics.g(coroutineScope, "coroutineScope");
        this.f60194a = y0Var;
        this.f60195b = paymentSheet$BillingDetailsCollectionConfiguration;
        this.f60196c = uVar;
        this.f60197d = z11;
        this.f60198e = function1;
        this.f60199f = function12;
        int i5 = 1;
        if (uVar != null) {
            p pVarA = a(uVar);
            boolean z13 = uVar.f60609c;
            Integer num = y0Var.f60682b;
            Integer num2 = y0Var.f60683c;
            lVar = null;
            if (z13 || (num != null && num.intValue() >= 1 && num.intValue() <= 12 && num2 != null && num2.intValue() >= 2000 && num2.intValue() <= 2100)) {
                String strSubstring = "00";
                if (num == null || num.intValue() < 1 || num.intValue() > 12) {
                    string = "00";
                } else if (num.intValue() < 10) {
                    string = "0" + num;
                } else {
                    string = num.toString();
                }
                if (num2 != null && num2.intValue() >= 2000 && num2.intValue() <= 2100) {
                    strSubstring = num2.toString().substring(2, 4);
                    Intrinsics.f(strSubstring, "substring(...)");
                }
                strE = b.c0.E(string, strSubstring);
            } else {
                strE = "•• / ••";
            }
            z12 = false;
            qVar = new q(pVarA, new a1(strE, z13, false, new kw.b0()));
        } else {
            lVar = null;
            z12 = false;
            qVar = null;
        }
        w70.i2 i2VarC = w70.u1.c(qVar);
        this.f60200g = i2VarC;
        this.f60201h = w70.u1.c(lVar);
        boolean z14 = (!(uVar != null ? uVar.f60609c : true) || paymentSheet$BillingDetailsCollectionConfiguration.f44516d == ou.m0.f80932b) ? z12 : true;
        z12 = (paymentSheet$BillingDetailsCollectionConfiguration.e() || paymentSheet$BillingDetailsCollectionConfiguration.d() || paymentSheet$BillingDetailsCollectionConfiguration.i()) ? true : z12;
        if (z14 || z12) {
            lVar2 = new l(y0Var.f60687g, paymentSheet$BillingDetailsCollectionConfiguration.f44516d, (!paymentSheet$BillingDetailsCollectionConfiguration.e() || uVar == null) ? paymentSheet$BillingDetailsCollectionConfiguration.e() ? g1.f60270b : g1.f60269a : g1.f60271c, paymentSheet$BillingDetailsCollectionConfiguration.d(), paymentSheet$BillingDetailsCollectionConfiguration.i(), paymentSheet$BillingDetailsCollectionConfiguration.b());
        } else {
            lVar2 = lVar;
        }
        this.f60202i = lVar2;
        this.f60203j = w70.u1.z(w70.u1.v(new c0(this, lVar, i5), i2VarC), coroutineScope, w70.y1.f94086a, c((q) i2VarC.getValue(), lVar2));
        a80.e eVar = t70.y0.f88884a;
        t70.m0.t(coroutineScope, y70.o.f96819a, null, new cv.y(this, null, 19), 2);
    }

    public final p a(u uVar) {
        CardBrandFilter cardBrandFilter = uVar.f60607a;
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        b6.b bVar = ft.b.f55885m;
        String str = this.f60194a.f60685e;
        bVar.getClass();
        ft.b bVarL = b6.b.l(str);
        return new p(bVarL, cardBrandFilter.M(bVarL));
    }

    public final void b(w0 w0Var) {
        Object value;
        q qVar;
        Object value2;
        q qVarA;
        Object value3;
        q qVar2;
        boolean z11 = w0Var instanceof t0;
        u uVar = this.f60196c;
        w70.i2 i2Var = this.f60200g;
        if (z11) {
            p pVar = ((t0) w0Var).f60597a;
            if (uVar != null) {
                q0 q0Var = ((r0) this.f60203j.f93973a.getValue()).f60538c;
                if (!Intrinsics.b(pVar, q0Var != null ? q0Var.f60505a : null)) {
                    this.f60198e.invoke(pVar.f60464a);
                }
                do {
                    value3 = i2Var.getValue();
                    qVar2 = (q) value3;
                } while (!i2Var.i(value3, qVar2 != null ? q.a(qVar2, pVar, null, 2) : null));
                return;
            }
            return;
        }
        if (w0Var instanceof u0) {
            String proposedValue = ((u0) w0Var).f60610a;
            if (uVar != null) {
                do {
                    value2 = i2Var.getValue();
                    q qVar3 = (q) value2;
                    if (qVar3 != null) {
                        a1 a1VarA = qVar3.f60504b;
                        Intrinsics.g(proposedValue, "proposedValue");
                        if (wh.f.A(a1VarA.f60110e, a1VarA.f60106a, proposedValue)) {
                            a1VarA = a1.a(a1VarA, proposedValue, 14);
                        }
                        qVarA = q.a(qVar3, null, a1VarA, 1);
                    } else {
                        qVarA = null;
                    }
                } while (!i2Var.i(value2, qVarA));
                return;
            }
            return;
        }
        if (w0Var instanceof s0) {
            k kVar = new k(((s0) w0Var).f60580a);
            w70.i2 i2Var2 = this.f60201h;
            i2Var2.getClass();
            i2Var2.k(null, kVar);
            return;
        }
        if (!(w0Var instanceof v0)) {
            throw new NoWhenBranchMatchedException();
        }
        do {
            value = i2Var.getValue();
            qVar = (q) value;
        } while (!i2Var.i(value, qVar != null ? q.a(qVar, null, a1.a(qVar.f60504b, null, 11), 1) : null));
        l lVar = this.f60202i;
        if (lVar != null) {
            kw.q2 q2Var = lVar.f60373b;
            if (q2Var != null) {
                q2Var.a(true);
            }
            lVar.f60374c.a(true);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r8v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r8v2, types: [java.util.ArrayList] */
    public final r0 c(q qVar, l lVar) {
        ?? arrayList;
        b6.b bVar = ft.b.f55885m;
        y0 y0Var = this.f60194a;
        String str = y0Var.f60685e;
        bVar.getClass();
        ft.b bVarL = b6.b.l(str);
        q0 q0Var = null;
        if (bVarL == ft.b.f55894x) {
            bVarL = null;
        }
        if (bVarL == null) {
            bVarL = y0Var.f60684d;
        }
        int iA = x1.a(bVarL);
        u uVar = this.f60196c;
        if (uVar != null && qVar != null) {
            p pVar = qVar.f60503a;
            boolean z11 = uVar.f60608b;
            CardBrandFilter cardBrandFilter = uVar.f60607a;
            Intrinsics.g(cardBrandFilter, "cardBrandFilter");
            Set set = y0Var.f60686f;
            if (set != null) {
                Set<String> set2 = set;
                arrayList = new ArrayList(b70.c.u0(set2, 10));
                for (String str2 : set2) {
                    ft.b.f55885m.getClass();
                    ft.b bVarL2 = b6.b.l(str2);
                    arrayList.add(new p(bVarL2, cardBrandFilter.M(bVarL2)));
                }
            } else {
                arrayList = EmptyList.f71733a;
            }
            q0Var = new q0(pVar, z11, arrayList, qVar.f60504b);
        }
        return new r0(y0Var, iA, q0Var, lVar);
    }
}
