package defpackage;

import java.io.IOException;
import java.net.InetAddress;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class avd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() != jd6.NULL) {
            return InetAddress.getByName(gd6Var.q());
        }
        gd6Var.a0();
        return null;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        InetAddress inetAddress = (InetAddress) obj;
        yd6Var.A0(inetAddress == null ? null : inetAddress.getHostAddress());
    }
}
