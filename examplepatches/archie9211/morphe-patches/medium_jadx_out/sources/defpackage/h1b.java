package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h1b {
    public final Class a;
    public final ym6 b;

    public h1b(Class cls, ym6 ym6Var) {
        this.a = cls;
        this.b = ym6Var;
    }

    public final String a() {
        String strReplace = this.a.getName().replace('.', '/');
        strReplace.getClass();
        return strReplace.concat(".class");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h1b) {
            return this.a.equals(((h1b) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return h1b.class.getName() + ": " + this.a;
    }
}
