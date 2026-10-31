package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.transactions.ErrorData;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0006\u0002\u0003\u0004\u0005\u0006\u0007\u0082\u0001\u0006\b\t\n\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "Landroid/os/Parcelable;", "Succeeded", "Failed", "Canceled", "ProtocolError", "RuntimeError", "Timeout", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Canceled;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Failed;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$ProtocolError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$RuntimeError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Succeeded;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Timeout;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class ChallengeResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Canceled;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new o();

        /* renamed from: a, reason: collision with root package name */
        public final String f45088a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45089b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45090c;

        public Canceled(String str, xv.d dVar, IntentData intentData) {
            Intrinsics.g(intentData, "intentData");
            this.f45088a = str;
            this.f45089b = dVar;
            this.f45090c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45089b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45090c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Canceled)) {
                return false;
            }
            Canceled canceled = (Canceled) obj;
            return Intrinsics.b(this.f45088a, canceled.f45088a) && this.f45089b == canceled.f45089b && Intrinsics.b(this.f45090c, canceled.f45090c);
        }

        public final int hashCode() {
            String str = this.f45088a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            xv.d dVar = this.f45089b;
            return this.f45090c.hashCode() + ((iHashCode + (dVar != null ? dVar.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "Canceled(uiTypeCode=" + this.f45088a + ", initialUiType=" + this.f45089b + ", intentData=" + this.f45090c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45088a);
            xv.d dVar = this.f45089b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45090c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Failed;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new p();

        /* renamed from: a, reason: collision with root package name */
        public final String f45091a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45092b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45093c;

        public Failed(String uiTypeCode, xv.d dVar, IntentData intentData) {
            Intrinsics.g(uiTypeCode, "uiTypeCode");
            Intrinsics.g(intentData, "intentData");
            this.f45091a = uiTypeCode;
            this.f45092b = dVar;
            this.f45093c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45092b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45093c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Failed)) {
                return false;
            }
            Failed failed = (Failed) obj;
            return Intrinsics.b(this.f45091a, failed.f45091a) && this.f45092b == failed.f45092b && Intrinsics.b(this.f45093c, failed.f45093c);
        }

        public final int hashCode() {
            int iHashCode = this.f45091a.hashCode() * 31;
            xv.d dVar = this.f45092b;
            return this.f45093c.hashCode() + ((iHashCode + (dVar == null ? 0 : dVar.hashCode())) * 31);
        }

        public final String toString() {
            return "Failed(uiTypeCode=" + this.f45091a + ", initialUiType=" + this.f45092b + ", intentData=" + this.f45093c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45091a);
            xv.d dVar = this.f45092b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45093c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$ProtocolError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ProtocolError extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<ProtocolError> CREATOR = new q();

        /* renamed from: a, reason: collision with root package name */
        public final ErrorData f45094a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45095b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45096c;

        public ProtocolError(ErrorData data, xv.d dVar, IntentData intentData) {
            Intrinsics.g(data, "data");
            Intrinsics.g(intentData, "intentData");
            this.f45094a = data;
            this.f45095b = dVar;
            this.f45096c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45095b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45096c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ProtocolError)) {
                return false;
            }
            ProtocolError protocolError = (ProtocolError) obj;
            return Intrinsics.b(this.f45094a, protocolError.f45094a) && this.f45095b == protocolError.f45095b && Intrinsics.b(this.f45096c, protocolError.f45096c);
        }

        public final int hashCode() {
            int iHashCode = this.f45094a.hashCode() * 31;
            xv.d dVar = this.f45095b;
            return this.f45096c.hashCode() + ((iHashCode + (dVar == null ? 0 : dVar.hashCode())) * 31);
        }

        public final String toString() {
            return "ProtocolError(data=" + this.f45094a + ", initialUiType=" + this.f45095b + ", intentData=" + this.f45096c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f45094a.writeToParcel(dest, i5);
            xv.d dVar = this.f45095b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45096c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$RuntimeError;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class RuntimeError extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<RuntimeError> CREATOR = new r();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f45097a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45098b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45099c;

        public RuntimeError(Throwable throwable, xv.d dVar, IntentData intentData) {
            Intrinsics.g(throwable, "throwable");
            Intrinsics.g(intentData, "intentData");
            this.f45097a = throwable;
            this.f45098b = dVar;
            this.f45099c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45098b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45099c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof RuntimeError)) {
                return false;
            }
            RuntimeError runtimeError = (RuntimeError) obj;
            return Intrinsics.b(this.f45097a, runtimeError.f45097a) && this.f45098b == runtimeError.f45098b && Intrinsics.b(this.f45099c, runtimeError.f45099c);
        }

        public final int hashCode() {
            int iHashCode = this.f45097a.hashCode() * 31;
            xv.d dVar = this.f45098b;
            return this.f45099c.hashCode() + ((iHashCode + (dVar == null ? 0 : dVar.hashCode())) * 31);
        }

        public final String toString() {
            return "RuntimeError(throwable=" + this.f45097a + ", initialUiType=" + this.f45098b + ", intentData=" + this.f45099c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f45097a);
            xv.d dVar = this.f45098b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45099c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Succeeded;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Succeeded extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<Succeeded> CREATOR = new s();

        /* renamed from: a, reason: collision with root package name */
        public final String f45100a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45101b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45102c;

        public Succeeded(String uiTypeCode, xv.d dVar, IntentData intentData) {
            Intrinsics.g(uiTypeCode, "uiTypeCode");
            Intrinsics.g(intentData, "intentData");
            this.f45100a = uiTypeCode;
            this.f45101b = dVar;
            this.f45102c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45101b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45102c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Succeeded)) {
                return false;
            }
            Succeeded succeeded = (Succeeded) obj;
            return Intrinsics.b(this.f45100a, succeeded.f45100a) && this.f45101b == succeeded.f45101b && Intrinsics.b(this.f45102c, succeeded.f45102c);
        }

        public final int hashCode() {
            int iHashCode = this.f45100a.hashCode() * 31;
            xv.d dVar = this.f45101b;
            return this.f45102c.hashCode() + ((iHashCode + (dVar == null ? 0 : dVar.hashCode())) * 31);
        }

        public final String toString() {
            return "Succeeded(uiTypeCode=" + this.f45100a + ", initialUiType=" + this.f45101b + ", intentData=" + this.f45102c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45100a);
            xv.d dVar = this.f45101b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45102c.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult$Timeout;", "Lcom/stripe/android/stripe3ds2/transaction/ChallengeResult;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Timeout extends ChallengeResult {

        @NotNull
        public static final Parcelable.Creator<Timeout> CREATOR = new t();

        /* renamed from: a, reason: collision with root package name */
        public final String f45103a;

        /* renamed from: b, reason: collision with root package name */
        public final xv.d f45104b;

        /* renamed from: c, reason: collision with root package name */
        public final IntentData f45105c;

        public Timeout(String str, xv.d dVar, IntentData intentData) {
            Intrinsics.g(intentData, "intentData");
            this.f45103a = str;
            this.f45104b = dVar;
            this.f45105c = intentData;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: b, reason: from getter */
        public final xv.d getF45104b() {
            return this.f45104b;
        }

        @Override // com.stripe.android.stripe3ds2.transaction.ChallengeResult
        /* renamed from: d, reason: from getter */
        public final IntentData getF45105c() {
            return this.f45105c;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Timeout)) {
                return false;
            }
            Timeout timeout = (Timeout) obj;
            return Intrinsics.b(this.f45103a, timeout.f45103a) && this.f45104b == timeout.f45104b && Intrinsics.b(this.f45105c, timeout.f45105c);
        }

        public final int hashCode() {
            String str = this.f45103a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            xv.d dVar = this.f45104b;
            return this.f45105c.hashCode() + ((iHashCode + (dVar != null ? dVar.hashCode() : 0)) * 31);
        }

        public final String toString() {
            return "Timeout(uiTypeCode=" + this.f45103a + ", initialUiType=" + this.f45104b + ", intentData=" + this.f45105c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45103a);
            xv.d dVar = this.f45104b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            this.f45105c.writeToParcel(dest, i5);
        }
    }

    /* renamed from: b */
    public abstract xv.d getF45104b();

    /* renamed from: d */
    public abstract IntentData getF45105c();
}
