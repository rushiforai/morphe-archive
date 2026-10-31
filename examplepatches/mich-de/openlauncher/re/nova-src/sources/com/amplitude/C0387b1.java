package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.b1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0387b1 {

    /* renamed from: a, reason: collision with root package name */
    public final C0362a1 f20497a;

    /* renamed from: b, reason: collision with root package name */
    public final b3.q f20498b;

    public C0387b1(C0362a1 modifierData, b3.q qVar) {
        Intrinsics.g(modifierData, "modifierData");
        this.f20497a = modifierData;
        this.f20498b = qVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C0387b1)) {
            return false;
        }
        C0387b1 c0387b1 = (C0387b1) obj;
        return Intrinsics.b(this.f20497a, c0387b1.f20497a) && Intrinsics.b(this.f20498b, c0387b1.f20498b);
    }

    public final int hashCode() {
        int iHashCode = this.f20497a.hashCode() * 31;
        b3.q qVar = this.f20498b;
        return iHashCode + (qVar == null ? 0 : qVar.hashCode());
    }

    public final String toString() {
        return "ModifierNodeData(modifierData=" + this.f20497a + ", drawModifierNode=" + this.f20498b + ")";
    }
}
