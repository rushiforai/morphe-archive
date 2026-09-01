package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cud implements jn3 {
    public final int a;
    public final int b;
    public final yn3 c;

    public cud(int i, yn3 yn3Var, int i2) {
        this(i, 0, (i2 & 4) != 0 ? ao3.a : yn3Var);
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new u11(this.a, this.b, this.c);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof cud) {
            cud cudVar = (cud) obj;
            if (cudVar.a == this.a && cudVar.b == this.b && g76.L(cudVar.c, this.c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.c.hashCode() + (this.a * 31)) * 31) + this.b;
    }

    public cud(int i, int i2, yn3 yn3Var) {
        this.a = i;
        this.b = i2;
        this.c = yn3Var;
    }

    @Override // defpackage.jn3, defpackage.ww
    public final lre a(hud hudVar) {
        return new u11(this.a, this.b, this.c);
    }
}
