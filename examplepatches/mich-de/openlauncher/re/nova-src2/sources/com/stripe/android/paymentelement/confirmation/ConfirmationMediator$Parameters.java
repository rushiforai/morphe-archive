package com.stripe.android.paymentelement.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import vt.f0;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u0000*\b\b\u0004\u0010\u0002*\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/paymentelement/confirmation/ConfirmationMediator$Parameters", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "TConfirmationOption", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConfirmationMediator$Parameters<TConfirmationOption extends ConfirmationHandler$Option> implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ConfirmationMediator$Parameters<?>> CREATOR = new ji.a(27);

    /* renamed from: a, reason: collision with root package name */
    public final ConfirmationHandler$Option f44131a;

    /* renamed from: b, reason: collision with root package name */
    public final ConfirmationHandler$Args f44132b;

    /* renamed from: c, reason: collision with root package name */
    public final f0 f44133c;

    public ConfirmationMediator$Parameters(ConfirmationHandler$Option confirmationOption, ConfirmationHandler$Args confirmationArgs, f0 f0Var) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(confirmationArgs, "confirmationArgs");
        this.f44131a = confirmationOption;
        this.f44132b = confirmationArgs;
        this.f44133c = f0Var;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmationMediator$Parameters)) {
            return false;
        }
        ConfirmationMediator$Parameters confirmationMediator$Parameters = (ConfirmationMediator$Parameters) obj;
        return Intrinsics.b(this.f44131a, confirmationMediator$Parameters.f44131a) && Intrinsics.b(this.f44132b, confirmationMediator$Parameters.f44132b) && this.f44133c == confirmationMediator$Parameters.f44133c;
    }

    public final int hashCode() {
        int iHashCode = (this.f44132b.hashCode() + (this.f44131a.hashCode() * 31)) * 31;
        f0 f0Var = this.f44133c;
        return iHashCode + (f0Var == null ? 0 : f0Var.hashCode());
    }

    public final String toString() {
        return "Parameters(confirmationOption=" + this.f44131a + ", confirmationArgs=" + this.f44132b + ", deferredIntentConfirmationType=" + this.f44133c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44131a, i5);
        dest.writeParcelable(this.f44132b, i5);
        f0 f0Var = this.f44133c;
        if (f0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(f0Var.name());
        }
    }
}
