package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iig {
    public final Class a;
    public final Class b;

    public iig(Class cls, Class cls2) {
        this.a = cls;
        this.b = cls2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof iig)) {
            return false;
        }
        iig iigVar = (iig) obj;
        return iigVar.a.equals(this.a) && iigVar.b.equals(this.b);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }

    public final String toString() {
        return ev6.x(this.a.getSimpleName(), " with primitive type: ", this.b.getSimpleName());
    }
}
