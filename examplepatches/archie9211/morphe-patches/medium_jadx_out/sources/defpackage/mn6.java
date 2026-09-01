package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mn6 implements gx, qn6 {
    public int a;

    public abstract ev7 H();

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mn6)) {
            return false;
        }
        mn6 mn6Var = (mn6) obj;
        if (k0() == mn6Var.k0()) {
            return bgf.M(h1c.j, m0(), mn6Var.m0());
        }
        return false;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return py.a(i0());
    }

    public abstract List h0();

    public final int hashCode() {
        int iHashCode;
        int i = this.a;
        if (i != 0) {
            return i;
        }
        if (kyd.a0(this)) {
            iHashCode = super.hashCode();
        } else {
            iHashCode = (k0() ? 1 : 0) + ((h0().hashCode() + (j0().hashCode() * 31)) * 31);
        }
        this.a = iHashCode;
        return iHashCode;
    }

    public abstract uvd i0();

    public abstract zvd j0();

    public abstract boolean k0();

    public abstract mn6 l0(sn6 sn6Var);

    public abstract o3e m0();
}
