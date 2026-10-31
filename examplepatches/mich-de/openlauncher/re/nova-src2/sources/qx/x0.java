package qx;

import android.view.View;
import android.view.ViewGroup;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public final View f84647a;

    /* renamed from: b, reason: collision with root package name */
    public ViewGroup f84648b;

    /* renamed from: c, reason: collision with root package name */
    public final String f84649c;

    /* renamed from: d, reason: collision with root package name */
    public final String f84650d;

    /* renamed from: e, reason: collision with root package name */
    public final s0 f84651e;

    /* renamed from: f, reason: collision with root package name */
    public f f84652f;

    /* renamed from: g, reason: collision with root package name */
    public long f84653g;

    /* renamed from: h, reason: collision with root package name */
    public final long f84654h;

    public x0(View view, ViewGroup viewGroup, String str, String str2, s0 s0Var, f fVar, long j11) {
        long jNanoTime = System.nanoTime();
        this.f84647a = view;
        this.f84648b = viewGroup;
        this.f84649c = str;
        this.f84650d = str2;
        this.f84651e = s0Var;
        this.f84652f = fVar;
        this.f84653g = j11;
        this.f84654h = jNanoTime;
    }

    public final String a() {
        return this.f84650d;
    }

    public final ViewGroup b() {
        return this.f84648b;
    }

    public final long c() {
        return this.f84653g;
    }

    public final f d() {
        return this.f84652f;
    }

    public final s0 e() {
        return this.f84651e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x0)) {
            return false;
        }
        x0 x0Var = (x0) obj;
        return Intrinsics.b(this.f84647a, x0Var.f84647a) && Intrinsics.b(this.f84648b, x0Var.f84648b) && Intrinsics.b(this.f84649c, x0Var.f84649c) && Intrinsics.b(this.f84650d, x0Var.f84650d) && this.f84651e == x0Var.f84651e && Intrinsics.b(this.f84652f, x0Var.f84652f) && this.f84653g == x0Var.f84653g && this.f84654h == x0Var.f84654h;
    }

    public final String f() {
        return this.f84649c;
    }

    public final long g() {
        return (System.nanoTime() - this.f84654h) / 1000000;
    }

    public final View h() {
        return this.f84647a;
    }

    public final int hashCode() {
        int iHashCode = (this.f84651e.hashCode() + b.c0.e(b.c0.e((this.f84648b.hashCode() + (this.f84647a.hashCode() * 31)) * 31, 31, this.f84649c), 31, this.f84650d)) * 31;
        f fVar = this.f84652f;
        return Long.hashCode(this.f84654h) + b.c0.d((iHashCode + (fVar == null ? 0 : fVar.hashCode())) * 31, 31, this.f84653g);
    }

    public final void i(ViewGroup viewGroup) {
        this.f84648b = viewGroup;
    }

    public final void j(long j11) {
        this.f84653g = j11;
    }

    public final void k(f fVar) {
        this.f84652f = fVar;
    }

    public final String toString() {
        ViewGroup viewGroup = this.f84648b;
        f fVar = this.f84652f;
        long j11 = this.f84653g;
        StringBuilder sb2 = new StringBuilder("PendingAdView(view=");
        sb2.append(this.f84647a);
        sb2.append(", adLayout=");
        sb2.append(viewGroup);
        sb2.append(", locationInApp=");
        b.c0.D(sb2, this.f84649c, ", adKey=", this.f84650d, ", layoutType=");
        sb2.append(this.f84651e);
        sb2.append(", eventsListener=");
        sb2.append(fVar);
        sb2.append(", admobPlacementId=");
        sb2.append(j11);
        sb2.append(", requestTime=");
        sb2.append(this.f84654h);
        sb2.append(")");
        return sb2.toString();
    }
}
