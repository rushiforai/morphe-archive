package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class an1 {
    public final p98 a;
    public final k5a b;
    public final mr0 c;
    public final jkc d;

    public an1(p98 p98Var, k5a k5aVar, mr0 mr0Var, jkc jkcVar) {
        p98Var.getClass();
        k5aVar.getClass();
        jkcVar.getClass();
        this.a = p98Var;
        this.b = k5aVar;
        this.c = mr0Var;
        this.d = jkcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof an1)) {
            return false;
        }
        an1 an1Var = (an1) obj;
        return g76.L(this.a, an1Var.a) && g76.L(this.b, an1Var.b) && this.c.equals(an1Var.c) && g76.L(this.d, an1Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ClassData(nameResolver=" + this.a + ", classProto=" + this.b + ", metadataVersion=" + this.c + ", sourceElement=" + this.d + ')';
    }
}
