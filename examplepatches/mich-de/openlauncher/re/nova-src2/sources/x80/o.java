package x80;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import javax.net.ssl.SSLSocket;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: e, reason: collision with root package name */
    public static final o f95575e;

    /* renamed from: f, reason: collision with root package name */
    public static final o f95576f;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f95577a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f95578b;

    /* renamed from: c, reason: collision with root package name */
    public final String[] f95579c;

    /* renamed from: d, reason: collision with root package name */
    public final String[] f95580d;

    static {
        m mVar = m.f95549r;
        m mVar2 = m.f95550s;
        m mVar3 = m.f95551t;
        m mVar4 = m.f95545l;
        m mVar5 = m.n;
        m mVar6 = m.f95546m;
        m mVar7 = m.o;
        m mVar8 = m.f95548q;
        m mVar9 = m.f95547p;
        m[] mVarArr = {mVar, mVar2, mVar3, mVar4, mVar5, mVar6, mVar7, mVar8, mVar9};
        m[] mVarArr2 = {mVar, mVar2, mVar3, mVar4, mVar5, mVar6, mVar7, mVar8, mVar9, m.f95543j, m.f95544k, m.f95541h, m.f95542i, m.f95539f, m.f95540g, m.f95538e};
        n nVar = new n();
        nVar.c((m[]) Arrays.copyOf(mVarArr, 9));
        r0 r0Var = r0.TLS_1_3;
        r0 r0Var2 = r0.TLS_1_2;
        nVar.e(r0Var, r0Var2);
        nVar.f95568c = true;
        nVar.a();
        n nVar2 = new n();
        nVar2.c((m[]) Arrays.copyOf(mVarArr2, 16));
        nVar2.e(r0Var, r0Var2);
        nVar2.f95568c = true;
        f95575e = nVar2.a();
        n nVar3 = new n();
        nVar3.c((m[]) Arrays.copyOf(mVarArr2, 16));
        nVar3.e(r0Var, r0Var2, r0.TLS_1_1, r0.TLS_1_0);
        nVar3.f95568c = true;
        nVar3.a();
        f95576f = new o(false, false, null, null);
    }

    public o(boolean z11, boolean z12, String[] strArr, String[] strArr2) {
        this.f95577a = z11;
        this.f95578b = z12;
        this.f95579c = strArr;
        this.f95580d = strArr2;
    }

    public final List a() {
        String[] strArr = this.f95579c;
        if (strArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            arrayList.add(m.f95535b.c(str));
        }
        return b70.g.I1(arrayList);
    }

    public final boolean b(SSLSocket sSLSocket) {
        if (!this.f95577a) {
            return false;
        }
        String[] strArr = this.f95580d;
        if (strArr != null && !y80.c.h(strArr, sSLSocket.getEnabledProtocols(), e70.a.f52241a)) {
            return false;
        }
        String[] strArr2 = this.f95579c;
        return strArr2 == null || y80.c.h(strArr2, sSLSocket.getEnabledCipherSuites(), m.f95536c);
    }

    public final List c() {
        String[] strArr = this.f95580d;
        if (strArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            arrayList.add(vm.d.g(str));
        }
        return b70.g.I1(arrayList);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof o)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        o oVar = (o) obj;
        boolean z11 = oVar.f95577a;
        boolean z12 = this.f95577a;
        if (z12 != z11) {
            return false;
        }
        if (z12) {
            return Arrays.equals(this.f95579c, oVar.f95579c) && Arrays.equals(this.f95580d, oVar.f95580d) && this.f95578b == oVar.f95578b;
        }
        return true;
    }

    public final int hashCode() {
        if (!this.f95577a) {
            return 17;
        }
        String[] strArr = this.f95579c;
        int iHashCode = (527 + (strArr != null ? Arrays.hashCode(strArr) : 0)) * 31;
        String[] strArr2 = this.f95580d;
        return ((iHashCode + (strArr2 != null ? Arrays.hashCode(strArr2) : 0)) * 31) + (!this.f95578b ? 1 : 0);
    }

    public final String toString() {
        if (!this.f95577a) {
            return "ConnectionSpec()";
        }
        StringBuilder sb2 = new StringBuilder("ConnectionSpec(cipherSuites=");
        sb2.append(Objects.toString(a(), "[all enabled]"));
        sb2.append(", tlsVersions=");
        sb2.append(Objects.toString(c(), "[all enabled]"));
        sb2.append(", supportsTlsExtensions=");
        return a2.c.p(sb2, this.f95578b, ')');
    }
}
