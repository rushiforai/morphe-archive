package com.stripe.android.googlepaylauncher;

import android.content.Intent;
import as.u;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.wallet.PaymentDataRequest;
import com.stripe.android.GooglePayJsonFactory$BillingAddressParameters;
import com.stripe.android.GooglePayJsonFactory$MerchantInfo;
import com.stripe.android.GooglePayJsonFactory$SoftwareInfo;
import com.stripe.android.GooglePayJsonFactory$TransactionInfo;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.googlepaylauncher.GooglePayLauncher$Result;
import com.stripe.android.googlepaylauncher.GooglePayLauncherContract;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import dq.e0;
import fi.t;
import h6.f1;
import h6.g1;
import h6.u0;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import sg.w;
import t70.m0;
import w70.n1;
import w70.p1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class j extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final gi.b f42831a;

    /* renamed from: b, reason: collision with root package name */
    public final ApiRequest$Options f42832b;

    /* renamed from: c, reason: collision with root package name */
    public final GooglePayLauncherContract.Args f42833c;

    /* renamed from: d, reason: collision with root package name */
    public final z0 f42834d;

    /* renamed from: e, reason: collision with root package name */
    public final e0 f42835e;

    /* renamed from: f, reason: collision with root package name */
    public final dq.i f42836f;

    /* renamed from: g, reason: collision with root package name */
    public final as.e f42837g;

    /* renamed from: h, reason: collision with root package name */
    public final u0 f42838h;

    /* renamed from: i, reason: collision with root package name */
    public final iu.f f42839i;

    /* renamed from: j, reason: collision with root package name */
    public final CoroutineContext f42840j;

    /* renamed from: k, reason: collision with root package name */
    public final t1 f42841k;

    /* renamed from: l, reason: collision with root package name */
    public final n1 f42842l;

    /* renamed from: m, reason: collision with root package name */
    public final t1 f42843m;
    public final n1 n;

    public j(gi.b bVar, ApiRequest$Options apiRequest$Options, GooglePayLauncherContract.Args args, z0 z0Var, e0 e0Var, dq.i iVar, as.e eVar, u0 u0Var, iu.f fVar, CoroutineContext workContext) {
        Intrinsics.g(args, "args");
        Intrinsics.g(workContext, "workContext");
        this.f42831a = bVar;
        this.f42832b = apiRequest$Options;
        this.f42833c = args;
        this.f42834d = z0Var;
        this.f42835e = e0Var;
        this.f42836f = iVar;
        this.f42837g = eVar;
        this.f42838h = u0Var;
        this.f42839i = fVar;
        this.f42840j = workContext;
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.f42841k = t1VarB;
        this.f42842l = new n1(t1VarB);
        t1 t1VarB2 = u1.b(1, 0, null, 6);
        this.f42843m = t1VarB2;
        this.n = new n1(t1VarB2);
        m0.t(g1.f(this), workContext, null, new f(this, null), 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00a5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(j jVar, ContinuationImpl continuationImpl) {
        u uVar;
        Object objA;
        Object objA2;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f15643w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f15643w = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(jVar, continuationImpl);
            }
        }
        Object objL = uVar.f15641u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f15643w;
        Continuation continuation = null;
        try {
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (i11 == 0) {
            ResultKt.b(objL);
            int i13 = Result.f71687b;
            uVar.f15640t = jVar;
            uVar.f15643w = 1;
            as.e eVar = jVar.f42837g;
            eVar.getClass();
            objL = u1.o(new p1(new ar.a(eVar, continuation, 18)), uVar);
            if (objL == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objL);
                    objA2 = (Task) objL;
                    int i14 = Result.f71687b;
                    return objA2;
                }
                jVar = uVar.f15640t;
                ResultKt.b(objL);
                objA2 = ((Result) objL).f71688a;
                int i15 = Result.f71687b;
                if (!(objA2 instanceof Result.Failure)) {
                    try {
                        String str = (String) objA2;
                        PaymentDataRequest paymentDataRequest = new PaymentDataRequest();
                        paymentDataRequest.n = true;
                        w.i(str, "paymentDataRequestJson cannot be null!");
                        paymentDataRequest.o = str;
                        objA2 = paymentDataRequest;
                    } catch (Throwable th3) {
                        int i16 = Result.f71687b;
                        objA2 = ResultKt.a(th3);
                    }
                }
                if (!(objA2 instanceof Result.Failure)) {
                    t tVarD = jVar.f42831a.d((PaymentDataRequest) objA2);
                    Intrinsics.f(tVarD, "loadPaymentData(...)");
                    uVar.f15640t = null;
                    uVar.f15643w = 3;
                    objL = vh.a.l(tVarD, uVar);
                    if (objL == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    objA2 = (Task) objL;
                    int i142 = Result.f71687b;
                }
                return objA2;
            }
            jVar = uVar.f15640t;
            ResultKt.b(objL);
        }
        if (!((Boolean) objL).booleanValue()) {
            throw new IllegalStateException("Google Pay is unavailable.");
        }
        objA = Unit.f71706a;
        int i17 = Result.f71687b;
        Throwable thA = Result.a(objA);
        if (thA == null) {
            GooglePayLauncherContract.Args args = jVar.f42833c;
            uVar.f15640t = jVar;
            uVar.f15643w = 2;
            objA2 = jVar.f(args, uVar);
            if (objA2 == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            objA2 = ResultKt.a(thA);
        }
        int i152 = Result.f71687b;
        if (!(objA2 instanceof Result.Failure)) {
        }
        if (!(objA2 instanceof Result.Failure)) {
        }
        return objA2;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(GooglePayLauncherContract.Args args, ContinuationImpl continuationImpl) {
        i iVar;
        Object objR;
        j jVar;
        dq.e eVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f42830x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f42830x = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f42828v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f42830x;
        if (i11 == 0) {
            ResultKt.b(obj);
            boolean z11 = args instanceof GooglePayLauncherContract.PaymentIntentArgs;
            ApiRequest$Options apiRequest$Options = this.f42832b;
            z0 z0Var = this.f42834d;
            if (z11) {
                String str = ((GooglePayLauncherContract.PaymentIntentArgs) args).f42783a;
                iVar.f42826t = this;
                iVar.f42827u = args;
                iVar.f42830x = 1;
                objR = z0Var.Q(str, apiRequest$Options, EmptyList.f71733a, iVar);
                if (objR != coroutineSingletons) {
                    jVar = this;
                    int i12 = Result.f71687b;
                    if (!(objR instanceof Result.Failure)) {
                    }
                }
            } else {
                if (!(args instanceof GooglePayLauncherContract.SetupIntentArgs)) {
                    throw new NoWhenBranchMatchedException();
                }
                String str2 = ((GooglePayLauncherContract.SetupIntentArgs) args).f42786a;
                iVar.f42826t = this;
                iVar.f42827u = args;
                iVar.f42830x = 2;
                objR = z0Var.R(str2, apiRequest$Options, EmptyList.f71733a, iVar);
                if (objR != coroutineSingletons) {
                    jVar = this;
                    int i13 = Result.f71687b;
                    if (!(objR instanceof Result.Failure)) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            args = iVar.f42827u;
            jVar = iVar.f42826t;
            ResultKt.b(obj);
            objR = ((Result) obj).f71688a;
            int i122 = Result.f71687b;
            if (!(objR instanceof Result.Failure)) {
                PaymentIntent paymentIntent = (PaymentIntent) objR;
                String str3 = paymentIntent.f43543k;
                if (str3 == null) {
                    str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                objR = jVar.g(paymentIntent, str3, null, ((GooglePayLauncherContract.PaymentIntentArgs) args).f42785c);
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            args = iVar.f42827u;
            jVar = iVar.f42826t;
            ResultKt.b(obj);
            objR = ((Result) obj).f71688a;
            int i132 = Result.f71687b;
            if (!(objR instanceof Result.Failure)) {
                GooglePayLauncherContract.SetupIntentArgs setupIntentArgs = (GooglePayLauncherContract.SetupIntentArgs) args;
                objR = jVar.g((SetupIntent) objR, setupIntentArgs.f42788c, setupIntentArgs.f42789d, setupIntentArgs.f42790e);
            }
        }
        if (objR instanceof Result.Failure) {
            return objR;
        }
        GooglePayJsonFactory$TransactionInfo googlePayJsonFactory$TransactionInfo = (GooglePayJsonFactory$TransactionInfo) objR;
        dq.i iVar2 = jVar.f42836f;
        GooglePayJsonFactory$MerchantInfo googlePayJsonFactory$MerchantInfo = new GooglePayJsonFactory$MerchantInfo(args.getF42787b().f42771c, new GooglePayJsonFactory$SoftwareInfo(dq.f.f49325b));
        boolean z12 = args.getF42787b().f42773e.f42766a;
        int iOrdinal = args.getF42787b().f42773e.f42767b.ordinal();
        if (iOrdinal == 0) {
            eVar = dq.e.f49308b;
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            eVar = dq.e.f49309c;
        }
        return dq.i.c(iVar2, googlePayJsonFactory$TransactionInfo, googlePayJsonFactory$MerchantInfo, new GooglePayJsonFactory$BillingAddressParameters(z12, eVar, args.getF42787b().f42773e.f42768c), args.getF42787b().f42772d, Boolean.valueOf(args.getF42787b().f42775g)).toString();
    }

    public final GooglePayJsonFactory$TransactionInfo g(StripeIntent stripeIntent, String currencyCode, Long l9, String str) {
        Intrinsics.g(stripeIntent, "stripeIntent");
        Intrinsics.g(currencyCode, "currencyCode");
        boolean z11 = stripeIntent instanceof PaymentIntent;
        GooglePayLauncherContract.Args args = this.f42833c;
        if (z11) {
            PaymentIntent paymentIntent = (PaymentIntent) stripeIntent;
            return new GooglePayJsonFactory$TransactionInfo(currencyCode, dq.h.f49335d, args.getF42787b().f42770b, paymentIntent.f43533a, paymentIntent.f43535c, null, dq.g.f49330c);
        }
        if (stripeIntent instanceof SetupIntent) {
            return new GooglePayJsonFactory$TransactionInfo(currencyCode, dq.h.f49334c, args.getF42787b().f42770b, ((SetupIntent) stripeIntent).f43763a, Long.valueOf(l9 != null ? l9.longValue() : 0L), str, dq.g.f49329b);
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004c, code lost:
    
        if (r6 == r1) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x005f, code lost:
    
        if (r6 == r1) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0061, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(int i5, Intent intent, ContinuationImpl continuationImpl) {
        as.s sVar;
        Object objA;
        if (continuationImpl instanceof as.s) {
            sVar = (as.s) continuationImpl;
            int i11 = sVar.f15634v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                sVar.f15634v = i11 - Integer.MIN_VALUE;
            } else {
                sVar = new as.s(this, continuationImpl);
            }
        }
        Object obj = sVar.f15632t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = sVar.f15634v;
        if (i12 == 0) {
            ResultKt.b(obj);
            e0 e0Var = this.f42835e;
            e0Var.getClass();
            if (i5 != 50000 || intent == null) {
                e0Var.getClass();
                if (i5 != 50001 || intent == null) {
                    IllegalStateException illegalStateException = new IllegalStateException("Unexpected confirmation result.");
                    iu.e eVar = iu.e.f68092g;
                    int i13 = StripeException.f42562e;
                    this.f42839i.a(eVar, p6.u.i(illegalStateException), b70.k.e0(new Pair("request_code", String.valueOf(i5))));
                    int i14 = Result.f71687b;
                    objA = ResultKt.a(illegalStateException);
                } else {
                    sVar.f15634v = 2;
                    objA = e0Var.d(intent, sVar);
                }
            } else {
                sVar.f15634v = 1;
                objA = e0Var.c(intent, sVar);
            }
        } else {
            if (i12 != 1 && i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objA = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            return new GooglePayLauncher$Result.Failed(thA);
        }
        return GooglePayLauncher$Result.Completed.f42778a;
    }
}
