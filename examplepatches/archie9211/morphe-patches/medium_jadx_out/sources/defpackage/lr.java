package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lr implements pb9 {
    public final int b;

    public lr(int i) {
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!lr.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        return this.b == ((lr) obj).b;
    }

    public final int hashCode() {
        return this.b;
    }

    public final String toString() {
        return km4.A(new StringBuilder("AndroidPointerIcon(type="), this.b, ')');
    }
}
