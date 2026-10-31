package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Canceled;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Completed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Failed;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class FinancialConnectionsSheetResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Canceled;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends FinancialConnectionsSheetResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42665a = new Canceled();

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
            return 637890822;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Completed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends FinancialConnectionsSheetResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSession f42666a;

        public Completed(FinancialConnectionsSession financialConnectionsSession) {
            Intrinsics.g(financialConnectionsSession, "financialConnectionsSession");
            this.f42666a = financialConnectionsSession;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Completed) && Intrinsics.b(this.f42666a, ((Completed) obj).f42666a);
        }

        public final int hashCode() {
            return this.f42666a.hashCode();
        }

        public final String toString() {
            return "Completed(financialConnectionsSession=" + this.f42666a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42666a.writeToParcel(dest, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult$Failed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends FinancialConnectionsSheetResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new k();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42667a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42667a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42667a, ((Failed) obj).f42667a);
        }

        public final int hashCode() {
            return this.f42667a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42667a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42667a);
        }
    }
}
