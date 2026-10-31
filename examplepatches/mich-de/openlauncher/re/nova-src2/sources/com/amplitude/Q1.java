package com.amplitude;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Q1 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("level")
    private final String f20372a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("payload")
    private final List<String> f20373b;

    public Q1(String level, List payload) {
        Intrinsics.g(level, "level");
        Intrinsics.g(payload, "payload");
        this.f20372a = level;
        this.f20373b = payload;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Q1)) {
            return false;
        }
        Q1 q12 = (Q1) obj;
        return Intrinsics.b(this.f20372a, q12.f20372a) && Intrinsics.b(this.f20373b, q12.f20373b);
    }

    public final int hashCode() {
        return this.f20373b.hashCode() + (this.f20372a.hashCode() * 31);
    }

    public final String toString() {
        return "RRConsolePayload(level=" + this.f20372a + ", payload=" + this.f20373b + ")";
    }
}
