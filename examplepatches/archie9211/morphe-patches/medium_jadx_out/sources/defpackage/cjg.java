package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cjg {
    public final Class a;
    public final Class b;

    public cjg(Class cls, Class cls2) {
        this.a = cls;
        this.b = cls2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof cjg)) {
            return false;
        }
        cjg cjgVar = (cjg) obj;
        return cjgVar.a.equals(this.a) && cjgVar.b.equals(this.b);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }

    public final String toString() {
        return ev6.x(this.a.getSimpleName(), " with serialization type: ", this.b.getSimpleName());
    }
}
