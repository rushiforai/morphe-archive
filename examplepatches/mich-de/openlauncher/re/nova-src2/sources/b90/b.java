package b90;

import java.net.UnknownServiceException;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final List f17649a;

    /* renamed from: b, reason: collision with root package name */
    public int f17650b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f17651c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f17652d;

    public b(List connectionSpecs) {
        Intrinsics.g(connectionSpecs, "connectionSpecs");
        this.f17649a = connectionSpecs;
    }

    public final x80.o a(SSLSocket sSLSocket) throws UnknownServiceException {
        boolean z11;
        x80.o oVar;
        boolean z12;
        String[] cipherSuitesIntersection;
        String[] tlsVersionsIntersection;
        int i5 = this.f17650b;
        List list = this.f17649a;
        int size = list.size();
        while (true) {
            z11 = true;
            if (i5 >= size) {
                oVar = null;
                break;
            }
            oVar = (x80.o) list.get(i5);
            if (oVar.b(sSLSocket)) {
                this.f17650b = i5 + 1;
                break;
            }
            i5++;
        }
        if (oVar == null) {
            StringBuilder sb2 = new StringBuilder("Unable to find acceptable protocols. isFallback=");
            sb2.append(this.f17652d);
            sb2.append(", modes=");
            sb2.append(list);
            sb2.append(", supported protocols=");
            String[] enabledProtocols = sSLSocket.getEnabledProtocols();
            Intrinsics.d(enabledProtocols);
            String string = Arrays.toString(enabledProtocols);
            Intrinsics.f(string, "toString(this)");
            sb2.append(string);
            throw new UnknownServiceException(sb2.toString());
        }
        int i11 = this.f17650b;
        int size2 = list.size();
        while (true) {
            if (i11 >= size2) {
                z12 = false;
                break;
            }
            if (((x80.o) list.get(i11)).b(sSLSocket)) {
                z12 = true;
                break;
            }
            i11++;
        }
        this.f17651c = z12;
        boolean z13 = this.f17652d;
        String[] strArr = oVar.f95580d;
        String[] strArr2 = oVar.f95579c;
        if (strArr2 != null) {
            String[] enabledCipherSuites = sSLSocket.getEnabledCipherSuites();
            Intrinsics.f(enabledCipherSuites, "sslSocket.enabledCipherSuites");
            cipherSuitesIntersection = y80.c.n(enabledCipherSuites, strArr2, x80.m.f95536c);
        } else {
            cipherSuitesIntersection = sSLSocket.getEnabledCipherSuites();
        }
        if (strArr != null) {
            String[] enabledProtocols2 = sSLSocket.getEnabledProtocols();
            Intrinsics.f(enabledProtocols2, "sslSocket.enabledProtocols");
            tlsVersionsIntersection = y80.c.n(enabledProtocols2, strArr, e70.a.f52241a);
        } else {
            tlsVersionsIntersection = sSLSocket.getEnabledProtocols();
        }
        String[] supportedCipherSuites = sSLSocket.getSupportedCipherSuites();
        Intrinsics.f(supportedCipherSuites, "supportedCipherSuites");
        x80.l lVar = x80.m.f95536c;
        byte[] bArr = y80.c.f96853a;
        int length = supportedCipherSuites.length;
        int i12 = 0;
        while (true) {
            if (i12 >= length) {
                i12 = -1;
                break;
            }
            boolean z14 = z11;
            if (lVar.compare(supportedCipherSuites[i12], "TLS_FALLBACK_SCSV") == 0) {
                break;
            }
            i12++;
            z11 = z14;
        }
        if (z13 && i12 != -1) {
            Intrinsics.f(cipherSuitesIntersection, "cipherSuitesIntersection");
            String str = supportedCipherSuites[i12];
            Intrinsics.f(str, "supportedCipherSuites[indexOfFallbackScsv]");
            Object[] objArrCopyOf = Arrays.copyOf(cipherSuitesIntersection, cipherSuitesIntersection.length + 1);
            Intrinsics.f(objArrCopyOf, "copyOf(this, newSize)");
            cipherSuitesIntersection = (String[]) objArrCopyOf;
            cipherSuitesIntersection[cipherSuitesIntersection.length - 1] = str;
        }
        x80.n nVar = new x80.n(false);
        nVar.f95567b = oVar.f95577a;
        nVar.f95569d = strArr2;
        nVar.f95570e = strArr;
        nVar.f95568c = oVar.f95578b;
        Intrinsics.f(cipherSuitesIntersection, "cipherSuitesIntersection");
        nVar.b((String[]) Arrays.copyOf(cipherSuitesIntersection, cipherSuitesIntersection.length));
        Intrinsics.f(tlsVersionsIntersection, "tlsVersionsIntersection");
        nVar.d((String[]) Arrays.copyOf(tlsVersionsIntersection, tlsVersionsIntersection.length));
        x80.o oVarA = nVar.a();
        if (oVarA.c() != null) {
            sSLSocket.setEnabledProtocols(oVarA.f95580d);
        }
        if (oVarA.a() != null) {
            sSLSocket.setEnabledCipherSuites(oVarA.f95579c);
        }
        return oVar;
    }
}
