package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gs3 implements is3 {
    public final y09 a;
    public final Exception b;

    public gs3(y09 y09Var, Exception exc) {
        this.a = y09Var;
        this.b = exc;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gs3)) {
            return false;
        }
        gs3 gs3Var = (gs3) obj;
        return this.a.equals(gs3Var.a) && this.b.equals(gs3Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ImageUploadFailure(imageData=" + this.a + ", throwable=" + this.b + ")";
    }
}
