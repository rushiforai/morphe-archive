package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uh5 implements u84, sya {
    public final qpc a;
    public int b;
    public sh5 c;
    public int d = -1;
    public int e = -1;
    public float f = 0.0f;
    public String g;

    public uh5(qpc qpcVar) {
        this.a = qpcVar;
    }

    @Override // defpackage.sya
    public final void a(b72 b72Var) {
        if (b72Var instanceof sh5) {
            this.c = (sh5) b72Var;
        } else {
            this.c = null;
        }
    }

    @Override // defpackage.u84, defpackage.sya
    public final void apply() {
        this.c.W(this.b);
        int i = this.d;
        if (i != -1) {
            sh5 sh5Var = this.c;
            if (i <= -1) {
                sh5Var.getClass();
                return;
            }
            sh5Var.r0 = -1.0f;
            sh5Var.s0 = i;
            sh5Var.t0 = -1;
            return;
        }
        int i2 = this.e;
        sh5 sh5Var2 = this.c;
        if (i2 != -1) {
            if (i2 <= -1) {
                sh5Var2.getClass();
                return;
            }
            sh5Var2.r0 = -1.0f;
            sh5Var2.s0 = -1;
            sh5Var2.t0 = i2;
            return;
        }
        float f = this.f;
        if (f <= -1.0f) {
            sh5Var2.getClass();
            return;
        }
        sh5Var2.r0 = f;
        sh5Var2.s0 = -1;
        sh5Var2.t0 = -1;
    }

    @Override // defpackage.sya
    public final b72 b() {
        sh5 sh5Var = this.c;
        if (sh5Var != null) {
            return sh5Var;
        }
        sh5 sh5Var2 = new sh5();
        this.c = sh5Var2;
        return sh5Var2;
    }

    @Override // defpackage.sya
    public final u84 c() {
        return null;
    }

    @Override // defpackage.sya
    public final Object getKey() {
        return this.g;
    }
}
