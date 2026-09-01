package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w4c {
    public final amb a;
    public final amb b;
    public final amb c;
    public final amb d;
    public final amb e;
    public final amb f;
    public final amb g;
    public final amb h;

    public w4c(amb ambVar, amb ambVar2, amb ambVar3, int i) {
        amb ambVar4 = u3c.a;
        ambVar = (i & 2) != 0 ? u3c.b : ambVar;
        ambVar2 = (i & 4) != 0 ? u3c.c : ambVar2;
        ambVar3 = (i & 8) != 0 ? u3c.d : ambVar3;
        amb ambVar5 = u3c.f;
        amb ambVar6 = u3c.e;
        amb ambVar7 = u3c.g;
        amb ambVar8 = u3c.h;
        this.a = ambVar4;
        this.b = ambVar;
        this.c = ambVar2;
        this.d = ambVar3;
        this.e = ambVar5;
        this.f = ambVar6;
        this.g = ambVar7;
        this.h = ambVar8;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w4c)) {
            return false;
        }
        w4c w4cVar = (w4c) obj;
        return g76.L(this.a, w4cVar.a) && g76.L(this.b, w4cVar.b) && g76.L(this.c, w4cVar.c) && g76.L(this.d, w4cVar.d) && g76.L(this.e, w4cVar.e) && g76.L(this.f, w4cVar.f) && g76.L(this.g, w4cVar.g) && g76.L(this.h, w4cVar.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Shapes(extraSmall=" + this.a + ", small=" + this.b + ", medium=" + this.c + ", large=" + this.d + ", largeIncreased=" + this.f + ", extraLarge=" + this.e + ", extralargeIncreased=" + this.g + ", extraExtraLarge=" + this.h + ')';
    }
}
