package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qm8 {
    public final int a;
    public final Integer b;

    public qm8(Integer num, int i) {
        this.a = i;
        this.b = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qm8)) {
            return false;
        }
        qm8 qm8Var = (qm8) obj;
        return this.a == qm8Var.a && g76.L(this.b, qm8Var.b);
    }

    public final int hashCode() {
        int i = this.a * 31;
        Integer num = this.b;
        return i + (num == null ? 0 : num.hashCode());
    }

    public final String toString() {
        return "ObjectLocation(group=" + this.a + ", dataOffset=" + this.b + ')';
    }
}
