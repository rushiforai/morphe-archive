package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/InstantDebitsResult;", "Landroid/os/Parcelable;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class InstantDebitsResult implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<InstantDebitsResult> CREATOR = new nv.f(16);

    /* renamed from: a, reason: collision with root package name */
    public final String f42687a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42688b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42689c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f42690d;

    public InstantDebitsResult(String encodedPaymentMethod, String str, String str2, boolean z11) {
        Intrinsics.g(encodedPaymentMethod, "encodedPaymentMethod");
        this.f42687a = encodedPaymentMethod;
        this.f42688b = str;
        this.f42689c = str2;
        this.f42690d = z11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof InstantDebitsResult)) {
            return false;
        }
        InstantDebitsResult instantDebitsResult = (InstantDebitsResult) obj;
        return Intrinsics.b(this.f42687a, instantDebitsResult.f42687a) && Intrinsics.b(this.f42688b, instantDebitsResult.f42688b) && Intrinsics.b(this.f42689c, instantDebitsResult.f42689c) && this.f42690d == instantDebitsResult.f42690d;
    }

    public final int hashCode() {
        int iHashCode = this.f42687a.hashCode() * 31;
        String str = this.f42688b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42689c;
        return Boolean.hashCode(this.f42690d) + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("InstantDebitsResult(encodedPaymentMethod=", this.f42687a, ", last4=", this.f42688b, ", bankName=");
        sbW.append(this.f42689c);
        sbW.append(", eligibleForIncentive=");
        sbW.append(this.f42690d);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42687a);
        dest.writeString(this.f42688b);
        dest.writeString(this.f42689c);
        dest.writeInt(this.f42690d ? 1 : 0);
    }
}
