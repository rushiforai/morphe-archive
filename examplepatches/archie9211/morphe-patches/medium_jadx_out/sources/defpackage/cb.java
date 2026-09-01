package defpackage;

import j$.util.Objects;
import java.net.ProxySelector;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cb {
    public final oi3 a;
    public final SocketFactory b;
    public final SSLSocketFactory c;
    public final HostnameVerifier d;
    public final oj1 e;
    public final wz7 f;
    public final ProxySelector g;
    public final qt5 h;
    public final List i;
    public final List j;

    public cb(String str, int i, oi3 oi3Var, SocketFactory socketFactory, SSLSocketFactory sSLSocketFactory, HostnameVerifier hostnameVerifier, oj1 oj1Var, wz7 wz7Var, List list, List list2, ProxySelector proxySelector) {
        str.getClass();
        oi3Var.getClass();
        socketFactory.getClass();
        wz7Var.getClass();
        list.getClass();
        list2.getClass();
        proxySelector.getClass();
        this.a = oi3Var;
        this.b = socketFactory;
        this.c = sSLSocketFactory;
        this.d = hostnameVerifier;
        this.e = oj1Var;
        this.f = wz7Var;
        this.g = proxySelector;
        pt5 pt5Var = new pt5();
        pt5Var.h(sSLSocketFactory != null ? "https" : "http");
        pt5Var.e(str);
        if (1 > i || i >= 65536) {
            ywb.g(b09.w(i, "unexpected port: "));
            throw null;
        }
        pt5Var.e = i;
        this.h = pt5Var.c();
        this.i = ggf.j(list);
        this.j = ggf.j(list2);
    }

    public final boolean a(cb cbVar) {
        return g76.L(this.a, cbVar.a) && g76.L(this.f, cbVar.f) && this.i.equals(cbVar.i) && this.j.equals(cbVar.j) && g76.L(this.g, cbVar.g) && g76.L(this.c, cbVar.c) && g76.L(this.d, cbVar.d) && g76.L(this.e, cbVar.e) && this.h.e == cbVar.h.e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof cb)) {
            return false;
        }
        cb cbVar = (cb) obj;
        return this.h.equals(cbVar.h) && a(cbVar);
    }

    public final int hashCode() {
        return Objects.hashCode(this.e) + ((Objects.hashCode(this.d) + ((Objects.hashCode(this.c) + ((this.g.hashCode() + wgd.p(wgd.p((this.f.hashCode() + ((this.a.hashCode() + wgd.o(527, 31, this.h.i)) * 31)) * 31, 31, this.i), 31, this.j)) * 961)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Address{");
        qt5 qt5Var = this.h;
        sb.append(qt5Var.d);
        sb.append(':');
        sb.append(qt5Var.e);
        sb.append(", ");
        sb.append("proxySelector=" + this.g);
        sb.append('}');
        return sb.toString();
    }
}
