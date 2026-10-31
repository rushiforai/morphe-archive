package du;

import android.content.Context;
import com.stripe.android.StripeIntentResult;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.l6;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import java.util.List;
import java.util.Set;
import jt.c1;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import t70.m0;
import t70.p2;

/* loaded from: classes4.dex */
public abstract class i {

    /* renamed from: f, reason: collision with root package name */
    public static final List f49555f = ul.b.P("payment_method");

    /* renamed from: a, reason: collision with root package name */
    public final w60.a f49556a;

    /* renamed from: b, reason: collision with root package name */
    public final c1 f49557b;

    /* renamed from: c, reason: collision with root package name */
    public final xq.c f49558c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f49559d;

    /* renamed from: e, reason: collision with root package name */
    public final b f49560e;

    public i(Context context, w60.a aVar, c1 c1Var, xq.c cVar, CoroutineContext coroutineContext) {
        this.f49556a = aVar;
        this.f49557b = c1Var;
        this.f49558c = cVar;
        this.f49559d = coroutineContext;
        this.f49560e = new b(context);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(i iVar, StripeIntent stripeIntent, String str, ApiRequest$Options apiRequest$Options, long j11, ContinuationImpl continuationImpl) {
        e eVar;
        i iVar2;
        String str2;
        Ref.ObjectRef objectRef;
        ApiRequest$Options apiRequest$Options2;
        PaymentMethod.Type type;
        PaymentMethod.AfterRedirectAction afterRedirectAction;
        Object objG;
        Ref.ObjectRef objectRef2;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f49538z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f49538z = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(iVar, continuationImpl);
            }
        }
        e eVar2 = eVar;
        Object obj = eVar2.f49536x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar2.f49538z;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.LongRef longRef = new Ref.LongRef();
            longRef.f71862a = j11;
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            PaymentMethod n = stripeIntent.getN();
            long f43588a = ((n == null || (type = n.f43573e) == null || (afterRedirectAction = type.f43660f) == null) ? 15000L : afterRedirectAction.getF43588a()) - (System.currentTimeMillis() - j11);
            f fVar = new f(objectRef3, iVar, str, apiRequest$Options, longRef, null);
            eVar2.f49532t = iVar;
            eVar2.f49533u = str;
            eVar2.f49534v = apiRequest$Options;
            eVar2.f49535w = objectRef3;
            eVar2.f49538z = 1;
            if (p2.d(f43588a, fVar, eVar2) != coroutineSingletons) {
                iVar2 = iVar;
                str2 = str;
                objectRef = objectRef3;
                apiRequest$Options2 = apiRequest$Options;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = (Ref.ObjectRef) eVar2.f49533u;
            objectRef2 = (Ref.ObjectRef) eVar2.f49532t;
            ResultKt.b(obj);
            objG = ((Result) obj).f71688a;
            objectRef.f71863a = new Result(objG);
            objectRef = objectRef2;
            return ((Result) objectRef.f71863a).f71688a;
        }
        objectRef = eVar2.f49535w;
        apiRequest$Options2 = eVar2.f49534v;
        String str3 = (String) eVar2.f49533u;
        i iVar3 = (i) eVar2.f49532t;
        ResultKt.b(obj);
        str2 = str3;
        iVar2 = iVar3;
        Result result = (Result) objectRef.f71863a;
        iVar2.getClass();
        if (h(result) || objectRef.f71863a == null) {
            eVar2.f49532t = objectRef;
            eVar2.f49533u = objectRef;
            eVar2.f49534v = null;
            eVar2.f49535w = null;
            eVar2.f49538z = 2;
            objG = iVar2.g(str2, apiRequest$Options2, f49555f, eVar2);
            if (objG != coroutineSingletons) {
                objectRef2 = objectRef;
                objectRef.f71863a = new Result(objG);
                objectRef = objectRef2;
            }
            return coroutineSingletons;
        }
        return ((Result) objectRef.f71863a).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0065  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final boolean b(i iVar, StripeIntent stripeIntent, int i5) {
        boolean z11;
        boolean z12;
        boolean z13;
        PaymentMethod n;
        PaymentMethod.Type type;
        PaymentMethod.AfterRedirectAction afterRedirectAction;
        if (i5 == 1) {
            Set set = l6.f44041a;
            if (stripeIntent instanceof PaymentIntent) {
                Set set2 = l6.f44041a;
                PaymentIntent paymentIntent = (PaymentIntent) stripeIntent;
                PaymentMethod paymentMethod = paymentIntent.n;
                z11 = b70.g.O0(set2, paymentMethod != null ? paymentMethod.f43573e : null) && paymentIntent.D();
            }
        }
        if (i5 == 3 && stripeIntent.getF43547q() == StripeIntent.Status.f43982d) {
            PaymentMethod n9 = stripeIntent.getN();
            if ((n9 != null ? n9.f43573e : null) == PaymentMethod.Type.f43639i) {
                z12 = true;
            }
        } else {
            z12 = false;
        }
        if (i5 == 3 && stripeIntent.getF43547q() == StripeIntent.Status.f43983e) {
            PaymentMethod n11 = stripeIntent.getN();
            if ((n11 != null ? n11.f43573e : null) == PaymentMethod.Type.f43639i && stripeIntent.X() == StripeIntent.NextActionType.f43967d) {
                z13 = true;
            }
        } else {
            z13 = false;
        }
        return z11 || z12 || z13 || (stripeIntent.D() && (n = stripeIntent.getN()) != null && (type = n.f43573e) != null && (afterRedirectAction = type.f43660f) != null && afterRedirectAction.O());
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean h(Result result) {
        boolean z11;
        if (result != null) {
            Object obj = result.f71688a;
            if (obj instanceof Result.Failure) {
                obj = null;
            }
            StripeIntent stripeIntent = (StripeIntent) obj;
            if (stripeIntent != null) {
                boolean zD = stripeIntent.D();
                if (stripeIntent.getF43547q() != StripeIntent.Status.f43982d) {
                    z11 = false;
                    if (zD && !z11) {
                        return false;
                    }
                } else {
                    PaymentMethod n = stripeIntent.getN();
                    if ((n != null ? n.f43573e : null) == PaymentMethod.Type.f43639i) {
                        z11 = true;
                    }
                    if (zD) {
                    }
                }
            }
        }
        return true;
    }

    public abstract Object c(ApiRequest$Options apiRequest$Options, String str, String str2, ContinuationImpl continuationImpl);

    public abstract StripeIntentResult d(StripeIntent stripeIntent, int i5, String str);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated, ContinuationImpl continuationImpl) {
        g gVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f49548v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f49548v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object objY = gVar.f49546t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f49548v;
        if (i11 == 0) {
            ResultKt.b(objY);
            h hVar = new h(this, paymentFlowResult$Unvalidated, null);
            gVar.f49548v = 1;
            objY = m0.y(this.f49559d, hVar, gVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    public abstract Object f(String str, ApiRequest$Options apiRequest$Options, ContinuationImpl continuationImpl);

    public abstract Object g(String str, ApiRequest$Options apiRequest$Options, List list, ContinuationImpl continuationImpl);
}
