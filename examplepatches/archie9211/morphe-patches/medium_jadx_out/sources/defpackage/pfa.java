package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pfa implements gga {
    public final eea a;

    public pfa(eea eeaVar) {
        this.a = eeaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof pfa) && this.a == ((pfa) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "FailedToSaveNewUnlistedValue(value=" + this.a + ")";
    }
}
