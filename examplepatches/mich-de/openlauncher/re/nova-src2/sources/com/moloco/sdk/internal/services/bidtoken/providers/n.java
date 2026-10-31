package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.services.H;
import h6.c1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37803d = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final H f37804a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f37805b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f37806c;

    public n() {
        this(null, null, null, 7, null);
    }

    @Nullable
    public final H a() {
        return this.f37804a;
    }

    @Nullable
    public final String b() {
        return this.f37805b;
    }

    @Nullable
    public final String c() {
        return this.f37806c;
    }

    @Nullable
    public final String d() {
        return this.f37806c;
    }

    @Nullable
    public final String e() {
        return this.f37805b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f37804a == nVar.f37804a && Intrinsics.b(this.f37805b, nVar.f37805b) && Intrinsics.b(this.f37806c, nVar.f37806c);
    }

    @Nullable
    public final H f() {
        return this.f37804a;
    }

    public int hashCode() {
        H h5 = this.f37804a;
        int iHashCode = (h5 == null ? 0 : h5.hashCode()) * 31;
        String str = this.f37805b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f37806c;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DeviceSignalInfo(orientation=");
        sb2.append(this.f37804a);
        sb2.append(", locale=");
        sb2.append(this.f37805b);
        sb2.append(", keyboardLocale=");
        return c1.t(sb2, this.f37806c, ')');
    }

    public n(@Nullable H h5, @Nullable String str, @Nullable String str2) {
        this.f37804a = h5;
        this.f37805b = str;
        this.f37806c = str2;
    }

    @NotNull
    public final n a(@Nullable H h5, @Nullable String str, @Nullable String str2) {
        return new n(h5, str, str2);
    }

    public static /* synthetic */ n a(n nVar, H h5, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            h5 = nVar.f37804a;
        }
        if ((i5 & 2) != 0) {
            str = nVar.f37805b;
        }
        if ((i5 & 4) != 0) {
            str2 = nVar.f37806c;
        }
        return nVar.a(h5, str, str2);
    }

    public /* synthetic */ n(H h5, String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : h5, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : str2);
    }
}
