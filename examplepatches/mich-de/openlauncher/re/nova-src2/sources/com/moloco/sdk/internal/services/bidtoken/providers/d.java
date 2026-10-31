package com.moloco.sdk.internal.services.bidtoken.providers;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37760b = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Long f37761a;

    public d(@Nullable Long l9) {
        this.f37761a = l9;
    }

    @Nullable
    public final Long a() {
        return this.f37761a;
    }

    @Nullable
    public final Long b() {
        return this.f37761a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f37761a, ((d) obj).f37761a);
    }

    public int hashCode() {
        Long l9 = this.f37761a;
        if (l9 == null) {
            return 0;
        }
        return l9.hashCode();
    }

    @NotNull
    public String toString() {
        return "AppDirInfo(appDirSize=" + this.f37761a + ')';
    }

    @NotNull
    public final d a(@Nullable Long l9) {
        return new d(l9);
    }

    public static /* synthetic */ d a(d dVar, Long l9, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            l9 = dVar.f37761a;
        }
        return dVar.a(l9);
    }
}
