package z1;

import androidx.compose.runtime.snapshots.SnapshotApplyConflictException;

/* loaded from: classes.dex */
public final class g extends w.b {

    /* renamed from: d, reason: collision with root package name */
    public final b f97928d;

    public g(b bVar) {
        this.f97928d = bVar;
    }

    @Override // w.b
    public final void e() throws SnapshotApplyConflictException {
        this.f97928d.c();
        throw new SnapshotApplyConflictException();
    }
}
