package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ta1 implements ua1 {
    public final u4b a;

    public ta1(u4b u4bVar) {
        this.a = u4bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ta1) && g76.L(this.a, ((ta1) obj).a);
    }

    public final int hashCode() {
        u4b u4bVar = this.a;
        if (u4bVar == null) {
            return 0;
        }
        return u4bVar.hashCode();
    }

    public final String toString() {
        return "SubmitReorder(submission=" + this.a + ")";
    }
}
