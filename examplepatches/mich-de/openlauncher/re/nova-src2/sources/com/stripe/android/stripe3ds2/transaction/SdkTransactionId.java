package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.Serializable;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/SdkTransactionId;", "Landroid/os/Parcelable;", "Ljava/io/Serializable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class SdkTransactionId implements Parcelable, Serializable {

    @NotNull
    public static final Parcelable.Creator<SdkTransactionId> CREATOR = new sv.b(29);

    /* renamed from: a, reason: collision with root package name */
    public final String f45118a;

    public SdkTransactionId(String value) {
        Intrinsics.g(value, "value");
        this.f45118a = value;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof SdkTransactionId) && Intrinsics.b(this.f45118a, ((SdkTransactionId) obj).f45118a);
    }

    public final int hashCode() {
        return this.f45118a.hashCode();
    }

    /* renamed from: toString, reason: from getter */
    public final String getF45118a() {
        return this.f45118a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45118a);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public SdkTransactionId(UUID uuid) {
        String string = uuid.toString();
        Intrinsics.f(string, "toString(...)");
        this(string);
    }
}
