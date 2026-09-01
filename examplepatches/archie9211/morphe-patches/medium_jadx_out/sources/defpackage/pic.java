package defpackage;

import androidx.compose.runtime.snapshots.SnapshotApplyConflictException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pic extends fo7 {
    public final k78 c;

    public pic(k78 k78Var) {
        this.c = k78Var;
    }

    @Override // defpackage.fo7
    public final void E() throws SnapshotApplyConflictException {
        this.c.c();
        throw new SnapshotApplyConflictException();
    }
}
