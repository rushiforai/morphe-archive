package com.amplitude;

/* renamed from: com.amplitude.f1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0435f1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f20558a;

    /* renamed from: b, reason: collision with root package name */
    public final float f20559b;

    /* renamed from: c, reason: collision with root package name */
    public final float f20560c;

    public C0435f1(int i5, float f11, float f12) {
        this.f20558a = i5;
        this.f20559b = f11;
        this.f20560c = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0435f1)) {
            return false;
        }
        C0435f1 c0435f1 = (C0435f1) obj;
        return this.f20558a == c0435f1.f20558a && Float.compare(this.f20559b, c0435f1.f20559b) == 0 && Float.compare(this.f20560c, c0435f1.f20560c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f20560c) + a80.m.d(this.f20559b, Integer.hashCode(this.f20558a) * 31, 31);
    }

    public final String toString() {
        return "MotionEventSnapshot(actionMasked=" + this.f20558a + ", rawX=" + this.f20559b + ", rawY=" + this.f20560c + ")";
    }
}
