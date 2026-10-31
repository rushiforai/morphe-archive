package com.stripe.android.paymentelement.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "Saved", "New", "Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption$New;", "Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption$Saved;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface PaymentMethodConfirmationOption extends ConfirmationHandler$Option {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption$New;", "Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class New implements PaymentMethodConfirmationOption {

        @NotNull
        public static final Parcelable.Creator<New> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethodCreateParams f44137a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethodOptionsParams f44138b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentMethodExtraParams f44139c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f44140d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f44141e;

        /* renamed from: f, reason: collision with root package name */
        public final boolean f44142f;

        public /* synthetic */ New(PaymentMethodCreateParams paymentMethodCreateParams, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, boolean z11) {
            this(paymentMethodCreateParams, paymentMethodOptionsParams, paymentMethodExtraParams, z11, false, false);
        }

        public static New a(New r72, PaymentMethodCreateParams paymentMethodCreateParams, PaymentMethodOptionsParams paymentMethodOptionsParams, int i5) {
            if ((i5 & 2) != 0) {
                paymentMethodOptionsParams = r72.f44138b;
            }
            PaymentMethodOptionsParams paymentMethodOptionsParams2 = paymentMethodOptionsParams;
            PaymentMethodExtraParams paymentMethodExtraParams = r72.f44139c;
            boolean z11 = r72.f44140d;
            boolean z12 = (i5 & 16) != 0 ? r72.f44141e : true;
            boolean z13 = (i5 & 32) != 0 ? r72.f44142f : true;
            r72.getClass();
            return new New(paymentMethodCreateParams, paymentMethodOptionsParams2, paymentMethodExtraParams, z11, z12, z13);
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        public final PaymentMethodConfirmationOption P(PaymentSheet$IntentConfiguration intentConfiguration) {
            Intrinsics.g(intentConfiguration, "intentConfiguration");
            PaymentMethodCreateParams paymentMethodCreateParamsC = zt.c.c(this.f44137a, intentConfiguration);
            return a(this, paymentMethodCreateParamsC, zt.c.b(this.f44138b, paymentMethodCreateParamsC.f43680a, intentConfiguration), 60);
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        public final boolean d0() {
            PaymentMethodExtraParams paymentMethodExtraParams = this.f44139c;
            if (paymentMethodExtraParams instanceof PaymentMethodExtraParams.Card) {
                return Intrinsics.b(((PaymentMethodExtraParams.Card) paymentMethodExtraParams).f43728b, Boolean.TRUE);
            }
            if (paymentMethodExtraParams instanceof PaymentMethodExtraParams.USBankAccount) {
                return Intrinsics.b(((PaymentMethodExtraParams.USBankAccount) paymentMethodExtraParams).f43732b, Boolean.TRUE);
            }
            if (paymentMethodExtraParams instanceof PaymentMethodExtraParams.Link) {
                return Intrinsics.b(((PaymentMethodExtraParams.Link) paymentMethodExtraParams).f43730b, Boolean.TRUE);
            }
            if (paymentMethodExtraParams instanceof PaymentMethodExtraParams.SepaDebit) {
                return Intrinsics.b(((PaymentMethodExtraParams.SepaDebit) paymentMethodExtraParams).f43731b, Boolean.TRUE);
            }
            if ((paymentMethodExtraParams instanceof PaymentMethodExtraParams.BacsDebit) || paymentMethodExtraParams == null) {
                return false;
            }
            throw new NoWhenBranchMatchedException();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof New)) {
                return false;
            }
            New r52 = (New) obj;
            return Intrinsics.b(this.f44137a, r52.f44137a) && Intrinsics.b(this.f44138b, r52.f44138b) && Intrinsics.b(this.f44139c, r52.f44139c) && this.f44140d == r52.f44140d && this.f44141e == r52.f44141e && this.f44142f == r52.f44142f;
        }

        public final int hashCode() {
            int iHashCode = this.f44137a.hashCode() * 31;
            PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44138b;
            int iHashCode2 = (iHashCode + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
            PaymentMethodExtraParams paymentMethodExtraParams = this.f44139c;
            return Boolean.hashCode(this.f44142f) + c9.f(c9.f((iHashCode2 + (paymentMethodExtraParams != null ? paymentMethodExtraParams.hashCode() : 0)) * 31, 31, this.f44140d), 31, this.f44141e);
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        /* renamed from: r, reason: from getter */
        public final PaymentMethodOptionsParams getF44144b() {
            return this.f44138b;
        }

        public final String toString() {
            return "New(createParams=" + this.f44137a + ", optionsParams=" + this.f44138b + ", extraParams=" + this.f44139c + ", shouldSave=" + this.f44140d + ", passiveChallengeComplete=" + this.f44141e + ", attestationComplete=" + this.f44142f + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44137a, i5);
            dest.writeParcelable(this.f44138b, i5);
            dest.writeParcelable(this.f44139c, i5);
            dest.writeInt(this.f44140d ? 1 : 0);
            dest.writeInt(this.f44141e ? 1 : 0);
            dest.writeInt(this.f44142f ? 1 : 0);
        }

        public New(PaymentMethodCreateParams createParams, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, boolean z11, boolean z12, boolean z13) {
            Intrinsics.g(createParams, "createParams");
            this.f44137a = createParams;
            this.f44138b = paymentMethodOptionsParams;
            this.f44139c = paymentMethodExtraParams;
            this.f44140d = z11;
            this.f44141e = z12;
            this.f44142f = z13;
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption$Saved;", "Lcom/stripe/android/paymentelement/confirmation/PaymentMethodConfirmationOption;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Saved implements PaymentMethodConfirmationOption {

        @NotNull
        public static final Parcelable.Creator<Saved> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod f44143a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethodOptionsParams f44144b;

        /* renamed from: c, reason: collision with root package name */
        public final boolean f44145c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44146d;

        /* renamed from: e, reason: collision with root package name */
        public final String f44147e;

        public /* synthetic */ Saved(PaymentMethod paymentMethod, PaymentMethodOptionsParams paymentMethodOptionsParams, int i5) {
            this(paymentMethod, paymentMethodOptionsParams, (i5 & 4) == 0, null, null);
        }

        public static Saved a(Saved saved, PaymentMethodOptionsParams paymentMethodOptionsParams) {
            PaymentMethod paymentMethod = saved.f44143a;
            boolean z11 = saved.f44145c;
            String str = saved.f44146d;
            String str2 = saved.f44147e;
            saved.getClass();
            Intrinsics.g(paymentMethod, "paymentMethod");
            return new Saved(paymentMethod, paymentMethodOptionsParams, z11, str, str2);
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        /* renamed from: b, reason: merged with bridge method [inline-methods] */
        public final Saved P(PaymentSheet$IntentConfiguration intentConfiguration) {
            Intrinsics.g(intentConfiguration, "intentConfiguration");
            PaymentMethod.Type type = this.f44143a.f43573e;
            return a(this, zt.c.b(this.f44144b, type != null ? type.f43655a : null, intentConfiguration));
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        public final boolean d0() {
            return false;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Saved)) {
                return false;
            }
            Saved saved = (Saved) obj;
            return Intrinsics.b(this.f44143a, saved.f44143a) && Intrinsics.b(this.f44144b, saved.f44144b) && this.f44145c == saved.f44145c && Intrinsics.b(this.f44146d, saved.f44146d) && Intrinsics.b(this.f44147e, saved.f44147e);
        }

        public final int hashCode() {
            int iHashCode = this.f44143a.hashCode() * 31;
            PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44144b;
            int iF = c9.f((iHashCode + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31, 31, this.f44145c);
            String str = this.f44146d;
            int iHashCode2 = (iF + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44147e;
            return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        }

        @Override // com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption
        /* renamed from: r, reason: from getter */
        public final PaymentMethodOptionsParams getF44144b() {
            return this.f44144b;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Saved(paymentMethod=");
            sb2.append(this.f44143a);
            sb2.append(", optionsParams=");
            sb2.append(this.f44144b);
            sb2.append(", originatedFromWallet=");
            c9.s(", hCaptchaToken=", this.f44146d, ", attestationToken=", sb2, this.f44145c);
            return c0.q(sb2, this.f44147e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44143a, i5);
            dest.writeParcelable(this.f44144b, i5);
            dest.writeInt(this.f44145c ? 1 : 0);
            dest.writeString(this.f44146d);
            dest.writeString(this.f44147e);
        }

        public Saved(PaymentMethod paymentMethod, PaymentMethodOptionsParams paymentMethodOptionsParams, boolean z11, String str, String str2) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f44143a = paymentMethod;
            this.f44144b = paymentMethodOptionsParams;
            this.f44145c = z11;
            this.f44146d = str;
            this.f44147e = str2;
        }
    }

    PaymentMethodConfirmationOption P(PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration);

    boolean d0();

    /* renamed from: r */
    PaymentMethodOptionsParams getF44144b();
}
