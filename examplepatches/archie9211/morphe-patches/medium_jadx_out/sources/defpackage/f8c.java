package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f8c {
    public final ww a;
    public final List b;
    public final List c;

    public f8c(ww wwVar, List list, List list2) {
        this.a = wwVar;
        this.b = list;
        this.c = list2;
    }

    public static f8c a(f8c f8cVar, k16 k16Var, List list) {
        f8cVar.getClass();
        f8cVar.getClass();
        List list2 = f8cVar.c;
        f8cVar.getClass();
        f8cVar.getClass();
        return new f8c(k16Var, list, list2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f8c)) {
            return false;
        }
        f8c f8cVar = (f8c) obj;
        return this.a.equals(f8cVar.a) && Float.compare(15.0f, 15.0f) == 0 && this.b.equals(f8cVar.b) && this.c.equals(f8cVar.c) && vj3.b(400.0f, 400.0f);
    }

    public final int hashCode() {
        return Float.floatToIntBits(400.0f) + wgd.p(wgd.p(km4.p(15.0f, ((this.a.hashCode() * 31) + 6) * 31, 31), 31, this.b), 31, this.c);
    }

    public final String toString() {
        return "ShimmerTheme(animationSpec=" + this.a + ", blendMode=" + ((Object) pxf.O(6)) + ", rotation=15.0, shaderColors=" + this.b + ", shaderColorStops=" + this.c + ", shimmerWidth=" + ((Object) vj3.c(400.0f)) + ')';
    }
}
