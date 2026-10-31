package com.vungle.ads.internal.network;

import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.q1;
import com.vungle.ads.internal.model.u1;
import com.vungle.ads.internal.model.w2;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.text.Regex;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;
import x80.g0;
import x80.h0;
import x80.j0;
import x80.k0;

/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: c, reason: collision with root package name */
    public static final Json f47241c = JsonKt.Json$default(null, b0.f47228a, 1, null);

    /* renamed from: d, reason: collision with root package name */
    public static final Regex f47242d = new Regex("[^\\t\\x20-\\x7E]");

    /* renamed from: a, reason: collision with root package name */
    public final x80.h f47243a;

    /* renamed from: b, reason: collision with root package name */
    public final com.vungle.ads.internal.network.converters.b f47244b;

    public e0(x80.e0 okHttpClient) {
        Intrinsics.g(okHttpClient, "okHttpClient");
        this.f47243a = okHttpClient;
        this.f47244b = new com.vungle.ads.internal.network.converters.b();
    }

    public final m b(String ua2, String path, u1 body) {
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(path, "path");
        Intrinsics.g(body, "body");
        try {
            Json json = f47241c;
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(u1.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            String strEncodeToString = json.encodeToString(kSerializerSerializer, body);
            try {
                g0 g0VarA = a(this, ua2, path, null, null, 12);
                k0.Companion.getClass();
                g0VarA.h(j0.a(strEncodeToString, null));
                return new m(((x80.e0) this.f47243a).c(g0VarA.b()), new com.vungle.ads.internal.network.converters.d(Reflection.b(w2.class)));
            } catch (Exception unused) {
                return null;
            }
        } catch (Exception unused2) {
        }
    }

    public final m c(String ua2, String path, u1 body) {
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(path, "path");
        Intrinsics.g(body, "body");
        try {
            Json json = f47241c;
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(u1.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            String strEncodeToString = json.encodeToString(kSerializerSerializer, body);
            try {
                g0 g0VarA = a(this, ua2, path, null, null, 12);
                k0.Companion.getClass();
                g0VarA.h(j0.a(strEncodeToString, null));
                return new m(((x80.e0) this.f47243a).c(g0VarA.b()), this.f47244b);
            } catch (Exception unused) {
                return null;
            }
        } catch (Exception unused2) {
        }
    }

    public static g0 a(e0 e0Var, String str, String str2, String str3, Map map, int i5) {
        if ((i5 & 4) != 0) {
            str3 = null;
        }
        if ((i5 & 8) != 0) {
            map = null;
        }
        e0Var.getClass();
        g0 g0Var = new g0();
        g0Var.k(str2);
        g0Var.a("User-Agent", c0.a(str));
        g0Var.a("Vungle-Version", "7.1.0");
        g0Var.a("Content-Type", "application/json");
        if (map != null) {
            ArrayList arrayList = new ArrayList(20);
            for (Map.Entry entry : map.entrySet()) {
                String name = (String) entry.getKey();
                try {
                    String value = c0.a((String) entry.getValue());
                    Intrinsics.g(name, "name");
                    Intrinsics.g(value, "value");
                    v4.a.c(name);
                    v4.a.d(value, name);
                    arrayList.add(name);
                    arrayList.add(r70.k.u1(value).toString());
                } catch (IllegalArgumentException unused) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("VungleApiImpl", d0.f47238a);
                }
            }
            g0Var.f(new x80.u((String[]) arrayList.toArray(new String[0])));
        }
        if (str3 != null) {
            g0Var.a("X-Vungle-Placement-Ref-Id", c0.a(str3));
        }
        String strC = f0.c();
        if (strC != null) {
            g0Var.a("X-VUNGLE-APP-VERSION", c0.a(strC));
        }
        String strB = f0.b();
        if (strB != null) {
            g0Var.a("X-Vungle-App-Id", c0.a(strB));
        }
        return g0Var;
    }

    public final m b(String ua2, String path, k0 requestBody) {
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(path, "path");
        Intrinsics.g(requestBody, "requestBody");
        x80.v vVar = new x80.v();
        vVar.e(null, path);
        x80.w wVarB = vVar.b().g().b();
        g0 g0Var = new g0();
        g0Var.f95504a = wVarB;
        g0Var.a("User-Agent", c0.a(ua2));
        g0Var.a("Vungle-Version", "7.1.0");
        g0Var.a("Content-Type", "application/x-protobuf");
        String strB = f0.b();
        if (strB != null) {
            g0Var.a("X-Vungle-App-Id", c0.a(strB));
        }
        String strC = f0.c();
        if (strC != null) {
            g0Var.a("X-VUNGLE-APP-VERSION", c0.a(strC));
        }
        g0Var.h(requestBody);
        return new m(((x80.e0) this.f47243a).c(g0Var.b()), this.f47244b);
    }

    public final m a(String ua2, String path, u1 body) {
        String strEncodeToString;
        q1 q1VarC;
        List listA;
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(path, "path");
        Intrinsics.g(body, "body");
        try {
            Json json = f47241c;
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(u1.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            strEncodeToString = json.encodeToString(kSerializerSerializer, body);
            q1VarC = body.c();
        } catch (Exception unused) {
        }
        try {
            g0 g0VarA = a(this, ua2, path, (q1VarC == null || (listA = q1VarC.a()) == null) ? null : (String) b70.g.Y0(listA), null, 8);
            k0.Companion.getClass();
            g0VarA.h(j0.a(strEncodeToString, null));
            return new m(((x80.e0) this.f47243a).c(g0VarA.b()), new com.vungle.ads.internal.network.converters.d(Reflection.b(i0.class)));
        } catch (Exception unused2) {
            return null;
        }
    }

    public final m a(String ua2, String url, g requestType, Map map, k0 k0Var) {
        h0 h0VarB;
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(url, "url");
        Intrinsics.g(requestType, "requestType");
        g0 g0VarA = a(this, ua2, url, null, map, 4);
        int iOrdinal = requestType.ordinal();
        if (iOrdinal == 0) {
            g0VarA.d();
            h0VarB = g0VarA.b();
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            if (k0Var == null) {
                k0Var = j0.d(k0.Companion, new byte[0], null, 0, 6);
            }
            g0VarA.h(k0Var);
            h0VarB = g0VarA.b();
        }
        return new m(((x80.e0) this.f47243a).c(h0VarB), this.f47244b);
    }

    public final m a(String ua2, String path, k0 requestBody) {
        Intrinsics.g(ua2, "ua");
        Intrinsics.g(path, "path");
        Intrinsics.g(requestBody, "requestBody");
        x80.v vVar = new x80.v();
        vVar.e(null, path);
        x80.w wVarB = vVar.b().g().b();
        g0 g0Var = new g0();
        g0Var.f95504a = wVarB;
        g0Var.a("User-Agent", c0.a(ua2));
        g0Var.a("Vungle-Version", "7.1.0");
        g0Var.a("Content-Type", "application/x-protobuf");
        String strB = f0.b();
        if (strB != null) {
            g0Var.a("X-Vungle-App-Id", c0.a(strB));
        }
        String strC = f0.c();
        if (strC != null) {
            g0Var.a("X-VUNGLE-APP-VERSION", c0.a(strC));
        }
        g0Var.h(requestBody);
        return new m(((x80.e0) this.f47243a).c(g0Var.b()), this.f47244b);
    }

    public final m a(k0 requestBody) {
        Intrinsics.g(requestBody, "requestBody");
        x80.v vVar = new x80.v();
        vVar.e(null, "https://events.ads.vungle.com/rtadebugging");
        g0 g0VarA = a(this, "debug", vVar.b().g().b().f95633i, null, null, 12);
        g0VarA.h(requestBody);
        return new m(((x80.e0) this.f47243a).c(g0VarA.b()), this.f47244b);
    }
}
