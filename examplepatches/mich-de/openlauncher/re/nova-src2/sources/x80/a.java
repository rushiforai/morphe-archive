package x80;

import b.u4;
import java.net.ProxySelector;
import java.util.List;
import java.util.Objects;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final b f95386a;

    /* renamed from: b, reason: collision with root package name */
    public final SocketFactory f95387b;

    /* renamed from: c, reason: collision with root package name */
    public final SSLSocketFactory f95388c;

    /* renamed from: d, reason: collision with root package name */
    public final HostnameVerifier f95389d;

    /* renamed from: e, reason: collision with root package name */
    public final k f95390e;

    /* renamed from: f, reason: collision with root package name */
    public final b f95391f;

    /* renamed from: g, reason: collision with root package name */
    public final ProxySelector f95392g;

    /* renamed from: h, reason: collision with root package name */
    public final w f95393h;

    /* renamed from: i, reason: collision with root package name */
    public final List f95394i;

    /* renamed from: j, reason: collision with root package name */
    public final List f95395j;

    public a(String uriHost, int i5, b dns, SocketFactory socketFactory, SSLSocketFactory sSLSocketFactory, HostnameVerifier hostnameVerifier, k kVar, b proxyAuthenticator, List protocols, List connectionSpecs, ProxySelector proxySelector) {
        Intrinsics.g(uriHost, "uriHost");
        Intrinsics.g(dns, "dns");
        Intrinsics.g(socketFactory, "socketFactory");
        Intrinsics.g(proxyAuthenticator, "proxyAuthenticator");
        Intrinsics.g(protocols, "protocols");
        Intrinsics.g(connectionSpecs, "connectionSpecs");
        Intrinsics.g(proxySelector, "proxySelector");
        this.f95386a = dns;
        this.f95387b = socketFactory;
        this.f95388c = sSLSocketFactory;
        this.f95389d = hostnameVerifier;
        this.f95390e = kVar;
        this.f95391f = proxyAuthenticator;
        this.f95392g = proxySelector;
        v vVar = new v();
        String str = sSLSocketFactory != null ? "https" : "http";
        if (str.equalsIgnoreCase("http")) {
            vVar.f95616a = "http";
        } else {
            if (!str.equalsIgnoreCase("https")) {
                throw new IllegalArgumentException("unexpected scheme: ".concat(str));
            }
            vVar.f95616a = "https";
        }
        String strB = y80.a.b(b.e(0, 0, 7, uriHost));
        if (strB == null) {
            throw new IllegalArgumentException("unexpected host: ".concat(uriHost));
        }
        vVar.f95619d = strB;
        if (1 > i5 || i5 >= 65536) {
            throw new IllegalArgumentException(b.c0.h(i5, "unexpected port: ").toString());
        }
        vVar.f95620e = i5;
        this.f95393h = vVar.b();
        this.f95394i = y80.c.v(protocols);
        this.f95395j = y80.c.v(connectionSpecs);
    }

    public final boolean a(a that) {
        Intrinsics.g(that, "that");
        return Intrinsics.b(this.f95386a, that.f95386a) && Intrinsics.b(this.f95391f, that.f95391f) && Intrinsics.b(this.f95394i, that.f95394i) && Intrinsics.b(this.f95395j, that.f95395j) && Intrinsics.b(this.f95392g, that.f95392g) && Intrinsics.b(this.f95388c, that.f95388c) && Intrinsics.b(this.f95389d, that.f95389d) && Intrinsics.b(this.f95390e, that.f95390e) && this.f95393h.f95629e == that.f95393h.f95629e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f95393h, aVar.f95393h) && a(aVar);
    }

    public final int hashCode() {
        return Objects.hashCode(this.f95390e) + ((Objects.hashCode(this.f95389d) + ((Objects.hashCode(this.f95388c) + ((this.f95392g.hashCode() + u4.c(u4.c((this.f95391f.hashCode() + ((this.f95386a.hashCode() + b.c0.e(527, 31, this.f95393h.f95633i)) * 31)) * 31, 31, this.f95394i), 31, this.f95395j)) * 961)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Address{");
        w wVar = this.f95393h;
        sb2.append(wVar.f95628d);
        sb2.append(AbstractJsonLexerKt.COLON);
        sb2.append(wVar.f95629e);
        sb2.append(", ");
        sb2.append("proxySelector=" + this.f95392g);
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
