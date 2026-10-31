package fr;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final class b extends t0 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f55579a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f55580b;

    /* renamed from: c, reason: collision with root package name */
    public final r0 f55581c;

    /* renamed from: d, reason: collision with root package name */
    public final IntRange f55582d;

    /* renamed from: e, reason: collision with root package name */
    public final String f55583e;

    public b(LinkedHashMap linkedHashMap, LinkedHashMap linkedHashMap2) throws IOException {
        this.f55579a = linkedHashMap;
        this.f55580b = linkedHashMap2;
        String strF1 = b70.g.f1(u.b(null, u.a(linkedHashMap)), "&", null, null, 0, new f1.o0(15), 30);
        strF1 = strF1 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strF1;
        this.f55581c = r0.f55694b;
        s0 s0Var = s0.f55700b;
        this.f55582d = new IntRange(429, 429, 1);
        this.f55583e = b70.g.f1(kotlin.collections.c.v0(new String[]{"https://q.stripe.com", strF1.length() > 0 ? strF1 : null}), "?", null, null, 0, null, 62);
    }

    @Override // fr.t0
    public final Map a() {
        return this.f55580b;
    }

    @Override // fr.t0
    public final r0 b() {
        return this.f55581c;
    }

    @Override // fr.t0
    public final Iterable d() {
        return this.f55582d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f55579a.equals(bVar.f55579a) && this.f55580b.equals(bVar.f55580b);
    }

    @Override // fr.t0
    public final String f() {
        return this.f55583e;
    }

    public final int hashCode() {
        return this.f55580b.hashCode() + (this.f55579a.hashCode() * 31);
    }

    public final String toString() {
        return "AnalyticsRequest(params=" + this.f55579a + ", headers=" + this.f55580b + ")";
    }
}
