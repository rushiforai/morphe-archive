package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n2 extends z1.b0 {

    /* renamed from: c, reason: collision with root package name */
    public int f81516c;

    public n2(long j11, int i5) {
        super(j11);
        this.f81516c = i5;
    }

    @Override // z1.b0
    public final void a(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableIntStateImpl.IntStateStateRecord");
        this.f81516c = ((n2) b0Var).f81516c;
    }

    @Override // z1.b0
    public final z1.b0 b(long j11) {
        return new n2(j11, this.f81516c);
    }
}
