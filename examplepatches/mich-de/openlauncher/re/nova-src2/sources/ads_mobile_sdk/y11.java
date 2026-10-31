package ads_mobile_sdk;

import b.f9;
import java.net.URL;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import x80.k0;
import x80.v;

/* loaded from: classes2.dex */
public final class y11 {

    /* renamed from: a, reason: collision with root package name */
    public final URL f11913a;

    /* renamed from: b, reason: collision with root package name */
    public final String f11914b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f11915c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f11916d;

    /* renamed from: e, reason: collision with root package name */
    public final bn0 f11917e;

    /* renamed from: f, reason: collision with root package name */
    public final f9 f11918f;

    public y11(URL url, String str, Map map, byte[] bArr, bn0 bn0Var, f9 f9Var) {
        this.f11913a = url;
        this.f11914b = str;
        this.f11915c = map;
        this.f11916d = bArr;
        this.f11917e = bn0Var;
        this.f11918f = f9Var;
    }

    public final bn0 b() {
        return this.f11917e;
    }

    public final Map c() {
        return this.f11915c;
    }

    public final String e() {
        return this.f11914b;
    }

    public final URL f() {
        return this.f11913a;
    }

    public final x11 g() {
        return new x11(this);
    }

    public final x80.h0 h() {
        x80.g0 g0Var = new x80.g0();
        String string = this.f11913a.toString();
        Intrinsics.f(string, "url.toString()");
        v vVar = new v();
        vVar.e(null, string);
        g0Var.f95504a = vVar.b();
        byte[] bArr = this.f11916d;
        g0Var.g(bArr != null ? x80.j0.d(k0.Companion, bArr, null, 0, 7) : null, this.f11914b);
        for (Map.Entry entry : this.f11915c.entrySet()) {
            g0Var.a((String) entry.getKey(), (String) entry.getValue());
        }
        return g0Var.b();
    }

    public final String toString() {
        return "HttpRequest{method=" + this.f11914b + ", url=" + this.f11913a + ", headers=" + this.f11915c + "}";
    }
}
