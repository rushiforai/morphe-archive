package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Canceled;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Completed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Failed;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class FinancialConnectionsSheetInstantDebitsResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Canceled;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends FinancialConnectionsSheetInstantDebitsResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42681a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new i();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -1615979050;
        }

        public final String toString() {
            return "Canceled";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Completed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends FinancialConnectionsSheetInstantDebitsResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final String f42682a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42683b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42684c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f42685d;

        public Completed(String encodedPaymentMethod, String str, String str2, boolean z11) {
            Intrinsics.g(encodedPaymentMethod, "encodedPaymentMethod");
            this.f42682a = encodedPaymentMethod;
            this.f42683b = str;
            this.f42684c = str2;
            this.f42685d = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Completed)) {
                return false;
            }
            Completed completed = (Completed) obj;
            return Intrinsics.b(this.f42682a, completed.f42682a) && Intrinsics.b(this.f42683b, completed.f42683b) && Intrinsics.b(this.f42684c, completed.f42684c) && this.f42685d == completed.f42685d;
        }

        public final int hashCode() {
            int iHashCode = this.f42682a.hashCode() * 31;
            String str = this.f42683b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f42684c;
            return Boolean.hashCode(this.f42685d) + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            StringBuilder sbW = c0.w("Completed(encodedPaymentMethod=", this.f42682a, ", last4=", this.f42683b, ", bankName=");
            sbW.append(this.f42684c);
            sbW.append(", eligibleForIncentive=");
            sbW.append(this.f42685d);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42682a);
            dest.writeString(this.f42683b);
            dest.writeString(this.f42684c);
            dest.writeInt(this.f42685d ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult$Failed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends FinancialConnectionsSheetInstantDebitsResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new k();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42686a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42686a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42686a, ((Failed) obj).f42686a);
        }

        public final int hashCode() {
            return this.f42686a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42686a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42686a);
        }
    }
}
