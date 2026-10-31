package p10;

import b.c9;

/* loaded from: classes4.dex */
public final class i2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f81794a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f81795b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f81796c;

    public i2(int i5, boolean z11, boolean z12) {
        this.f81794a = i5;
        this.f81795b = z11;
        this.f81796c = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i2)) {
            return false;
        }
        i2 i2Var = (i2) obj;
        return this.f81794a == i2Var.f81794a && this.f81795b == i2Var.f81795b && this.f81796c == i2Var.f81796c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f81796c) + c9.f(Integer.hashCode(this.f81794a) * 31, 31, this.f81795b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("StreakUpdate(day=");
        sb2.append(this.f81794a);
        sb2.append(", advanced=");
        sb2.append(this.f81795b);
        sb2.append(", wasReset=");
        return a80.m.k(sb2, this.f81796c, ")");
    }
}
