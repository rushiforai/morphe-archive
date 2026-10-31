package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/MobileCardElementConfig;", "Lcom/stripe/android/core/model/StripeModel;", "CardBrandChoice", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class MobileCardElementConfig implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<MobileCardElementConfig> CREATOR = new b2();

    /* renamed from: a, reason: collision with root package name */
    public final CardBrandChoice f43526a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/MobileCardElementConfig$CardBrandChoice;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CardBrandChoice implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<CardBrandChoice> CREATOR = new a2();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f43527a;

        public CardBrandChoice(boolean z11) {
            this.f43527a = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof CardBrandChoice) && this.f43527a == ((CardBrandChoice) obj).f43527a;
        }

        public final int hashCode() {
            return Boolean.hashCode(this.f43527a);
        }

        public final String toString() {
            return a80.m.i("CardBrandChoice(eligible=", ")", this.f43527a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f43527a ? 1 : 0);
        }
    }

    public MobileCardElementConfig(CardBrandChoice cardBrandChoice) {
        Intrinsics.g(cardBrandChoice, "cardBrandChoice");
        this.f43526a = cardBrandChoice;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof MobileCardElementConfig) && Intrinsics.b(this.f43526a, ((MobileCardElementConfig) obj).f43526a);
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f43526a.f43527a);
    }

    public final String toString() {
        return "MobileCardElementConfig(cardBrandChoice=" + this.f43526a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43526a.writeToParcel(dest, i5);
    }
}
