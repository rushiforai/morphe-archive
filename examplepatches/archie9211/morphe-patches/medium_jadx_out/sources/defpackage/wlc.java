package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wlc implements tj4 {
    public final float a;
    public final float b;
    public final Object c;

    public wlc(float f, float f2, Object obj) {
        this.a = f;
        this.b = f2;
        this.c = obj;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        ex wjcVar;
        Object obj = this.c;
        dx dxVar = obj == null ? null : (dx) hudVar.a.invoke(obj);
        int[] iArr = kre.a;
        float f = this.a;
        float f2 = this.b;
        if (dxVar != null) {
            wjcVar = new wjc(dxVar, f, f2);
        } else {
            qlb qlbVar = new qlb();
            qlbVar.a = new pn4(f, f2, 0.01f);
            wjcVar = qlbVar;
        }
        qlb qlbVar2 = new qlb();
        qlbVar2.a = new o2b(wjcVar);
        return qlbVar2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof wlc) {
            wlc wlcVar = (wlc) obj;
            if (wlcVar.a == this.a && wlcVar.b == this.b && g76.L(wlcVar.c, this.c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.c;
        return Float.floatToIntBits(this.b) + km4.p(this.a, (obj != null ? obj.hashCode() : 0) * 31, 31);
    }

    public /* synthetic */ wlc(Object obj) {
        this(1.0f, 1500.0f, obj);
    }
}
