package com.moloco.sdk.internal.services.bidtoken.providers;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37853b = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f37854a;

    public x(@Nullable String str) {
        this.f37854a = str;
    }

    @Nullable
    public final String a() {
        return this.f37854a;
    }

    @Nullable
    public final String b() {
        return this.f37854a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x) && Intrinsics.b(this.f37854a, ((x) obj).f37854a);
    }

    public int hashCode() {
        String str = this.f37854a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    @NotNull
    public String toString() {
        return c1.t(new StringBuilder("TestConfigSignal(configJson="), this.f37854a, ')');
    }

    @NotNull
    public final x a(@Nullable String str) {
        return new x(str);
    }

    public static /* synthetic */ x a(x xVar, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = xVar.f37854a;
        }
        return xVar.a(str);
    }
}
