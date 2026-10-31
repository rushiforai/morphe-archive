package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P5 {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final C3342r1 f63067a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final T5 f63068b;

    public P5(@Nullable C3342r1 c3342r1, @Nullable T5 t52) {
        this.f63067a = c3342r1;
        this.f63068b = t52;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof P5)) {
            return false;
        }
        P5 p52 = (P5) obj;
        return Intrinsics.b(this.f63067a, p52.f63067a) && Intrinsics.b(this.f63068b, p52.f63068b);
    }

    public final int hashCode() {
        C3342r1 c3342r1 = this.f63067a;
        int iHashCode = (c3342r1 == null ? 0 : c3342r1.hashCode()) * 31;
        T5 t52 = this.f63068b;
        return iHashCode + (t52 != null ? t52.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        return "DeviceInfoData(basicDeviceData=" + this.f63067a + ", devicePendingJobs=" + this.f63068b + ')';
    }
}
