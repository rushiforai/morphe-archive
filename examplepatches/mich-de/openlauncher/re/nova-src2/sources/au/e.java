package au;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.link.LinkConfiguration;
import com.stripe.android.link.f0;
import com.stripe.android.shoppay.ShopPayActivityContract;
import cw.o2;
import dq.o;
import es.n;
import fs.g0;
import fs.r0;
import fs.y;
import fv.k;
import gv.c0;
import h6.u0;
import j00.k0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import mt.n0;
import ou.q;
import t5.d0;

/* loaded from: classes4.dex */
public final class e implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15679a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f15680b;

    public /* synthetic */ e(Object obj, s40.h hVar, int i5) {
        this.f15679a = i5;
        this.f15680b = hVar;
    }

    public static xw.g a(Application context) {
        xw.g gVar;
        Intrinsics.g(context, "context");
        ks.c cVar = ks.c.f72187a;
        xw.g gVar2 = ks.c.f72188b;
        if (gVar2 != null) {
            return gVar2;
        }
        synchronized (cVar) {
            gVar = ks.c.f72188b;
            if (gVar == null) {
                gVar = new xw.g(new k0(3, (byte) 0), new d0(context));
                ks.c.f72188b = gVar;
            }
        }
        return gVar;
    }

    @Override // w60.a
    public final Object get() {
        PaymentConfiguration paymentConfiguration;
        Object objA;
        int i5 = this.f15679a;
        s40.h hVar = this.f15680b;
        switch (i5) {
            case 0:
                Context appContext = (Context) hVar.get();
                Intrinsics.g(appContext, "appContext");
                PaymentConfiguration paymentConfiguration2 = PaymentConfiguration.f42439c;
                if (paymentConfiguration2 != null) {
                    return paymentConfiguration2;
                }
                SharedPreferences sharedPreferences = new o(appContext).f49358a;
                String string = sharedPreferences.getString("key_publishable_key", null);
                paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                if (paymentConfiguration == null) {
                    throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                }
                PaymentConfiguration.f42439c = paymentConfiguration;
                return paymentConfiguration;
            case 1:
                String paymentElementCallbackIdentifier = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier);
                return null;
            case 2:
                n0 confirmationHandler = (n0) hVar.get();
                Intrinsics.g(confirmationHandler, "confirmationHandler");
                return new bu.g(confirmationHandler);
            case 3:
                u0 savedStateHandle = (u0) hVar.get();
                Intrinsics.g(savedStateHandle, "savedStateHandle");
                return new g0(savedStateHandle);
            case 4:
                return new o2((iu.f) hVar.get());
            case 5:
                return new f0((bu.e) hVar.get());
            case 6:
                return new r0((Context) hVar.get());
            case 7:
                return new gs.a((gs.b) hVar.get());
            case 8:
                return new gv.g((n) hVar.get());
            case 9:
                return new c0((k) hVar.get());
            case 10:
                return new ir.i((Context) hVar.get());
            case 11:
                return new js.a((LinkConfiguration) hVar.get());
            case 12:
                return new ju.c((Function1) hVar.get());
            case 13:
                return new ju.h((Function1) hVar.get());
            case 14:
                return ((Boolean) hVar.get()).booleanValue() ? xq.d.f96223a : xq.d.f96224b;
            case 15:
                Context appContext2 = (Context) hVar.get();
                Intrinsics.g(appContext2, "appContext");
                PaymentConfiguration paymentConfiguration3 = PaymentConfiguration.f42439c;
                if (paymentConfiguration3 != null) {
                    return paymentConfiguration3;
                }
                SharedPreferences sharedPreferences2 = new o(appContext2).f49358a;
                String string2 = sharedPreferences2.getString("key_publishable_key", null);
                paymentConfiguration = string2 != null ? new PaymentConfiguration(string2, sharedPreferences2.getString("key_account_id", null)) : null;
                if (paymentConfiguration == null) {
                    throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                }
                PaymentConfiguration.f42439c = paymentConfiguration;
                return paymentConfiguration;
            case 16:
                String paymentElementCallbackIdentifier2 = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier2, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier2);
                return null;
            case 17:
                y linkAccountManager = (y) hVar.get();
                Intrinsics.g(linkAccountManager, "linkAccountManager");
                return new wt.f(linkAccountManager);
            case 18:
                return a((Application) hVar.get());
            case 19:
                Context context = (Context) hVar.get();
                Intrinsics.g(context, "context");
                String packageName = context.getPackageName();
                Intrinsics.f(packageName, "getPackageName(...)");
                return new du.a(packageName);
            case 20:
                Context context2 = (Context) hVar.get();
                Intrinsics.g(context2, "context");
                return Boolean.valueOf(t2.c.D(context2));
            case 21:
                Object unsupportedNextActionHandler = (ju.h) hVar.get();
                Intrinsics.g(unsupportedNextActionHandler, "unsupportedNextActionHandler");
                try {
                    int i11 = Result.f71687b;
                    Object objNewInstance = Class.forName("com.stripe.android.payments.wechatpay.WeChatPayNextActionHandler").getConstructor(null).newInstance(null);
                    Intrinsics.e(objNewInstance, "null cannot be cast to non-null type com.stripe.android.payments.core.authentication.PaymentNextActionHandler<com.stripe.android.model.StripeIntent>");
                    objA = (ju.e) objNewInstance;
                } catch (Throwable th2) {
                    int i12 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (!(objA instanceof Result.Failure)) {
                    unsupportedNextActionHandler = objA;
                }
                return (ju.e) unsupportedNextActionHandler;
            case 22:
                return new com.stripe.android.paymentelement.confirmation.b((ou.e) hVar.get());
            case 23:
                return new ShopPayActivityContract((String) hVar.get());
            case 24:
                return new q((n) hVar.get());
            case 25:
                String paymentElementCallbackIdentifier3 = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier3, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier3);
                return null;
            case 26:
                Application application = (Application) hVar.get();
                Intrinsics.g(application, "application");
                String packageName2 = application.getPackageName();
                Intrinsics.f(packageName2, "getPackageName(...)");
                return packageName2;
            case 27:
                String paymentElementCallbackIdentifier4 = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier4, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier4);
                return null;
            case 28:
                String paymentElementCallbackIdentifier5 = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier5, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier5);
                return null;
            default:
                String paymentElementCallbackIdentifier6 = (String) hVar.get();
                Intrinsics.g(paymentElementCallbackIdentifier6, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier6);
                return null;
        }
    }

    public /* synthetic */ e(s40.h hVar, int i5) {
        this.f15679a = i5;
        this.f15680b = hVar;
    }
}
