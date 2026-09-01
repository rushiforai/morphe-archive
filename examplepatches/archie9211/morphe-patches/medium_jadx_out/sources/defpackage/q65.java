package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q65 implements n22 {
    public final k22 a;

    public q65(k22 k22Var) {
        this.a = k22Var;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof q65) {
            return this.a.equals(((q65) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode() * 31;
    }
}
