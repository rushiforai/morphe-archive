package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z0c {
    public final t34 a;
    public final g1c b;
    public final w60 c;

    public z0c(t34 t34Var, g1c g1cVar, w60 w60Var) {
        t34Var.getClass();
        this.a = t34Var;
        this.b = g1cVar;
        this.c = w60Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z0c)) {
            return false;
        }
        z0c z0cVar = (z0c) obj;
        return this.a == z0cVar.a && this.b.equals(z0cVar.b) && this.c.equals(z0cVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "SessionEvent(eventType=" + this.a + ", sessionData=" + this.b + ", applicationInfo=" + this.c + ')';
    }
}
