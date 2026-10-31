package com.stripe.android.core.networking;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import fr.h;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/core/networking/ApiRequest$Options", "Landroid/os/Parcelable;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ApiRequest$Options implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ApiRequest$Options> CREATOR = new h();

    /* renamed from: a, reason: collision with root package name */
    public final String f42576a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42577b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42578c;

    public /* synthetic */ ApiRequest$Options(String str, String str2, int i5) {
        this(str, (i5 & 2) != 0 ? null : str2, (String) null);
    }

    public static ApiRequest$Options a(ApiRequest$Options apiRequest$Options, String apiKey, int i5) {
        if ((i5 & 1) != 0) {
            apiKey = apiRequest$Options.f42576a;
        }
        String str = (i5 & 2) != 0 ? apiRequest$Options.f42577b : null;
        String str2 = apiRequest$Options.f42578c;
        apiRequest$Options.getClass();
        Intrinsics.g(apiKey, "apiKey");
        return new ApiRequest$Options(apiKey, str, str2);
    }

    public final boolean b() {
        return !k.K0(this.f42576a, "test", false);
    }

    public final boolean d() {
        return j.I0(this.f42576a, "uk_", false);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ApiRequest$Options)) {
            return false;
        }
        ApiRequest$Options apiRequest$Options = (ApiRequest$Options) obj;
        return Intrinsics.b(this.f42576a, apiRequest$Options.f42576a) && Intrinsics.b(this.f42577b, apiRequest$Options.f42577b) && Intrinsics.b(this.f42578c, apiRequest$Options.f42578c);
    }

    public final int hashCode() {
        int iHashCode = this.f42576a.hashCode() * 31;
        String str = this.f42577b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42578c;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.q(c0.w("Options(apiKey=", this.f42576a, ", stripeAccount=", this.f42577b, ", idempotencyKey="), this.f42578c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42576a);
        dest.writeString(this.f42577b);
        dest.writeString(this.f42578c);
    }

    public ApiRequest$Options(String apiKey, String str, String str2) {
        Intrinsics.g(apiKey, "apiKey");
        this.f42576a = apiKey;
        this.f42577b = str;
        this.f42578c = str2;
        if (k.U0(apiKey)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You must use a valid Stripe API key to make a Stripe API request. For more info, see https://stripe.com/docs/keys");
        }
        if (j.I0(apiKey, "sk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a secret key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        if (j.I0(apiKey, "rk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a restricted key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ApiRequest$Options(Function0 publishableKeyProvider, Function0 stripeAccountIdProvider) {
        this((String) publishableKeyProvider.invoke(), (String) stripeAccountIdProvider.invoke(), 4);
        Intrinsics.g(publishableKeyProvider, "publishableKeyProvider");
        Intrinsics.g(stripeAccountIdProvider, "stripeAccountIdProvider");
    }
}
