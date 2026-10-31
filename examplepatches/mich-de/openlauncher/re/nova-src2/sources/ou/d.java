package ou;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.z2;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.ui.core.Amount;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kw.s3;

/* loaded from: classes4.dex */
public final class d implements o {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f80821a;

    /* renamed from: b, reason: collision with root package name */
    public final r f80822b;

    /* renamed from: c, reason: collision with root package name */
    public final hq.m f80823c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentMethodMetadata f80824d;

    /* renamed from: e, reason: collision with root package name */
    public final Function0 f80825e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f80826f;

    /* renamed from: g, reason: collision with root package name */
    public final es.n f80827g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f80828h;

    /* renamed from: i, reason: collision with root package name */
    public final ru.d f80829i;

    /* renamed from: j, reason: collision with root package name */
    public final h6.u0 f80830j;

    /* renamed from: k, reason: collision with root package name */
    public final kw.p f80831k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f80832l;

    /* renamed from: m, reason: collision with root package name */
    public final cw.q f80833m;
    public final mh.c n;
    public final w70.t1 o;

    /* renamed from: p, reason: collision with root package name */
    public final cw.u0 f80834p;

    public d(t70.j0 coroutineScope, r rVar, hq.m cardAccountRangeRepositoryFactory, PaymentMethodMetadata paymentMethodMetadata, Function0 function0, Function1 function1, es.n nVar, boolean z11, ru.d eventReporter, h6.u0 savedStateHandle, kw.p pVar, boolean z12, cw.q qVar, mh.c cVar) {
        w70.o1 o1Var;
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        this.f80821a = coroutineScope;
        this.f80822b = rVar;
        this.f80823c = cardAccountRangeRepositoryFactory;
        this.f80824d = paymentMethodMetadata;
        this.f80825e = function0;
        this.f80826f = function1;
        this.f80827g = nVar;
        this.f80828h = z11;
        this.f80829i = eventReporter;
        this.f80830j = savedStateHandle;
        this.f80831k = pVar;
        this.f80832l = z12;
        this.f80833m = qVar;
        this.n = cVar;
        Continuation continuation = null;
        w70.t1 t1VarB = w70.u1.b(0, 0, null, 7);
        this.o = t1VarB;
        this.f80834p = w70.u1.j(t1VarB, rVar.f80967b, (cVar == null || (o1Var = (w70.o1) cVar.f76325d) == null) ? ps.v.y(null) : o1Var, new cw.u1(this, continuation, 2));
        t70.m0.t(coroutineScope, null, null, new mx.e0(this, continuation, 8), 3);
    }

    public final yu.a a(String paymentMethodCode) {
        Intrinsics.g(paymentMethodCode, "paymentMethodCode");
        PaymentMethodMetadata metadata = this.f80824d;
        Intrinsics.g(metadata, "metadata");
        String str = metadata.f43100i;
        Amount amountB = metadata.b();
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = metadata.f43102k;
        AddressDetails addressDetails = metadata.f43103l;
        PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration = metadata.f43093b;
        return new yu.a(paymentMethodCode, metadata.f43099h, str, amountB, paymentSheet$BillingDetails, addressDetails, metadata.f43108s, metadata.m(paymentMethodCode), paymentSheet$BillingDetailsCollectionConfiguration);
    }

