package lv;

import com.stripe.android.PaymentConfiguration;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.c0;
import t70.g2;
import t70.t0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f75110a;

    /* renamed from: b, reason: collision with root package name */
    public final w60.a f75111b;

    /* renamed from: c, reason: collision with root package name */
    public final f f75112c;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f75113d;

    /* renamed from: e, reason: collision with root package name */
    public g2 f75114e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f75115f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f75116g;

    public e(z0 z0Var, av.a paymentConfigProvider, f fVar, c0 dispatcher) {
        Intrinsics.g(paymentConfigProvider, "paymentConfigProvider");
        Intrinsics.g(dispatcher, "dispatcher");
        this.f75110a = z0Var;
        this.f75111b = paymentConfigProvider;
        this.f75112c = fVar;
        this.f75113d = dispatcher;
        i2 i2VarC = u1.c(null);
        this.f75115f = i2VarC;
        this.f75116g = i2VarC;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Enum a(ContinuationImpl continuationImpl) {
        c cVar;
        Object objQ;
        if (continuationImpl instanceof c) {
            cVar = (c) continuationImpl;
            int i5 = cVar.f75104v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f75104v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, continuationImpl);
            }
        }
        Object obj = cVar.f75102t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f75104v;
        final int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            final PaymentConfiguration paymentConfiguration = (PaymentConfiguration) this.f75111b.get();
            String str = this.f75112c.f75117a;
            final int i13 = 0;
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(new Function0() { // from class: lv.a
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i13) {
                        case 0:
                            return paymentConfiguration.f42440a;
                        default:
                            return paymentConfiguration.f42441b;
                    }
                }
            }, new Function0() { // from class: lv.a
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i12) {
                        case 0:
                            return paymentConfiguration.f42440a;
                        default:
                            return paymentConfiguration.f42441b;
                    }
                }
            });
            cVar.f75104v = 1;
            objQ = this.f75110a.Q(str, apiRequest$Options, EmptyList.f71733a, cVar);
            if (objQ == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objQ = ((Result) obj).f71688a;
        }
        int i14 = Result.f71687b;
        if (objQ instanceof Result.Failure) {
            objQ = null;
        }
        PaymentIntent paymentIntent = (PaymentIntent) objQ;
        if (paymentIntent != null) {
            return paymentIntent.f43547q;
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0099, code lost:
    
        if (r2.b(r0) != r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        d dVar;
        i2 i2Var;
        e eVar;
        e eVar2;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f75109x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f75109x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object objA = dVar.f75107v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f75109x;
        if (i11 == 0) {
            ResultKt.b(objA);
            StripeIntent.Status status = (StripeIntent.Status) this.f75116g.getValue();
            switch (status == null ? -1 : b.f75101a[status.ordinal()]) {
                case -1:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    dVar.f75105t = this;
                    i2Var = this.f75115f;
                    dVar.f75106u = i2Var;
                    dVar.f75109x = 1;
                    objA = a(dVar);
                    if (objA != coroutineSingletons) {
                        eVar = this;
                        break;
                    }
                    return coroutineSingletons;
                case 0:
                default:
                    throw new NoWhenBranchMatchedException();
                case 1:
                case 2:
                    return Unit.f71706a;
            }
        }
        if (i11 == 1) {
            i2Var = dVar.f75106u;
            eVar = dVar.f75105t;
            ResultKt.b(objA);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                return Unit.f71706a;
            }
            eVar2 = dVar.f75105t;
            ResultKt.b(objA);
            dVar.f75105t = null;
            dVar.f75109x = 3;
        }
        i2Var.j(objA);
        Duration.Companion companion = Duration.f72038b;
        long jG = DurationKt.g(1, DurationUnit.f72046e);
        dVar.f75105t = eVar;
        dVar.f75106u = null;
        dVar.f75109x = 2;
        if (t0.c(jG, dVar) != coroutineSingletons) {
            eVar2 = eVar;
            dVar.f75105t = null;
            dVar.f75109x = 3;
        }
        return coroutineSingletons;
    }
}
