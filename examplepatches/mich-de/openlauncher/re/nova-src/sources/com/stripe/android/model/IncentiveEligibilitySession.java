package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/model/IncentiveEligibilitySession;", "Landroid/os/Parcelable;", "PaymentIntent", "SetupIntent", "DeferredIntent", "Lcom/stripe/android/model/IncentiveEligibilitySession$DeferredIntent;", "Lcom/stripe/android/model/IncentiveEligibilitySession$PaymentIntent;", "Lcom/stripe/android/model/IncentiveEligibilitySession$SetupIntent;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface IncentiveEligibilitySession extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/IncentiveEligibilitySession$DeferredIntent;", "Lcom/stripe/android/model/IncentiveEligibilitySession;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DeferredIntent implements IncentiveEligibilitySession {

        @NotNull
        public static final Parcelable.Creator<DeferredIntent> CREATOR = new q1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43498a;

        public DeferredIntent(String id2) {
            Intrinsics.g(id2, "id");
            this.f43498a = id2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof DeferredIntent) && Intrinsics.b(this.f43498a, ((DeferredIntent) obj).f43498a);
        }

        @Override // com.stripe.android.model.IncentiveEligibilitySession
        /* renamed from: getId, reason: from getter */
        public final String getF43500a() {
            return this.f43498a;
        }

        public final int hashCode() {
            return this.f43498a.hashCode();
        }

        public final String toString() {
            return b.c0.l("DeferredIntent(id=", this.f43498a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43498a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/IncentiveEligibilitySession$PaymentIntent;", "Lcom/stripe/android/model/IncentiveEligibilitySession;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class PaymentIntent implements IncentiveEligibilitySession {

        @NotNull
        public static final Parcelable.Creator<PaymentIntent> CREATOR = new r1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43499a;

        public PaymentIntent(String id2) {
            Intrinsics.g(id2, "id");
            this.f43499a = id2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof PaymentIntent) && Intrinsics.b(this.f43499a, ((PaymentIntent) obj).f43499a);
        }

        @Override // com.stripe.android.model.IncentiveEligibilitySession
        /* renamed from: getId, reason: from getter */
        public final String getF43500a() {
            return this.f43499a;
        }

        public final int hashCode() {
            return this.f43499a.hashCode();
        }

        public final String toString() {
            return b.c0.l("PaymentIntent(id=", this.f43499a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43499a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/IncentiveEligibilitySession$SetupIntent;", "Lcom/stripe/android/model/IncentiveEligibilitySession;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupIntent implements IncentiveEligibilitySession {

        @NotNull
        public static final Parcelable.Creator<SetupIntent> CREATOR = new s1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43500a;

        public SetupIntent(String id2) {
            Intrinsics.g(id2, "id");
            this.f43500a = id2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SetupIntent) && Intrinsics.b(this.f43500a, ((SetupIntent) obj).f43500a);
        }

        @Override // com.stripe.android.model.IncentiveEligibilitySession
        /* renamed from: getId, reason: from getter */
        public final String getF43500a() {
            return this.f43500a;
        }

        public final int hashCode() {
            return this.f43500a.hashCode();
        }

        public final String toString() {
            return b.c0.l("SetupIntent(id=", this.f43500a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43500a);
        }
    }

    /* renamed from: getId */
    String getF43500a();
}
