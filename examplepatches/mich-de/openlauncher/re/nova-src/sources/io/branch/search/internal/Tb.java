package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Tb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63384a;

    /* renamed from: b, reason: collision with root package name */
    public final long f63385b;

    /* renamed from: c, reason: collision with root package name */
    public final long f63386c;

    public Tb(long j11, long j12, @NotNull String policyType) {
        Intrinsics.g(policyType, "policyType");
        this.f63384a = policyType;
        this.f63385b = j11;
        this.f63386c = j12;
    }
}
