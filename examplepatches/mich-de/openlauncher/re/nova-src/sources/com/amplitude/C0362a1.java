package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.a1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0362a1 {

    /* renamed from: a, reason: collision with root package name */
    public final z2.y0 f20464a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20465b;

    /* renamed from: c, reason: collision with root package name */
    public final c3.o2 f20466c;

    /* renamed from: d, reason: collision with root package name */
    public final i2.a0 f20467d;

    public C0362a1(z2.y0 info, int i5, c3.o2 o2Var, i2.a0 a0Var) {
        Intrinsics.g(info, "info");
        this.f20464a = info;
        this.f20465b = i5;
        this.f20466c = o2Var;
        this.f20467d = a0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0362a1)) {
            return false;
        }
        C0362a1 c0362a1 = (C0362a1) obj;
        return Intrinsics.b(this.f20464a, c0362a1.f20464a) && this.f20465b == c0362a1.f20465b && Intrinsics.b(this.f20466c, c0362a1.f20466c) && Intrinsics.b(this.f20467d, c0362a1.f20467d);
    }

    public final int hashCode() {
        int iA = b.u4.a(this.f20465b, this.f20464a.hashCode() * 31, 31);
        c3.o2 o2Var = this.f20466c;
        int iHashCode = (iA + (o2Var == null ? 0 : o2Var.hashCode())) * 31;
        i2.a0 a0Var = this.f20467d;
        return iHashCode + (a0Var != null ? a0Var.hashCode() : 0);
    }

    public final String toString() {
        return "ModifierData(info=" + this.f20464a + ", hashCode=" + this.f20465b + ", inspectableValue=" + this.f20466c + ", graphicsLayerScope=" + this.f20467d + ")";
    }
}
