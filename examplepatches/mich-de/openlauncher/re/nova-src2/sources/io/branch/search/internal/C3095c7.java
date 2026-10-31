package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.P1;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.c7, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C3095c7 implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final int f64098a;

    /* renamed from: b, reason: collision with root package name */
    public final long f64099b;

    @NotNull
    public static final b Companion = new b();

    @JvmField
    @NotNull
    public static final Parcelable.Creator<C3095c7> CREATOR = new a();

    /* renamed from: io.branch.search.internal.c7$a */
    /* loaded from: classes4.dex */
    public static final class a implements Parcelable.Creator<C3095c7> {
        @Override // android.os.Parcelable.Creator
        public final C3095c7 createFromParcel(Parcel in2) {
            Intrinsics.g(in2, "in");
            return new C3095c7(in2);
        }

        @Override // android.os.Parcelable.Creator
        public final C3095c7[] newArray(int i5) {
            C3095c7[] c3095c7Arr = new C3095c7[i5];
            for (int i11 = 0; i11 < i5; i11++) {
                c3095c7Arr[i11] = null;
            }
            return c3095c7Arr;
        }
    }

    /* renamed from: io.branch.search.internal.c7$b */
    /* loaded from: classes4.dex */
    public static final class b {
    }

    public C3095c7(long j11, int i5) {
        this.f64098a = i5;
        this.f64099b = j11;
    }

    public final int b() {
        return this.f64098a;
    }

    public final long c() {
        return this.f64099b;
    }

    @NotNull
    public final P1.a d() {
        return this.f64098a == 1 ? P1.a.OPTED_IN : P1.a.OPTED_OUT;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3095c7)) {
            return false;
        }
        C3095c7 c3095c7 = (C3095c7) obj;
        return this.f64098a == c3095c7.f64098a && this.f64099b == c3095c7.f64099b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f64099b) + (Integer.hashCode(this.f64098a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HistoricalTrackingStatus(status=");
        sb2.append(this.f64098a);
        sb2.append(", timestamp=");
        return C3380t5.a(sb2, this.f64099b, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f64098a);
        dest.writeLong(this.f64099b);
    }

    public C3095c7(Parcel parcel) {
        this(parcel.readLong(), parcel.readInt());
    }
}
