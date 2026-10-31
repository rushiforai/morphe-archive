package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.d8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3113d8 {

    /* renamed from: a, reason: collision with root package name */
    public final long f64283a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64284b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64285c;

    /* renamed from: d, reason: collision with root package name */
    public final long f64286d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f64287e;

    public C3113d8(long j11, @NotNull String appStoreId, @NotNull String linking, long j12, boolean z11) {
        Intrinsics.g(appStoreId, "appStoreId");
        Intrinsics.g(linking, "linking");
        this.f64283a = j11;
        this.f64284b = appStoreId;
        this.f64285c = linking;
        this.f64286d = j12;
        this.f64287e = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (!(obj instanceof C3113d8)) {
            return false;
        }
        C3113d8 c3113d8 = (C3113d8) obj;
        return Intrinsics.b(c3113d8.f64285c, this.f64285c) && c3113d8.f64283a == this.f64283a;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("InvalidLinks{userId=");
        sb2.append(this.f64283a);
        sb2.append(", app_store_id='");
        sb2.append(this.f64284b);
        sb2.append("', linking='");
        sb2.append(this.f64285c);
        sb2.append("', validation_timestamp='");
        sb2.append(this.f64286d);
        sb2.append("', should_retry='");
        return a80.m.k(sb2, this.f64287e, "'}");
    }
}
