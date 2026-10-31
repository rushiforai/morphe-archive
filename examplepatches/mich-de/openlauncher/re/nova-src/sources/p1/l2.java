package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l2 extends z1.b0 {

    /* renamed from: c, reason: collision with root package name */
    public float f81501c;

    public l2(float f11, long j11) {
        super(j11);
        this.f81501c = f11;
    }

    @Override // z1.b0
    public final void a(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableFloatStateImpl.FloatStateStateRecord");
        this.f81501c = ((l2) b0Var).f81501c;
    }

    @Override // z1.b0
    public final z1.b0 b(long j11) {
        return new l2(this.f81501c, j11);
    }
}