    public final List b(String code) {
        Object next;
        Intrinsics.g(code, "code");
        x xVar = (x) this.f80825e.invoke();
        Boolean boolValueOf = null;
        if (xVar == null || !Intrinsics.b(xVar.getType(), code)) {
            xVar = null;
        }
        iv.c cVar = new iv.c(1, this.f80822b, r.class, "onStateUpdated", "onStateUpdated(Lcom/stripe/android/link/ui/inline/InlineSignupViewState;)V", 0, 14);
        PaymentMethodCreateParams paymentMethodCreateParamsE = xVar != null ? xVar.e() : null;
        PaymentMethodOptionsParams paymentMethodOptionsParamsC = xVar != null ? xVar.c() : null;
        PaymentMethodExtraParams paymentMethodExtraParamsA = xVar != null ? xVar.a() : null;
        PaymentSelection paymentSelectionB = xVar != null ? xVar.b() : null;
        UserInput userInput = paymentSelectionB instanceof PaymentSelection.New.Card ? ((PaymentSelection.New.Card) paymentSelectionB).f44819f : null;
        PaymentSelection paymentSelectionB2 = xVar != null ? xVar.b() : null;
        if (paymentSelectionB2 instanceof PaymentSelection.New.Card) {
            boolValueOf = Boolean.valueOf(((PaymentSelection.New.Card) paymentSelectionB2).f44819f != null);
        }
        ct.o oVar = new ct.o(this.f80823c, this.f80827g, this.f80822b, cVar, paymentMethodCreateParamsE, paymentMethodOptionsParamsC, paymentMethodExtraParamsA, userInput, this.f80828h, this.f80831k, this.f80832l, boolValueOf, this.f80833m, this.n);
        PaymentMethodMetadata paymentMethodMetadata = this.f80824d;
        paymentMethodMetadata.getClass();
        Intrinsics.g(code, "code");
        List listC = null;
        if (paymentMethodMetadata.s(code)) {
            dt.w wVarL = paymentMethodMetadata.l(code);
            if (wVarL != null) {
                listC = wVarL.g(paymentMethodMetadata, oVar.a(paymentMethodMetadata, false));
            }
        } else if (paymentMethodMetadata.p(code)) {
            dt.w wVarI = paymentMethodMetadata.i(code);
            if (wVarI != null) {
                listC = wVarI.g(paymentMethodMetadata, oVar.a(paymentMethodMetadata, false));
            }
        } else {
            Iterator it = paymentMethodMetadata.a0().iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((ct.j) next).getType().f43655a, code)) {
                    break;
                }
            }
            ct.j jVar = (ct.j) next;
            if (jVar != null) {
                listC = jVar.b().c(jVar, paymentMethodMetadata, paymentMethodMetadata.f43104m, oVar.a(paymentMethodMetadata, jVar.c(paymentMethodMetadata)));
            }
        }
        return listC == null ? EmptyList.f71733a : listC;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005a A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final n c(String paymentMethodCode) {
        Iterator it;
        ResolvableString resolvableStringC;
        Intrinsics.g(paymentMethodCode, "paymentMethodCode");
        List listB = b(paymentMethodCode);
        if ((listB instanceof Collection) && listB.isEmpty()) {
            z2 z2Var = PaymentMethod.Type.f43637g;
            if (!paymentMethodCode.equals("us_bank_account")) {
                it = listB.iterator();
                while (true) {
                    if (it.hasNext()) {
                    }
                }
                if (resolvableStringC != null) {
                }
            }
        } else {
            Iterator it2 = listB.iterator();
            while (it2.hasNext()) {
                if (((kw.x0) it2.next()).d()) {
                    break;
                }
            }
            z2 z2Var2 = PaymentMethod.Type.f43637g;
            if (!paymentMethodCode.equals("us_bank_account") && !paymentMethodCode.equals("link")) {
                it = listB.iterator();
                while (true) {
                    if (it.hasNext()) {
                        resolvableStringC = null;
                        break;
                    }
                    resolvableStringC = ((kw.x0) it.next()).c();
                    if (resolvableStringC != null) {
                        break;
                    }
                }
                return resolvableStringC != null ? l.f80924a : new m(resolvableStringC);
            }
        }
        return l.f80925b;
    }

    public final void d(uu.b bVar, String selectedPaymentMethodCode) {
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        t70.m0.t(this.f80821a, null, null, new s3(this, bVar, selectedPaymentMethodCode, (Continuation) null, 23), 3);
    }
}
