package as;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import h6.u0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15608a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.e f15609b;

    public /* synthetic */ h(Object obj, s40.e eVar, int i5) {
        this.f15608a = i5;
        this.f15609b = eVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f15608a) {
            case 0:
                return new g((Context) this.f15609b.f86659a);
            case 1:
                return new au.i((u0) this.f15609b.f86659a);
            case 2:
                Application application = (Application) this.f15609b.f86659a;
                Intrinsics.g(application, "application");
                return application;
            case 3:
                Application application2 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application2, "application");
                return application2;
            case 4:
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) this.f15609b.f86659a;
                Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
                return ps.v.y(paymentMethodMetadata);
            case 5:
                Application application3 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application3, "application");
                return application3;
            case 6:
                CoroutineContext ioDispatcher = (CoroutineContext) this.f15609b.f86659a;
                Intrinsics.g(ioDispatcher, "ioDispatcher");
                iw.p pVar = new iw.p(15);
                io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c();
                cVar.f67327a = pVar;
                cVar.f67328b = ioDispatcher;
                return cVar;
            case 7:
                Context context = (Context) this.f15609b.f86659a;
                Intrinsics.g(context, "context");
                String packageName = context.getPackageName();
                Intrinsics.f(packageName, "getPackageName(...)");
                return new du.a(packageName);
            case 8:
                Application application4 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application4, "application");
                return application4;
            case 9:
                Application application5 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application5, "application");
                PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                if (paymentConfiguration == null) {
                    SharedPreferences sharedPreferences = new dq.o(application5).f49358a;
                    String string = sharedPreferences.getString("key_publishable_key", null);
                    paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                    if (paymentConfiguration == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                }
                return paymentConfiguration;
            case 10:
                return new vt.s((vt.m) this.f15609b.f86659a);
            case 11:
                Application application6 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application6, "application");
                Context applicationContext = application6.getApplicationContext();
                Intrinsics.f(applicationContext, "getApplicationContext(...)");
                return applicationContext;
            default:
                Application application7 = (Application) this.f15609b.f86659a;
                Intrinsics.g(application7, "application");
                return application7;
        }
    }

    public /* synthetic */ h(s40.e eVar, int i5) {
        this.f15608a = i5;
        this.f15609b = eVar;
    }
}
