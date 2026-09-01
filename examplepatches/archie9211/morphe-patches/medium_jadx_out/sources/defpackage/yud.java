package defpackage;

import java.io.IOException;
import java.net.URL;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class yud extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        String strQ = gd6Var.q();
        if (strQ.equals("null")) {
            return null;
        }
        return new URL(strQ);
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        URL url = (URL) obj;
        yd6Var.A0(url == null ? null : url.toExternalForm());
    }
}
