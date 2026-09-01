package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class jvd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() != jd6.NULL) {
            return Boolean.valueOf(gd6Var.q());
        }
        gd6Var.a0();
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        Boolean bool = (Boolean) obj;
        yd6Var.A0(bool == null ? "null" : bool.toString());
    }
}
