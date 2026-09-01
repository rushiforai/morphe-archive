package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hge implements mge {
    public final SourceParameter a;

    public hge(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof hge) && g76.L(this.a, ((hge) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "AccountSuspended(sourceParameter=" + this.a + ")";
    }
}
