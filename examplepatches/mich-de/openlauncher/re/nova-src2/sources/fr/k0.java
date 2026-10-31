package fr;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public final class k0 extends l0 {

    /* renamed from: b, reason: collision with root package name */
    public final Map f55652b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55653c = "Stripe/v1 ".concat("AndroidBindings/22.7.0");

    /* renamed from: d, reason: collision with root package name */
    public final Map f55654d;

    public k0(String str) {
        this.f55652b = a80.m.n("Cookie", "m=".concat(str));
        s0 s0Var = s0.f55700b;
        this.f55654d = a80.m.n("Content-Type", b.c0.k("application/json; charset=", l0.f55658a));
    }

    @Override // fr.l0
    public final Map c() {
        return this.f55652b;
    }

    @Override // fr.l0
    public final String d() {
        return this.f55653c;
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
}
