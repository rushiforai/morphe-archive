package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c8c {
    public final ww a;
    public final List b;
    public final List c;
    public final float d;
    public final ou e = yi2.h(0.0f);
    public final float[] f = pk7.a();
    public final long g;
    public final long h;
    public final uq i;
    public final uq j;

    public c8c(ww wwVar, List list, List list2, float f) {
        this.a = wwVar;
        this.b = list;
        this.c = list2;
        this.d = f;
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits((-f) / 2.0f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(0.0f)));
        this.g = jFloatToRawIntBits;
        this.h = jFloatToRawIntBits ^ (-9223372034707292160L);
        uq uqVarZ = rx0.z();
        uqVarZ.a.setAntiAlias(true);
        uqVarZ.l(0);
        uqVarZ.d(6);
        this.i = uqVarZ;
        this.j = rx0.z();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || c8c.class != obj.getClass()) {
            return false;
        }
        c8c c8cVar = (c8c) obj;
        return this.a.equals(c8cVar.a) && this.b.equals(c8cVar.b) && this.c.equals(c8cVar.c) && this.d == c8cVar.d;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + wgd.p(wgd.p(km4.p(15.0f, ((this.a.hashCode() * 31) + 6) * 31, 31), 31, this.b), 31, this.c);
    }
}
