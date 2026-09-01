package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ru9 implements tu9 {
    public final iv0 a;

    public ru9(iv0 iv0Var) {
        this.a = iv0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ru9) && this.a.equals(((ru9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Loading(bottomActionBarUiModel=" + this.a + ")";
    }
}
