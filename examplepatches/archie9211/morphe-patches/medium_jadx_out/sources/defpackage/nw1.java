package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nw1 implements yw1 {
    public final y09 a;

    public nw1(y09 y09Var) {
        this.a = y09Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nw1) && this.a.equals(((nw1) obj).a);
    }

    @Override // defpackage.yw1
    public final String getParagraphName() {
        return this.a.getParagraphName();
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Image(imageData=" + this.a + ")";
    }
}
