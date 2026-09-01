package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zig {
    public final Class a;
    public final qvg b;

    public zig(Class cls, qvg qvgVar) {
        this.a = cls;
        this.b = qvgVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zig)) {
            return false;
        }
        zig zigVar = (zig) obj;
        return zigVar.a.equals(this.a) && zigVar.b.equals(this.b);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }

    public final String toString() {
        return ev6.x(this.a.getSimpleName(), ", object identifier: ", String.valueOf(this.b));
    }
}
