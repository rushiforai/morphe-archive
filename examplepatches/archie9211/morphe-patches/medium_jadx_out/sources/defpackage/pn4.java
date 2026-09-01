package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pn4 implements hn4 {
    public final float a;
    public final vlc b;

    public pn4(float f, float f2, float f3) {
        this.a = f3;
        vlc vlcVar = new vlc();
        vlcVar.a = 1.0f;
        vlcVar.b = Math.sqrt(50.0d);
        vlcVar.c = 1.0f;
        if (f < 0.0f) {
            zx9.a("Damping ratio must be non-negative");
        }
        vlcVar.c = f;
        double d = vlcVar.b;
        if (((float) (d * d)) <= 0.0f) {
            zx9.a("Spring stiffness constant must be positive.");
        }
        vlcVar.b = Math.sqrt(f2);
        this.b = vlcVar;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new o2b(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x0132  */
    @Override // defpackage.hn4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long b(float r34, float r35, float r36) {
        /*
            Method dump skipped, instruction units count: 581
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pn4.b(float, float, float):long");
    }

    @Override // defpackage.hn4
    public final float c(float f, float f2, float f3, long j) {
        vlc vlcVar = this.b;
        vlcVar.a = f2;
        return Float.intBitsToFloat((int) (vlcVar.a(f, f3, j / 1000000) & 4294967295L));
    }

    @Override // defpackage.hn4
    public final float d(float f, float f2, float f3) {
        return 0.0f;
    }

    @Override // defpackage.hn4
    public final float e(float f, float f2, float f3, long j) {
        vlc vlcVar = this.b;
        vlcVar.a = f2;
        return Float.intBitsToFloat((int) (vlcVar.a(f, f3, j / 1000000) >> 32));
    }
}
