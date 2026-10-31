package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class F6 implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62447a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62448b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f62449c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Map<String, String> f62450d;

    @NotNull
    public static final a Companion = new a();

    @NotNull
    public static final Parcelable.Creator<F6> CREATOR = new b();

    public static final class a {
        public static final String a(a aVar, String str, Throwable th2) {
            aVar.getClass();
            StringBuilder sb2 = new StringBuilder();
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            sb2.append(str);
            sb2.append(" ");
            sb2.append(th2.getClass().getSimpleName());
            sb2.append(": ");
            sb2.append(th2.getMessage());
            for (Throwable cause = th2.getCause(); cause != null; cause = cause.getCause()) {
                sb2.append(" caused by ");
                sb2.append(cause.getClass().getSimpleName());
                sb2.append(": ");
                sb2.append(cause.getMessage());
            }
            String string = sb2.toString();
            Intrinsics.f(string, "b.toString()");
            return string;
        }
    }

    public static final class b implements Parcelable.Creator<F6> {
        @Override // android.os.Parcelable.Creator
        public final F6 createFromParcel(Parcel parcel) {
            LinkedHashMap linkedHashMap;
            Intrinsics.g(parcel, "parcel");
            String string = parcel.readString();
            String string2 = parcel.readString();
            String string3 = parcel.readString();
            if (parcel.readInt() == 0) {
                linkedHashMap = null;
            } else {
                int i5 = parcel.readInt();
                LinkedHashMap linkedHashMap2 = new LinkedHashMap(i5);
                for (int i11 = 0; i11 != i5; i11++) {
                    linkedHashMap2.put(parcel.readString(), parcel.readString());
                }
                linkedHashMap = linkedHashMap2;
            }
            return new F6(string, string2, string3, linkedHashMap);
        }

        @Override // android.os.Parcelable.Creator
        public final F6[] newArray(int i5) {
            return new F6[i5];
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public F6(@NotNull String sessionId, @NotNull String source, @Nullable String str, @NotNull Throwable e3, @Nullable Map map) {
        this(sessionId, source, a.a(Companion, str, e3), map);
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        Intrinsics.g(e3, "e");
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof F6)) {
            return false;
        }
        F6 f62 = (F6) obj;
        return Intrinsics.b(this.f62447a, f62.f62447a) && Intrinsics.b(this.f62448b, f62.f62448b) && Intrinsics.b(this.f62449c, f62.f62449c) && Intrinsics.b(this.f62450d, f62.f62450d);
    }

    public final int hashCode() {
        int iA = C3248l8.a(this.f62448b, this.f62447a.hashCode() * 31, 31);
        String str = this.f62449c;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        Map<String, String> map = this.f62450d;
        return iHashCode + (map != null ? map.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Failure(sessionId=");
        sb2.append(this.f62447a);
        sb2.append(", source=");
        sb2.append(this.f62448b);
        sb2.append(", message=");
        sb2.append(this.f62449c);
        sb2.append(", extras=");
        return b.c9.l(sb2, this.f62450d, ')');
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(this.f62447a);
        out.writeString(this.f62448b);
        out.writeString(this.f62449c);
        Map<String, String> map = this.f62450d;
        if (map == null) {
            out.writeInt(0);
            return;
        }
        out.writeInt(1);
        out.writeInt(map.size());
        for (Map.Entry<String, String> entry : map.entrySet()) {
            out.writeString(entry.getKey());
            out.writeString(entry.getValue());
        }
    }

    public F6(@NotNull String sessionId, @NotNull String source, @Nullable String str, @Nullable Map<String, String> map) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(source, "source");
        this.f62447a = sessionId;
        this.f62448b = source;
        this.f62449c = str;
        this.f62450d = map;
    }
}
