package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class os0 {
    public final String a;
    public final ns0 b;

    public os0(String str, ns0 ns0Var) {
        ns0Var.getClass();
        this.a = str;
        this.b = ns0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof os0)) {
            return false;
        }
        os0 os0Var = (os0) obj;
        return g76.L(this.a, os0Var.a) && this.b == os0Var.b;
    }

    public final int hashCode() {
        String str = this.a;
        return this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "BlockStateResult(userName=" + this.a + ", blockState=" + this.b + ")";
    }
}
