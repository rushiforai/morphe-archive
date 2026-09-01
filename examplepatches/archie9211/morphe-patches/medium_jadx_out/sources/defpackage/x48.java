package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x48 implements zk7 {
    public final w48 a;

    public x48(w48 w48Var) {
        this.a = w48Var;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        return this.a.a(y66Var, dl7.n(y66Var), i);
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        return this.a.b(bl7Var, dl7.n(bl7Var), j);
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        return this.a.c(y66Var, dl7.n(y66Var), i);
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        return this.a.d(y66Var, dl7.n(y66Var), i);
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        return this.a.e(y66Var, dl7.n(y66Var), i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x48) && g76.L(this.a, ((x48) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MultiContentMeasurePolicyImpl(measurePolicy=" + this.a + ')';
    }
}
