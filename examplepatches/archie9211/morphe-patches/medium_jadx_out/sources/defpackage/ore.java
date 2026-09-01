package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ore {
    public final dx a;
    public final yn3 b;

    public ore(dx dxVar, yn3 yn3Var) {
        this.a = dxVar;
        this.b = yn3Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ore)) {
            return false;
        }
        ore oreVar = (ore) obj;
        return g76.L(this.a, oreVar.a) && g76.L(this.b, oreVar.b);
    }

    public final int hashCode() {
        return (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
    }

    public final String toString() {
        return "VectorizedKeyframeSpecElementInfo(vectorValue=" + this.a + ", easing=" + this.b + ", arcMode=ArcMode(value=0))";
    }
}
