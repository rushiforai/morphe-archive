package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ffa extends gfa {
    public final eea a;

    public ffa(eea eeaVar) {
        this.a = eeaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ffa) && this.a == ((ffa) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnlistedValueHasChanged(publicationFlowPostVisibility=" + this.a + ")";
    }
}
