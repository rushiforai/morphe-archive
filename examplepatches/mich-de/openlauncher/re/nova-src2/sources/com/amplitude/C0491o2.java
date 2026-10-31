package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.o2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0491o2 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c("plugin")
    private final String f20703a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("payload")
    private final Object f20704b;

    public C0491o2(Q1 payload) {
        Intrinsics.g(payload, "payload");
        this.f20703a = "rrweb/console@1";
        this.f20704b = payload;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0491o2)) {
            return false;
        }
        C0491o2 c0491o2 = (C0491o2) obj;
        return Intrinsics.b(this.f20703a, c0491o2.f20703a) && Intrinsics.b(this.f20704b, c0491o2.f20704b);
    }

    public final int hashCode() {
        return this.f20704b.hashCode() + (this.f20703a.hashCode() * 31);
    }

    public final String toString() {
        return "RRPluginData(plugin=" + this.f20703a + ", payload=" + this.f20704b + ")";
    }
}
