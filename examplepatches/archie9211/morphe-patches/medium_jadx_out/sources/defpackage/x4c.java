package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x4c {
    public final amb a;
    public final amb b;
    public final amb c;

    public x4c(amb ambVar, amb ambVar2, amb ambVar3) {
        this.a = ambVar;
        this.b = ambVar2;
        this.c = ambVar3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x4c)) {
            return false;
        }
        x4c x4cVar = (x4c) obj;
        return this.a.equals(x4cVar.a) && this.b.equals(x4cVar.b) && this.c.equals(x4cVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Shapes(small=" + this.a + ", medium=" + this.b + ", large=" + this.c + ')';
    }
}
