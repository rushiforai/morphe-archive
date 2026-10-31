package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r2 extends z1.b0 {

    /* renamed from: c, reason: collision with root package name */
    public Object f81544c;

    public r2(long j11, Object obj) {
        super(j11);
        this.f81544c = obj;
    }

    @Override // z1.b0
    public final void a(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableStateImpl.StateStateRecord<T of androidx.compose.runtime.SnapshotMutableStateImpl.StateStateRecord>");
        this.f81544c = ((r2) b0Var).f81544c;
    }

    @Override // z1.b0
    public final z1.b0 b(long j11) {
        return new r2(z1.k.k().g(), this.f81544c);
    }
}
