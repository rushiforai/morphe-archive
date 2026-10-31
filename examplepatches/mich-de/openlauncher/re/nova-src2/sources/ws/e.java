package ws;

import com.stripe.android.DefaultCardBrandFilter;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.Address;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.z2;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import es.f0;
import es.v;
import fs.h0;
import fs.y;
import h6.f1;
import h6.g1;
import hv.d0;
import hv.u;
import hv.y0;
import is.g;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptySet;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import ou.m0;
import ou.n0;
import ps.p0;
import w70.g2;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class e extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final xq.c f94655a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f94656b;

    /* renamed from: c, reason: collision with root package name */
    public final rw.e f94657c;

    /* renamed from: d, reason: collision with root package name */
    public final f0 f94658d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkConfiguration f94659e;

    /* renamed from: f, reason: collision with root package name */
    public final g f94660f;

    /* renamed from: g, reason: collision with root package name */
    public final Function1 f94661g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f94662h;

    /* renamed from: i, reason: collision with root package name */
    public final o1 f94663i;

    /* renamed from: j, reason: collision with root package name */
    public final i2 f94664j;

    /* renamed from: k, reason: collision with root package name */
    public final o1 f94665k;

    /* JADX WARN: Removed duplicated region for block: B:22:0x00af  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public e(xq.c logger, h0 linkAccountManager, rw.e navigationManager, f0 dismissalCoordinator, LinkConfiguration configuration, LinkLaunchMode linkLaunchMode, g gVar, Function1 dismissWithResult, String str, v vVar) {
        Object objA;
        Object value;
        Object next;
        Intrinsics.g(logger, "logger");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(navigationManager, "navigationManager");
        Intrinsics.g(dismissalCoordinator, "dismissalCoordinator");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        this.f94655a = logger;
        this.f94656b = linkAccountManager;
        this.f94657c = navigationManager;
        this.f94658d = dismissalCoordinator;
        this.f94659e = configuration;
        this.f94660f = gVar;
        this.f94661g = dismissWithResult;
        i2 i2VarC = u1.c(new a(str, vVar, vVar != null ? p0.e(configuration.f42895a, linkLaunchMode) : zg.a.G(2132019846), false, null, null, null, false));
        this.f94662h = i2VarC;
        this.f94663i = new o1(i2VarC);
        i2 i2VarC2 = u1.c(null);
        this.f94664j = i2VarC2;
        this.f94665k = new o1(i2VarC2);
        try {
            int i5 = Result.f71687b;
            com.stripe.android.link.a aVar = (com.stripe.android.link.a) ((y) linkAccountManager).f55861i.f93973a.getValue();
            if (aVar != null) {
                Iterator it = aVar.f42962a.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    } else {
                        next = it.next();
                        if (Intrinsics.b(((LinkPaymentMethod.ConsumerPaymentDetails) next).f42942b.getF43297c(), str)) {
                            break;
                        }
                    }
                }
                LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails = (LinkPaymentMethod.ConsumerPaymentDetails) next;
                ConsumerPaymentDetails.PaymentDetails paymentDetails = consumerPaymentDetails != null ? consumerPaymentDetails.f42942b : null;
                if (paymentDetails == null) {
                    throw new IllegalArgumentException(("Payment details with id " + str + " not found").toString());
                }
                i2 i2Var = this.f94662h;
                do {
                    value = i2Var.getValue();
                } while (!i2Var.i(value, a.a((a) value, str, paymentDetails.getF43302a(), null, null, null, false, 246)));
                i2 i2Var2 = this.f94664j;
                d0 d0VarF = f(paymentDetails);
                i2Var2.getClass();
                i2Var2.k(null, d0VarF);
                objA = Unit.f71706a;
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            this.f94655a.b("Failed to render payment update screen", thA);
            this.f94657c.f86455a.c(rw.b.f86451a);
        }
    }

    public static final PaymentMethodCreateParams e(e eVar, ou.a aVar) {
        eVar.getClass();
        Integer num = aVar.f80786a;
        Integer num2 = aVar.f80787b;
        ft.b bVar = ((a) eVar.f94663i.f93973a.getValue()).f94645f;
        return new PaymentMethodCreateParams(new PaymentMethodCreateParams.Card(num, num2, null, null, bVar != null ? new PaymentMethodCreateParams.Card.Networks(bVar.f55897a) : null, 48), aVar.f80789d, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00b7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final d0 f(ConsumerPaymentDetails.PaymentDetails paymentDetails) {
        u uVar;
        ft.b bVar;
        Address address;
        List list;
        ft.b bVar2;
        String f43301g;
        String strB;
        boolean z11;
        ConsumerPaymentDetails.PaymentDetails paymentDetailsF = paymentDetails;
        o1 o1Var = this.f94663i;
        g2 g2Var = o1Var.f93973a;
        g2 g2Var2 = o1Var.f93973a;
        boolean zB = ((a) g2Var.getValue()).b();
        h0 h0Var = this.f94656b;
        LinkConfiguration configuration = this.f94659e;
        if (zB) {
            LinkAccount linkAccount = ((LinkAccountUpdate.Value) ((y) h0Var).f55853a.f55777b.f93973a.getValue()).f42864a;
            Intrinsics.g(configuration, "configuration");
            if (linkAccount != null) {
                PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = configuration.n;
                PaymentSheet$BillingDetails paymentSheet$BillingDetails = configuration.o;
                if (paymentSheet$BillingDetails == null || (f43301g = paymentSheet$BillingDetails.f44510b) == null) {
                    f43301g = linkAccount.f43016h;
                    if (!paymentSheet$BillingDetailsCollectionConfiguration.d()) {
                        f43301g = null;
                    }
                }
                if (paymentSheet$BillingDetails == null || (strB = paymentSheet$BillingDetails.f44512d) == null) {
                    strB = linkAccount.b();
                    if (!paymentSheet$BillingDetailsCollectionConfiguration.i()) {
                        strB = null;
                    }
                }
                ConsumerPaymentDetails.BillingAddress billingAddressB = zs.b.b(new PaymentSheet$BillingDetails(paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44509a : null, f43301g, paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44511c : null, strB));
                ConsumerPaymentDetails.BillingAddress f43300f = paymentDetailsF.getF43300f();
                if (f43300f == null) {
                    z11 = false;
                    if (paymentDetailsF.getF43300f() != null && !z11) {
                        billingAddressB = paymentDetailsF.getF43300f();
                    }
                    if (f43301g == null) {
                        f43301g = paymentDetailsF.getF43301g();
                    }
                    if (!(paymentDetailsF instanceof ConsumerPaymentDetails.Card)) {
                        paymentDetailsF = ConsumerPaymentDetails.Card.f((ConsumerPaymentDetails.Card) paymentDetailsF, false, billingAddressB, f43301g, 4047);
                    } else if (paymentDetailsF instanceof ConsumerPaymentDetails.BankAccount) {
                        paymentDetailsF = ConsumerPaymentDetails.BankAccount.f((ConsumerPaymentDetails.BankAccount) paymentDetailsF, false, billingAddressB, f43301g, 63);
                    } else if (!(paymentDetailsF instanceof ConsumerPaymentDetails.Passthrough)) {
                        throw new NoWhenBranchMatchedException();
                    }
                } else if (Intrinsics.b(billingAddressB != null ? billingAddressB.f43285g : null, f43300f.f43285g)) {
                    if (Intrinsics.b(billingAddressB != null ? billingAddressB.f43284f : null, f43300f.f43284f)) {
                        z11 = true;
                    }
                    if (paymentDetailsF.getF43300f() != null) {
                        billingAddressB = paymentDetailsF.getF43300f();
                    }
                    if (f43301g == null) {
                    }
                    if (!(paymentDetailsF instanceof ConsumerPaymentDetails.Card)) {
                    }
                }
            }
        }
        boolean z12 = paymentDetailsF instanceof ConsumerPaymentDetails.Card;
        ConsumerPaymentDetails.Card card = z12 ? (ConsumerPaymentDetails.Card) paymentDetailsF : null;
        if (card != null) {
            List<String> list2 = card.f43295l;
            ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
            for (String str : list2) {
                ft.b.f55885m.getClass();
                arrayList.add(b6.b.l(str));
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (((ft.b) next) != ft.b.f55894x) {
                    arrayList2.add(next);
                }
            }
            uVar = new u(DefaultCardBrandFilter.f42421a, arrayList2.size() > 1, true);
        } else {
            uVar = null;
        }
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration2 = configuration.n;
        m6.a aVarF = g1.f(this);
        LinkAccount linkAccount2 = ((LinkAccountUpdate.Value) ((y) h0Var).f55853a.f55777b.f93973a.getValue()).f42864a;
        String strB2 = linkAccount2 != null ? linkAccount2.b() : null;
        ConsumerPaymentDetails.Card card2 = z12 ? (ConsumerPaymentDetails.Card) paymentDetailsF : null;
        String str2 = card2 != null ? card2.f43287d : null;
        Integer numValueOf = card2 != null ? Integer.valueOf(card2.f43293j) : null;
        Integer numValueOf2 = card2 != null ? Integer.valueOf(card2.f43292i) : null;
        if (card2 == null || (bVar = card2.f43294k) == null) {
            bVar = ft.b.f55894x;
        }
        ft.b bVar3 = bVar;
        String str3 = (card2 == null || (bVar2 = card2.f43294k) == null) ? null : bVar2.f55897a;
        Set setN1 = (card2 == null || (list = card2.f43295l) == null) ? null : b70.g.N1(list);
        Set set = ((setN1 != null ? Integer.valueOf(setN1.size()) : null) == null || setN1.size() <= 1) ? null : setN1;
        ConsumerPaymentDetails.BillingAddress f43300f2 = paymentDetailsF.getF43300f();
        if (f43300f2 != null) {
            String str4 = f43300f2.f43280b;
            String str5 = f43300f2.f43281c;
            String str6 = f43300f2.f43283e;
            String str7 = f43300f2.f43282d;
            String str8 = f43300f2.f43284f;
            CountryCode countryCode = f43300f2.f43285g;
            address = new Address(str6, countryCode != null ? countryCode.f42575a : null, str4, str5, str8, str7);
        } else {
            address = null;
        }
        String f43301g2 = paymentDetailsF.getF43301g();
        ConsumerPaymentDetails.BillingAddress f43300f3 = paymentDetailsF.getF43300f();
        y0 y0Var = new y0(str2, numValueOf, numValueOf2, bVar3, str3, set, new PaymentMethod.BillingDetails(address, f43301g2, f43300f3 != null ? f43300f3.f43279a : null, strB2));
        n0 n0Var = paymentSheet$BillingDetailsCollectionConfiguration2.f44513a;
        m0 m0Var = paymentSheet$BillingDetailsCollectionConfiguration2.f44516d;
        n0 n0Var2 = paymentSheet$BillingDetailsCollectionConfiguration2.f44515c;
        n0 n0Var3 = ((a) g2Var2.getValue()).b() ? paymentSheet$BillingDetailsCollectionConfiguration2.f44514b : null;
        if (n0Var3 == null) {
            n0Var3 = n0.f80939b;
        }
        n0 n0Var4 = n0Var3;
        String str9 = paymentDetailsF.f43303b;
        z2 z2Var = PaymentMethod.Type.f43637g;
        if (str9.equals("card") && m0Var == m0.f80932b) {
            m0Var = m0.f80931a;
        }
        return new d0(y0Var, new PaymentSheet$BillingDetailsCollectionConfiguration(n0Var, n0Var4, n0Var2, m0Var, paymentSheet$BillingDetailsCollectionConfiguration2.f44517e, ((a) g2Var2.getValue()).b() ? paymentSheet$BillingDetailsCollectionConfiguration2.b() : EmptySet.f71734a), uVar, !((a) g2Var2.getValue()).b(), aVarF, new c(1, 0, e.class, this, "onBrandChoiceChanged", "onBrandChoiceChanged(Lcom/stripe/android/model/CardBrand;)V"), new b(1, 0, e.class, this, "onCardUpdateParamsChanged", "onCardUpdateParamsChanged$paymentsheet_release(Lcom/stripe/android/paymentsheet/CardUpdateParams;)V"));
    }
}
