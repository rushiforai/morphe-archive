package gv;

import android.content.Context;
import com.stripe.android.DefaultCardBrandFilter;
import com.stripe.android.DefaultCardFundingFilter;
import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentSheetCardBrandFilter;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentSheetCardFundingFilter;
import com.stripe.android.model.ElementsSession;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.g3;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.model.SavedSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import cw.o2;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.p1;
import w70.u1;

/* loaded from: classes4.dex */
public final class x implements g0 {

    /* renamed from: a, reason: collision with root package name */
    public final ou.e f57959a;

    /* renamed from: b, reason: collision with root package name */
    public final bs.a f57960b;

    /* renamed from: c, reason: collision with root package name */
    public final fv.m f57961c;

    /* renamed from: d, reason: collision with root package name */
    public final fv.k f57962d;

    /* renamed from: e, reason: collision with root package name */
    public final bt.f f57963e;

    /* renamed from: f, reason: collision with root package name */
    public final xq.c f57964f;

    /* renamed from: g, reason: collision with root package name */
    public final ru.e f57965g;

    /* renamed from: h, reason: collision with root package name */
    public final iu.f f57966h;

    /* renamed from: i, reason: collision with root package name */
    public final CoroutineContext f57967i;

    /* renamed from: j, reason: collision with root package name */
    public final a f57968j;

    /* renamed from: k, reason: collision with root package name */
    public final oq.d f57969k;

    /* renamed from: l, reason: collision with root package name */
    public final o2 f57970l;

    /* renamed from: m, reason: collision with root package name */
    public final ir.i f57971m;
    public final xw.c n;
    public final uq.b o;

    /* renamed from: p, reason: collision with root package name */
    public final w60.a f57972p;

    /* renamed from: q, reason: collision with root package name */
    public final String f57973q;

    /* renamed from: r, reason: collision with root package name */
    public final h f57974r;

    /* renamed from: s, reason: collision with root package name */
    public final h0 f57975s;

    /* renamed from: t, reason: collision with root package name */
    public final b50.d f57976t;

