package com.stripe.android.attestation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/attestation/AttestationActivityResult;", "Landroid/os/Parcelable;", "Success", "Failed", "Lcom/stripe/android/attestation/AttestationActivityResult$Failed;", "Lcom/stripe/android/attestation/AttestationActivityResult$Success;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AttestationActivityResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/attestation/AttestationActivityResult$Failed;", "Lcom/stripe/android/attestation/AttestationActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements AttestationActivityResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42460a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42460a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42460a, ((Failed) obj).f42460a);
        }

        public final int hashCode() {
            return this.f42460a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42460a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42460a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/attestation/AttestationActivityResult$Success;", "Lcom/stripe/android/attestation/AttestationActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success implements AttestationActivityResult {

        @NotNull
        public static final Parcelable.Creator<Success> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f42461a;

        public Success(String token) {
            Intrinsics.g(token, "token");
            this.f42461a = token;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Success) && Intrinsics.b(this.f42461a, ((Success) obj).f42461a);
        }

        public final int hashCode() {
            return this.f42461a.hashCode();
        }

        public final String toString() {
            return c0.l("Success(token=", this.f42461a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42461a);
        }
    }
}
