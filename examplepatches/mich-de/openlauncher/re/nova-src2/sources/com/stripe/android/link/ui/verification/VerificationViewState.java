package com.stripe.android.link.ui.verification;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.ui.wallet.DefaultPaymentUI;
import com.stripe.android.model.ConsentUi;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import xs.p;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/ui/verification/VerificationViewState;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class VerificationViewState implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<VerificationViewState> CREATOR = new p();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f43050a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f43051b;

    /* renamed from: c, reason: collision with root package name */
    public final ResolvableString f43052c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f43053d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43054e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43055f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43056g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f43057h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f43058i;

    /* renamed from: j, reason: collision with root package name */
    public final DefaultPaymentUI f43059j;

    /* renamed from: k, reason: collision with root package name */
    public final ConsentUi.ConsentSection f43060k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f43061l;

    public VerificationViewState(boolean z11, boolean z12, ResolvableString resolvableString, boolean z13, boolean z14, String redactedPhoneNumber, String email, boolean z15, boolean z16, DefaultPaymentUI defaultPaymentUI, ConsentUi.ConsentSection consentSection, boolean z17) {
        Intrinsics.g(redactedPhoneNumber, "redactedPhoneNumber");
        Intrinsics.g(email, "email");
        this.f43050a = z11;
        this.f43051b = z12;
        this.f43052c = resolvableString;
        this.f43053d = z13;
        this.f43054e = z14;
        this.f43055f = redactedPhoneNumber;
        this.f43056g = email;
        this.f43057h = z15;
        this.f43058i = z16;
        this.f43059j = defaultPaymentUI;
        this.f43060k = consentSection;
        this.f43061l = z17;
    }

    public static VerificationViewState a(VerificationViewState verificationViewState, boolean z11, ResolvableString resolvableString, boolean z12, boolean z13, int i5) {
        boolean z14 = (i5 & 1) != 0 ? verificationViewState.f43050a : z11;
        boolean z15 = (i5 & 2) != 0 ? verificationViewState.f43051b : false;
        ResolvableString resolvableString2 = (i5 & 4) != 0 ? verificationViewState.f43052c : resolvableString;
        boolean z16 = (i5 & 8) != 0 ? verificationViewState.f43053d : z12;
        boolean z17 = (i5 & 16) != 0 ? verificationViewState.f43054e : z13;
        String redactedPhoneNumber = verificationViewState.f43055f;
        String email = verificationViewState.f43056g;
        boolean z18 = verificationViewState.f43057h;
        boolean z19 = verificationViewState.f43058i;
        DefaultPaymentUI defaultPaymentUI = verificationViewState.f43059j;
        ConsentUi.ConsentSection consentSection = verificationViewState.f43060k;
        boolean z21 = verificationViewState.f43061l;
        verificationViewState.getClass();
        Intrinsics.g(redactedPhoneNumber, "redactedPhoneNumber");
        Intrinsics.g(email, "email");
        return new VerificationViewState(z14, z15, resolvableString2, z16, z17, redactedPhoneNumber, email, z18, z19, defaultPaymentUI, consentSection, z21);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof VerificationViewState)) {
            return false;
        }
        VerificationViewState verificationViewState = (VerificationViewState) obj;
        return this.f43050a == verificationViewState.f43050a && this.f43051b == verificationViewState.f43051b && Intrinsics.b(this.f43052c, verificationViewState.f43052c) && this.f43053d == verificationViewState.f43053d && this.f43054e == verificationViewState.f43054e && Intrinsics.b(this.f43055f, verificationViewState.f43055f) && Intrinsics.b(this.f43056g, verificationViewState.f43056g) && this.f43057h == verificationViewState.f43057h && this.f43058i == verificationViewState.f43058i && Intrinsics.b(this.f43059j, verificationViewState.f43059j) && Intrinsics.b(this.f43060k, verificationViewState.f43060k) && this.f43061l == verificationViewState.f43061l;
    }

    public final int hashCode() {
        int iF = c9.f(Boolean.hashCode(this.f43050a) * 31, 31, this.f43051b);
        ResolvableString resolvableString = this.f43052c;
        int iF2 = c9.f(c9.f(c0.e(c0.e(c9.f(c9.f((iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31, 31, this.f43053d), 31, this.f43054e), 31, this.f43055f), 31, this.f43056g), 31, this.f43057h), 31, this.f43058i);
        DefaultPaymentUI defaultPaymentUI = this.f43059j;
        int iHashCode = (iF2 + (defaultPaymentUI == null ? 0 : defaultPaymentUI.hashCode())) * 31;
        ConsentUi.ConsentSection consentSection = this.f43060k;
        return Boolean.hashCode(this.f43061l) + ((iHashCode + (consentSection != null ? consentSection.f43268a.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("VerificationViewState(isProcessing=");
        sb2.append(this.f43050a);
        sb2.append(", requestFocus=");
        sb2.append(this.f43051b);
        sb2.append(", errorMessage=");
        sb2.append(this.f43052c);
        sb2.append(", isSendingNewCode=");
        sb2.append(this.f43053d);
        sb2.append(", didSendNewCode=");
        c9.s(", redactedPhoneNumber=", this.f43055f, ", email=", sb2, this.f43054e);
        m.q(this.f43056g, ", isDialog=", ", allowLogout=", sb2, this.f43057h);
        sb2.append(this.f43058i);
        sb2.append(", defaultPayment=");
        sb2.append(this.f43059j);
        sb2.append(", consentSection=");
        sb2.append(this.f43060k);
        sb2.append(", isProcessingWebAuth=");
        sb2.append(this.f43061l);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f43050a ? 1 : 0);
        dest.writeInt(this.f43051b ? 1 : 0);
        dest.writeParcelable(this.f43052c, i5);
        dest.writeInt(this.f43053d ? 1 : 0);
        dest.writeInt(this.f43054e ? 1 : 0);
        dest.writeString(this.f43055f);
        dest.writeString(this.f43056g);
        dest.writeInt(this.f43057h ? 1 : 0);
        dest.writeInt(this.f43058i ? 1 : 0);
        DefaultPaymentUI defaultPaymentUI = this.f43059j;
        if (defaultPaymentUI == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            defaultPaymentUI.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f43060k, i5);
        dest.writeInt(this.f43061l ? 1 : 0);
    }
}
