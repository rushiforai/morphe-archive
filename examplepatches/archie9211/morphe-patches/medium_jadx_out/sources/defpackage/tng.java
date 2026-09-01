package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tng {
    public final Class a;
    public final cmf b;

    public /* synthetic */ tng(Class cls, cmf cmfVar) {
        this.a = cls;
        this.b = cmfVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof tng)) {
            return false;
        }
        tng tngVar = (tng) obj;
        return tngVar.a.equals(this.a) && tngVar.b.equals(this.b);
    }

    public final int hashCode() {
        return Objects.hash(this.a, this.b);
    }

    public final String toString() {
        String simpleName = this.a.getSimpleName();
        String strValueOf = String.valueOf(this.b);
        return y30.s(new StringBuilder(simpleName.length() + 21 + strValueOf.length()), simpleName, ", object identifier: ", strValueOf);
    }
}
