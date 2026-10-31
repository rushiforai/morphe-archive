package com.stripe.android.paymentelement.embedded.manage;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/manage/ManageResult;", "Landroid/os/Parcelable;", "Complete", k.f40331e, "Lcom/stripe/android/paymentelement/embedded/manage/ManageResult$Complete;", "Lcom/stripe/android/paymentelement/embedded/manage/ManageResult$Error;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ManageResult extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/manage/ManageResult$Complete;", "Lcom/stripe/android/paymentelement/embedded/manage/ManageResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Complete implements ManageResult {

        @NotNull
        public static final Parcelable.Creator<Complete> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final CustomerState f44232a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentSelection f44233b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f44234c;

        public Complete(CustomerState customerState, PaymentSelection paymentSelection, boolean z11) {
            Intrinsics.g(customerState, "customerState");
            this.f44232a = customerState;
            this.f44233b = paymentSelection;
            this.f44234c = z11;
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
            return Intrinsics.b(this.f44232a, complete.f44232a) && Intrinsics.b(this.f44233b, complete.f44233b) && this.f44234c == complete.f44234c;
        }

        public final int hashCode() {
            int iHashCode = this.f44232a.hashCode() * 31;
            PaymentSelection paymentSelection = this.f44233b;
            return Boolean.hashCode(this.f44234c) + ((iHashCode + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Complete(customerState=");
            sb2.append(this.f44232a);
            sb2.append(", selection=");
            sb2.append(this.f44233b);
            sb2.append(", shouldInvokeSelectionCallback=");
            return m.k(sb2, this.f44234c, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44232a, i5);
            dest.writeParcelable(this.f44233b, i5);
            dest.writeInt(this.f44234c ? 1 : 0);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/manage/ManageResult$Error;", "Lcom/stripe/android/paymentelement/embedded/manage/ManageResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Error implements ManageResult {

        /* renamed from: a, reason: collision with root package name */
        public static final Error f44235a = new Error();

        @NotNull
        public static final Parcelable.Creator<Error> CREATOR = new c();

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
}
