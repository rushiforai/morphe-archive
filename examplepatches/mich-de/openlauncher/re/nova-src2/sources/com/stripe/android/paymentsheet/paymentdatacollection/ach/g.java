package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import android.app.Application;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.model.Address;
import com.stripe.android.model.IncentiveEligibilitySession;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.ui.core.Amount;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.d4;
import cw.f4;
import cw.v3;
import cw.w3;
import e1.o;
import ft.d0;
import h6.f1;
import h6.g1;
import h6.u0;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kw.c1;
import kw.h2;
import kw.l;
import kw.o0;
import kw.o1;
import kw.p;
import kw.p0;
import kw.t2;
import kw.z0;
import ou.m0;
import ou.n0;
import ou.w0;
import ps.v;
import r70.k;
import w70.g2;
import w70.i2;
import w70.n1;
import w70.t1;
import w70.u1;
import zu.s;

/* loaded from: classes4.dex */
public final class g extends f1 {
    public final t1 A;
    public final n1 B;
    public final uw.c C;
    public final uw.c D;
    public eu.d E;

    /* renamed from: a, reason: collision with root package name */
    public final s f44876a;

    /* renamed from: b, reason: collision with root package name */
    public final Application f44877b;

    /* renamed from: c, reason: collision with root package name */
    public final w60.a f44878c;

    /* renamed from: d, reason: collision with root package name */
    public final u0 f44879d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f44880e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f44881f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f44882g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f44883h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f44884i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f44885j;

    /* renamed from: k, reason: collision with root package name */
    public final t2 f44886k;

    /* renamed from: l, reason: collision with root package name */
    public final uw.c f44887l;

    /* renamed from: m, reason: collision with root package name */
    public final t2 f44888m;
    public final uw.c n;
    public final IdentifierSpec o;

    /* renamed from: p, reason: collision with root package name */
    public final o1 f44889p;

    /* renamed from: q, reason: collision with root package name */
    public final uw.c f44890q;

    /* renamed from: r, reason: collision with root package name */
    public final h2 f44891r;

    /* renamed from: s, reason: collision with root package name */
    public final kw.d f44892s;

    /* renamed from: t, reason: collision with root package name */
    public final uw.c f44893t;

    /* renamed from: u, reason: collision with root package name */
    public final g2 f44894u;

    /* renamed from: v, reason: collision with root package name */
    public final w3 f44895v;

    /* renamed from: w, reason: collision with root package name */
    public final i2 f44896w;

    /* renamed from: x, reason: collision with root package name */
    public final f4 f44897x;

    /* renamed from: y, reason: collision with root package name */
    public final i2 f44898y;

    /* renamed from: z, reason: collision with root package name */
    public final uw.c f44899z;

