package com.stripe.android.challenge.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult;", "Landroid/os/Parcelable;", "Success", "Failed", "Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult$Failed;", "Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult$Success;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface IntentConfirmationChallengeActivityResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult$Failed;", "Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements IntentConfirmationChallengeActivityResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42490a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42490a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42490a, ((Failed) obj).f42490a);
        }

        public final int hashCode() {
            return this.f42490a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42490a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42490a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult$Success;", "Lcom/stripe/android/challenge/confirmation/IntentConfirmationChallengeActivityResult;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success implements IntentConfirmationChallengeActivityResult {

        @NotNull
        public static final Parcelable.Creator<Success> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f42491a;

        public Success(String clientSecret) {
            Intrinsics.g(clientSecret, "clientSecret");
            this.f42491a = clientSecret;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Success) && Intrinsics.b(this.f42491a, ((Success) obj).f42491a);
        }

        public final int hashCode() {
            return this.f42491a.hashCode();
        }

        public final String toString() {
            return c0.l("Success(clientSecret=", this.f42491a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42491a);
        }
    }
}
