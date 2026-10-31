package oq;

import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.f0;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.ConsumerSessionLookup;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.state.LinkState;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$State;
import es.n;
import ft.u;
import ft.v;
import fv.j;
import gv.c0;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ms.x;
import ms.z;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final ru.d f80595a;

    /* renamed from: b, reason: collision with root package name */
    public final z f80596b;

    /* renamed from: c, reason: collision with root package name */
    public final String f80597c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f80598d;

    /* renamed from: e, reason: collision with root package name */
    public final c0 f80599e;

    /* renamed from: f, reason: collision with root package name */
    public final n f80600f;

    /* renamed from: g, reason: collision with root package name */
    public final EventReporter$Mode f80601g;

    /* renamed from: h, reason: collision with root package name */
    public final xq.c f80602h;

    public c(ru.d eventReporter, z linkDisabledApiRepository, String mobileSessionId, CoroutineContext workContext, c0 retrieveCustomerEmail, n linkConfigurationCoordinator, EventReporter$Mode mode, xq.c logger) {
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(linkDisabledApiRepository, "linkDisabledApiRepository");
        Intrinsics.g(mobileSessionId, "mobileSessionId");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(retrieveCustomerEmail, "retrieveCustomerEmail");
        Intrinsics.g(linkConfigurationCoordinator, "linkConfigurationCoordinator");
        Intrinsics.g(mode, "mode");
        Intrinsics.g(logger, "logger");
        this.f80595a = eventReporter;
        this.f80596b = linkDisabledApiRepository;
        this.f80597c = mobileSessionId;
        this.f80598d = workContext;
        this.f80599e = retrieveCustomerEmail;
        this.f80600f = linkConfigurationCoordinator;
        this.f80601g = mode;
        this.f80602h = logger;
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x01a3  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x01a6 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x01b9  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001e  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0185  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0190  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c cVar, ElementsSession elementsSession, PaymentElementLoader$State paymentElementLoader$State, List list, ContinuationImpl continuationImpl) throws Throwable {
        b bVar;
        ElementsSession.ExperimentsData experimentsData;
        Object objA;
        Object obj;
        c cVar2;
        List list2;
        LinkConfiguration linkConfiguration;
        LinkConfiguration.CustomerInfo customerInfo;
        String str;
        f fVar;
        List<u> list3;
        ElementsSession elementsSession2;
        String str2;
        f fVar2;
        PaymentElementLoader$State paymentElementLoader$State2;
        ElementsSession.ExperimentsData experimentsData2;
        c cVar3;
        boolean z11;
        f fVar3;
        LinkState linkState;
        boolean z12;
        ElementsSession.Customer customer;
        String str3;
        ElementsSession.Customer.Session session;
        ElementsSession.Customer.Components components;
        LinkConfiguration linkConfiguration2;
        ElementsSession elementsSession3 = elementsSession;
        PaymentElementLoader$State paymentElementLoader$State3 = paymentElementLoader$State;
        cVar.getClass();
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.C;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.C = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(cVar, continuationImpl);
            }
        }
        Object obj2 = bVar.A;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.C;
        ElementsSession.Customer.Components.MobilePaymentElement mobilePaymentElement = null;
        if (i11 == 0) {
            ResultKt.b(obj2);
            if (Intrinsics.b(elementsSession3.f43391f.get(v.f56055d), Boolean.TRUE)) {
                return Unit.f71706a;
            }
            experimentsData = elementsSession3.f43392g;
            if (experimentsData == null) {
                throw new IllegalArgumentException("Experiments data required to log exposures");
            }
            bVar.f80588t = cVar;
            bVar.f80589u = elementsSession3;
            bVar.f80590v = paymentElementLoader$State3;
            bVar.f80591w = list;
            bVar.f80592x = experimentsData;
            bVar.C = 1;
            PaymentMethodMetadata paymentMethodMetadata = paymentElementLoader$State3.f44975e;
            LinkState linkState2 = paymentMethodMetadata.L;
            if (linkState2 == null || (linkConfiguration = linkState2.f44962a) == null || (customerInfo = linkConfiguration.f42900f) == null || (objA = customerInfo.f42922b) == null) {
                c0 c0Var = cVar.f80599e;
                CommonConfiguration commonConfiguration = paymentElementLoader$State3.f44971a;
                CustomerMetadata customerMetadata = paymentMethodMetadata.f43105p;
                objA = c0Var.a(commonConfiguration, customerMetadata != null ? new j(customerMetadata.f43071a, customerMetadata.f43072b, customerMetadata.f43073c) : null, bVar);
            }
            if (objA != coroutineSingletons) {
                obj = objA;
                cVar2 = cVar;
                list2 = list;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fVar2 = bVar.f80594z;
            str2 = bVar.f80593y;
            experimentsData2 = bVar.f80592x;
            list3 = bVar.f80591w;
            paymentElementLoader$State2 = bVar.f80590v;
            elementsSession2 = bVar.f80589u;
            cVar3 = bVar.f80588t;
            ResultKt.b(obj2);
            if (((Boolean) obj2).booleanValue()) {
                fVar = fVar2;
                experimentsData = experimentsData2;
                cVar2 = cVar3;
                list2 = list3;
                paymentElementLoader$State3 = paymentElementLoader$State2;
                str = str2;
                elementsSession3 = elementsSession2;
                list3 = list2;
                elementsSession2 = elementsSession3;
                str2 = str;
                z11 = false;
                cVar3 = cVar2;
                fVar3 = fVar;
                paymentElementLoader$State2 = paymentElementLoader$State3;
                experimentsData2 = experimentsData;
                linkState = paymentElementLoader$State2.f44975e.L;
                if (linkState == null) {
                    z12 = false;
                }
                if (str2 != null) {
                }
                if (paymentElementLoader$State2.f44975e.L != null) {
                }
                String str4 = cVar3.f80601g.f44781a;
                customer = elementsSession2.f43393h;
                if (customer != null) {
                    mobilePaymentElement = components.f43413a;
                }
                if ((mobilePaymentElement instanceof ElementsSession.Customer.Components.MobilePaymentElement.Enabled) && ((ElementsSession.Customer.Components.MobilePaymentElement.Enabled) mobilePaymentElement).f43420a) {
                }
                while (r1.hasNext()) {
                }
                return Unit.f71706a;
            }
            fVar3 = fVar2;
            z11 = true;
            linkState = paymentElementLoader$State2.f44975e.L;
            if (linkState == null || (linkConfiguration2 = linkState.f44962a) == null) {
                z12 = false;
            } else {
                f0 f0Var = (f0) cVar3.f80600f;
                f0Var.getClass();
                if (f0Var.b(linkConfiguration2).b().b()) {
                    z12 = true;
                }
            }
            e eVar = str2 != null ? e.f80603a : null;
            boolean z13 = paymentElementLoader$State2.f44975e.L != null;
            String str42 = cVar3.f80601g.f44781a;
            customer = elementsSession2.f43393h;
            if (customer != null && (session = customer.f43412c) != null && (components = session.f43430f) != null) {
                mobilePaymentElement = components.f43413a;
            }
            boolean z14 = ((mobilePaymentElement instanceof ElementsSession.Customer.Components.MobilePaymentElement.Enabled) && ((ElementsSession.Customer.Components.MobilePaymentElement.Enabled) mobilePaymentElement).f43420a) && (!z13 || Intrinsics.b(elementsSession2.f43391f.get(v.f56056e), Boolean.TRUE));
            for (u uVar : list3) {
                ElementsSession.ExperimentsData experimentsData3 = elementsSession2.f43392g;
                if (experimentsData3 == null || (str3 = (String) experimentsData3.f43432b.get(uVar)) == null) {
                    str3 = "control";
                }
                String str5 = str42;
                ((ru.a) cVar3.f80595a).k(new g(experimentsData2.f43431a, str3, uVar, z11, z12, eVar, fVar3, z14, str5, z13, elementsSession2.o, cVar3.f80597c));
                str42 = str5;
            }
            return Unit.f71706a;
        }
        ElementsSession.ExperimentsData experimentsData4 = bVar.f80592x;
        List list4 = bVar.f80591w;
        paymentElementLoader$State3 = bVar.f80590v;
        ElementsSession elementsSession4 = bVar.f80589u;
        cVar2 = bVar.f80588t;
        ResultKt.b(obj2);
        experimentsData = experimentsData4;
        list2 = list4;
        elementsSession3 = elementsSession4;
        obj = obj2;
        str = (String) obj;
        cVar2.getClass();
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = paymentElementLoader$State3.f44971a.f42528e;
        fVar = new f((paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44510b : null) != null, (paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44511c : null) != null, (paymentSheet$BillingDetails != null ? paymentSheet$BillingDetails.f44512d : null) != null);
        if (str != null) {
            String str6 = elementsSession3.o;
            bVar.f80588t = cVar2;
            bVar.f80589u = elementsSession3;
            bVar.f80590v = paymentElementLoader$State3;
            bVar.f80591w = list2;
            bVar.f80592x = experimentsData;
            bVar.f80593y = str;
            bVar.f80594z = fVar;
            bVar.C = 2;
            Object objB = cVar2.b(str, str6, bVar);
            if (objB != coroutineSingletons) {
                list3 = list2;
                elementsSession2 = elementsSession3;
                str2 = str;
                fVar2 = fVar;
                paymentElementLoader$State2 = paymentElementLoader$State3;
                experimentsData2 = experimentsData;
                obj2 = objB;
                cVar3 = cVar2;
                if (((Boolean) obj2).booleanValue()) {
                }
            }
            return coroutineSingletons;
        }
        list3 = list2;
        elementsSession2 = elementsSession3;
        str2 = str;
        z11 = false;
        cVar3 = cVar2;
        fVar3 = fVar;
        paymentElementLoader$State2 = paymentElementLoader$State3;
        experimentsData2 = experimentsData;
        linkState = paymentElementLoader$State2.f44975e.L;
        if (linkState == null) {
        }
        if (str2 != null) {
        }
        if (paymentElementLoader$State2.f44975e.L != null) {
        }
        String str422 = cVar3.f80601g.f44781a;
        customer = elementsSession2.f43393h;
        if (customer != null) {
        }
        if ((mobilePaymentElement instanceof ElementsSession.Customer.Components.MobilePaymentElement.Enabled) && ((ElementsSession.Customer.Components.MobilePaymentElement.Enabled) mobilePaymentElement).f43420a) {
        }
        while (r1.hasNext()) {
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, ContinuationImpl continuationImpl) throws Throwable {
        a aVar;
        Object objM;
        c cVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f80587w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f80587w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f80585u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f80587w;
        if (i11 == 0) {
            ResultKt.b(obj);
            aVar.f80584t = this;
            aVar.f80587w = 1;
            objM = ((x) this.f80596b).m(str, str2, aVar);
            if (objM == coroutineSingletons) {
                return coroutineSingletons;
            }
            cVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = aVar.f80584t;
            ResultKt.b(obj);
            objM = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        if (!(objM instanceof Result.Failure)) {
            objM = Boolean.valueOf(((ConsumerSessionLookup) objM).f43342a);
        }
        Throwable thA = Result.a(objM);
        if (thA != null) {
            cVar.f80602h.b("Failed to check if user is returning", thA);
        }
        ResultKt.b(objM);
        return objM;
    }
}
