package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/LinkConsumerIncentive;", "Lcom/stripe/android/core/model/StripeModel;", "IncentiveParams", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkConsumerIncentive implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<LinkConsumerIncentive> CREATOR = new t1();

    /* renamed from: a, reason: collision with root package name */
    public final IncentiveParams f43505a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43506b;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/LinkConsumerIncentive$IncentiveParams;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class IncentiveParams implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<IncentiveParams> CREATOR = new u1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43507a;

        public IncentiveParams(String paymentMethod) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f43507a = paymentMethod;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof IncentiveParams) && Intrinsics.b(this.f43507a, ((IncentiveParams) obj).f43507a);
        }

        public final int hashCode() {
            return this.f43507a.hashCode();
        }

        public final String toString() {
            return b.c0.l("IncentiveParams(paymentMethod=", this.f43507a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43507a);
        }
    }

    public LinkConsumerIncentive(IncentiveParams incentiveParams, String str) {
        Intrinsics.g(incentiveParams, "incentiveParams");
        this.f43505a = incentiveParams;
        this.f43506b = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkConsumerIncentive)) {
            return false;
        }
        LinkConsumerIncentive linkConsumerIncentive = (LinkConsumerIncentive) obj;
        return Intrinsics.b(this.f43505a, linkConsumerIncentive.f43505a) && Intrinsics.b(this.f43506b, linkConsumerIncentive.f43506b);
    }

    public final int hashCode() {
        int iHashCode = this.f43505a.f43507a.hashCode() * 31;
        String str = this.f43506b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "LinkConsumerIncentive(incentiveParams=" + this.f43505a + ", incentiveDisplayText=" + this.f43506b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f43505a.writeToParcel(dest, i5);
        dest.writeString(this.f43506b);
    }
}
