package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ic1 implements jc1 {
    public final v81 a;

    public ic1(v81 v81Var) {
        this.a = v81Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ic1) && this.a.equals(((ic1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Loading(bottomBarUiModel=" + this.a + ")";
    }
}
