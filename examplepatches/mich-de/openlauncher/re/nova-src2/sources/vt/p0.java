package vt;

import android.content.Context;
import android.content.SharedPreferences;
import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p0 implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93102a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f93103b;

    public /* synthetic */ p0(s40.h hVar, int i5) {
        this.f93102a = i5;
        this.f93103b = hVar;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f93102a) {
            case 0:
                String paymentElementCallbackIdentifier = (String) this.f93103b.get();
                Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier);
                return null;
            case 1:
                String paymentElementCallbackIdentifier2 = (String) this.f93103b.get();
                Intrinsics.g(paymentElementCallbackIdentifier2, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier2);
                return null;
            case 2:
                qu.c defaultAddressLauncherEventReporter = (qu.c) this.f93103b.get();
                Intrinsics.g(defaultAddressLauncherEventReporter, "defaultAddressLauncherEventReporter");
                return defaultAddressLauncherEventReporter;
            case 3:
                Context context = (Context) this.f93103b.get();
                Intrinsics.g(context, "context");
                return new n00.d(context, 11);
            case 4:
                Context appContext = (Context) this.f93103b.get();
                Intrinsics.g(appContext, "appContext");
                PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                if (paymentConfiguration == null) {
                    SharedPreferences sharedPreferences = new dq.o(appContext).f49358a;
                    String string = sharedPreferences.getString("key_publishable_key", null);
                    paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                    if (paymentConfiguration == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                }
                return paymentConfiguration;
            case 5:
                s40.h paymentConfiguration2 = this.f93103b;
                Intrinsics.g(paymentConfiguration2, "paymentConfiguration");
                return new n0(paymentConfiguration2, 3);
            case 6:
                String paymentElementCallbackIdentifier3 = (String) this.f93103b.get();
                Intrinsics.g(paymentElementCallbackIdentifier3, "paymentElementCallbackIdentifier");
                lt.a.a(paymentElementCallbackIdentifier3);
                return null;
            case 7:
                h6.u0 savedStateHandle = (h6.u0) this.f93103b.get();
                Intrinsics.g(savedStateHandle, "savedStateHandle");
                return new fs.g0(savedStateHandle);
            default:
                return new wt.f((fs.h0) this.f93103b.get());
        }
    }

    public /* synthetic */ p0(o0 o0Var, s40.d dVar, int i5) {
        this.f93102a = i5;
        this.f93103b = dVar;
    }
}
