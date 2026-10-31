package z1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class w extends b0 {

    /* renamed from: c, reason: collision with root package name */
    public s1.d f97985c;

    /* renamed from: d, reason: collision with root package name */
    public int f97986d;

    /* renamed from: e, reason: collision with root package name */
    public int f97987e;

    public w(long j11, s1.d dVar) {
        super(j11);
        this.f97985c = dVar;
    }

    @Override // z1.b0
    public final void a(b0 b0Var) {
        synchronized (q.f97955a) {
            Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.StateListStateRecord>");
            this.f97985c = ((w) b0Var).f97985c;
            this.f97986d = ((w) b0Var).f97986d;
            this.f97987e = ((w) b0Var).f97987e;
            Unit unit = Unit.f71706a;
        }
    }

    @Override // z1.b0
    public final b0 b(long j11) {
        return new w(j11, this.f97985c);
    }

    public final s1.d c() {
        return this.f97985c;
    }

    public final int d() {
        return this.f97986d;
    }

    public final int e() {
        return this.f97987e;
    }

    public final void f(s1.d dVar) {
        this.f97985c = dVar;
    }

    public final void g(int i5) {
        this.f97986d = i5;
    }

    public final void h(int i5) {
        this.f97987e = i5;
    }
}