    /* JADX WARN: Removed duplicated region for block: B:53:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01ac  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(s sVar, Application application, av.a lazyPaymentConfig, u0 u0Var, p pVar) {
        PaymentSheet$Address paymentSheet$Address;
        String str;
        IdentifierSpec identifierSpec;
        PaymentSheet$Address paymentSheet$Address2;
        IdentifierSpec identifierSpec2;
        Address address;
        Address address2;
        h2 h2Var;
        h2 h2Var2;
        kw.d aVar;
        BankFormScreenState bankFormScreenState;
        d4 d4Var;
        g2 g2Var;
        Boolean boolA;
        PaymentSelection.New.USBankAccount.Input input;
        Boolean boolT1;
        PaymentSelection.New.USBankAccount.Input input2;
        String str2;
        PaymentSelection.New.USBankAccount uSBankAccount = sVar.f98668k;
        Intrinsics.g(lazyPaymentConfig, "lazyPaymentConfig");
        this.f44876a = sVar;
        this.f44877b = application;
        this.f44878c = lazyPaymentConfig;
        this.f44879d = u0Var;
        yu.a aVar2 = sVar.f98661d;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = aVar2.f97650e;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails2 = aVar2.f97650e;
        AddressDetails addressDetails = aVar2.f97651f;
        this.f44880e = paymentSheet$BillingDetails;
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = aVar2.f97654i;
        this.f44881f = paymentSheet$BillingDetailsCollectionConfiguration;
        m0 m0Var = paymentSheet$BillingDetailsCollectionConfiguration.f44516d;
        n0 n0Var = paymentSheet$BillingDetailsCollectionConfiguration.f44513a;
        boolean z11 = paymentSheet$BillingDetailsCollectionConfiguration.f44517e;
        boolean z12 = m0Var == m0.f80933c;
        this.f44882g = z12;
        n0 n0Var2 = paymentSheet$BillingDetailsCollectionConfiguration.f44514b;
        n0 n0Var3 = n0.f80940c;
        boolean z13 = n0Var2 == n0Var3;
        this.f44883h = z13;
        boolean z14 = !sVar.f98658a ? n0Var == n0.f80939b : n0Var != n0Var3;
        this.f44884i = z14;
        boolean z15 = paymentSheet$BillingDetailsCollectionConfiguration.f44515c != n0.f80939b;
        this.f44885j = z15;
        Continuation continuation = null;
        boolean z16 = z12;
        int i5 = 4;
        t2 t2Var = new t2(new c1(), uSBankAccount != null ? uSBankAccount.f44832c.f44839a : ((z14 || z11) && paymentSheet$BillingDetails != null) ? paymentSheet$BillingDetails.f44511c : null, null, i5);
        this.f44886k = t2Var;
        xu.c cVar = new xu.c(8);
        uw.c cVar2 = t2Var.f72655x;
        uw.c cVarU = v.u(cVar2, cVar);
        this.f44887l = cVarU;
        String str3 = uSBankAccount != null ? uSBankAccount.f44832c.f44840b : ((z15 || z11) && paymentSheet$BillingDetails != null) ? paymentSheet$BillingDetails.f44510b : null;
        Pattern pattern = p0.f72544f;
        if (uSBankAccount != null && (input2 = uSBankAccount.f44832c) != null && (str2 = input2.f44840b) != null) {
            str3 = str2;
        }
        boolean z17 = z14;
        boolean z18 = z13;
        t2 t2Var2 = new t2(new p0(false, 1), str3, null, i5);
        this.f44888m = t2Var2;
        xu.c cVar3 = new xu.c(13);
        uw.c cVar4 = t2Var2.f72655x;
        uw.c cVarU2 = v.u(cVar4, cVar3);
        this.n = cVarU2;
        if (uSBankAccount != null) {
            Address address3 = uSBankAccount.f44832c.f44842d;
            str = address3 != null ? address3.f43128b : null;
        } else if ((z18 || z11) && paymentSheet$BillingDetails != null && (paymentSheet$Address = paymentSheet$BillingDetails.f44509a) != null) {
            str = paymentSheet$Address.f44448b;
        }
        String str4 = uSBankAccount != null ? uSBankAccount.f44832c.f44841c : ((z18 || z11) && paymentSheet$BillingDetails != null) ? paymentSheet$BillingDetails.f44512d : null;
        if (z18) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = IdentifierSpec.n;
        } else if (z15) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = IdentifierSpec.f45372m;
        } else if (z17) {
            IdentifierSpec.Companion.getClass();
            identifierSpec = IdentifierSpec.f45364e;
        } else {
            identifierSpec = null;
        }
        this.o = identifierSpec;
        o1 o1VarA = o0.a(str4 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str4, 28, str, false, false);
        uw.c cVar5 = o1VarA.f72531m;
        this.f44889p = o1VarA;
        uw.c cVarU3 = v.u(cVar5, new xu.c(14));
        this.f44890q = cVarU3;
        if (uSBankAccount != null) {
            address = uSBankAccount.f44832c.f44842d;
            identifierSpec2 = identifierSpec;
        } else if ((!z16 && !z11) || paymentSheet$BillingDetails == null || (paymentSheet$Address2 = paymentSheet$BillingDetails.f44509a) == null) {
            identifierSpec2 = identifierSpec;
            address = null;
        } else {
            identifierSpec2 = identifierSpec;
            address = new Address(paymentSheet$Address2.f44447a, paymentSheet$Address2.f44448b, paymentSheet$Address2.f44449c, paymentSheet$Address2.f44450d, paymentSheet$Address2.f44451e, paymentSheet$Address2.f44452f);
        }
        if (addressDetails != null) {
            Map mapC = pu.b.c(addressDetails, paymentSheet$BillingDetails);
            IdentifierSpec.Companion.getClass();
            IdentifierSpec identifierSpec3 = IdentifierSpec.f45382y;
            String str5 = (String) mapC.get(identifierSpec3);
            if (str5 == null || (boolT1 = k.t1(str5)) == null) {
                address2 = address;
                h2Var = null;
            } else {
                address2 = address;
                h2Var = new h2(identifierSpec3, new v3(boolT1.booleanValue()));
            }
        }
        this.f44891r = h2Var;
        Map map = b70.h.f17594a;
        if (pVar != null) {
            IdentifierSpec.Companion.getClass();
            h2 h2Var3 = h2Var;
            aVar = new l(z0.a("billing_details[address]"), address2 != null ? h.a(address2) : map, paymentSheet$BillingDetailsCollectionConfiguration.b(), null, null, null, null, h2Var3, addressDetails != null ? pu.b.c(addressDetails, paymentSheet$BillingDetails2) : null, pVar, false, 1144);
            h2Var2 = h2Var3;
        } else {
            h2Var2 = h2Var;
            aVar = null;
        }
        if (aVar == null) {
            IdentifierSpec.Companion.getClass();
            aVar = new com.stripe.android.uicore.elements.a(z0.a("billing_details[address]"), address2 != null ? h.a(address2) : map, null, paymentSheet$BillingDetailsCollectionConfiguration.b(), null, h2Var2, addressDetails != null ? pu.b.c(addressDetails, paymentSheet$BillingDetails2) : null, false, false, TTAdConstant.DEEPLINK_FALLBACK_CODE);
        }
        kw.d dVar = aVar;
        this.f44892s = dVar;
        uw.c cVarU4 = v.u(dVar.e(), new xu.c(15));
        this.f44893t = cVarU4;
        this.f44894u = z16 ? v.u(dVar.f(), new xu.k(this, 9)) : v.y(identifierSpec2);
        w3 w3Var = new w3((uSBankAccount == null || (input = uSBankAccount.f44832c) == null) ? false : input.f44843e, aVar2.f97648c);
        this.f44895v = w3Var;
        i2 i2Var = (i2) w3Var.f48367c.f48347f;
        this.f44896w = i2Var;
        f4 f4Var = sVar.o ? new f4((uSBankAccount == null || (boolA = iv.h.a(uSBankAccount)) == null) ? false : boolA.booleanValue(), i2Var, sVar.f98671p) : null;
        this.f44897x = f4Var;
        if (uSBankAccount != null) {
            bankFormScreenState = uSBankAccount.f44833d;
        } else {
            boolean z19 = sVar.f98664g;
            PaymentMethodIncentive paymentMethodIncentive = sVar.f98659b;
            bankFormScreenState = new BankFormScreenState(z19, paymentMethodIncentive != null ? paymentMethodIncentive.f44798b : null, false, null, null);
        }
        i2 i2VarC = u1.c(bankFormScreenState);
        this.f44898y = i2VarC;
        uw.c cVarL = v.l(cVarU, cVarU2, cVarU3, cVarU4, new o(2));
        int i11 = 11;
        uw.c cVarJ = v.j(i2VarC, i2Var, new ux.s(this, i11));
        this.f44899z = cVarJ;
        t1 t1VarB = u1.b(0, 1, null, 5);
        this.A = t1VarB;
        this.B = new n1(t1VarB);
        this.C = v.k(cVarJ, cVarL, (f4Var == null || (d4Var = f4Var.f48150f) == null || (g2Var = d4Var.f48129c) == null) ? v.y(Boolean.FALSE) : g2Var, new c1.f(this, 6));
        this.D = v.l(v.u(cVar2, new xu.c(9)), v.u(cVar4, new xu.c(10)), v.u(cVar5, new xu.c(i11)), v.u(dVar.e(), new xu.c(12)), new jv.h(this, 4));
        t70.m0.t(g1.f(this), null, null, new u6.a(this, continuation, 8), 3);
        PaymentSheet$BillingDetails paymentSheet$BillingDetails3 = aVar2.f97650e;
        if ((paymentSheet$BillingDetails3 != null ? paymentSheet$BillingDetails3.f44511c : null) != null) {
            boolean z21 = aVar2.f97654i.f44517e;
        }
        if ((paymentSheet$BillingDetails3 != null ? paymentSheet$BillingDetails3.f44510b : null) != null) {
            boolean z22 = aVar2.f97654i.f44517e;
        }
    }

    public final ResolvableString e(boolean z11, boolean z12) {
        CharSequence charSequenceSubSequence;
        s sVar = this.f44876a;
        if (sVar.f98672q == w0.f80998b) {
            return null;
        }
        String str = sVar.f98661d.f97648c;
        int length = str.length() - 1;
        if (length >= 0) {
            while (true) {
                int i5 = length - 1;
                if (str.charAt(length) != '.') {
                    charSequenceSubSequence = str.subSequence(0, length + 1);
                    break;
                }
                if (i5 < 0) {
                    break;
                }
                length = i5;
            }
            charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return ph.a.k(charSequenceSubSequence.toString(), sVar.f98673r, sVar.f98674s, z11, z12, sVar.f98658a, !sVar.f98664g);
    }

    public final wu.c g() {
        return this.f44876a.f98662e ? ((Boolean) this.f44896w.getValue()).booleanValue() ? wu.c.f94689b : wu.c.f94690c : wu.c.f94691d;
    }

    public final CollectBankAccountConfiguration.USBankAccountInternal h() {
        return new CollectBankAccountConfiguration.USBankAccountInternal((String) this.f44887l.f91586b.invoke(), (String) this.n.f91586b.invoke(), i());
    }

    public final ElementsSessionContext i() {
        IncentiveEligibilitySession deferredIntent;
        ElementsSessionContext.AllowRedisplay allowRedisplay;
        String lowerCase;
        s sVar = this.f44876a;
        String str = sVar.f98665h;
        yu.a aVar = sVar.f98661d;
        Intrinsics.d(str);
        if (sVar.f98659b != null) {
            deferredIntent = sVar.f98666i == null ? new IncentiveEligibilitySession.DeferredIntent(str) : sVar.f98664g ? new IncentiveEligibilitySession.PaymentIntent(str) : new IncentiveEligibilitySession.SetupIntent(str);
        } else {
            deferredIntent = null;
        }
        Amount amount = aVar.f97649d;
        Long lValueOf = amount != null ? Long.valueOf(amount.f45272a) : null;
        Amount amount2 = aVar.f97649d;
        String str2 = amount2 != null ? amount2.f45273b : null;
        d0 d0Var = sVar.f98660c;
        wu.c cVarG = g();
        yu.a aVar2 = sVar.f98661d;
        int iOrdinal = aVar2.f97652g.e0(aVar2.f97653h, cVarG).ordinal();
        if (iOrdinal == 0) {
            allowRedisplay = ElementsSessionContext.AllowRedisplay.f42640b;
        } else if (iOrdinal == 1) {
            allowRedisplay = ElementsSessionContext.AllowRedisplay.f42641c;
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            allowRedisplay = ElementsSessionContext.AllowRedisplay.f42642d;
        }
        ElementsSessionContext.AllowRedisplay allowRedisplay2 = allowRedisplay;
        boolean z11 = this.f44881f.f44517e;
        Object objInvoke = this.f44887l.f91586b.invoke();
        if (!this.f44884i && !z11) {
            objInvoke = null;
        }
        String str3 = (String) objInvoke;
        uw.c cVar = this.n;
        Object objInvoke2 = cVar.f91586b.invoke();
        if (!this.f44885j && !z11) {
            objInvoke2 = null;
        }
        String str4 = (String) objInvoke2;
        uw.c cVar2 = this.f44890q;
        Object objInvoke3 = cVar2.f91586b.invoke();
        if (!this.f44883h && !z11) {
            objInvoke3 = null;
        }
        String str5 = (String) objInvoke3;
        Object objInvoke4 = this.f44893t.f91586b.invoke();
        if (!this.f44882g && !z11) {
            objInvoke4 = null;
        }
        Address address = (Address) objInvoke4;
        if (str4 != null) {
            lowerCase = str4.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
        } else {
            lowerCase = null;
        }
        ElementsSessionContext.BillingDetails billingDetails = new ElementsSessionContext.BillingDetails(str3, str5, lowerCase, address != null ? new ElementsSessionContext.BillingDetails.Address(address.f43129c, address.f43130d, address.f43131e, address.f43127a, address.f43132f, address.f43128b) : null);
        String str6 = (String) cVar.f91586b.invoke();
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44880e;
        if (str6 == null) {
            str6 = paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44510b : null;
        }
        String str7 = (String) cVar2.f91586b.invoke();
        return new ElementsSessionContext(lValueOf, str2, d0Var, allowRedisplay2, billingDetails, new ElementsSessionContext.PrefillDetails(str6, str7 == null ? paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44512d : null : str7, this.f44889p.v()), deferredIntent);
    }

    public final void j(IdentifierResolvableString identifierResolvableString) {
        Boolean bool = Boolean.FALSE;
        u0 u0Var = this.f44879d;
        u0Var.d("has_launched", bool);
        u0Var.d("should_reset", bool);
        k(false);
        s sVar = this.f44876a;
        boolean z11 = sVar.f98664g;
        PaymentMethodIncentive paymentMethodIncentive = sVar.f98659b;
        BankFormScreenState bankFormScreenState = new BankFormScreenState(z11, paymentMethodIncentive != null ? paymentMethodIncentive.f44798b : null, false, null, identifierResolvableString);
        i2 i2Var = this.f44898y;
        i2Var.getClass();
        i2Var.k(null, bankFormScreenState);
        i2 i2Var2 = (i2) this.f44895v.f48367c.f48346e;
        Boolean bool2 = Boolean.TRUE;
        i2Var2.getClass();
        i2Var2.k(null, bool2);
    }

    public final void k(boolean z11) {
        this.f44886k.a(z11);
        this.f44889p.a(z11);
        this.f44888m.a(z11);
        this.f44892s.a(z11);
    }
}
