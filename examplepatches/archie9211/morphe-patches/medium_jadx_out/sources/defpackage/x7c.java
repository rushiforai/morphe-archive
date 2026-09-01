package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x7c {
    public final f8c a;
    public final c8c b;
    public final xpc c;

    public x7c(f8c f8cVar, c8c c8cVar, zwa zwaVar) {
        c8cVar.getClass();
        this.a = f8cVar;
        this.b = c8cVar;
        this.c = vv2.j(zwaVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || x7c.class != obj.getClass()) {
            return false;
        }
        x7c x7cVar = (x7c) obj;
        return this.a.equals(x7cVar.a) && g76.L(this.b, x7cVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }
}
