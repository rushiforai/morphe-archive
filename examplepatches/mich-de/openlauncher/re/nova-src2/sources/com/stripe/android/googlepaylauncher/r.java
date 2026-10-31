package com.stripe.android.googlepaylauncher;

import as.a0;
import as.b0;
import as.c0;
import com.google.android.gms.wallet.PaymentData;
import com.google.android.gms.wallet.PaymentDataRequest;
import com.stripe.android.GooglePayJsonFactory$MerchantInfo;
import com.stripe.android.GooglePayJsonFactory$SoftwareInfo;
import com.stripe.android.GooglePayJsonFactory$TransactionInfo;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.exception.InvalidRequestException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncher$Result;
import com.stripe.android.googlepaylauncher.GooglePayPaymentMethodLauncherContractV2;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.m3;
import fi.t;
import h6.f1;
import h6.u0;
import java.util.Locale;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;
import sg.w;
import w70.i2;
import w70.o1;
import w70.p1;
import w70.u1;

/* loaded from: classes4.dex */
public final class r extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final gi.b f42850a;

    /* renamed from: b, reason: collision with root package name */
    public final ApiRequest$Options f42851b;

    /* renamed from: c, reason: collision with root package name */
    public final GooglePayPaymentMethodLauncherContractV2.Args f42852c;

    /* renamed from: d, reason: collision with root package name */
    public final z0 f42853d;

    /* renamed from: e, reason: collision with root package name */
    public final dq.i f42854e;

    /* renamed from: f, reason: collision with root package name */
    public final c0 f42855f;

    /* renamed from: g, reason: collision with root package name */
    public final u0 f42856g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f42857h;

    /* renamed from: i, reason: collision with root package name */
    public final o1 f42858i;

    public r(gi.b paymentsClient, ApiRequest$Options apiRequest$Options, GooglePayPaymentMethodLauncherContractV2.Args args, z0 z0Var, dq.i googlePayJsonFactory, c0 googlePayRepository, u0 u0Var) {
        Intrinsics.g(paymentsClient, "paymentsClient");
        Intrinsics.g(args, "args");
        Intrinsics.g(googlePayJsonFactory, "googlePayJsonFactory");
        Intrinsics.g(googlePayRepository, "googlePayRepository");
        this.f42850a = paymentsClient;
        this.f42851b = apiRequest$Options;
        this.f42852c = args;
        this.f42853d = z0Var;
        this.f42854e = googlePayJsonFactory;
        this.f42855f = googlePayRepository;
        this.f42856g = u0Var;
        i2 i2VarC = u1.c(null);
        this.f42857h = i2VarC;
        this.f42858i = new o1(i2VarC);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(PaymentData paymentData, ContinuationImpl continuationImpl) {
        a0 a0Var;
        Object objP;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f15574v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f15574v = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        Object obj = a0Var.f15572t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f15574v;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            PaymentMethodCreateParams paymentMethodCreateParamsA = m3.a(new JSONObject(paymentData.f33891l), this.f42852c.f42816h);
            a0Var.f15574v = 1;
            objP = this.f42853d.p(paymentMethodCreateParamsA, this.f42851b, a0Var);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objP = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objP);
        if (thA == null) {
            return new GooglePayPaymentMethodLauncher$Result.Completed((PaymentMethod) objP);
        }
        if (thA instanceof APIConnectionException) {
            i12 = 3;
        } else if (thA instanceof InvalidRequestException) {
            i12 = 2;
        }
        return new GooglePayPaymentMethodLauncher$Result.Failed(i12, thA);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(ContinuationImpl continuationImpl) {
        b0 b0Var;
        r rVar;
        GooglePayJsonFactory$TransactionInfo googlePayJsonFactory$TransactionInfo;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f15579w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f15579w = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object objO = b0Var.f15577u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f15579w;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objO);
            b0Var.f15576t = this;
            b0Var.f15579w = 1;
            as.e eVar = (as.e) this.f42855f;
            eVar.getClass();
            objO = u1.o(new p1(new ar.a(eVar, continuation, 18)), b0Var);
            if (objO != coroutineSingletons) {
                rVar = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objO);
            return objO;
        }
        rVar = b0Var.f15576t;
        ResultKt.b(objO);
        if (!((Boolean) objO).booleanValue()) {
            throw new IllegalStateException("Google Pay is unavailable.");
        }
        gi.b bVar = rVar.f42850a;
        dq.i iVar = rVar.f42854e;
        GooglePayPaymentMethodLauncherContractV2.Args args = rVar.f42852c;
        Intrinsics.g(args, "args");
        GooglePayPaymentMethodLauncher$Config googlePayPaymentMethodLauncher$Config = args.f42809a;
        long j11 = args.f42811c;
        if ((r70.j.B0(googlePayPaymentMethodLauncher$Config.f42795b, Locale.US.getCountry(), true) || r70.j.B0(googlePayPaymentMethodLauncher$Config.f42795b, Locale.CANADA.getCountry(), true)) && j11 == 0) {
            String currencyCode = args.f42810b;
            dq.h hVar = dq.h.f49333b;
            String str = googlePayPaymentMethodLauncher$Config.f42795b;
            String str2 = args.f42813e;
            String str3 = args.f42812d;
            dq.g gVar = dq.g.f49329b;
            Intrinsics.g(currencyCode, "currencyCode");
            googlePayJsonFactory$TransactionInfo = new GooglePayJsonFactory$TransactionInfo(currencyCode, hVar, str, str2, null, str3, gVar);
        } else {
            googlePayJsonFactory$TransactionInfo = new GooglePayJsonFactory$TransactionInfo(args.f42810b, dq.h.f49334c, googlePayPaymentMethodLauncher$Config.f42795b, args.f42813e, Long.valueOf(j11), args.f42812d, dq.g.f49329b);
        }
        String string = dq.i.c(iVar, googlePayJsonFactory$TransactionInfo, new GooglePayJsonFactory$MerchantInfo(googlePayPaymentMethodLauncher$Config.f42796c, new GooglePayJsonFactory$SoftwareInfo(args.f42817i ? dq.f.f49326c : dq.f.f49325b)), t2.c.p(googlePayPaymentMethodLauncher$Config.f42798e), googlePayPaymentMethodLauncher$Config.f42797d, Boolean.valueOf(googlePayPaymentMethodLauncher$Config.f42800g)).toString();
        PaymentDataRequest paymentDataRequest = new PaymentDataRequest();
        paymentDataRequest.n = true;
        w.i(string, "paymentDataRequestJson cannot be null!");
        paymentDataRequest.o = string;
        t tVarD = bVar.d(paymentDataRequest);
        Intrinsics.f(tVarD, "loadPaymentData(...)");
        b0Var.f15576t = null;
        b0Var.f15579w = 2;
        Object objL = vh.a.l(tVarD, b0Var);
        return objL == coroutineSingletons ? coroutineSingletons : objL;
    }
}
