package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l72 extends m72 {
    public final int a;

    public l72(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l72) && this.a == ((l72) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return km4.A(new StringBuilder("ConstraintsNotMet(reason="), this.a, ')');
    }
}
