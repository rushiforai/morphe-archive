package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yjd {
    public final int a;

    public final boolean equals(Object obj) {
        if (obj instanceof yjd) {
            return this.a == ((yjd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        int i = this.a;
        return i == 1 ? "Linearity.Linear" : i == 2 ? "Linearity.FontHinting" : i == 3 ? "Linearity.None" : "Invalid";
    }
}
