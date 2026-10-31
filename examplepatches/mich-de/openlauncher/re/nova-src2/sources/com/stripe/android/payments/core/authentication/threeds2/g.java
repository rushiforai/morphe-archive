package com.stripe.android.payments.core.authentication.threeds2;

import android.app.Application;
import b.c0;
import bn.i;
import bn.s0;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.consent_sdk.z;
import com.stripe.android.PaymentAuthConfig$Stripe3ds2Config;
import com.stripe.android.auth.PaymentBrowserAuthContract;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.Stripe3ds2AuthResult;
import com.stripe.android.model.Stripe3ds2Fingerprint;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.networking.PaymentAnalyticsEvent;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import com.stripe.android.stripe3ds2.exceptions.InvalidInputException;
import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.stripe.android.stripe3ds2.transaction.u;
import com.vungle.ads.internal.protos.Sdk;
import dq.e0;
import e00.x4;
import fr.l;
import h6.f1;
import h6.u0;
import java.security.KeyPair;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ku.m;
import ku.n;
import m.w;
import r70.k;
import t70.m0;

/* loaded from: classes4.dex */
public final class g extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final Application f44334a;

    /* renamed from: b, reason: collision with root package name */
    public final Stripe3ds2TransactionContract.Args f44335b;

    /* renamed from: c, reason: collision with root package name */
    public final z0 f44336c;

    /* renamed from: d, reason: collision with root package name */
    public final l f44337d;

    /* renamed from: e, reason: collision with root package name */
    public final jt.a f44338e;

    /* renamed from: f, reason: collision with root package name */
    public final vv.a f44339f;

    /* renamed from: g, reason: collision with root package name */
    public final wv.l f44340g;

    /* renamed from: h, reason: collision with root package name */
    public final ku.d f44341h;

    /* renamed from: i, reason: collision with root package name */
    public final u f44342i;

    /* renamed from: j, reason: collision with root package name */
    public final CoroutineContext f44343j;

    /* renamed from: k, reason: collision with root package name */
    public final u0 f44344k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f44345l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f44346m;
    public final ApiRequest$Options n;

    /* JADX WARN: Removed duplicated region for block: B:10:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public g(Application application, Stripe3ds2TransactionContract.Args args, z0 z0Var, l lVar, jt.a aVar, vv.a threeDs2Service, wv.l messageVersionRegistry, ku.d challengeResultProcessor, u uVar, CoroutineContext workContext, u0 u0Var, boolean z11) {
        ApiRequest$Options apiRequest$Options;
        Intrinsics.g(threeDs2Service, "threeDs2Service");
        Intrinsics.g(messageVersionRegistry, "messageVersionRegistry");
        Intrinsics.g(challengeResultProcessor, "challengeResultProcessor");
        Intrinsics.g(workContext, "workContext");
        this.f44334a = application;
        this.f44335b = args;
        this.f44336c = z0Var;
        this.f44337d = lVar;
        this.f44338e = aVar;
        this.f44339f = threeDs2Service;
        this.f44340g = messageVersionRegistry;
        this.f44341h = challengeResultProcessor;
        this.f44342i = uVar;
        this.f44343j = workContext;
        this.f44344k = u0Var;
        this.f44345l = z11;
        s0 s0Var = u0Var.f59455b;
        s0Var.getClass();
        this.f44346m = ((LinkedHashMap) s0Var.f18279b).containsKey("key_next_step");
        String str = args.f44314d.f43954f;
        if (str == null) {
            apiRequest$Options = args.f44315e;
        } else {
            str = str.length() <= 0 ? null : str;
            if (str != null) {
                apiRequest$Options = new ApiRequest$Options(str, (String) null, 6);
            }
        }
        this.n = apiRequest$Options;
    }

    /* JADX WARN: Code restructure failed: missing block: B:55:0x024a, code lost:
    
        if (r1 != r6) goto L57;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(Stripe3ds2Fingerprint stripe3ds2Fingerprint, ContinuationImpl continuationImpl) throws Throwable {
        ku.l lVar;
        g gVar;
        i iVar;
        Object obj;
        int i5;
        Stripe3ds2Fingerprint stripe3ds2Fingerprint2;
        String strF1;
        Object gVar2;
        if (continuationImpl instanceof ku.l) {
            lVar = (ku.l) continuationImpl;
            int i11 = lVar.f72253z;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                lVar.f72253z = i11 - Integer.MIN_VALUE;
            } else {
                lVar = new ku.l(this, continuationImpl);
            }
        }
        ku.l lVar2 = lVar;
        Object eVar = lVar2.f72251x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = lVar2.f72253z;
        if (i12 == 0) {
            ResultKt.b(eVar);
            Stripe3ds2TransactionContract.Args args = this.f44335b;
            SdkTransactionId sdkTransactionId = args.f44311a;
            PaymentAuthConfig$Stripe3ds2Config paymentAuthConfig$Stripe3ds2Config = args.f44312b;
            String directoryServerId = stripe3ds2Fingerprint.f43927d.f43928a;
            this.f44340g.getClass();
            args.f44313c.getClass();
            String directoryServerName = stripe3ds2Fingerprint.f43925b;
            Stripe3ds2Fingerprint.DirectoryServerEncryption directoryServerEncryption = stripe3ds2Fingerprint.f43927d;
            ArrayList arrayList = directoryServerEncryption.f43930c;
            PublicKey directoryServerPublicKey = directoryServerEncryption.f43929b;
            String str = directoryServerEncryption.f43931d;
            StripeUiCustomization uiCustomization = paymentAuthConfig$Stripe3ds2Config.f42437b.f42438a;
            vv.a aVar = this.f44339f;
            aVar.getClass();
            Intrinsics.g(sdkTransactionId, "sdkTransactionId");
            Intrinsics.g(directoryServerId, "directoryServerID");
            Intrinsics.g(directoryServerName, "directoryServerName");
            Intrinsics.g(directoryServerPublicKey, "dsPublicKey");
            Intrinsics.g(uiCustomization, "uiCustomization");
            aVar.f93262a.getClass();
            if (!b70.g.O0(wv.l.f94734a, "2.2.0")) {
                throw new InvalidInputException("Message version is unsupported: ".concat("2.2.0"));
            }
            w wVar = aVar.f93264c;
            zv.a aVar2 = zv.b.f98686e;
            tv.c cVar = aVar.f93263b;
            aVar2.getClass();
            zv.a.a(directoryServerName, cVar);
            wVar.getClass();
            KeyPair keyPairA = ((uv.g) wVar.f75379c).a();
            z zVar = (z) wVar.f75378b;
            Intrinsics.g(directoryServerId, "directoryServerId");
            Intrinsics.g(directoryServerPublicKey, "directoryServerPublicKey");
            Intrinsics.g(sdkTransactionId, "sdkTransactionId");
            i iVar2 = new i();
            iVar2.f18209a = zVar;
            iVar2.f18210b = directoryServerId;
            iVar2.f18211c = directoryServerPublicKey;
            iVar2.f18212d = str;
            iVar2.f18213e = sdkTransactionId;
            iVar2.f18214f = keyPairA;
            int i13 = paymentAuthConfig$Stripe3ds2Config.f42436a;
            lVar2.f72247t = this;
            lVar2.f72248u = stripe3ds2Fingerprint;
            lVar2.f72249v = iVar2;
            lVar2.f72250w = i13;
            lVar2.f72253z = 1;
            Object objF = f(iVar2, stripe3ds2Fingerprint, this.n, i13, lVar2);
            if (objF != coroutineSingletons) {
                gVar = this;
                iVar = iVar2;
                obj = objF;
                i5 = i13;
                stripe3ds2Fingerprint2 = stripe3ds2Fingerprint;
            }
            return coroutineSingletons;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(eVar);
            return (ku.h) eVar;
        }
        int i14 = lVar2.f72250w;
        i iVar3 = lVar2.f72249v;
        stripe3ds2Fingerprint2 = lVar2.f72248u;
        g gVar3 = lVar2.f72247t;
        ResultKt.b(eVar);
        obj = ((Result) eVar).f71688a;
        i5 = i14;
        iVar = iVar3;
        gVar = gVar3;
        Throwable thA = Result.a(obj);
        if (thA != null) {
            int i15 = StripeException.f42562e;
            return new ku.e(new PaymentFlowResult$Unvalidated((String) null, 0, p6.u.i(thA), false, (String) null, (String) null, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        }
        Stripe3ds2AuthResult stripe3ds2AuthResult = (Stripe3ds2AuthResult) obj;
        String str2 = stripe3ds2Fingerprint2.f43924a;
        lVar2.f72247t = null;
        lVar2.f72248u = null;
        lVar2.f72249v = null;
        lVar2.f72253z = 2;
        Stripe3ds2TransactionContract.Args args2 = gVar.f44335b;
        l lVar3 = gVar.f44337d;
        Stripe3ds2AuthResult.Ares ares = stripe3ds2AuthResult.f43889b;
        if (ares == null) {
            String str3 = stripe3ds2AuthResult.f43895h;
            if (str3 != null) {
                lVar3.a(jt.a.c(gVar.f44338e, PaymentAnalyticsEvent.L, null, null, null, null, 62));
                StripeIntent stripeIntent = args2.f44313c;
                String f43533a = stripeIntent.getF43533a();
                String str4 = f43533a == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : f43533a;
                List list = e0.f49312l;
                int iQ = k0.q(stripeIntent);
                String f43539g = stripeIntent.getF43539g();
                String str5 = f43539g == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : f43539g;
                boolean z11 = args2.f44316f;
                String str6 = args2.f44315e.f42577b;
                Integer num = args2.f44317g;
                String str7 = gVar.n.f42576a;
                boolean z12 = gVar.f44345l;
                StripeToolbarCustomization stripeToolbarCustomization = new StripeToolbarCustomization();
                String string = gVar.f44334a.getString(2132019734);
                Intrinsics.g(string, "string");
                if (k.U0(string)) {
                    throw new InvalidInputException("String must not be null or empty");
                }
                stripeToolbarCustomization.f45047g = string;
                gVar2 = new ku.g(new PaymentBrowserAuthContract.Args(str4, iQ, str5, str3, null, z11, stripeToolbarCustomization, str6, true, false, num, str7, z12, null, false, 25088));
                eVar = gVar2;
            } else {
                Stripe3ds2AuthResult.ThreeDS2Error threeDS2Error = stripe3ds2AuthResult.f43894g;
                if (threeDS2Error == null || (strF1 = b70.g.f1(ul.b.Q(c0.k("Code: ", threeDS2Error.f43916d), c0.k("Detail: ", threeDS2Error.f43919g), c0.k("Description: ", threeDS2Error.f43918f), c0.k("Component: ", threeDS2Error.f43917e)), ", ", null, null, 0, null, 62)) == null) {
                    strF1 = "Invalid 3DS2 authentication response";
                }
                int i16 = StripeException.f42562e;
                eVar = new ku.e(new PaymentFlowResult$Unvalidated((String) null, 0, p6.u.i(new RuntimeException("Error encountered during 3DS2 authentication request. ".concat(strF1))), false, (String) null, (String) null, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
            }
        } else if ("C".equals(ares.f43908l)) {
            gVar2 = m0.y(gVar.f44343j, new f(ares, iVar, i5, gVar, str2, null), lVar2);
            if (gVar2 != coroutineSingletons) {
                gVar2 = (ku.h) gVar2;
            }
            eVar = gVar2;
        } else {
            lVar3.a(jt.a.c(gVar.f44338e, PaymentAnalyticsEvent.F, null, null, null, null, 62));
            eVar = new ku.e(new PaymentFlowResult$Unvalidated(args2.f44313c.getF43539g(), 0, (StripeException) null, false, (String) null, args2.f44315e.f42577b, 62));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(i iVar, Stripe3ds2Fingerprint stripe3ds2Fingerprint, ApiRequest$Options apiRequest$Options, int i5, ContinuationImpl continuationImpl) {
        m mVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i11 = mVar.f72256v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                mVar.f72256v = i11 - Integer.MIN_VALUE;
            } else {
                mVar = new m(this, continuationImpl);
            }
        }
        m mVar2 = mVar;
        Object objY = mVar2.f72254t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = mVar2.f72256v;
        if (i12 == 0) {
            ResultKt.b(objY);
            x4 x4Var = new x4(iVar, stripe3ds2Fingerprint, i5, this, apiRequest$Options, null);
            mVar2.f72256v = 1;
            objY = m0.y(this.f44343j, x4Var, mVar2);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        return ((Result) objY).f71688a;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(ContinuationImpl continuationImpl) {
        n nVar;
        Throwable th2;
        g gVar;
        Object objA;
        Throwable thA;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f72260w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f72260w = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objE = nVar.f72258u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f72260w;
        if (i11 == 0) {
            ResultKt.b(objE);
            this.f44337d.a(jt.a.c(this.f44338e, PaymentAnalyticsEvent.D, null, null, null, null, 62));
            try {
                int i12 = Result.f71687b;
                Stripe3ds2Fingerprint stripe3ds2Fingerprint = new Stripe3ds2Fingerprint(this.f44335b.f44314d);
                nVar.f72257t = this;
                nVar.f72260w = 1;
                objE = e(stripe3ds2Fingerprint, nVar);
                if (objE == coroutineSingletons) {
                    return coroutineSingletons;
                }
                gVar = this;
            } catch (Throwable th3) {
                th2 = th3;
                gVar = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
                thA = Result.a(objA);
                if (thA != null) {
                }
                gVar.f44344k.d("key_next_step", Boolean.TRUE);
                gVar.f44346m = true;
                return objA;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            gVar = nVar.f72257t;
            try {
                ResultKt.b(objE);
            } catch (Throwable th4) {
                th2 = th4;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th2);
                thA = Result.a(objA);
                if (thA != null) {
                }
                gVar.f44344k.d("key_next_step", Boolean.TRUE);
                gVar.f44346m = true;
                return objA;
            }
        }
        objA = (ku.h) objE;
        int i14 = Result.f71687b;
        thA = Result.a(objA);
        if (thA != null) {
            gVar.f44337d.a(jt.a.c(gVar.f44338e, PaymentAnalyticsEvent.C, null, null, null, null, 62));
            int i15 = StripeException.f42562e;
            objA = new ku.e(new PaymentFlowResult$Unvalidated((String) null, 0, p6.u.i(thA), false, (String) null, (String) null, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        }
        gVar.f44344k.d("key_next_step", Boolean.TRUE);
        gVar.f44346m = true;
        return objA;
    }
}
