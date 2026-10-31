package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/DefaultCardFundingFilter;", "Lcom/stripe/android/CardFundingFilter;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class DefaultCardFundingFilter implements CardFundingFilter {

    /* renamed from: a, reason: collision with root package name */
    public static final DefaultCardFundingFilter f42422a = new DefaultCardFundingFilter();

    @NotNull
    public static final Parcelable.Creator<DefaultCardFundingFilter> CREATOR = new di.b(5);

    @Override // com.stripe.android.CardFundingFilter
    public final /* bridge */ /* synthetic */ Integer E() {
        return null;
    }

    @Override // com.stripe.android.CardFundingFilter
    public final boolean H(ft.c cardFunding) {
        Intrinsics.g(cardFunding, "cardFunding");
        return true;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(1);
    }
}
