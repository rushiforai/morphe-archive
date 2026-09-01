package defpackage;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hmb {
    public final cb a;
    public final Proxy b;
    public final InetSocketAddress c;

    public hmb(cb cbVar, Proxy proxy, InetSocketAddress inetSocketAddress) {
        inetSocketAddress.getClass();
        this.a = cbVar;
        this.b = proxy;
        this.c = inetSocketAddress;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof hmb)) {
            return false;
        }
        hmb hmbVar = (hmb) obj;
        return hmbVar.a.equals(this.a) && hmbVar.b.equals(this.b) && g76.L(hmbVar.c, this.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + ((this.a.hashCode() + 527) * 31)) * 31);
    }

    public final String toString() {
        String hostAddress;
        StringBuilder sb = new StringBuilder();
        qt5 qt5Var = this.a.h;
        String str = qt5Var.d;
        InetSocketAddress inetSocketAddress = this.c;
        InetAddress address = inetSocketAddress.getAddress();
        String strB = (address == null || (hostAddress = address.getHostAddress()) == null) ? null : cgf.b(hostAddress);
        if (muc.R(str, ':')) {
            sb.append("[");
            sb.append(str);
            sb.append("]");
        } else {
            sb.append(str);
        }
        if (qt5Var.e != inetSocketAddress.getPort() || str.equals(strB)) {
            sb.append(":");
            sb.append(qt5Var.e);
        }
        if (!str.equals(strB)) {
            if (this.b.equals(Proxy.NO_PROXY)) {
                sb.append(" at ");
            } else {
                sb.append(" via proxy ");
            }
            if (strB == null) {
                sb.append("<unresolved>");
            } else if (muc.R(strB, ':')) {
                sb.append("[");
                sb.append(strB);
                sb.append("]");
            } else {
                sb.append(strB);
            }
            sb.append(":");
            sb.append(inetSocketAddress.getPort());
        }
        return sb.toString();
    }
}
