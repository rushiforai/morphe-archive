package io.branch.search.internal;

import io.branch.search.internal.P1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.nf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3289nf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final P1.a f65397a;

    public C3289nf(@NotNull P1.a analyticsTrackingStatus) {
        Intrinsics.g(analyticsTrackingStatus, "analyticsTrackingStatus");
        this.f65397a = analyticsTrackingStatus;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof C3289nf) && this.f65397a == ((C3289nf) obj).f65397a;
    }

    public final int hashCode() {
        return this.f65397a.hashCode();
    }

    @NotNull
    public final String toString() {
        return "UserData(analyticsTrackingStatus=" + this.f65397a + ')';
    }
}
