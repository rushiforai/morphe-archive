package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cec extends q28 implements sp6, xxb {
    public int A;
    public fw8 B;
    public float o;
    public float p;
    public float q;
    public float r;
    public float s;
    public float t;
    public long u;
    public m3c v;
    public boolean w;
    public long x;
    public long y;
    public int z;

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new jr(t99VarS, 14, this));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return false;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        if (this.w) {
            gyb.h(jybVar, this.v);
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SimpleGraphicsLayerModifier(scaleX=");
        sb.append(this.o);
        sb.append(", scaleY=");
        sb.append(this.p);
        sb.append(", alpha = ");
        sb.append(this.q);
        sb.append(", translationX=0.0, translationY=0.0, shadowElevation=");
        sb.append(this.r);
        sb.append(", rotationX=0.0, rotationY=0.0, rotationZ=");
        sb.append(this.s);
        sb.append(", cameraDistance=");
        sb.append(this.t);
        sb.append(", transformOrigin=");
        sb.append((Object) nrd.b(this.u));
        sb.append(", shape=");
        sb.append(this.v);
        sb.append(", clip=");
        sb.append(this.w);
        sb.append(", renderEffect=null, ambientShadowColor=");
        ev6.F(this.x, ", spotShadowColor=", sb);
        ev6.F(this.y, ", compositingStrategy=", sb);
        sb.append((Object) ("CompositingStrategy(value=" + this.z + ')'));
        sb.append(", blendMode=");
        sb.append((Object) pxf.O(this.A));
        sb.append(", colorFilter=null)");
        return sb.toString();
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }
}
