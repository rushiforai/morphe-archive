package dq;

import android.content.Context;
import jt.b1;
import jt.c1;
import jt.z0;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import t70.y0;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: c, reason: collision with root package name */
    public static final String f49365c = xq.a.f96218c.a();

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f49366d = true;

    /* renamed from: a, reason: collision with root package name */
    public final z0 f49367a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49368b;

    public s(Context context, String publishableKey) {
        EmptySet betas = EmptySet.f71734a;
        Intrinsics.g(context, "context");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(betas, "betas");
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "getApplicationContext(...)");
        Context applicationContext2 = context.getApplicationContext();
        Intrinsics.f(applicationContext2, "getApplicationContext(...)");
        int i5 = 0;
        r rVar = new r(publishableKey, i5);
        c1.f69772a.getClass();
        z0 z0Var = new z0(applicationContext2, rVar, b1.f69764b, xq.d.f96224b, null, null, null, null, betas, 57312);
        if (r70.k.U0(publishableKey)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You must use a valid Stripe API key to make a Stripe API request. For more info, see https://stripe.com/docs/keys");
        }
        if (r70.j.I0(publishableKey, "sk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a secret key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        if (r70.j.I0(publishableKey, "rk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a restricted key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        Context applicationContext3 = applicationContext.getApplicationContext();
        Intrinsics.f(applicationContext3, "getApplicationContext(...)");
        new e0(applicationContext3, new r(publishableKey, i5), z0Var, null, 496);
        a80.e eVar = y0.f88884a;
        a80.d workContext = a80.d.f488c;
        Intrinsics.g(workContext, "workContext");
        this.f49367a = z0Var;
        if (r70.k.U0(publishableKey)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You must use a valid Stripe API key to make a Stripe API request. For more info, see https://stripe.com/docs/keys");
        }
        if (r70.j.I0(publishableKey, "sk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a secret key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        if (r70.j.I0(publishableKey, "rk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a restricted key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        this.f49368b = publishableKey;
    }
}
