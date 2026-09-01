package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iud extends jud {
    public final /* synthetic */ jud a;

    public iud(jud judVar) {
        this.a = judVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() != jd6.NULL) {
            return this.a.b(gd6Var);
        }
        gd6Var.a0();
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) {
        if (obj == null) {
            yd6Var.Q();
        } else {
            this.a.c(yd6Var, obj);
        }
    }

    public final String toString() {
        return "NullSafeTypeAdapter[" + this.a + "]";
    }
}
