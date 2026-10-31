package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d3 {

    /* renamed from: a, reason: collision with root package name */
    public final String f46994a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f46995b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f46996c;

    public d3(String description, boolean z11, boolean z12) {
        Intrinsics.g(description, "description");
        this.f46994a = description;
        this.f46995b = z11;
        this.f46996c = z12;
    }

    public final boolean a() {
        return this.f46995b;
    }

    public final boolean b() {
        return this.f46996c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d3)) {
            return false;
        }
        d3 d3Var = (d3) obj;
        return Intrinsics.b(this.f46994a, d3Var.f46994a) && this.f46995b == d3Var.f46995b && this.f46996c == d3Var.f46996c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f46994a.hashCode() * 31;
        boolean z11 = this.f46995b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        boolean z12 = this.f46996c;
        return i11 + (z12 ? 1 : z12 ? 1 : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("ErrorInfo(description=");
        sbA.append(this.f46994a);
        sbA.append(", errorIsTerminal=");
        sbA.append(this.f46995b);
        sbA.append(", isRetryCode=");
        return a2.c.p(sbA, this.f46996c, ')');
    }

    public /* synthetic */ d3(String str, boolean z11, boolean z12, int i5) {
        this(str, (i5 & 2) != 0 ? false : z11, (i5 & 4) != 0 ? false : z12);
    }
}
