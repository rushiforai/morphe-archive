package com.stripe.android.core.frauddetection;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/frauddetection/FraudDetectionData;", "Lcom/stripe/android/core/model/StripeModel;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class FraudDetectionData implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<FraudDetectionData> CREATOR = new w(18);

    /* renamed from: e, reason: collision with root package name */
    public static final long f42567e = TimeUnit.MINUTES.toMillis(30);

    /* renamed from: a, reason: collision with root package name */
    public final String f42568a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42569b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42570c;

    /* renamed from: d, reason: collision with root package name */
    public final long f42571d;

    public FraudDetectionData(String guid, String muid, String sid, long j11) {
        Intrinsics.g(guid, "guid");
        Intrinsics.g(muid, "muid");
        Intrinsics.g(sid, "sid");
        this.f42568a = guid;
        this.f42569b = muid;
        this.f42570c = sid;
        this.f42571d = j11;
    }

    public final Map b() {
        return MapsKt.j0(new Pair("guid", this.f42568a), new Pair("muid", this.f42569b), new Pair("sid", this.f42570c));
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FraudDetectionData)) {
            return false;
        }
        FraudDetectionData fraudDetectionData = (FraudDetectionData) obj;
        return Intrinsics.b(this.f42568a, fraudDetectionData.f42568a) && Intrinsics.b(this.f42569b, fraudDetectionData.f42569b) && Intrinsics.b(this.f42570c, fraudDetectionData.f42570c) && this.f42571d == fraudDetectionData.f42571d;
    }

    public final int hashCode() {
        return Long.hashCode(this.f42571d) + c0.e(c0.e(this.f42568a.hashCode() * 31, 31, this.f42569b), 31, this.f42570c);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("FraudDetectionData(guid=", this.f42568a, ", muid=", this.f42569b, ", sid=");
        sbW.append(this.f42570c);
        sbW.append(", timestamp=");
        sbW.append(this.f42571d);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42568a);
        dest.writeString(this.f42569b);
        dest.writeString(this.f42570c);
        dest.writeLong(this.f42571d);
    }
}
