package ys;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.ConsumerPaymentDetailsUpdateParams;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.z2;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import cw.n1;
import h6.f1;
import h6.g1;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.ListBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kw.t2;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class e1 extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f97453a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkAccount f97454b;

    /* renamed from: c, reason: collision with root package name */
    public final fs.h0 f97455c;

    /* renamed from: d, reason: collision with root package name */
    public final is.g f97456d;

    /* renamed from: e, reason: collision with root package name */
    public final g f97457e;

    /* renamed from: f, reason: collision with root package name */
    public final xq.c f97458f;

    /* renamed from: g, reason: collision with root package name */
    public final rw.e f97459g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkLaunchMode f97460h;

    /* renamed from: i, reason: collision with root package name */
    public final es.f0 f97461i;

    /* renamed from: j, reason: collision with root package name */
    public final Function1 f97462j;

    /* renamed from: k, reason: collision with root package name */
    public final Function1 f97463k;

    /* renamed from: l, reason: collision with root package name */
    public final StripeIntent f97464l;

    /* renamed from: m, reason: collision with root package name */
    public final i2 f97465m;
    public final o1 n;
    public final t2 o;

    /* renamed from: p, reason: collision with root package name */
    public final n1 f97466p;

    /* JADX WARN: Removed duplicated region for block: B:44:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0136  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public e1(LinkConfiguration configuration, LinkAccount linkAccount, fs.h0 linkAccountManager, is.g gVar, g gVar2, xq.c logger, rw.e navigationManager, LinkLaunchMode linkLaunchMode, es.f0 dismissalCoordinator, Function1 navigateAndClearStack, Function1 dismissWithResult) {
        boolean z11;
        IdentifierResolvableString identifierResolvableStringG;
        IdentifierResolvableString identifierResolvableString;
        i2 i2VarC;
        Object value;
        boolean zA;
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        ListBuilder listBuilder = gVar2.f97473a;
        Intrinsics.g(logger, "logger");
        Intrinsics.g(navigationManager, "navigationManager");
        Intrinsics.g(linkLaunchMode, "linkLaunchMode");
        Intrinsics.g(dismissalCoordinator, "dismissalCoordinator");
        Intrinsics.g(navigateAndClearStack, "navigateAndClearStack");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        this.f97453a = configuration;
        this.f97454b = linkAccount;
        this.f97455c = linkAccountManager;
        this.f97456d = gVar;
        this.f97457e = gVar2;
        this.f97458f = logger;
        this.f97459g = navigationManager;
        this.f97460h = linkLaunchMode;
        this.f97461i = dismissalCoordinator;
        this.f97462j = navigateAndClearStack;
        this.f97463k = dismissWithResult;
        StripeIntent stripeIntent = configuration.f42895a;
        this.f97464l = stripeIntent;
        EmptyList emptyList = EmptyList.f71733a;
        String str = linkAccount.f43016h;
        boolean z12 = configuration.f42917y;
        boolean z13 = configuration.f42902h;
        Intrinsics.g(stripeIntent, "<this>");
        boolean z14 = stripeIntent instanceof PaymentIntent;
        if (z14) {
            if (z13) {
                z2 z2Var = PaymentMethod.Type.f43637g;
                zA = ((PaymentIntent) stripeIntent).a("card");
            } else {
                z2 z2Var2 = PaymentMethod.Type.f43637g;
                zA = ((PaymentIntent) stripeIntent).a("link");
            }
            z11 = zA;
        } else {
            if (!(stripeIntent instanceof SetupIntent)) {
                throw new NoWhenBranchMatchedException();
            }
            z11 = true;
        }
        String str2 = configuration.f42896b;
        String str3 = configuration.f42897c;
        CardBrandFilter cardBrandFilter = configuration.f42905k;
        CardFundingFilter cardFundingFilter = configuration.f42906l;
        boolean z15 = configuration.f42915w;
        boolean z16 = h(linkLaunchMode) != null;
        IdentifierResolvableString identifierResolvableStringE = ps.p0.e(stripeIntent, linkLaunchMode);
        Continuation continuation = null;
        if ((linkLaunchMode instanceof LinkLaunchMode.Full) || (linkLaunchMode instanceof LinkLaunchMode.Confirmation)) {
            if (z14) {
                identifierResolvableStringG = zg.a.G(2132020060);
            } else {
                if (!(stripeIntent instanceof SetupIntent)) {
                    throw new NoWhenBranchMatchedException();
                }
                identifierResolvableStringG = zg.a.G(2132020054);
            }
        } else if (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) {
            if (!((LinkLaunchMode.PaymentMethodSelection) linkLaunchMode).f42934d) {
                identifierResolvableString = null;
                Integer num = (Intrinsics.b(configuration.f42903i.get("link_show_prefer_debit_card_hint"), Boolean.TRUE) || !listBuilder.contains(e.f97449c)) ? null : 2132020061;
                i2VarC = u1.c(new t0(emptyList, str, z12, cardBrandFilter, cardFundingFilter, null, false, z11, str2, str3, identifierResolvableStringE, identifierResolvableString, listBuilder, z15, Boolean.valueOf(z16), null, null, new pw.a(null, false), new pw.a(null, false), a.f97407a, null, num == null ? zg.a.G(num.intValue()) : null, !(linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) && ((LinkLaunchMode.PaymentMethodSelection) linkLaunchMode).f42931a == null && configuration.A, false, configuration.C, configuration.n, false));
                this.f97465m = i2VarC;
                o1 o1Var = new o1(i2VarC);
                this.n = o1Var;
                this.o = new t2(new kw.b0(), null, null, 6);
                this.f97466p = new n1((bh.k) null, ps.v.u(o1Var, new xu.c(4)), 5);
                do {
                    value = i2VarC.getValue();
                } while (!i2VarC.i(value, t0.a((t0) value, null, null, true, null, null, null, null, null, null, null, 268435391)));
                t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 0), 3);
                t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 1), 3);
                t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 2), 3);
                t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 3), 3);
            }
            identifierResolvableStringG = zg.a.G(2132020054);
        } else {
            if (!(linkLaunchMode instanceof LinkLaunchMode.Authentication) && !(linkLaunchMode instanceof LinkLaunchMode.Authorization)) {
                throw new NoWhenBranchMatchedException();
            }
            identifierResolvableStringG = zg.a.G(2132020054);
        }
        identifierResolvableString = identifierResolvableStringG;
        if (Intrinsics.b(configuration.f42903i.get("link_show_prefer_debit_card_hint"), Boolean.TRUE)) {
        }
        i2VarC = u1.c(new t0(emptyList, str, z12, cardBrandFilter, cardFundingFilter, null, false, z11, str2, str3, identifierResolvableStringE, identifierResolvableString, listBuilder, z15, Boolean.valueOf(z16), null, null, new pw.a(null, false), new pw.a(null, false), a.f97407a, null, num == null ? zg.a.G(num.intValue()) : null, !(linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) && ((LinkLaunchMode.PaymentMethodSelection) linkLaunchMode).f42931a == null && configuration.A, false, configuration.C, configuration.n, false));
        this.f97465m = i2VarC;
        o1 o1Var2 = new o1(i2VarC);
        this.n = o1Var2;
        this.o = new t2(new kw.b0(), null, null, 6);
        this.f97466p = new n1((bh.k) null, ps.v.u(o1Var2, new xu.c(4)), 5);
        do {
            value = i2VarC.getValue();
        } while (!i2VarC.i(value, t0.a((t0) value, null, null, true, null, null, null, null, null, null, null, 268435391)));
        t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 0), 3);
        t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 1), 3);
        t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 2), 3);
        t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 3), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00f1, code lost:
    
        if (r3.k((com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails) r13, r1) == r2) goto L42;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(e1 e1Var, ConsumerPaymentDetails.PaymentDetails paymentDetails, ContinuationImpl continuationImpl) throws Throwable {
        x0 x0Var;
        Throwable th2;
        es.f0 f0Var;
        boolean z11;
        Throwable th3;
        Object objX;
        ConsumerPaymentDetails.PaymentDetails paymentDetails2;
        e1 e1Var2;
        Throwable thA;
        Object value;
        LinkConfiguration linkConfiguration = e1Var.f97453a;
        if (continuationImpl instanceof x0) {
            x0Var = (x0) continuationImpl;
            int i5 = x0Var.f97617z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x0Var.f97617z = i5 - Integer.MIN_VALUE;
            } else {
                x0Var = new x0(e1Var, continuationImpl);
            }
        }
        Object obj = x0Var.f97615x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x0Var.f97617z;
        boolean z12 = false;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            z11 = x0Var.f97614w;
            f0Var = x0Var.f97613v;
            paymentDetails2 = x0Var.f97612u;
            e1Var2 = x0Var.f97611t;
            try {
                ResultKt.b(obj);
                objX = ((Result) obj).f71688a;
                f0Var.f52946a = z11;
                thA = Result.a(objX);
                if (thA != null) {
                    Object obj2 = null;
                    for (Object obj3 : ((ConsumerPaymentDetails) objX).f43270a) {
                        if (Intrinsics.b(((ConsumerPaymentDetails.PaymentDetails) obj3).getF43297c(), paymentDetails2.getF43297c())) {
                            if (z12) {
                                throw new IllegalArgumentException("Collection contains more than one matching element.");
                            }
                            obj2 = obj3;
                            z12 = true;
                        }
                    }
                    if (!z12) {
                        throw new NoSuchElementException("Collection contains no element matching the predicate.");
                    }
                    x0Var.f97611t = null;
                    x0Var.f97612u = null;
                    x0Var.f97613v = null;
                    x0Var.f97617z = 2;
                } else {
                    i2 i2Var = e1Var2.f97465m;
                    do {
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, t0.a((t0) value, null, null, false, null, null, null, null, null, null, p50.i.w(thA), 266338239)));
                }
                return Unit.f71706a;
            } catch (Throwable th4) {
                th2 = th4;
                f0Var.f52946a = z11;
                throw th2;
            }
        }
        ResultKt.b(obj);
        t0 t0Var = (t0) e1Var.n.f93973a.getValue();
        ClientAttributionMetadata clientAttributionMetadata = linkConfiguration.I;
        Map mapA = cw.c1.a(t0Var.f97572r);
        z2 z2Var = PaymentMethod.Type.f43637g;
        PaymentMethodCreateParams paymentMethodCreateParamsB = aw.c.b(mapA, "card", false, null, clientAttributionMetadata);
        es.f0 f0Var2 = e1Var.f97461i;
        boolean z13 = f0Var2.f52946a;
        f0Var2.f52946a = false;
        try {
            try {
                ConsumerPaymentDetailsUpdateParams consumerPaymentDetailsUpdateParams = new ConsumerPaymentDetailsUpdateParams(paymentDetails.getF43297c(), Boolean.valueOf(paymentDetails.getF43302a()), (LinkedHashMap) paymentMethodCreateParamsB.k0(), (LinkedHashMap) linkConfiguration.I.k0());
                fs.h0 h0Var = e1Var.f97455c;
                x0Var.f97611t = e1Var;
                x0Var.f97612u = paymentDetails;
                x0Var.f97613v = f0Var2;
                x0Var.f97614w = z13;
                x0Var.f97617z = 1;
                try {
                    objX = ((fs.y) h0Var).x(consumerPaymentDetailsUpdateParams, null, x0Var);
                    if (objX != coroutineSingletons) {
                        paymentDetails2 = paymentDetails;
                        f0Var = f0Var2;
                        e1Var2 = e1Var;
                        z11 = z13;
                        f0Var.f52946a = z11;
                        thA = Result.a(objX);
                        if (thA != null) {
                        }
                        return Unit.f71706a;
                    }
                    return coroutineSingletons;
                } catch (Throwable th5) {
                    th3 = th5;
                    th2 = th3;
                    f0Var = f0Var2;
                    z11 = z13;
                    f0Var.f52946a = z11;
                    throw th2;
                }
            } catch (Throwable th6) {
                th3 = th6;
            }
        } catch (Throwable th7) {
            th2 = th7;
        }
    }

    public static final void f(e1 e1Var, Throwable th2, String str) {
        Object value;
        e1Var.f97458f.b("WalletViewModel: ".concat(str), th2);
        i2 i2Var = e1Var.f97465m;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, t0.a((t0) value, null, null, false, null, null, null, null, null, a.f97407a, p50.i.w(th2), 265289727)));
    }

    public static final void g(e1 e1Var, Throwable th2, String str) {
        Object value;
        e1Var.f97458f.b("WalletViewModel: ".concat(str), th2);
        i2 i2Var = e1Var.f97465m;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, t0.a((t0) value, null, null, false, null, null, null, null, null, null, p50.i.w(th2), 266272703)));
    }

    public static String h(LinkLaunchMode linkLaunchMode) {
        if ((linkLaunchMode instanceof LinkLaunchMode.Full) || (linkLaunchMode instanceof LinkLaunchMode.Confirmation)) {
            return null;
        }
        if (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) {
            ConsumerPaymentDetails.PaymentDetails paymentDetails = ((LinkLaunchMode.PaymentMethodSelection) linkLaunchMode).f42931a;
            if (paymentDetails != null) {
                return paymentDetails.getF43297c();
            }
            return null;
        }
        if ((linkLaunchMode instanceof LinkLaunchMode.Authentication) || (linkLaunchMode instanceof LinkLaunchMode.Authorization)) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    public static void m(e1 e1Var, boolean z11) {
        i2 i2Var = e1Var.f97465m;
        while (true) {
            Object value = i2Var.getValue();
            boolean z12 = z11;
            if (i2Var.i(value, t0.a((t0) value, null, null, z12, null, null, null, null, null, null, null, 268304319))) {
                return;
            } else {
                z11 = z12;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(String str, ContinuationImpl continuationImpl, boolean z11) {
        y0 y0Var;
        String str2;
        Object objG;
        e1 e1Var;
        boolean z12;
        Object value;
        t0 t0Var;
        if (continuationImpl instanceof y0) {
            y0Var = (y0) continuationImpl;
            int i5 = y0Var.f97626y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y0Var.f97626y = i5 - Integer.MIN_VALUE;
            } else {
                y0Var = new y0(this, continuationImpl);
            }
        }
        Object obj = y0Var.f97624w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y0Var.f97626y;
        if (i11 == 0) {
            ResultKt.b(obj);
            Set setA = ls.g.a(this.f97464l, this.f97454b);
            y0Var.f97621t = this;
            str2 = str;
            y0Var.f97622u = str2;
            y0Var.f97623v = z11;
            y0Var.f97626y = 1;
            objG = ((fs.y) this.f97455c).g(setA, y0Var);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
            e1Var = this;
            z12 = z11;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z12 = y0Var.f97623v;
            str2 = y0Var.f97622u;
            e1Var = y0Var.f97621t;
            ResultKt.b(obj);
            objG = ((Result) obj).f71688a;
        }
        String str3 = str2;
        Throwable thA = Result.a(objG);
        if (thA == null) {
            i2 i2Var = e1Var.f97465m;
            do {
                value = i2Var.getValue();
                t0Var = (t0) value;
            } while (!i2Var.i(value, t0.a(t0Var, null, str3, false, z12 ? Boolean.FALSE : t0Var.o, null, z12 ? null : t0Var.f97571q, null, null, z12 ? a.f97407a : t0Var.f97574t, null, 267223007)));
        } else {
            e1Var.f97458f.b("WalletViewModel Fatal error: ", thA);
            e1Var.f97463k.invoke(new LinkActivityResult.Failed(thA, fs.j0.a(e1Var.f97455c)));
        }
        return Unit.f71706a;
    }

    public final void j(boolean z11) {
        Object value;
        Object value2;
        i2 i2Var = this.f97465m;
        if (z11) {
            do {
                value2 = i2Var.getValue();
            } while (!i2Var.i(value2, t0.a((t0) value2, null, null, false, null, null, null, null, null, new b(null), null, 267386879)));
        } else {
            this.f97458f.d("WalletViewModel: Failed to present Financial Connections");
            do {
                value = i2Var.getValue();
            } while (!i2Var.i(value, t0.a((t0) value, null, null, false, null, null, null, null, null, a.f97407a, null, 267386879)));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(ConsumerPaymentDetails.PaymentDetails paymentDetails, ContinuationImpl continuationImpl) throws Throwable {
        d1 d1Var;
        LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails;
        String strB;
        e1 e1Var;
        Object next;
        Object value;
        Object value2;
        if (continuationImpl instanceof d1) {
            d1Var = (d1) continuationImpl;
            int i5 = d1Var.f97448w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d1Var.f97448w = i5 - Integer.MIN_VALUE;
            } else {
                d1Var = new d1(this, continuationImpl);
            }
        }
        Object objA = d1Var.f97446u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d1Var.f97448w;
        if (i11 == 0) {
            ResultKt.b(objA);
            PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = this.f97453a.n;
            LinkAccount linkAccount = this.f97454b;
            boolean zA = zs.b.a(paymentDetails, paymentSheet$BillingDetailsCollectionConfiguration, linkAccount);
            n1 n1Var = this.f97466p;
            if (!zA && ((t0) this.f97465m.getValue()).n) {
                m(this, false);
                Object objInvoke = n1Var.f48237q.f91586b.invoke();
                if (!((pw.a) objInvoke).f83106b) {
                    objInvoke = null;
                }
                pw.a aVar = (pw.a) objInvoke;
                String str = aVar != null ? aVar.f83105a : null;
                es.w wVar = es.w.f53010d;
                String paymentDetailsId = paymentDetails.getF43297c();
                wVar.getClass();
                Intrinsics.g(paymentDetailsId, "paymentDetailsId");
                rw.f.b(this.f97459g, es.g0.c(wVar.f53013a, MapsKt.j0(new Pair("payment_details", paymentDetailsId), new Pair("is_billing_update_flow", String.valueOf(true)), new Pair("billing_update_cvc", str))));
                return Unit.f71706a;
            }
            Object objInvoke2 = n1Var.f48237q.f91586b.invoke();
            if (!((pw.a) objInvoke2).f83106b) {
                objInvoke2 = null;
            }
            pw.a aVar2 = (pw.a) objInvoke2;
            String str2 = aVar2 != null ? aVar2.f83105a : null;
            com.stripe.android.link.a aVar3 = (com.stripe.android.link.a) ((fs.y) this.f97455c).f55861i.f93973a.getValue();
            if (aVar3 != null) {
                Iterator it = aVar3.f42962a.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (Intrinsics.b(((LinkPaymentMethod.ConsumerPaymentDetails) next).f42942b.getF43297c(), paymentDetails.getF43297c())) {
                        break;
                    }
                }
                consumerPaymentDetails = (LinkPaymentMethod.ConsumerPaymentDetails) next;
            } else {
                consumerPaymentDetails = null;
            }
            if (consumerPaymentDetails == null || (strB = consumerPaymentDetails.f42944d) == null) {
                strB = linkAccount.b();
            }
            LinkPaymentMethod.ConsumerPaymentDetails consumerPaymentDetails2 = new LinkPaymentMethod.ConsumerPaymentDetails(paymentDetails, str2, strB);
            d1Var.f97445t = this;
            d1Var.f97448w = 1;
            is.g gVar = this.f97456d;
            objA = gVar.a(gVar.f68031d, new is.f(consumerPaymentDetails2, gVar, linkAccount, null), consumerPaymentDetails2, d1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            e1Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            e1Var = d1Var.f97445t;
            ResultKt.b(objA);
        }
        is.d dVar = (is.d) objA;
        if (dVar instanceof is.a) {
            i2 i2Var = e1Var.f97465m;
            do {
                value2 = i2Var.getValue();
            } while (!i2Var.i(value2, t0.a((t0) value2, null, null, false, null, null, null, null, null, null, null, 268435391)));
        } else if (dVar instanceof is.c) {
            i2 i2Var2 = e1Var.f97465m;
            do {
                value = i2Var2.getValue();
            } while (!i2Var2.i(value, t0.a((t0) value, null, null, false, null, null, ((is.c) dVar).f68017a, null, null, null, null, 268304319)));
        } else {
            if (!(dVar instanceof is.b)) {
                throw new NoWhenBranchMatchedException();
            }
            e1Var.f97463k.invoke(((is.b) dVar).f68016a);
        }
        return Unit.f71706a;
    }

    public final void l() {
        i2 i2Var;
        Object value;
        Continuation continuation;
        do {
            i2Var = this.f97465m;
            value = i2Var.getValue();
            continuation = null;
        } while (!i2Var.i(value, t0.a((t0) value, null, null, false, null, null, null, null, null, new b(null), null, 267386879)));
        t70.m0.t(g1.f(this), null, null, new u0(this, continuation, 4), 3);
    }
}
