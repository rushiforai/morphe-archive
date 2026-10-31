package com.stripe.android.payments.core.authentication.threeds2;

import com.stripe.android.PaymentAuthConfig$Stripe3ds2Config;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionContract;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import dq.k;
import h10.y0;
import java.util.Set;
import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends ju.e {

    /* renamed from: a, reason: collision with root package name */
    public final k f44320a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f44321b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f44322c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f44323d;

    /* renamed from: e, reason: collision with root package name */
    public j.c f44324e;

    /* renamed from: f, reason: collision with root package name */
    public final y0 f44325f;

    public a(k config, boolean z11, Function0 publishableKeyProvider, Set productUsage) {
        Intrinsics.g(config, "config");
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(productUsage, "productUsage");
        this.f44320a = config;
        this.f44321b = z11;
        this.f44322c = publishableKeyProvider;
        this.f44323d = productUsage;
        this.f44325f = new y0(this, 19);
    }

    @Override // ju.e
    public final void a() {
        j.c cVar = this.f44324e;
        if (cVar != null) {
            cVar.b();
        }
        this.f44324e = null;
    }

    @Override // ju.e
    public final void b(j.b bVar, j.a aVar) {
        this.f44324e = bVar.registerForActivityResult(new Stripe3ds2TransactionContract(), aVar);
    }

    @Override // ju.e
    public final Object d(ww.a aVar, Object obj, ApiRequest$Options apiRequest$Options, ju.d dVar) {
        StripeIntent stripeIntent = (StripeIntent) obj;
        e eVar = (e) this.f44325f.invoke(aVar);
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        SdkTransactionId sdkTransactionId = new SdkTransactionId(uuidRandomUUID);
        PaymentAuthConfig$Stripe3ds2Config paymentAuthConfig$Stripe3ds2Config = this.f44320a.f49353a;
        StripeIntent.NextActionData f43553w = stripeIntent.getF43553w();
        Intrinsics.e(f43553w, "null cannot be cast to non-null type com.stripe.android.model.StripeIntent.NextActionData.SdkData.Use3DS2");
        eVar.a(new Stripe3ds2TransactionContract.Args(sdkTransactionId, paymentAuthConfig$Stripe3ds2Config, stripeIntent, (StripeIntent.NextActionData.SdkData.Use3DS2) f43553w, apiRequest$Options, this.f44321b, aVar.f94747b, (String) this.f44322c.invoke(), this.f44323d));
        return Unit.f71706a;
    }
}
