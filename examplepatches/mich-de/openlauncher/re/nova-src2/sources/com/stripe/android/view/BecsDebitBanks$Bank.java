package com.stripe.android.view;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/view/BecsDebitBanks$Bank", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class BecsDebitBanks$Bank implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<BecsDebitBanks$Bank> CREATOR = new ww.c(0);

    /* renamed from: a, reason: collision with root package name */
    public final String f45424a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45425b;

    public BecsDebitBanks$Bank(String prefix, String name) {
        Intrinsics.g(prefix, "prefix");
        Intrinsics.g(name, "name");
        this.f45424a = prefix;
        this.f45425b = name;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BecsDebitBanks$Bank)) {
            return false;
        }
        BecsDebitBanks$Bank becsDebitBanks$Bank = (BecsDebitBanks$Bank) obj;
        return Intrinsics.b(this.f45424a, becsDebitBanks$Bank.f45424a) && Intrinsics.b(this.f45425b, becsDebitBanks$Bank.f45425b);
    }

    public final int hashCode() {
        return this.f45425b.hashCode() + (this.f45424a.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("Bank(prefix=", this.f45424a, ", name=", this.f45425b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45424a);
        dest.writeString(this.f45425b);
    }
}
