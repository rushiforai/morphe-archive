package z1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class r extends b0 {

    /* renamed from: c, reason: collision with root package name */
    public s1.f f97956c;

    /* renamed from: d, reason: collision with root package name */
    public int f97957d;

    public r(long j11, s1.f fVar) {
        super(j11);
        this.f97956c = fVar;
    }

    @Override // z1.b0
    public final void a(b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord<K of androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord, V of androidx.compose.runtime.snapshots.SnapshotStateMap.StateMapStateRecord>");
        r rVar = (r) b0Var;
        synchronized (t.f97962a) {
            this.f97956c = rVar.f97956c;
            this.f97957d = rVar.f97957d;
            Unit unit = Unit.f71706a;
        }
    }

    @Override // z1.b0
    public final b0 b(long j11) {
        return new r(j11, this.f97956c);
    }
}
