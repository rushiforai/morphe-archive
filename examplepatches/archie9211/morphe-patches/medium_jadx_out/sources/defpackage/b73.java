package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b73 {
    public int a;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b73) && this.a == ((b73) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return km4.A(new StringBuilder("DeltaCounter(count="), this.a, ')');
    }
}
