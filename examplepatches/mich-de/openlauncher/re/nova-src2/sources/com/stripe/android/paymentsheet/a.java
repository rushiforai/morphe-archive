package com.stripe.android.paymentsheet;

import android.app.ActivityOptions;
import android.app.Application;
import android.os.Build;
import android.view.Window;
import com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost;
import com.stripe.android.paymentsheet.PaymentSheetContract;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final j.c f44672a;

    /* renamed from: b, reason: collision with root package name */
    public final g.o f44673b;

    /* renamed from: c, reason: collision with root package name */
    public final g.o f44674c;

    /* renamed from: d, reason: collision with root package name */
    public final Application f44675d;

    /* renamed from: e, reason: collision with root package name */
    public final a5.i f44676e;

    /* renamed from: f, reason: collision with root package name */
    public final String f44677f;

    public a(g.o oVar, a5.i iVar) {
        j.c activityResultLauncher = oVar.registerForActivityResult(new PaymentSheetContract(), new as.n(iVar, 11));
        Application application = oVar.getApplication();
        Intrinsics.f(application, "getApplication(...)");
        Intrinsics.g(activityResultLauncher, "activityResultLauncher");
        this.f44672a = activityResultLauncher;
        this.f44673b = oVar;
        this.f44674c = oVar;
        this.f44675d = application;
        this.f44676e = iVar;
        this.f44677f = "PaymentSheet";
        oVar.getLifecycle().a(new mt.m0(this, 2));
    }

    public final void a(PaymentElementLoader$InitializationMode paymentElementLoader$InitializationMode, PaymentSheet$Configuration paymentSheet$Configuration) {
        PaymentSheet$Configuration paymentSheet$Configuration2;
        Window window;
        g.o activity = this.f44673b;
        if (paymentSheet$Configuration == null) {
            Intrinsics.g(activity, "context");
            String merchantDisplayName = activity.getApplicationInfo().loadLabel(activity.getPackageManager()).toString();
            PaymentSheet$BillingDetails paymentSheet$BillingDetails = pq.a.f82797b;
            PaymentSheet$Appearance appearance = pq.a.f82796a;
            PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = pq.a.f82798c;
            EmptyList preferredNetworks = pq.a.f82801f;
            Intrinsics.g(merchantDisplayName, "merchantDisplayName");
            Intrinsics.g(appearance, "appearance");
            Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
            Intrinsics.g(preferredNetworks, "preferredNetworks");
            paymentSheet$Configuration2 = new PaymentSheet$Configuration(merchantDisplayName, null, null, paymentSheet$BillingDetails, null, false, false, appearance, null, billingDetailsCollectionConfiguration, preferredNetworks, true, pq.a.f82800e, pq.a.f82802g, pq.a.f82803h, pq.a.f82804i, pq.a.f82805j, pq.a.f82806k, pq.a.f82799d, pq.a.f82807l, null, null, b70.h.f17594a, false, null);
        } else {
            paymentSheet$Configuration2 = paymentSheet$Configuration;
        }
        Intrinsics.g(activity, "activity");
        Integer numValueOf = null;
        if (Build.VERSION.SDK_INT <= 34 && (window = activity.getWindow()) != null) {
            numValueOf = Integer.valueOf(window.getStatusBarColor());
        }
        try {
            this.f44672a.a(new PaymentSheetContract.Args(paymentElementLoader$InitializationMode, paymentSheet$Configuration2, this.f44677f, numValueOf, false), new n4.c(ActivityOptions.makeCustomAnimation(this.f44675d.getApplicationContext(), 2130772049, 2130772050)));
        } catch (IllegalStateException e3) {
            PaymentSheetResult.Failed failed = new PaymentSheetResult.Failed(new IllegalStateException("The host activity is not in a valid state (" + this.f44674c.getLifecycle().b() + ").", e3));
            this.f44676e.getClass();
            StripePaymentSheetHost.Companion.register$lambda$0(failed);
        }
    }
}
