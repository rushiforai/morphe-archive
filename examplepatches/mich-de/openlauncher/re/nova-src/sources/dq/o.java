package dq;

import android.content.Context;
import android.content.SharedPreferences;
import com.stripe.android.PaymentConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final String f49357b = PaymentConfiguration.class.getCanonicalName();

    /* renamed from: a, reason: collision with root package name */
    public final SharedPreferences f49358a;

    public o(Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(f49357b, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.f49358a = sharedPreferences;
    }
}
