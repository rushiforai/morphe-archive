package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu6 implements wt6 {
    public final kv6 a;
    public final xu6 b;
    public final xr6 c;
    public final xp d;

    public yu6(kv6 kv6Var, xu6 xu6Var, xr6 xr6Var, xp xpVar) {
        this.a = kv6Var;
        this.b = xu6Var;
        this.c = xr6Var;
        this.d = xpVar;
    }

    @Override // defpackage.wt6
    public final int a() {
        return this.b.X().b;
    }

    @Override // defpackage.wt6
    public final void b(int i, Object obj, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-462424778);
        int i3 = 4;
        int i4 = (p65Var.d(i) ? 4 : 2) | i2 | (p65Var.h(obj) ? 32 : 16) | (p65Var.f(this) ? 256 : 128);
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            vv2.h(obj, i, this.a.s, pxf.E(-824725566, new s8(i, i3, this), p65Var), p65Var, ((i4 >> 3) & 14) | 3072 | ((i4 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(this, i, obj, i2, 20);
        }
    }

    @Override // defpackage.wt6
    public final Object c(int i) {
        Object objT = this.d.t(i);
        return objT == null ? this.b.Y(i) : objT;
    }

    @Override // defpackage.wt6
    public final Object d(int i) {
        return this.b.V(i);
    }

    @Override // defpackage.wt6
    public final int e(Object obj) {
        return this.d.s(obj);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yu6)) {
            return false;
        }
        return g76.L(this.b, ((yu6) obj).b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }
}
