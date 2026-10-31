package com.amplitude;

import androidx.compose.ui.graphics.Canvas;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.a, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0360a {

    /* renamed from: a, reason: collision with root package name */
    public y3.c f20459a;

    /* renamed from: b, reason: collision with root package name */
    public y3.n f20460b;

    /* renamed from: c, reason: collision with root package name */
    public Canvas f20461c;

    /* renamed from: d, reason: collision with root package name */
    public long f20462d;

    public C0360a(y3.c density, y3.n layoutDirection, Canvas canvas, long j11) {
        Intrinsics.g(density, "density");
        Intrinsics.g(layoutDirection, "layoutDirection");
        Intrinsics.g(canvas, "canvas");
        this.f20459a = density;
        this.f20460b = layoutDirection;
        this.f20461c = canvas;
        this.f20462d = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0360a)) {
            return false;
        }
        C0360a c0360a = (C0360a) obj;
        return Intrinsics.b(this.f20459a, c0360a.f20459a) && this.f20460b == c0360a.f20460b && Intrinsics.b(this.f20461c, c0360a.f20461c) && h2.e.a(this.f20462d, c0360a.f20462d);
    }

    public final int hashCode() {
        return Long.hashCode(this.f20462d) + ((this.f20461c.hashCode() + ((this.f20460b.hashCode() + (this.f20459a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "DrawParams(density=" + this.f20459a + ", layoutDirection=" + this.f20460b + ", canvas=" + this.f20461c + ", size=" + h2.e.f(this.f20462d) + ")";
    }
}
