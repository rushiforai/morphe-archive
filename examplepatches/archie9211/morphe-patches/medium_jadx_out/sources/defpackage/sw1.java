package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sw1 implements tw1 {
    public final int a;
    public final String b;

    public sw1(int i, String str) {
        this.a = i;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sw1)) {
            return false;
        }
        sw1 sw1Var = (sw1) obj;
        return this.a == sw1Var.a && this.b.equals(sw1Var.b);
    }

    @Override // defpackage.tw1
    public final String getParagraphName() {
        return this.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "Loading(graphIndex=" + this.a + ", paragraphName=" + this.b + ")";
    }
}
