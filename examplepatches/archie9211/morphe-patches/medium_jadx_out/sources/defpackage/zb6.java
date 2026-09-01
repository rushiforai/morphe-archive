package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zb6 extends flb {
    public final jl1 q;
    public final fa4 r;

    public zb6(jl1 jl1Var, fb6 fb6Var) {
        this.q = jl1Var;
        this.r = fb6Var.b;
    }

    @Override // defpackage.f22
    public final int e(xzb xzbVar) {
        xzbVar.getClass();
        throw new IllegalStateException("unsupported");
    }

    @Override // defpackage.flb, defpackage.kw2
    public final int k() {
        jl1 jl1Var = this.q;
        String strN = jl1Var.n();
        try {
            strN.getClass();
            zyd zydVarP = fo7.P(strN);
            if (zydVarP != null) {
                return zydVarP.a;
            }
            tuc.H(strN);
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'UInt' for input '", strN), 0, null, 6);
            throw null;
        }
    }

    @Override // defpackage.f22
    public final fa4 n() {
        return this.r;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final long t() {
        jl1 jl1Var = this.q;
        String strN = jl1Var.n();
        try {
            strN.getClass();
            ezd ezdVarQ = fo7.Q(strN);
            if (ezdVarQ != null) {
                return ezdVarQ.a;
            }
            tuc.H(strN);
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'ULong' for input '", strN), 0, null, 6);
            throw null;
        }
    }

    @Override // defpackage.flb, defpackage.kw2
    public final byte x() {
        tyd tydVar;
        jl1 jl1Var = this.q;
        String strN = jl1Var.n();
        try {
            strN.getClass();
            zyd zydVarP = fo7.P(strN);
            if (zydVarP != null) {
                int i = zydVarP.a;
                tydVar = Integer.compare(Integer.MIN_VALUE ^ i, -2147483393) > 0 ? null : new tyd((byte) i);
            }
            if (tydVar != null) {
                return tydVar.a;
            }
            tuc.H(strN);
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'UByte' for input '", strN), 0, null, 6);
            throw null;
        }
    }

    @Override // defpackage.flb, defpackage.kw2
    public final short y() {
        kzd kzdVar;
        jl1 jl1Var = this.q;
        String strN = jl1Var.n();
        try {
            strN.getClass();
            zyd zydVarP = fo7.P(strN);
            if (zydVarP != null) {
                int i = zydVarP.a;
                kzdVar = Integer.compare(Integer.MIN_VALUE ^ i, -2147418113) > 0 ? null : new kzd((short) i);
            }
            if (kzdVar != null) {
                return kzdVar.a;
            }
            tuc.H(strN);
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'UShort' for input '", strN), 0, null, 6);
            throw null;
        }
    }
}
