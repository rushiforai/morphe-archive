package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.SSLSocket;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j42 {
    public static final j42 e;
    public static final j42 f;
    public static final j42 g;
    public final boolean a;
    public final boolean b;
    public final String[] c;
    public final String[] d;

    static {
        zl1 zl1Var = zl1.r;
        zl1 zl1Var2 = zl1.s;
        zl1 zl1Var3 = zl1.t;
        zl1 zl1Var4 = zl1.l;
        zl1 zl1Var5 = zl1.n;
        zl1 zl1Var6 = zl1.m;
        zl1 zl1Var7 = zl1.o;
        zl1 zl1Var8 = zl1.q;
        zl1 zl1Var9 = zl1.p;
        List listR = d46.R(zl1Var, zl1Var2, zl1Var3, zl1Var4, zl1Var5, zl1Var6, zl1Var7, zl1Var8, zl1Var9);
        List listR2 = d46.R(zl1Var, zl1Var2, zl1Var3, zl1Var4, zl1Var5, zl1Var6, zl1Var7, zl1Var8, zl1Var9, zl1.j, zl1.k, zl1.h, zl1.i, zl1.f, zl1.g, zl1.e);
        i42 i42Var = new i42();
        zl1[] zl1VarArr = (zl1[]) listR.toArray(new zl1[0]);
        i42Var.c((zl1[]) Arrays.copyOf(zl1VarArr, zl1VarArr.length));
        nmd nmdVar = nmd.TLS_1_3;
        nmd nmdVar2 = nmd.TLS_1_2;
        i42Var.d(nmdVar, nmdVar2);
        i42Var.b = true;
        e = i42Var.b();
        i42 i42Var2 = new i42();
        zl1[] zl1VarArr2 = (zl1[]) listR2.toArray(new zl1[0]);
        i42Var2.c((zl1[]) Arrays.copyOf(zl1VarArr2, zl1VarArr2.length));
        i42Var2.d(nmdVar, nmdVar2);
        i42Var2.b = true;
        f = i42Var2.b();
        i42 i42Var3 = new i42();
        zl1[] zl1VarArr3 = (zl1[]) listR2.toArray(new zl1[0]);
        i42Var3.c((zl1[]) Arrays.copyOf(zl1VarArr3, zl1VarArr3.length));
        i42Var3.d(nmdVar, nmdVar2, nmd.TLS_1_1, nmd.TLS_1_0);
        i42Var3.b = true;
        i42Var3.b();
        g = new j42(false, false, null, null);
    }

    public j42(boolean z, boolean z2, String[] strArr, String[] strArr2) {
        this.a = z;
        this.b = z2;
        this.c = strArr;
        this.d = strArr2;
    }

    public final void a(SSLSocket sSLSocket, boolean z) {
        String[] enabledProtocols;
        String[] enabledCipherSuites = sSLSocket.getEnabledCipherSuites();
        enabledCipherSuites.getClass();
        String[] strArr = this.c;
        if (strArr != null) {
            enabledCipherSuites = egf.l(strArr, enabledCipherSuites, zl1.c);
        }
        String[] strArr2 = this.d;
        if (strArr2 != null) {
            String[] enabledProtocols2 = sSLSocket.getEnabledProtocols();
            enabledProtocols2.getClass();
            enabledProtocols = egf.l(enabledProtocols2, strArr2, y98.b);
        } else {
            enabledProtocols = sSLSocket.getEnabledProtocols();
        }
        String[] supportedCipherSuites = sSLSocket.getSupportedCipherSuites();
        supportedCipherSuites.getClass();
        js4 js4Var = zl1.c;
        byte[] bArr = egf.a;
        int length = supportedCipherSuites.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                i = -1;
                break;
            } else if (js4Var.compare(supportedCipherSuites[i], "TLS_FALLBACK_SCSV") == 0) {
                break;
            } else {
                i++;
            }
        }
        if (z && i != -1) {
            String str = supportedCipherSuites[i];
            str.getClass();
            enabledCipherSuites.getClass();
            enabledCipherSuites = (String[]) Arrays.copyOf(enabledCipherSuites, enabledCipherSuites.length + 1);
            enabledCipherSuites[enabledCipherSuites.length - 1] = str;
        }
        String[] strArr3 = (String[]) Arrays.copyOf(enabledCipherSuites, enabledCipherSuites.length);
        boolean z2 = this.a;
        if (!z2) {
            ay0.e("no cipher suites for cleartext connections");
            return;
        }
        if (strArr3.length == 0) {
            ay0.e("At least one cipher suite is required");
            return;
        }
        String[] strArr4 = (String[]) Arrays.copyOf(strArr3, strArr3.length);
        String[] strArr5 = (String[]) Arrays.copyOf(enabledProtocols, enabledProtocols.length);
        if (!z2) {
            ay0.e("no TLS versions for cleartext connections");
            return;
        }
        if (strArr5.length == 0) {
            ay0.e("At least one TLS version is required");
            return;
        }
        j42 j42Var = new j42(z2, this.b, strArr4, (String[]) Arrays.copyOf(strArr5, strArr5.length));
        if (j42Var.c() != null) {
            sSLSocket.setEnabledProtocols(j42Var.d);
        }
        if (j42Var.b() != null) {
            sSLSocket.setEnabledCipherSuites(j42Var.c);
        }
    }

    public final ArrayList b() {
        String[] strArr = this.c;
        if (strArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            arrayList.add(zl1.b.A(str));
        }
        return arrayList;
    }

    public final ArrayList c() {
        String[] strArr = this.d;
        if (strArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            nmd.Companion.getClass();
            arrayList.add(mmd.a(str));
        }
        return arrayList;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof j42)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        j42 j42Var = (j42) obj;
        boolean z = j42Var.a;
        boolean z2 = this.a;
        if (z2 != z) {
            return false;
        }
        if (z2) {
            return Arrays.equals(this.c, j42Var.c) && Arrays.equals(this.d, j42Var.d) && this.b == j42Var.b;
        }
        return true;
    }

    public final int hashCode() {
        if (!this.a) {
            return 17;
        }
        String[] strArr = this.c;
        int iHashCode = (527 + (strArr != null ? Arrays.hashCode(strArr) : 0)) * 31;
        String[] strArr2 = this.d;
        return ((iHashCode + (strArr2 != null ? Arrays.hashCode(strArr2) : 0)) * 31) + (!this.b ? 1 : 0);
    }

    public final String toString() {
        if (!this.a) {
            return "ConnectionSpec()";
        }
        StringBuilder sb = new StringBuilder(peNPu.vfgOAxzgXNlc);
        sb.append(Objects.toString(b(), "[all enabled]"));
        sb.append(", tlsVersions=");
        sb.append(Objects.toString(c(), "[all enabled]"));
        sb.append(", supportsTlsExtensions=");
        return ev6.A(sb, this.b, ')');
    }
}
