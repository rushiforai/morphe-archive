package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sm4 implements tm4 {
    public final List a;
    public final List b;

    public sm4(List list, List list2) {
        this.a = list;
        this.b = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sm4)) {
            return false;
        }
        sm4 sm4Var = (sm4) obj;
        return this.a.equals(sm4Var.a) && this.b.equals(sm4Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Main(localFlags=" + this.a + ", localVariants=" + this.b + ")";
    }
}
