package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fr6 implements wt6 {
    public final ur6 a;
    public final er6 b;
    public final xp c;

    public fr6(ur6 ur6Var, er6 er6Var, xp xpVar) {
        this.a = ur6Var;
        this.b = er6Var;
        this.c = xpVar;
    }

    @Override // defpackage.wt6
    public final int a() {
        return this.b.X().b;
    }

    @Override // defpackage.wt6
    public final void b(int i, Object obj, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1493551140);
        int i3 = (p65Var.d(i) ? 4 : 2) | i2 | (p65Var.h(obj) ? 32 : 16) | (p65Var.f(this) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            vv2.h(obj, i, this.a.q, pxf.E(726189336, new s8(i, 3, this), p65Var), p65Var, ((i3 >> 3) & 14) | 3072 | ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(this, i, obj, i2, 18);
        }
    }

    @Override // defpackage.wt6
    public final Object c(int i) {
        Object objT = this.c.t(i);
        return objT == null ? this.b.Y(i) : objT;
    }

    @Override // defpackage.wt6
    public final Object d(int i) {
        return this.b.V(i);
    }

    @Override // defpackage.wt6
    public final int e(Object obj) {
        return this.c.s(obj);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fr6)) {
            return false;
        }
        return g76.L(this.b, ((fr6) obj).b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }
}
