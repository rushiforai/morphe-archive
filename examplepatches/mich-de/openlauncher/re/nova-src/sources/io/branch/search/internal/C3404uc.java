package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.uc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3404uc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66023a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f66024b;

    /* renamed from: c, reason: collision with root package name */
    public final long f66025c;

    /* renamed from: d, reason: collision with root package name */
    public final long f66026d;

    /* renamed from: e, reason: collision with root package name */
    public final long f66027e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f66028f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final List<Double> f66029g;

    public C3404uc(@NotNull String ssmlVersionName, @NotNull String ssmlBuiltOn, long j11, long j12, long j13, @NotNull String ssmlLastUpdateTime, @NotNull ArrayList ssmlSearchTimings) {
        Intrinsics.g(ssmlVersionName, "ssmlVersionName");
        Intrinsics.g(ssmlBuiltOn, "ssmlBuiltOn");
        Intrinsics.g(ssmlLastUpdateTime, "ssmlLastUpdateTime");
        Intrinsics.g(ssmlSearchTimings, "ssmlSearchTimings");
        this.f66023a = ssmlVersionName;
        this.f66024b = ssmlBuiltOn;
        this.f66025c = j11;
        this.f66026d = j12;
        this.f66027e = j13;
        this.f66028f = ssmlLastUpdateTime;
        this.f66029g = ssmlSearchTimings;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3404uc)) {
            return false;
        }
        C3404uc c3404uc = (C3404uc) obj;
        return Intrinsics.b(this.f66023a, c3404uc.f66023a) && Intrinsics.b(this.f66024b, c3404uc.f66024b) && this.f66025c == c3404uc.f66025c && this.f66026d == c3404uc.f66026d && this.f66027e == c3404uc.f66027e && Intrinsics.b(this.f66028f, c3404uc.f66028f) && Intrinsics.b(this.f66029g, c3404uc.f66029g);
    }

    public final int hashCode() {
        return this.f66029g.hashCode() + C3248l8.a(this.f66028f, C3231k8.a(this.f66027e, C3231k8.a(this.f66026d, C3231k8.a(this.f66025c, C3248l8.a(this.f66024b, this.f66023a.hashCode() * 31, 31), 31), 31), 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SSMLDiagnostics(ssmlVersionName=");
        sb2.append(this.f66023a);
        sb2.append(", ssmlBuiltOn=");
        sb2.append(this.f66024b);
        sb2.append(", ssmlSizeOnDisk=");
        sb2.append(this.f66025c);
        sb2.append(", ssmlShortcutRowCount=");
        sb2.append(this.f66026d);
        sb2.append(", ssmlAliasRowCount=");
        sb2.append(this.f66027e);
        sb2.append(", ssmlLastUpdateTime=");
        sb2.append(this.f66028f);
        sb2.append(", ssmlSearchTimings=");
        return Ob.a(sb2, this.f66029g, ')');
    }
}
