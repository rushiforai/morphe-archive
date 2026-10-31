package ads_mobile_sdk;

import android.net.Uri;
import b.c0;
import b.f9;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class x11 {

    /* renamed from: a, reason: collision with root package name */
    public URL f11531a;

    /* renamed from: b, reason: collision with root package name */
    public String f11532b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f11533c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f11534d;

    /* renamed from: e, reason: collision with root package name */
    public final bn0 f11535e;

    /* renamed from: f, reason: collision with root package name */
    public f9 f11536f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f11537g;

    public x11() {
        this.f11532b = "GET";
        this.f11533c = new LinkedHashMap();
        this.f11537g = new ArrayList();
    }

    public final void a(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        LinkedHashMap linkedHashMap = this.f11533c;
        String str = (String) linkedHashMap.get(name);
        if (str != null) {
            value = b.u4.m(str, ", ", value);
        }
        linkedHashMap.put(name, value);
    }

    public final void b(String str, String value) {
        Intrinsics.g(value, "value");
        this.f11537g.add(new Pair(str, value));
    }

    public final void c(String name, String value) {
        Intrinsics.g(name, "name");
        Intrinsics.g(value, "value");
        this.f11533c.put(name, value);
    }

    public final void b() {
        a("GET", (byte[]) null);
    }

    public x11(y11 request) {
        Intrinsics.g(request, "request");
        this.f11532b = "GET";
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        this.f11533c = linkedHashMap;
        this.f11537g = new ArrayList();
        this.f11531a = request.f11913a;
        this.f11532b = request.f11914b;
        linkedHashMap.putAll(request.f11915c);
        this.f11534d = request.f11916d;
        this.f11535e = request.f11917e;
        this.f11536f = request.f11918f;
    }

    public final void b(String str, byte[] body) {
        Intrinsics.g(body, "body");
        a("POST", body);
        this.f11533c.put("Content-Type", str);
    }

    public final void b(String url) {
        Intrinsics.g(url, "url");
        this.f11531a = new URL(url);
    }

    public final y11 a() {
        URL url;
        URL url2 = this.f11531a;
        if (url2 != null) {
            ArrayList arrayList = this.f11537g;
            if (arrayList.isEmpty()) {
                url = url2;
            } else {
                String string = url2.toString();
                Intrinsics.f(string, "toString(...)");
                Uri.Builder builderBuildUpon = Uri.parse(string).buildUpon();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    builderBuildUpon.appendQueryParameter((String) pair.f71683a, (String) pair.f71684b);
                }
                url = new URL(builderBuildUpon.build().toString());
            }
            return new y11(url, this.f11532b, MapsKt.s0(this.f11533c), this.f11534d, this.f11535e, this.f11536f);
        }
        throw new IllegalStateException("HttpRequest.Builder: URL must be set before calling build()");
    }

    public final void a(String str, byte[] bArr) {
        if (str.length() > 0) {
            if (bArr == null && (str.equals("POST") || str.equals("PUT") || str.equals("PATCH"))) {
                throw new IllegalArgumentException(c0.l("Method ", str, " must have a request body.").toString());
            }
            this.f11532b = str;
            this.f11534d = bArr;
            return;
        }
        throw new IllegalArgumentException("HTTP method must not be empty");
    }

    public final void a(String name) {
        Intrinsics.g(name, "name");
        this.f11533c.remove(name);
    }

    public final void a(URL url) {
        this.f11531a = url;
    }
}
