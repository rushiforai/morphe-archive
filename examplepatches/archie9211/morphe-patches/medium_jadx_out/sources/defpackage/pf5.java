package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lpf5;", "Lu28;", "Lcec;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class pf5 extends u28 {
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final float f;
    public final long g;
    public final m3c h;
    public final boolean i;
    public final long j;
    public final long k;
    public final int l;

    public pf5(float f, float f2, float f3, float f4, float f5, long j, m3c m3cVar, boolean z, long j2, long j3, int i) {
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        this.f = f5;
        this.g = j;
        this.h = m3cVar;
        this.i = z;
        this.j = j2;
        this.k = j3;
        this.l = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pf5)) {
            return false;
        }
        pf5 pf5Var = (pf5) obj;
        if (Float.compare(this.b, pf5Var.b) != 0 || Float.compare(this.c, pf5Var.c) != 0 || Float.compare(this.d, pf5Var.d) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(this.e, pf5Var.e) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(0.0f, 0.0f) != 0 || Float.compare(this.f, pf5Var.f) != 0 || Float.compare(8.0f, 8.0f) != 0 || !nrd.a(this.g, pf5Var.g) || !g76.L(this.h, pf5Var.h) || this.i != pf5Var.i) {
            return false;
        }
        long j = pf5Var.j;
        int i = uu1.i;
        return ezd.a(this.j, j) && ezd.a(this.k, pf5Var.k) && this.l == pf5Var.l;
    }

    @Override // defpackage.u28
    public final q28 f() {
        cec cecVar = new cec();
        cecVar.o = this.b;
        cecVar.p = this.c;
        cecVar.q = this.d;
        cecVar.r = this.e;
        cecVar.s = this.f;
        cecVar.t = 8.0f;
        cecVar.u = this.g;
        cecVar.v = this.h;
        cecVar.w = this.i;
        cecVar.x = this.j;
        cecVar.y = this.k;
        cecVar.z = this.l;
        cecVar.A = 3;
        cecVar.B = new fw8(7, cecVar);
        return cecVar;
    }

    public final int hashCode() {
        int iP = km4.p(8.0f, km4.p(this.f, km4.p(0.0f, km4.p(0.0f, km4.p(this.e, km4.p(0.0f, km4.p(0.0f, km4.p(this.d, km4.p(this.c, Float.floatToIntBits(this.b) * 31, 31), 31), 31), 31), 31), 31), 31), 31), 31);
        int i = nrd.c;
        long j = this.g;
        int iHashCode = (((this.h.hashCode() + ((((int) (j ^ (j >>> 32))) + iP) * 31)) * 31) + (this.i ? 1231 : 1237)) * 961;
        int i2 = uu1.i;
        return (((lv8.g(lv8.g(iHashCode, 31, this.j), 31, this.k) + this.l) * 31) + 3) * 31;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        eh8 eh8Var;
        cec cecVar = (cec) q28Var;
        cecVar.o = this.b;
        cecVar.p = this.c;
        cecVar.q = this.d;
        cecVar.r = this.e;
        cecVar.s = this.f;
        cecVar.t = 8.0f;
        cecVar.u = this.g;
        cecVar.v = this.h;
        cecVar.w = this.i;
        cecVar.x = this.j;
        cecVar.y = this.k;
        cecVar.z = this.l;
        cecVar.A = 3;
        fw8 fw8Var = cecVar.B;
        if (cecVar.a.n && (eh8Var = flb.t0(cecVar, 2).p) != null) {
            eh8Var.n1(fw8Var, true);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("GraphicsLayerElement(scaleX=");
        sb.append(this.b);
        sb.append(", scaleY=");
        sb.append(this.c);
        sb.append(", alpha=");
        sb.append(this.d);
        sb.append(", translationX=0.0, translationY=0.0, shadowElevation=");
        sb.append(this.e);
        sb.append(", rotationX=0.0, rotationY=0.0, rotationZ=");
        sb.append(this.f);
        sb.append(", cameraDistance=8.0, transformOrigin=");
        sb.append((Object) nrd.b(this.g));
        sb.append(", shape=");
        sb.append(this.h);
        sb.append(", clip=");
        sb.append(this.i);
        sb.append(", renderEffect=null, ambientShadowColor=");
        ev6.F(this.j, ", spotShadowColor=", sb);
        ev6.F(this.k, ", compositingStrategy=", sb);
        sb.append((Object) ("CompositingStrategy(value=" + this.l + ')'));
        sb.append(", blendMode=");
        sb.append((Object) pxf.O(3));
        sb.append(", colorFilter=null)");
        return sb.toString();
    }
}
