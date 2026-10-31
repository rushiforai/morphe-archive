package com.stripe.android.attestation;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/attestation/AttestationArgs;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AttestationArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AttestationArgs> CREATOR = new eh.a(11);

    /* renamed from: a, reason: collision with root package name */
    public final String f42462a;

    /* renamed from: b, reason: collision with root package name */
    public final List f42463b;

    public AttestationArgs(String publishableKey, List productUsage) {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        this.f42462a = publishableKey;
        this.f42463b = productUsage;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AttestationArgs)) {
            return false;
        }
        AttestationArgs attestationArgs = (AttestationArgs) obj;
        return Intrinsics.b(this.f42462a, attestationArgs.f42462a) && Intrinsics.b(this.f42463b, attestationArgs.f42463b);
    }

    public final int hashCode() {
        return this.f42463b.hashCode() + (this.f42462a.hashCode() * 31);
    }

    public final String toString() {
        return "AttestationArgs(publishableKey=" + this.f42462a + ", productUsage=" + this.f42463b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42462a);
        dest.writeStringList(this.f42463b);
    }
}
