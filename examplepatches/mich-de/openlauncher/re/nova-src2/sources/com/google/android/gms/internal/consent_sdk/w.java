package com.google.android.gms.internal.consent_sdk;

import android.content.Context;
import android.content.SharedPreferences;
import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public String f32277a;

    /* renamed from: b, reason: collision with root package name */
    public String f32278b;

    /* renamed from: c, reason: collision with root package name */
    public String f32279c;

    /* JADX WARN: Illegal instructions before constructor call */
    public w(Context context) {
        Intrinsics.g(context, "context");
        PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
        if (paymentConfiguration == null) {
            SharedPreferences sharedPreferences = new dq.o(context).f49358a;
            String string = sharedPreferences.getString("key_publishable_key", null);
            paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
            if (paymentConfiguration == null) {
                throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
            }
            PaymentConfiguration.f42439c = paymentConfiguration;
        }
        this(paymentConfiguration.f42440a, paymentConfiguration.f42441b, 1);
    }

    public String a() {
        return this.f32279c;
    }

    public w(String publishableKey, String str, int i5) {
        switch (i5) {
            case 2:
                this.f32277a = publishableKey;
                this.f32278b = str;
                this.f32279c = a80.m.h(publishableKey, "/{", str, "}");
                return;
            default:
                Intrinsics.g(publishableKey, "publishableKey");
                this.f32277a = str;
                if (!r70.k.U0(publishableKey)) {
                    if (!r70.j.I0(publishableKey, "sk_", false)) {
                        if (!r70.j.I0(publishableKey, "rk_", false)) {
                            this.f32278b = publishableKey;
                            this.f32279c = "22.7.0";
                            return;
                        }
                        throw new IllegalArgumentException("Invalid Publishable Key: You are using a restricted key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
                    }
                    throw new IllegalArgumentException("Invalid Publishable Key: You are using a secret key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
                }
                throw new IllegalArgumentException("Invalid Publishable Key: You must use a valid Stripe API key to make a Stripe API request. For more info, see https://stripe.com/docs/keys");
        }
    }
}
