package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ju9 implements ou9 {
    public final r0e a;

    public ju9(r0e r0eVar) {
        r0eVar.getClass();
        this.a = r0eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ju9) && g76.L(this.a, ((ju9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnfollowUnSubscribe(result=" + this.a + ")";
    }
}
