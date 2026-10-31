package fr;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public final class i0 extends l0 {

    /* renamed from: b, reason: collision with root package name */
    public static final i0 f55639b = new i0();

    /* renamed from: c, reason: collision with root package name */
    public static final String f55640c = "Stripe/v1 ".concat("AndroidBindings/22.7.0");

    /* renamed from: d, reason: collision with root package name */
    public static final b70.h f55641d = b70.h.f17594a;

    @Override // fr.l0
    public final Map c() {
        return f55641d;
    }

    @Override // fr.l0
    public final String d() {
        return f55640c;
    }

    @Override // fr.l0
    public final String e() {
        LinkedHashMap linkedHashMapB = l0.b();
        ArrayList arrayList = new ArrayList(linkedHashMapB.size());
        for (Map.Entry entry : linkedHashMapB.entrySet()) {
            arrayList.add(b.c0.n("\"", (String) entry.getKey(), "\":\"", (String) entry.getValue(), "\""));
        }
        return b.c0.l("{", b70.g.f1(arrayList, ",", null, null, 0, null, 62), "}");
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof i0);
    }

    public final int hashCode() {
        return -334358835;
    }

    public final String toString() {
        return "Analytics";
    }
}