    public x(ou.e prefsRepositoryFactory, bs.a googlePayRepositoryFactory, fv.m elementsSessionRepository, fv.k customerRepository, bt.f lpmRepository, xq.c logger, ru.e eventReporter, iu.f errorReporter, CoroutineContext workContext, a createLinkState, oq.d logLinkHoldbackExperiment, o2 externalPaymentMethodsRepository, ir.i userFacingLogger, xw.c integrityRequestManager, uq.b tapToAddConnectionManager, w60.a paymentConfiguration, String paymentElementCallbackIdentifier, h analyticsMetadataFactory, h0 paymentMethodFilter, b50.d cardFundingFilterFactory) {
        Intrinsics.g(prefsRepositoryFactory, "prefsRepositoryFactory");
        Intrinsics.g(googlePayRepositoryFactory, "googlePayRepositoryFactory");
        Intrinsics.g(elementsSessionRepository, "elementsSessionRepository");
        Intrinsics.g(customerRepository, "customerRepository");
        Intrinsics.g(lpmRepository, "lpmRepository");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(createLinkState, "createLinkState");
        Intrinsics.g(logLinkHoldbackExperiment, "logLinkHoldbackExperiment");
        Intrinsics.g(externalPaymentMethodsRepository, "externalPaymentMethodsRepository");
        Intrinsics.g(userFacingLogger, "userFacingLogger");
        Intrinsics.g(integrityRequestManager, "integrityRequestManager");
        Intrinsics.g(tapToAddConnectionManager, "tapToAddConnectionManager");
        Intrinsics.g(paymentConfiguration, "paymentConfiguration");
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(analyticsMetadataFactory, "analyticsMetadataFactory");
        Intrinsics.g(paymentMethodFilter, "paymentMethodFilter");
        Intrinsics.g(cardFundingFilterFactory, "cardFundingFilterFactory");
        this.f57959a = prefsRepositoryFactory;
        this.f57960b = googlePayRepositoryFactory;
        this.f57961c = elementsSessionRepository;
        this.f57962d = customerRepository;
        this.f57963e = lpmRepository;
        this.f57964f = logger;
        this.f57965g = eventReporter;
        this.f57966h = errorReporter;
        this.f57967i = workContext;
        this.f57968j = createLinkState;
        this.f57969k = logLinkHoldbackExperiment;
        this.f57970l = externalPaymentMethodsRepository;
        this.f57971m = userFacingLogger;
        this.n = integrityRequestManager;
        this.o = tapToAddConnectionManager;
        this.f57972p = paymentConfiguration;
        this.f57973q = paymentElementCallbackIdentifier;
        this.f57974r = analyticsMetadataFactory;
        this.f57975s = paymentMethodFilter;
        this.f57976t = cardFundingFilterFactory;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x010c, code lost:
    
        if (r15 == r1) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0116 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(x xVar, k kVar, PaymentMethodMetadata paymentMethodMetadata, t70.q0 localSavedSelection, PaymentSheetCardBrandFilter cardBrandFilter, PaymentSheetCardFundingFilter cardFundingFilter, ContinuationImpl continuationImpl) {
        l lVar;
        x xVar2;
        CustomerState customerState;
        b bVar;
        xVar.getClass();
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.B;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.B = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(xVar, continuationImpl);
            }
        }
        Object objA = lVar.f57890z;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = lVar.B;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (kVar instanceof i) {
                ElementsSession.Customer customer = ((i) kVar).f57870a;
                ArrayList arrayListP0 = paymentMethodMetadata.p0();
                Intrinsics.g(customer, "customer");
                List list = customer.f43410a;
                ArrayList arrayList = new ArrayList();
                for (Object obj2 : list) {
                    if (b70.g.O0(arrayListP0, ((PaymentMethod) obj2).f43573e)) {
                        arrayList.add(obj2);
                    }
                }
                CustomerState customerState2 = new CustomerState(arrayList, customer.f43411b);
                xVar2 = xVar;
                customerState = customerState2;
            } else {
                if (kVar instanceof j) {
                    PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = ((j) kVar).f57877a;
                    lVar.f57884t = xVar;
                    lVar.f57885u = paymentMethodMetadata;
                    lVar.f57886v = localSavedSelection;
                    lVar.f57887w = cardBrandFilter;
                    lVar.f57888x = cardFundingFilter;
                    b bVar2 = CustomerState.f44955c;
                    lVar.f57889y = bVar2;
                    lVar.B = 1;
                    Object objH = xVar.h(paymentMethodMetadata, paymentSheet$CustomerConfiguration, lVar);
                    if (objH != obj) {
                        xVar2 = xVar;
                        bVar = bVar2;
                        objA = objH;
                    }
                    return obj;
                }
                xVar2 = xVar;
                customerState = null;
            }
            if (customerState != null) {
                return null;
            }
            h0 h0Var = xVar2.f57975s;
            List list2 = customerState.f44956a;
            PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = paymentMethodMetadata.f43093b;
            CustomerMetadata customerMetadata = paymentMethodMetadata.f43105p;
            String str = customerState.f44957b;
            Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
            Intrinsics.g(cardBrandFilter, "cardBrandFilter");
            Intrinsics.g(cardFundingFilter, "cardFundingFilter");
            Intrinsics.g(localSavedSelection, "localSavedSelection");
            bn.i iVar = new bn.i();
            iVar.f18209a = billingDetailsCollectionConfiguration;
            iVar.f18210b = customerMetadata;
            iVar.f18211c = str;
            iVar.f18212d = cardBrandFilter;
            iVar.f18213e = cardFundingFilter;
            iVar.f18214f = localSavedSelection;
            lVar.f57884t = customerState;
            lVar.f57885u = null;
            lVar.f57886v = null;
            lVar.f57887w = null;
            lVar.f57888x = null;
            lVar.f57889y = null;
            lVar.B = 2;
            objA = ((a0) h0Var).a(list2, iVar, lVar);
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                customerState = (CustomerState) lVar.f57884t;
                ResultKt.b(objA);
                return CustomerState.a(customerState, (List) objA, null, 2);
            }
            bVar = lVar.f57889y;
            cardFundingFilter = lVar.f57888x;
            cardBrandFilter = lVar.f57887w;
            localSavedSelection = lVar.f57886v;
            paymentMethodMetadata = lVar.f57885u;
            xVar2 = (x) lVar.f57884t;
            ResultKt.b(objA);
        }
        List paymentMethods = (List) objA;
        bVar.getClass();
        Intrinsics.g(paymentMethods, "paymentMethods");
        customerState = new CustomerState(paymentMethods, null);
        if (customerState != null) {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0067, code lost:
    
        if (r10 == r2) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(x xVar, CommonConfiguration commonConfiguration, ElementsSession elementsSession, t70.p0 p0Var, ContinuationImpl continuationImpl) {
        m mVar;
        ir.i iVar = xVar.f57971m;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f57899y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f57899y = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(xVar, continuationImpl);
            }
        }
        Object objL = mVar.f57897w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f57899y;
        if (i11 == 0) {
            ResultKt.b(objL);
            if (!elementsSession.f43397l) {
                iVar.a("Google Pay is not enabled for this session.");
            } else if (commonConfiguration.f42526c == null) {
                iVar.a("GooglePayConfiguration is not set.");
            } else {
                mVar.f57894t = xVar;
                mVar.f57895u = elementsSession;
                mVar.f57896v = p0Var;
                mVar.f57899y = 1;
                objL = p0Var.l(mVar);
            }
            if (elementsSession.f43397l) {
                return Boolean.FALSE;
            }
            mVar.f57894t = null;
            mVar.f57895u = null;
            mVar.f57896v = null;
            mVar.f57899y = 2;
            Object objL2 = p0Var.l(mVar);
            return objL2 == coroutineSingletons ? coroutineSingletons : objL2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objL);
            return objL;
        }
        p0Var = mVar.f57896v;
        elementsSession = mVar.f57895u;
        xVar = mVar.f57894t;
        ResultKt.b(objL);
        if (!((Boolean) objL).booleanValue()) {
            xVar.f57971m.a("Google Pay API check failed.\nPossible reasons:\n- Google Play service is not available on this device.\n- Google account is not signed in on this device.\nSee https://developers.google.com/android/reference/com/google/android/gms/wallet/PaymentsClient#public-taskboolean-isreadytopay-isreadytopayrequest-request for more details.");
        }
        if (elementsSession.f43397l) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(x xVar, CommonConfiguration commonConfiguration, ContinuationImpl continuationImpl) {
        n nVar;
        boolean zBooleanValue;
        ou.q0 q0Var;
        as.j jVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f57904v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f57904v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(xVar, continuationImpl);
            }
        }
        Object objO = nVar.f57902t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f57904v;
        if (i11 == 0) {
            ResultKt.b(objO);
            PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = commonConfiguration.f42526c;
            if (paymentSheet$GooglePayConfiguration == null || (q0Var = paymentSheet$GooglePayConfiguration.f44575a) == null) {
                zBooleanValue = false;
                return Boolean.valueOf(zBooleanValue);
            }
            int iOrdinal = q0Var.ordinal();
            if (iOrdinal == 0) {
                jVar = as.j.f15611b;
            } else {
                if (iOrdinal != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                jVar = as.j.f15612c;
            }
            nVar.f57904v = 1;
            objO = u1.o(new p1(new ar.a(xVar.f57960b.a(jVar, DefaultCardFundingFilter.f42422a, DefaultCardBrandFilter.f42421a), (Continuation) null, 18)), nVar);
            if (objO == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objO);
        }
        zBooleanValue = ((Boolean) objO).booleanValue();
        return Boolean.valueOf(zBooleanValue);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(x xVar, PaymentElementLoader$InitializationMode paymentElementLoader$InitializationMode, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, List list, List list2, String str, PaymentSheet$LinkConfiguration paymentSheet$LinkConfiguration, String str2, ContinuationImpl continuationImpl) {
        u uVar;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f57948v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f57948v = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(xVar, continuationImpl);
            }
        }
        u uVar2 = uVar;
        Object obj = uVar2.f57946t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar2.f57948v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        fv.m mVar = xVar.f57961c;
        Set set = paymentSheet$LinkConfiguration.f44611e;
        uVar2.f57948v = 1;
        Object objB = ((fv.r) mVar).b(paymentElementLoader$InitializationMode, paymentSheet$CustomerConfiguration, list, list2, str, str2, set, uVar2);
        return objB == coroutineSingletons ? coroutineSingletons : objB;
    }

    /* JADX WARN: Removed duplicated region for block: B:70:0x00ef A[PHI: r9 r10 r11
      0x00ef: PHI (r9v1 com.stripe.android.paymentsheet.state.CustomerState) = 
      (r9v0 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v0 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v3 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v3 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v3 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v3 com.stripe.android.paymentsheet.state.CustomerState)
      (r9v3 com.stripe.android.paymentsheet.state.CustomerState)
     binds: [B:19:0x0049, B:33:0x0075, B:72:0x00f3, B:66:0x00e5, B:68:0x00ec, B:49:0x00a8, B:44:0x009a] A[DONT_GENERATE, DONT_INLINE]
      0x00ef: PHI (r10v1 boolean) = (r10v0 boolean), (r10v0 boolean), (r10v3 boolean), (r10v3 boolean), (r10v3 boolean), (r10v3 boolean), (r10v3 boolean) binds: [B:19:0x0049, B:33:0x0075, B:72:0x00f3, B:66:0x00e5, B:68:0x00ec, B:49:0x00a8, B:44:0x009a] A[DONT_GENERATE, DONT_INLINE]
      0x00ef: PHI (r11v1 boolean) = (r11v0 boolean), (r11v0 boolean), (r11v3 boolean), (r11v3 boolean), (r11v3 boolean), (r11v3 boolean), (r11v3 boolean) binds: [B:19:0x0049, B:33:0x0075, B:72:0x00f3, B:66:0x00e5, B:68:0x00ec, B:49:0x00a8, B:44:0x009a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0117 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(x xVar, t70.p0 p0Var, PaymentMethodMetadata paymentMethodMetadata, CustomerState customerState, boolean z11, boolean z12, ContinuationImpl continuationImpl) {
        v vVar;
        Object next;
        Object saved;
        PaymentMethod paymentMethod;
        PaymentMethod paymentMethod2;
        Object next2;
        xVar.getClass();
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f57955y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f57955y = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(xVar, continuationImpl);
            }
        }
        Object objL = vVar.f57953w;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = vVar.f57955y;
        PaymentSelection.GooglePay googlePay = PaymentSelection.GooglePay.f44810a;
        boolean z13 = false;
        if (i11 == 0) {
            ResultKt.b(objL);
            CustomerMetadata customerMetadata = paymentMethodMetadata.f43105p;
            if (customerMetadata != null ? customerMetadata.f43074d : false) {
                if (customerState != null) {
                    Iterator it = customerState.f44956a.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            next = null;
                            break;
                        }
                        next = it.next();
                        PaymentMethod paymentMethod3 = (PaymentMethod) next;
                        String str = customerState.f44957b;
                        if (str != null && Intrinsics.b(paymentMethod3.f43569a, str)) {
                            break;
                        }
                    }
                    PaymentMethod paymentMethod4 = (PaymentMethod) next;
                    saved = paymentMethod4 != null ? new PaymentSelection.Saved(paymentMethod4, null, null) : null;
                }
                if (saved == null) {
                    return saved;
                }
                PaymentSelection.Saved saved2 = (customerState == null || (paymentMethod = (PaymentMethod) b70.g.Y0(customerState.f44956a)) == null) ? null : new PaymentSelection.Saved(paymentMethod, null, null);
                if (saved2 != null) {
                    return saved2;
                }
                if (!z12 && z11) {
                    z13 = true;
                }
                if (z13) {
                    return googlePay;
                }
                return null;
            }
            vVar.f57950t = customerState;
            vVar.f57951u = z11;
            vVar.f57952v = z12;
            vVar.f57955y = 1;
            objL = p0Var.l(vVar);
            if (objL == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z12 = vVar.f57952v;
            z11 = vVar.f57951u;
            customerState = vVar.f57950t;
            ResultKt.b(objL);
        }
        SavedSelection savedSelection = (SavedSelection) objL;
        if (savedSelection instanceof SavedSelection.GooglePay) {
            if (!z12 && z11) {
                saved = googlePay;
            }
        } else if (savedSelection instanceof SavedSelection.Link) {
            saved = new PaymentSelection.Link(null, null, null, 7);
            if (z12) {
            }
        } else {
            if (savedSelection instanceof SavedSelection.PaymentMethod) {
                if (customerState != null) {
                    Iterator it2 = customerState.f44956a.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            next2 = null;
                            break;
                        }
                        next2 = it2.next();
                        if (Intrinsics.b(((PaymentMethod) next2).f43569a, ((SavedSelection.PaymentMethod) savedSelection).f44853a)) {
                            break;
                        }
                    }
                    paymentMethod2 = (PaymentMethod) next2;
                } else {
                    paymentMethod2 = null;
                }
                if (paymentMethod2 != null) {
                    saved = new PaymentSelection.Saved(paymentMethod2, null, null);
                } else if (((SavedSelection.PaymentMethod) savedSelection).f44854b) {
                    saved = new PaymentSelection.Link(null, null, null, 7);
                    if (z12) {
                    }
                }
            } else if (!(savedSelection instanceof SavedSelection.None)) {
                throw new NoWhenBranchMatchedException();
            }
        }
        if (saved == null) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(x xVar, CommonConfiguration commonConfiguration, ContinuationImpl continuationImpl) {
        w wVar;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f57958v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f57958v = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(xVar, continuationImpl);
            }
        }
        Object objY = wVar.f57956t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f57958v;
        if (i11 == 0) {
            ResultKt.b(objY);
            PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = commonConfiguration.f42525b;
            PaymentSheet$CustomerAccessType paymentSheet$CustomerAccessType = paymentSheet$CustomerConfiguration != null ? paymentSheet$CustomerConfiguration.f44574c : null;
            if (!(paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.CustomerSession)) {
                if (!(paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey) && paymentSheet$CustomerAccessType != null) {
                    throw new NoWhenBranchMatchedException();
                }
                return null;
            }
            wVar.f57958v = 1;
            ou.e eVar = xVar.f57959a;
            String str = paymentSheet$CustomerConfiguration != null ? paymentSheet$CustomerConfiguration.f44572a : null;
            Context context = eVar.f80846a;
            CoroutineContext coroutineContext = eVar.f80847b;
            objY = t70.m0.y(coroutineContext, new ou.f(new ou.g(context, str, coroutineContext), false, false, null), wVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        if (objY instanceof SavedSelection.PaymentMethod) {
            return (SavedSelection.PaymentMethod) objY;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(PaymentElementLoader$InitializationMode paymentElementLoader$InitializationMode, e0 e0Var, f0 f0Var, ContinuationImpl continuationImpl) {
        o oVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f57909v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f57909v = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        o oVar2 = oVar;
        Object obj = oVar2.f57907t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar2.f57909v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        bu.m mVar = new bu.m(1, this, x.class, "reportFailedLoad", "reportFailedLoad(Ljava/lang/Throwable;)V", 0, 20);
        s sVar = new s(e0Var, paymentElementLoader$InitializationMode, this, f0Var, null);
        oVar2.f57909v = 1;
        Object objM = p6.p0.m(this.f57967i, mVar, sVar, oVar2);
        return objM == coroutineSingletons ? coroutineSingletons : objM;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable h(PaymentMethodMetadata paymentMethodMetadata, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, ContinuationImpl continuationImpl) {
        t tVar;
        Object objC;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f57944v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f57944v = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        Object obj = tVar.f57942t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar.f57944v;
        if (i11 == 0) {
            ResultKt.b(obj);
            ArrayList arrayListP0 = paymentMethodMetadata.p0();
            PaymentSheet$CustomerAccessType paymentSheet$CustomerAccessType = paymentSheet$CustomerConfiguration.f44574c;
            PaymentSheet$CustomerAccessType.CustomerSession customerSession = paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.CustomerSession ? (PaymentSheet$CustomerAccessType.CustomerSession) paymentSheet$CustomerAccessType : null;
            fv.j jVar = new fv.j(paymentSheet$CustomerConfiguration.f44572a, paymentSheet$CustomerConfiguration.f44573b, customerSession != null ? customerSession.f44570a : null);
            boolean f43545m = paymentMethodMetadata.f43092a.getF43545m();
            tVar.f57944v = 1;
            objC = ((fv.i) this.f57962d).c(jVar, arrayListP0, f43545m, tVar);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objC = ((Result) obj).f71688a;
        }
        ResultKt.b(objC);
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : (List) objC) {
            PaymentMethod paymentMethod = (PaymentMethod) obj2;
            PaymentMethod.Type type = paymentMethod.f43573e;
            switch (type == null ? -1 : g3.f44036a[type.ordinal()]) {
                case 1:
                    if (paymentMethod.f43576h != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 2:
                    if (paymentMethod.f43577i != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 3:
                    if (paymentMethod.f43578j != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 4:
                    if (paymentMethod.f43579k != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 5:
                    if (paymentMethod.f43580l != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 6:
                    if (paymentMethod.f43581m != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 7:
                    if (paymentMethod.n != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                case 8:
                    if (paymentMethod.f43583q != null) {
                        arrayList.add(obj2);
                        break;
                    } else {
                        break;
                    }
                default:
                    arrayList.add(obj2);
                    break;
            }
        }
        return arrayList;
    }
}
