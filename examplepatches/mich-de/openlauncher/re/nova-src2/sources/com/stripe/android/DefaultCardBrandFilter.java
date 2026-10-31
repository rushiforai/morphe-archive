package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/DefaultCardBrandFilter;", "Lcom/stripe/android/CardBrandFilter;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class DefaultCardBrandFilter implements CardBrandFilter {

    /* renamed from: a, reason: collision with root package name */
    public static final DefaultCardBrandFilter f42421a = new DefaultCardBrandFilter();

    @NotNull
    public static final Parcelable.Creator<DefaultCardBrandFilter> CREATOR = new di.b(4);

    @Override // com.stripe.android.CardBrandFilter
    public final boolean M(ft.b cardBrand) {
        Intrinsics.g(cardBrand, "cardBrand");
        return true;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // com.stripe.android.CardBrandFilter
    public final boolean q0(PaymentMethod paymentMethod) {
        return true;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(1);
    }
}
