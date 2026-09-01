package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class rud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        jd6 jd6VarP0 = gd6Var.p0();
        if (jd6VarP0 != jd6.NULL) {
            return jd6VarP0 == jd6.BOOLEAN ? Boolean.toString(gd6Var.nextBoolean()) : gd6Var.q();
        }
        gd6Var.a0();
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.A0((String) obj);
    }
}
