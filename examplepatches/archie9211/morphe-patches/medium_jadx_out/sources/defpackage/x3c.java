package defpackage;

import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x3c implements r82 {
    public final String a;
    public final List b;
    public final boolean c;

    public x3c(String str, List list, boolean z) {
        this.a = str;
        this.b = list;
        this.c = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        return new f82(rc7Var, tn0Var, this, bc7Var);
    }

    public final String toString() {
        return "ShapeGroup{name='" + this.a + "' Shapes: " + Arrays.toString(this.b.toArray()) + '}';
    }
}
