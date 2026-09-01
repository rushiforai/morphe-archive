package defpackage;

import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ry7 implements r82 {
    public final qy7 a;
    public final boolean b;

    public ry7(String str, qy7 qy7Var, boolean z) {
        this.a = qy7Var;
        this.b = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        if (((HashSet) rc7Var.j.a).contains(sc7.MergePathsApi19)) {
            return new ty7(this);
        }
        h87.a("Animation contains merge paths but they are disabled.");
        return null;
    }

    public final String toString() {
        return "MergePaths{mode=" + this.a + '}';
    }
}
