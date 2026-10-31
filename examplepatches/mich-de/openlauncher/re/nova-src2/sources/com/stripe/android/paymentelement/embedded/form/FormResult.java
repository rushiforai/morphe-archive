package com.stripe.android.paymentelement.embedded.form;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/form/FormResult;", "Landroid/os/Parcelable;", "Complete", "Cancelled", "Lcom/stripe/android/paymentelement/embedded/form/FormResult$Cancelled;", "Lcom/stripe/android/paymentelement/embedded/form/FormResult$Complete;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface FormResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/form/FormResult$Cancelled;", "Lcom/stripe/android/paymentelement/embedded/form/FormResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Cancelled implements FormResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Cancelled f44210a = new Cancelled();

        @NotNull
        public static final Parcelable.Creator<Cancelled> CREATOR = new d();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/form/FormResult$Complete;", "Lcom/stripe/android/paymentelement/embedded/form/FormResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Complete implements FormResult {

        @NotNull
        public static final Parcelable.Creator<Complete> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSelection f44211a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f44212b;

        public Complete(PaymentSelection paymentSelection, boolean z11) {
            this.f44211a = paymentSelection;
            this.f44212b = z11;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Complete)) {
                return false;
            }
            Complete complete = (Complete) obj;
            return Intrinsics.b(this.f44211a, complete.f44211a) && this.f44212b == complete.f44212b;
        }

        public final int hashCode() {
            PaymentSelection paymentSelection = this.f44211a;
            return Boolean.hashCode(this.f44212b) + ((paymentSelection == null ? 0 : paymentSelection.hashCode()) * 31);
        }

        public final String toString() {
            return "Complete(selection=" + this.f44211a + ", hasBeenConfirmed=" + this.f44212b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44211a, i5);
            dest.writeInt(this.f44212b ? 1 : 0);
        }
    }
}
