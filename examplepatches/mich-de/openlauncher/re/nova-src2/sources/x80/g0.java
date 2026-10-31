package x80;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public w f95504a;

    /* renamed from: d, reason: collision with root package name */
    public k0 f95507d;

    /* renamed from: e, reason: collision with root package name */
    public LinkedHashMap f95508e = new LinkedHashMap();

    /* renamed from: b, reason: collision with root package name */
    public String f95505b = "GET";

    /* renamed from: c, reason: collision with root package name */
    public o2.h f95506c = new o2.h(1);

    public final void a(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.f95506c.a(name, value);
    }

    public final h0 b() {
        Map mapUnmodifiableMap;
        w wVar = this.f95504a;
        if (wVar == null) {
            throw new IllegalStateException("url == null");
        }
        String str = this.f95505b;
        u uVarF = this.f95506c.f();
        k0 k0Var = this.f95507d;
        LinkedHashMap linkedHashMap = this.f95508e;
        byte[] bArr = y80.c.f96853a;
        Intrinsics.g(linkedHashMap, "<this>");
        if (linkedHashMap.isEmpty()) {
            mapUnmodifiableMap = b70.h.f17594a;
        } else {
            mapUnmodifiableMap = Collections.unmodifiableMap(new LinkedHashMap(linkedHashMap));
            Intrinsics.f(mapUnmodifiableMap, "{\n    Collections.unmodi…(LinkedHashMap(this))\n  }");
        }
        return new h0(wVar, str, uVarF, k0Var, mapUnmodifiableMap);
    }

    public final void c(g cacheControl) {
        Intrinsics.g(cacheControl, "cacheControl");
        String string = cacheControl.toString();
        if (string.length() == 0) {
            i("Cache-Control");
        } else {
            e("Cache-Control", string);
        }
    }

    public final void d() {
        g(null, "GET");
    }

    public final void e(String str, String value) {
        Intrinsics.g(value, "value");
        o2.h hVar = this.f95506c;
        hVar.getClass();
        v4.a.c(str);
        v4.a.d(value, str);
        hVar.s(str);
        hVar.c(str, value);
    }

    public final void f(u headers) {
        Intrinsics.g(headers, "headers");
        this.f95506c = headers.d();
    }

    public final void g(k0 k0Var, String method) {
        Intrinsics.g(method, "method");
        if (method.length() <= 0) {
            throw new IllegalArgumentException("method.isEmpty() == true");
        }
        if (k0Var == null) {
            if (method.equals("POST") || method.equals("PUT") || method.equals("PATCH") || method.equals("PROPPATCH") || method.equals("REPORT")) {
                throw new IllegalArgumentException(b.c0.l("method ", method, " must have a request body.").toString());
            }
        } else if (!x7.f.M(method)) {
            throw new IllegalArgumentException(b.c0.l("method ", method, " must not have a request body.").toString());
        }
        this.f95505b = method;
        this.f95507d = k0Var;
    }

    public final void h(k0 body) {
        Intrinsics.g(body, "body");
        g(body, "POST");
    }

    public final void i(String name) {
        Intrinsics.g(name, "name");
        this.f95506c.s(name);
    }

    public final void j(Class type, Object obj) {
        Intrinsics.g(type, "type");
        if (obj == null) {
            this.f95508e.remove(type);
            return;
        }
        if (this.f95508e.isEmpty()) {
            this.f95508e = new LinkedHashMap();
        }
        LinkedHashMap linkedHashMap = this.f95508e;
        Object objCast = type.cast(obj);
        Intrinsics.d(objCast);
        linkedHashMap.put(type, objCast);
    }

    public final void k(String url) {
        Intrinsics.g(url, "url");
        if (r70.j.I0(url, "ws:", true)) {
            String strSubstring = url.substring(3);
            Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            url = "http:".concat(strSubstring);
        } else if (r70.j.I0(url, "wss:", true)) {
            String strSubstring2 = url.substring(4);
            Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
            url = "https:".concat(strSubstring2);
        }
        Intrinsics.g(url, "<this>");
        v vVar = new v();
        vVar.e(null, url);
        this.f95504a = vVar.b();
    }
}
