package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qxb {
    public static final qxb c = new qxb(0, 0);
    public final int a;
    public final int b;

    public qxb(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qxb)) {
            return false;
        }
        qxb qxbVar = (qxb) obj;
        return this.a == qxbVar.a && this.b == qxbVar.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        return ev6.s(this.a, this.b, "SelectionText(start=", ", end=", ")");
    }
}
