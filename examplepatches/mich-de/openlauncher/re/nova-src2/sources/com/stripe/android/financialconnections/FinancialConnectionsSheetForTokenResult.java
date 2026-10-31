package com.stripe.android.financialconnections;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.Token;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult;", "Landroid/os/Parcelable;", "Completed", "Canceled", "Failed", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Canceled;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Completed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Failed;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class FinancialConnectionsSheetForTokenResult implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Canceled;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Canceled extends FinancialConnectionsSheetForTokenResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Canceled f42661a = new Canceled();

        @NotNull
        public static final Parcelable.Creator<Canceled> CREATOR = new f();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Canceled);
        }

        public final int hashCode() {
            return -890158026;
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

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Completed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed extends FinancialConnectionsSheetForTokenResult {

        @NotNull
        public static final Parcelable.Creator<Completed> CREATOR = new g();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSession f42662a;

        /* renamed from: b, reason: collision with root package name */
        public final Token f42663b;

        public Completed(FinancialConnectionsSession financialConnectionsSession, Token token) {
            Intrinsics.g(financialConnectionsSession, "financialConnectionsSession");
            Intrinsics.g(token, "token");
            this.f42662a = financialConnectionsSession;
            this.f42663b = token;
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
            return Intrinsics.b(this.f42662a, completed.f42662a) && Intrinsics.b(this.f42663b, completed.f42663b);
        }

        public final int hashCode() {
            return this.f42663b.hashCode() + (this.f42662a.hashCode() * 31);
        }

        public final String toString() {
            return "Completed(financialConnectionsSession=" + this.f42662a + ", token=" + this.f42663b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42662a.writeToParcel(dest, i5);
            dest.writeParcelable(this.f42663b, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult$Failed;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed extends FinancialConnectionsSheetForTokenResult {

        @NotNull
        public static final Parcelable.Creator<Failed> CREATOR = new h();

        /* renamed from: a, reason: collision with root package name */
        public final Throwable f42664a;

        public Failed(Throwable error) {
            Intrinsics.g(error, "error");
            this.f42664a = error;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Failed) && Intrinsics.b(this.f42664a, ((Failed) obj).f42664a);
        }

        public final int hashCode() {
            return this.f42664a.hashCode();
        }

        public final String toString() {
            return fq.c.d("Failed(error=", ")", this.f42664a);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeSerializable(this.f42664a);
        }
    }
}
