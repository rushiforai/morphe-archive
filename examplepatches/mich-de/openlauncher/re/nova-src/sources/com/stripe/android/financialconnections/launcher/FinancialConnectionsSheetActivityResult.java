package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.Token;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Canceled;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Completed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Failed;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class FinancialConnectionsSheetActivityResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Canceled;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends FinancialConnectionsSheetActivityResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42674a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new d();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -1375852025;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Failed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends FinancialConnectionsSheetActivityResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new f();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42678a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42678a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42678a, ((Failed) obj).f42678a);
        }

        public final int hashCode() {
            return this.f42678a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42678a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42678a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult$Completed;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends FinancialConnectionsSheetActivityResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final InstantDebitsResult f42675a;

        /* renamed from: b, reason: collision with root package name */
        public final FinancialConnectionsSession f42676b;

        /* renamed from: c, reason: collision with root package name */
        public final Token f42677c;

        public Completed(InstantDebitsResult instantDebitsResult, FinancialConnectionsSession financialConnectionsSession, Token token) {
            this.f42675a = instantDebitsResult;
            this.f42676b = financialConnectionsSession;
            this.f42677c = token;
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
            return Intrinsics.b(this.f42675a, completed.f42675a) && Intrinsics.b(this.f42676b, completed.f42676b) && Intrinsics.b(this.f42677c, completed.f42677c);
        }

        public final int hashCode() {
            InstantDebitsResult instantDebitsResult = this.f42675a;
            int iHashCode = (instantDebitsResult == null ? 0 : instantDebitsResult.hashCode()) * 31;
            FinancialConnectionsSession financialConnectionsSession = this.f42676b;
            int iHashCode2 = (iHashCode + (financialConnectionsSession == null ? 0 : financialConnectionsSession.hashCode())) * 31;
            Token token = this.f42677c;
            return iHashCode2 + (token != null ? token.hashCode() : 0);
        }

        public final String toString() {
            return "Completed(instantDebits=" + this.f42675a + ", financialConnectionsSession=" + this.f42676b + ", token=" + this.f42677c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            InstantDebitsResult instantDebitsResult = this.f42675a;
            if (instantDebitsResult == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                instantDebitsResult.writeToParcel(dest, i5);
            }
            FinancialConnectionsSession financialConnectionsSession = this.f42676b;
            if (financialConnectionsSession == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                financialConnectionsSession.writeToParcel(dest, i5);
            }
            dest.writeParcelable(this.f42677c, i5);
        }

        public /* synthetic */ Completed(FinancialConnectionsSession financialConnectionsSession, Token token, int i5) {
            this((InstantDebitsResult) null, financialConnectionsSession, (i5 & 4) != 0 ? null : token);
        }
    }
}
