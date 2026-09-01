package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bj0 extends kd2 {
    public final List a;

    public bj0(List list) {
        this.a = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof kd2)) {
            return false;
        }
        return this.a.equals(((bj0) ((kd2) obj)).a);
    }

    public final int hashCode() {
        return this.a.hashCode() ^ 1000003;
    }

    public final String toString() {
        return b09.B(new StringBuilder("RolloutsState{rolloutAssignments="), this.a, "}");
    }
}
