package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Pa implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63083a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f63084b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Pa f63085c;

    @NotNull
    public static final a Companion = new a();

    @NotNull
    public static final Parcelable.Creator<Pa> CREATOR = new b();

    public static final class a {
        @NotNull
        public static Pa a(@NotNull Throwable t6) {
            Intrinsics.g(t6, "t");
            return new Pa(t6.getClass().getName(), t6.getMessage(), null);
        }
    }

    public static final class b implements Parcelable.Creator<Pa> {
        @Override // android.os.Parcelable.Creator
        public final Pa createFromParcel(Parcel parcel) {
            Intrinsics.g(parcel, "parcel");
            return new Pa(parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : Pa.CREATOR.createFromParcel(parcel));
        }

        @Override // android.os.Parcelable.Creator
        public final Pa[] newArray(int i5) {
            return new Pa[i5];
        }
    }

    public Pa(@NotNull String klass, @Nullable String str, @Nullable Pa pa2) {
        Intrinsics.g(klass, "klass");
        this.f63083a = klass;
        this.f63084b = str;
        this.f63085c = pa2;
    }

    @NotNull
    public final String b() {
        String str;
        StringBuilder sb2 = new StringBuilder();
        if (this.f63084b == null) {
            str = this.f63083a;
        } else {
            str = this.f63083a + ": " + this.f63084b;
        }
        sb2.append(str);
        if (this.f63085c != null) {
            if (r70.l.F1(sb2) != '\n') {
                sb2.append("\n");
            }
            sb2.append("Caused by: " + this.f63085c.b());
        }
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply {\n…   }\n        }.toString()");
        return string;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Pa)) {
            return false;
        }
        Pa pa2 = (Pa) obj;
        return Intrinsics.b(this.f63083a, pa2.f63083a) && Intrinsics.b(this.f63084b, pa2.f63084b) && Intrinsics.b(this.f63085c, pa2.f63085c);
    }

    public final int hashCode() {
        int iHashCode = this.f63083a.hashCode() * 31;
        String str = this.f63084b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Pa pa2 = this.f63085c;
        return iHashCode2 + (pa2 != null ? pa2.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        if (this.f63085c != null) {
            String str = b() + "\nPlease make sure logging is enabled, consult the logs to see complete stacktrace.";
            if (str != null) {
                return str;
            }
        }
        return b();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(this.f63083a);
        out.writeString(this.f63084b);
        Pa pa2 = this.f63085c;
        if (pa2 == null) {
            out.writeInt(0);
        } else {
            out.writeInt(1);
            pa2.writeToParcel(out, i5);
        }
    }
}
