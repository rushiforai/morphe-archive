package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nj8 implements pj8 {
    public final String a;
    public final int b;
    public final boolean c;

    public nj8(int i, String str, boolean z) {
        this.a = str;
        this.b = i;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nj8)) {
            return false;
        }
        nj8 nj8Var = (nj8) obj;
        return this.a.equals(nj8Var.a) && this.b == nj8Var.b && this.c == nj8Var.c;
    }

    @Override // defpackage.pj8
    public final String getName() {
        return this.a;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + this.b) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.t(this.b, "Boolean(name=", this.a, ", labelResId=", ", value="), this.c, ")");
    }
}
