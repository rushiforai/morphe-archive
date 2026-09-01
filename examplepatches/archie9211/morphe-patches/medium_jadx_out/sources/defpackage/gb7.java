package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gb7 extends s99 {
    public final /* synthetic */ int b;
    public final Object c;

    public /* synthetic */ gb7(int i, Object obj) {
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.m73
    public final float U() {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((fb7) obj).U();
            default:
                return ((mn) obj).getDensity().U();
        }
    }

    @Override // defpackage.s99
    public float a(lr5 lr5Var) {
        float fIntBitsToFloat;
        int iA0;
        switch (this.b) {
            case 0:
                b55 b55Var = lr5Var.a;
                if (b55Var != null) {
                    return ((Number) b55Var.invoke(this, Float.valueOf(Float.NaN))).floatValue();
                }
                fb7 fb7Var = (fb7) this.c;
                if (fb7Var.k) {
                    return Float.NaN;
                }
                fb7 fb7Var2 = fb7Var;
                while (true) {
                    e8 e8Var = fb7Var2.m;
                    float f = (e8Var == null || (iA0 = k80.A0(lr5Var, (lr5[]) e8Var.b)) < 0) ? Float.NaN : ((float[]) e8Var.c)[iA0];
                    if (!Float.isNaN(f)) {
                        fb7Var2.j0(fb7Var.v0(), lr5Var);
                        hp6 hp6VarS0 = fb7Var2.s0();
                        hp6 hp6VarS02 = fb7Var.s0();
                        switch (lr5Var.b) {
                            case 0:
                                fIntBitsToFloat = Float.intBitsToFloat((int) (hp6VarS02.D(hp6VarS0, (((long) Float.floatToRawIntBits(f)) & 4294967295L) | (((long) Float.floatToRawIntBits(((int) (hp6VarS0.j() >> 32)) / 2.0f)) << 32)) & 4294967295L));
                                break;
                            default:
                                fIntBitsToFloat = Float.intBitsToFloat((int) (hp6VarS02.D(hp6VarS0, (((long) Float.floatToRawIntBits(f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(((int) (hp6VarS0.j() & 4294967295L)) / 2.0f)))) >> 32));
                                break;
                        }
                        return fIntBitsToFloat;
                    }
                    fb7 fb7VarX0 = fb7Var2.x0();
                    if (fb7VarX0 == null) {
                        fb7Var2.j0(fb7Var.v0(), lr5Var);
                        return Float.NaN;
                    }
                    fb7Var2 = fb7VarX0;
                }
                break;
            default:
                return super.a(lr5Var);
        }
    }

    @Override // defpackage.m73
    public final float b() {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((fb7) obj).b();
            default:
                return ((mn) obj).getDensity().b();
        }
    }

    @Override // defpackage.s99
    public final ip6 c() {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((fb7) obj).getLayoutDirection();
            default:
                return ((mn) obj).getLayoutDirection();
        }
    }

    @Override // defpackage.s99
    public final int d() {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((fb7) obj).R();
            default:
                return ((mn) obj).getRoot().G.p.a;
        }
    }
}
