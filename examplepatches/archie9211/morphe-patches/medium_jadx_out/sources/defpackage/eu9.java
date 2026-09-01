package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eu9 implements ou9 {
    public final int a;
    public final bhc b;

    public eu9(int i, bhc bhcVar) {
        bhcVar.getClass();
        this.a = i;
        this.b = bhcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eu9)) {
            return false;
        }
        eu9 eu9Var = (eu9) obj;
        return this.a == eu9Var.a && this.b == eu9Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "ShowSnackbar(messageResId=" + this.a + ", duration=" + this.b + ")";
    }
}
