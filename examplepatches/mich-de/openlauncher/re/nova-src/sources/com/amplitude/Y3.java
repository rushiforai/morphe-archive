package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Y3 {

    /* renamed from: a, reason: collision with root package name */
    public transient E f20448a = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Y3) && Intrinsics.b(this.f20448a, ((Y3) obj).f20448a);
    }

    public final int hashCode() {
        E e3 = this.f20448a;
        return Long.hashCode(0L) + ((e3 == null ? 0 : e3.hashCode()) * 31);
    }

    public final String toString() {
        return "TransientProps(bitmapRendering=" + this.f20448a + ", duration=0)";
    }
}
