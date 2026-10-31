package com.stripe.android.stripe3ds2.observability;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b70.h;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import tv.a;
import tv.e;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/observability/Stripe3ds2ErrorReporterConfig;", "Ltv/a;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Stripe3ds2ErrorReporterConfig implements a, Parcelable {

    @NotNull
    public static final Parcelable.Creator<Stripe3ds2ErrorReporterConfig> CREATOR = new e();

    /* renamed from: a, reason: collision with root package name */
    public final SdkTransactionId f45054a;

    public Stripe3ds2ErrorReporterConfig(SdkTransactionId sdkTransactionId) {
        this.f45054a = sdkTransactionId;
    }

    @Override // tv.a
    public final Map b() {
        SdkTransactionId sdkTransactionId = this.f45054a;
        Map mapN = sdkTransactionId != null ? m.n("sdk_transaction_id", sdkTransactionId.f45118a) : null;
        return mapN == null ? h.f17594a : mapN;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Stripe3ds2ErrorReporterConfig) && Intrinsics.b(this.f45054a, ((Stripe3ds2ErrorReporterConfig) obj).f45054a);
    }

    public final int hashCode() {
        SdkTransactionId sdkTransactionId = this.f45054a;
        if (sdkTransactionId == null) {
            return 0;
        }
        return sdkTransactionId.f45118a.hashCode();
    }

    public final String toString() {
        return "Stripe3ds2ErrorReporterConfig(sdkTransactionId=" + this.f45054a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        SdkTransactionId sdkTransactionId = this.f45054a;
        if (sdkTransactionId == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sdkTransactionId.writeToParcel(dest, i5);
        }
    }
}
