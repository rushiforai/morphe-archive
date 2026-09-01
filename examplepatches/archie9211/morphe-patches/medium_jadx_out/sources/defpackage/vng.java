package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vng {
    public final Class a;
    public final Class b;

    public /* synthetic */ vng(Class cls, Class cls2) {
        this.a = cls;
        this.b = cls2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof vng)) {
            return false;
        }
        vng vngVar = (vng) obj;
        return vngVar.a.equals(this.a) && vngVar.b.equals(this.b);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }

    public final String toString() {
        String simpleName = this.a.getSimpleName();
        String simpleName2 = this.b.getSimpleName();
        return y30.s(new StringBuilder(simpleName.length() + 26 + simpleName2.length()), simpleName, " with serialization type: ", simpleName2);
    }
}
