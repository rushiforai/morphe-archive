package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.o3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3294o3 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Ab f65422a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P5 f65423b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3278n4 f65424c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final C3127e5 f65425d;

    public C3294o3(@NotNull Ab sqlVersionInfo, @NotNull P5 deviceInfo, @NotNull C3278n4 configurationData, @Nullable C3127e5 c3127e5) {
        Intrinsics.g(sqlVersionInfo, "sqlVersionInfo");
        Intrinsics.g(deviceInfo, "deviceInfo");
        Intrinsics.g(configurationData, "configurationData");
        this.f65422a = sqlVersionInfo;
        this.f65423b = deviceInfo;
        this.f65424c = configurationData;
        this.f65425d = c3127e5;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3294o3)) {
            return false;
        }
        C3294o3 c3294o3 = (C3294o3) obj;
        return Intrinsics.b(this.f65422a, c3294o3.f65422a) && Intrinsics.b(this.f65423b, c3294o3.f65423b) && Intrinsics.b(this.f65424c, c3294o3.f65424c) && Intrinsics.b(this.f65425d, c3294o3.f65425d);
    }

    public final int hashCode() {
        int iHashCode = (this.f65424c.hashCode() + ((this.f65423b.hashCode() + (this.f65422a.f62039a.hashCode() * 31)) * 31)) * 31;
        C3127e5 c3127e5 = this.f65425d;
        return iHashCode + (c3127e5 == null ? 0 : c3127e5.f64363a.hashCode());
    }

    @NotNull
    public final String toString() {
        return "BundleRequest(sqlVersionInfo=" + this.f65422a + ", deviceInfo=" + this.f65423b + ", configurationData=" + this.f65424c + ", databaseDiagnostics=" + this.f65425d + ')';
    }
}
