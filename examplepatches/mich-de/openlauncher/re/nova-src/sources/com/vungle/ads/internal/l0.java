package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public m0 f46867a;

    /* renamed from: b, reason: collision with root package name */
    public m0 f46868b;

    public l0(m0 downCoordinate, m0 upCoordinate) {
        Intrinsics.g(downCoordinate, "downCoordinate");
        Intrinsics.g(upCoordinate, "upCoordinate");
        this.f46867a = downCoordinate;
        this.f46868b = upCoordinate;
    }

    public final m0 a() {
        return this.f46867a;
    }

    public final m0 b() {
        return this.f46868b;
    }

    public final boolean c() {
        m0 m0Var = this.f46867a;
        if (m0Var.f46917a == Integer.MIN_VALUE || m0Var.f46918b == Integer.MIN_VALUE) {
            return false;
        }
        m0 m0Var2 = this.f46868b;
        return (m0Var2.f46917a == Integer.MIN_VALUE || m0Var2.f46918b == Integer.MIN_VALUE) ? false : true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l0)) {
            return false;
        }
        l0 l0Var = (l0) obj;
        return Intrinsics.b(this.f46867a, l0Var.f46867a) && Intrinsics.b(this.f46868b, l0Var.f46868b);
    }

    public final int hashCode() {
        return this.f46868b.hashCode() + (this.f46867a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("ClickCoordinate(downCoordinate=");
        sbA.append(this.f46867a);
        sbA.append(", upCoordinate=");
        sbA.append(this.f46868b);
        sbA.append(')');
        return sbA.toString();
    }

    public final void a(m0 m0Var) {
        Intrinsics.g(m0Var, "<set-?>");
        this.f46867a = m0Var;
    }

    public final void b(m0 m0Var) {
        Intrinsics.g(m0Var, "<set-?>");
        this.f46868b = m0Var;
    }
}
