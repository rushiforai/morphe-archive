package com.moloco.sdk.internal.services.init;

import com.moloco.sdk.Init;
import com.moloco.sdk.internal.x;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38015c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final x<Init.SDKInitResponse, j> f38016a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f38017b;

    public c(@NotNull x<Init.SDKInitResponse, j> sdkInitResult, @NotNull String fetchType) {
        Intrinsics.g(sdkInitResult, "sdkInitResult");
        Intrinsics.g(fetchType, "fetchType");
        this.f38016a = sdkInitResult;
        this.f38017b = fetchType;
    }

    @NotNull
    public final x<Init.SDKInitResponse, j> a() {
        return this.f38016a;
    }

    @NotNull
    public final String b() {
        return this.f38017b;
    }

    @NotNull
    public final String c() {
        return this.f38017b;
    }

    @NotNull
    public final x<Init.SDKInitResponse, j> d() {
        return this.f38016a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f38016a, cVar.f38016a) && Intrinsics.b(this.f38017b, cVar.f38017b);
    }

    public int hashCode() {
        return this.f38017b.hashCode() + (this.f38016a.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("FetchState(sdkInitResult=");
        sb2.append(this.f38016a);
        sb2.append(", fetchType=");
        return c1.t(sb2, this.f38017b, ')');
    }

    @NotNull
    public final c a(@NotNull x<Init.SDKInitResponse, j> sdkInitResult, @NotNull String fetchType) {
        Intrinsics.g(sdkInitResult, "sdkInitResult");
        Intrinsics.g(fetchType, "fetchType");
        return new c(sdkInitResult, fetchType);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ c a(c cVar, x xVar, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            xVar = cVar.f38016a;
        }
        if ((i5 & 2) != 0) {
            str = cVar.f38017b;
        }
        return cVar.a(xVar, str);
    }
}
