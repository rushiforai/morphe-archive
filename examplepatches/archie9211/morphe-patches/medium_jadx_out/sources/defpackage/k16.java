package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k16 implements ww {
    public final jn3 a;
    public final v4b b;
    public final long c;

    public k16(jn3 jn3Var, v4b v4bVar, long j) {
        this.a = jn3Var;
        this.b = v4bVar;
        this.c = j;
        if (jn3Var instanceof cud) {
            cud cudVar = (cud) jn3Var;
            if (cudVar.a != 0 || cudVar.b != 0) {
                return;
            }
        } else if (!(jn3Var instanceof nic) && (!(jn3Var instanceof al6) || ((al6) jn3Var).a.a != 0)) {
            return;
        }
        ay0.e("Animation to be infinitely repeated cannot have a 0-duration");
        throw null;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new uva(this.a.a(hudVar), this.b, this.c);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof k16) {
            k16 k16Var = (k16) obj;
            if (k16Var.a.equals(this.a) && k16Var.b == this.b && k16Var.c == this.c) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        long j = this.c;
        return ((int) (j ^ (j >>> 32))) + iHashCode;
    }
}
