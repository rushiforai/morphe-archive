package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import com.stripe.android.stripe3ds2.transactions.ChallengeResponseData;
import com.stripe.android.stripe3ds2.transactions.ErrorData;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006\u0082\u0001\u0002\u0007\b¨\u0006\t"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult;", "Landroid/os/Parcelable;", "Success", "Failure", "ProtocolError", "RuntimeError", "Timeout", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Failure;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Success;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class ChallengeRequestResult implements Parcelable {

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001\u0082\u0001\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Failure;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$ProtocolError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$RuntimeError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Timeout;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Failure extends ChallengeRequestResult {
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$ProtocolError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Failure;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ProtocolError extends Failure {

        @NotNull
        public static final Parcelable.Creator<ProtocolError> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final ErrorData f45082a;

        public ProtocolError(ErrorData data) {
            Intrinsics.g(data, "data");
            this.f45082a = data;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof ProtocolError) && Intrinsics.b(this.f45082a, ((ProtocolError) obj).f45082a);
        }

        public final int hashCode() {
            return this.f45082a.hashCode();
        }

        public final String toString() {
            return "ProtocolError(data=" + this.f45082a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f45082a.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$RuntimeError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Failure;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class RuntimeError extends Failure {

        @NotNull
        public static final Parcelable.Creator<RuntimeError> CREATOR = new k();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f45083a;

        public RuntimeError(Throwable throwable) {
            Intrinsics.g(throwable, "throwable");
            this.f45083a = throwable;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof RuntimeError) && Intrinsics.b(this.f45083a, ((RuntimeError) obj).f45083a);
        }

        public final int hashCode() {
            return this.f45083a.hashCode();
        }

        public final String toString() {
            return fq.c.d("RuntimeError(throwable=", ")", this.f45083a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f45083a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Success;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Success extends ChallengeRequestResult {

        @NotNull
        public static final Parcelable.Creator<Success> CREATOR = new l();

        /* renamed from: a, reason: collision with root package name */
        public final ChallengeRequestData f45084a;

        /* renamed from: b, reason: collision with root package name */
        public final ChallengeResponseData f45085b;

        /* renamed from: c, reason: collision with root package name */
        public final ChallengeRequestExecutor$Config f45086c;

        public Success(ChallengeRequestData creqData, ChallengeResponseData cresData, ChallengeRequestExecutor$Config creqExecutorConfig) {
            Intrinsics.g(creqData, "creqData");
            Intrinsics.g(cresData, "cresData");
            Intrinsics.g(creqExecutorConfig, "creqExecutorConfig");
            this.f45084a = creqData;
            this.f45085b = cresData;
            this.f45086c = creqExecutorConfig;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Success)) {
                return false;
            }
            Success success = (Success) obj;
            return Intrinsics.b(this.f45084a, success.f45084a) && Intrinsics.b(this.f45085b, success.f45085b) && Intrinsics.b(this.f45086c, success.f45086c);
        }

        public final int hashCode() {
            return this.f45086c.hashCode() + ((this.f45085b.hashCode() + (this.f45084a.hashCode() * 31)) * 31);
        }

        public final String toString() {
            return "Success(creqData=" + this.f45084a + ", cresData=" + this.f45085b + ", creqExecutorConfig=" + this.f45086c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f45084a.writeToParcel(dest, i5);
            this.f45085b.writeToParcel(dest, i5);
            this.f45086c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Timeout;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestResult$Failure;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Timeout extends Failure {

        @NotNull
        public static final Parcelable.Creator<Timeout> CREATOR = new m();

        /* renamed from: a, reason: collision with root package name */
        public final ErrorData f45087a;

        public Timeout(ErrorData data) {
            Intrinsics.g(data, "data");
            this.f45087a = data;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Timeout) && Intrinsics.b(this.f45087a, ((Timeout) obj).f45087a);
        }

        public final int hashCode() {
            return this.f45087a.hashCode();
        }

        public final String toString() {
            return "Timeout(data=" + this.f45087a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f45087a.writeToParcel(dest, i5);
        }
    }
}
