package com.stripe.android.paymentelement.embedded.form;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.EmbeddedPaymentElement$Configuration;
import com.stripe.android.paymentelement.embedded.form.FormResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\bÁ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0006B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/form/FormContract;", "Lk/b;", "Lcom/stripe/android/paymentelement/embedded/form/FormContract$Args;", "Lcom/stripe/android/paymentelement/embedded/form/FormResult;", "<init>", "()V", "Args", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FormContract extends k.b {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/embedded/form/FormContract$Args;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Args implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Args> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f44203a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethodMetadata f44204b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f44205c;

        /* renamed from: d, reason: collision with root package name */
        public final EmbeddedPaymentElement$Configuration f44206d;

        /* renamed from: e, reason: collision with root package name */
        public final String f44207e;

        /* renamed from: f, reason: collision with root package name */
        public final Integer f44208f;

        /* renamed from: g, reason: collision with root package name */
        public final PaymentSelection f44209g;

        public Args(String selectedPaymentMethodCode, PaymentMethodMetadata paymentMethodMetadata, boolean z11, EmbeddedPaymentElement$Configuration configuration, String paymentElementCallbackIdentifier, Integer num, PaymentSelection paymentSelection) {
            Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
            Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
            Intrinsics.g(configuration, "configuration");
            Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
            this.f44203a = selectedPaymentMethodCode;
            this.f44204b = paymentMethodMetadata;
            this.f44205c = z11;
            this.f44206d = configuration;
            this.f44207e = paymentElementCallbackIdentifier;
            this.f44208f = num;
            this.f44209g = paymentSelection;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Args)) {
                return false;
            }
            Args args = (Args) obj;
            return Intrinsics.b(this.f44203a, args.f44203a) && Intrinsics.b(this.f44204b, args.f44204b) && this.f44205c == args.f44205c && Intrinsics.b(this.f44206d, args.f44206d) && Intrinsics.b(this.f44207e, args.f44207e) && Intrinsics.b(this.f44208f, args.f44208f) && Intrinsics.b(this.f44209g, args.f44209g);
        }

        public final int hashCode() {
            int iE = c0.e((this.f44206d.hashCode() + c9.f((this.f44204b.hashCode() + (this.f44203a.hashCode() * 31)) * 31, 31, this.f44205c)) * 31, 31, this.f44207e);
            Integer num = this.f44208f;
            int iHashCode = (iE + (num == null ? 0 : num.hashCode())) * 31;
            PaymentSelection paymentSelection = this.f44209g;
            return iHashCode + (paymentSelection != null ? paymentSelection.hashCode() : 0);
        }

        public final String toString() {
            return "Args(selectedPaymentMethodCode=" + this.f44203a + ", paymentMethodMetadata=" + this.f44204b + ", hasSavedPaymentMethods=" + this.f44205c + ", configuration=" + this.f44206d + ", paymentElementCallbackIdentifier=" + this.f44207e + ", statusBarColor=" + this.f44208f + ", paymentSelection=" + this.f44209g + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44203a);
            dest.writeParcelable(this.f44204b, i5);
            dest.writeInt(this.f44205c ? 1 : 0);
            this.f44206d.writeToParcel(dest, i5);
            dest.writeString(this.f44207e);
            Integer num = this.f44208f;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeParcelable(this.f44209g, i5);
        }
    }

    static {
        new FormContract();
    }

    private FormContract() {
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) FormActivity.class).putExtra("extra_activity_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        FormResult formResult = (intent == null || (extras = intent.getExtras()) == null) ? null : (FormResult) vm.d.i(extras, "extra_activity_result", FormResult.class);
        return formResult == null ? FormResult.Cancelled.f44210a : formResult;
    }
}
