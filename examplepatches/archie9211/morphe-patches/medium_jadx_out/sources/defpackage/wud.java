package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class wud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() != jd6.NULL) {
            return new StringBuilder(gd6Var.q());
        }
        gd6Var.a0();
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        StringBuilder sb = (StringBuilder) obj;
        yd6Var.A0(sb == null ? null : sb.toString());
    }
}
