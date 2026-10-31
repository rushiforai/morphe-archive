package androidx.compose.foundation.lazy.layout;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0083\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Landroidx/compose/foundation/lazy/layout/DefaultLazyKey;", "Landroid/os/Parcelable;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes.dex */
final /* data */ class DefaultLazyKey implements Parcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<DefaultLazyKey> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final int f13980a;

    public DefaultLazyKey(int i5) {
        this.f13980a = i5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof DefaultLazyKey) && this.f13980a == ((DefaultLazyKey) obj).f13980a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f13980a);
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("DefaultLazyKey(index="), this.f13980a, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f13980a);
    }
}
